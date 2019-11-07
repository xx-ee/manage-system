package com.ms.service.Impl;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.ms.response.DataGridView;
import com.ms.response.ResultObj;
import com.ms.response.Status;
import com.ms.response.ToWeb;
import com.ms.service.IWorkFlowService;
import com.ms.vo.WorkFlowVo;
import com.ms.vo.act.*;
import lombok.extern.slf4j.Slf4j;
import org.activiti.bpmn.converter.BpmnXMLConverter;
import org.activiti.bpmn.model.BpmnModel;
import org.activiti.editor.constants.ModelDataJsonConstants;
import org.activiti.editor.language.json.converter.BpmnJsonConverter;
import org.activiti.engine.*;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.Model;
import org.activiti.engine.repository.ModelQuery;
import org.activiti.engine.repository.ProcessDefinition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

/**
 * @Classname： WorkFlowServiceImpl
 * @Description：
 * @Author： xiedong
 * @Date： 2019/11/6 16:29
 * @Version： 1.0
 **/
@Service
@Slf4j
public class WorkFlowServiceImpl implements IWorkFlowService {
    @Autowired
    private RepositoryService repositoryService;
    @Autowired
    private RuntimeService runtimeService;
    @Autowired
    private TaskService taskService;
    @Autowired
    private HistoryService historyService;
    @Autowired
    private IdentityService identityService;
    @Autowired
    private FormService formService;
    @Autowired
    private ManagementService managementService;
    @Autowired
    ObjectMapper objectMapper;

    /**
     * 查询流程部署信息
     */
    @Override
    public DataGridView queryProcessDeploy(WorkFlowVo vo){
        int firstResult=(vo.getPage()-1)*vo.getLimit();
        int maxResult=vo.getLimit();
        List<Deployment> queryResult=new ArrayList<>();
        if (vo.getDeploymentId()!=null&&!vo.getDeploymentId().equals(""))
        {
            queryResult = this.repositoryService.createDeploymentQuery().deploymentId(vo.getDeploymentId()).deploymentNameLike("%" + vo.getDeploymentName() + "%").listPage(firstResult, maxResult);
        }

        if (vo.getDeploymentId()==null||vo.getDeploymentId().equals(""))
        {
            if (vo.getDeploymentName()==null){
                vo.setDeploymentName("");
            }
            queryResult = this.repositoryService.createDeploymentQuery().deploymentNameLike("%" + vo.getDeploymentName() + "%").listPage(firstResult, maxResult);
        }
        //查询总条数
        long size = queryResult.size();
        ArrayList<DeploymentEntityVo> data = new ArrayList<>();
        for(Deployment deployment: queryResult){
            data.add(new DeploymentEntityVo(deployment));
        }
        return new DataGridView(size,data);
    }

    /**
     * 查询流程定义信息
     * @param vo
     * @return
     */
    @Override
    public DataGridView queryProcessDefinition(WorkFlowVo vo)
    {
        int firstResult=(vo.getPage()-1)*vo.getLimit();
        int maxResult=vo.getLimit();
        List<ProcessDefinition> queryResult=new ArrayList<>();
        if (vo.getDefinitionId()!=null&&!vo.getDefinitionId().equals(""))
        {
            queryResult = this.repositoryService.createProcessDefinitionQuery().processDefinitionId(vo.getDefinitionId()).processDefinitionKeyLike("%" + vo.getDefinitionName() + "%").listPage(firstResult, maxResult);
        }

        if (vo.getDefinitionId()==null||vo.getDefinitionId().equals(""))
        {
            if (vo.getDefinitionName()==null){
                vo.setDefinitionName("");
            }

            queryResult = this.repositoryService.createProcessDefinitionQuery().processDefinitionKeyLike("%" + vo.getDefinitionName() + "%").listPage(firstResult, maxResult);
        }

        long size = queryResult.size();

        ArrayList<ProcessDefinitionEntityVo> objects = new ArrayList<>();
        for (ProcessDefinition processDefinition : queryResult) {
            ProcessDefinitionEntityVo processDefinitionEntityVo = new ProcessDefinitionEntityVo(processDefinition);
            objects.add(processDefinitionEntityVo);
        }
        return new DataGridView(size,objects);

    }


    /**
     * 根据部署id删除模型
     * @param id
     */
    @Override
    public void deleteProcessDeployById(Integer id) {
        this.repositoryService.deleteDeployment(id+"",true);
    }

    /**
     * 查询流程模型信息
     * @param vo
     * @return
     */
    @Override
    public DataGridView queryProcessModel(WorkFlowVo vo) {
        int firstResult=(vo.getPage()-1)*vo.getLimit();
        int maxResult=vo.getLimit();
        List<Model> queryResult=new ArrayList<>();
//        boolean fl = vo.getModelId().equals("");
        if (vo.getModelId()!=null&&!vo.getModelId().equals(""))
        {
            queryResult = this.repositoryService.createModelQuery().modelId(vo.getModelId()).modelNameLike("%" + vo.getModelName() + "%").listPage(firstResult, maxResult);
        }
        //根据模型名称查询
        if (vo.getModelId()==null||vo.getModelId().equals(""))
        {
            if (vo.getModelName()==null){
                vo.setModelName("");
            }
            queryResult = this.repositoryService.createModelQuery().modelNameLike("%" + vo.getModelName() + "%").listPage(firstResult, maxResult);
        }
        long count = queryResult.size();
        ArrayList<ModelEntityVo> objects = new ArrayList<>();

        for (Model model : queryResult)
        {
            objects.add(new ModelEntityVo(model));
        }
        return new DataGridView(count,objects);
    }

    /**
     * 删除流程模型
     * @param id
     */
    @Override
    public void deleteProcessModelById(Integer id) {
        this.repositoryService.deleteModel(id+"");
    }

    /**
     * 发布模型为流程定义
     * @param id
     */
    @Override
    public  ResultObj deployModel(String id) {
        try {
            //获取模型
            Model modelData = this.repositoryService.getModel(id);
            byte[] bytes = this.repositoryService.getModelEditorSource(modelData.getId());

            if (bytes == null)
            {
                return  ResultObj.DEPLOY_ERROR;
    //            return ToWeb.buildResult().status(Status.FAIL)
    //                    .msg("模型数据为空，请先设计流程并成功保存，再进行发布。");
            }

            JsonNode modelNode = new ObjectMapper().readTree(bytes);

            BpmnModel model = new BpmnJsonConverter().convertToBpmnModel(modelNode);
            if(model.getProcesses().size()==0){
                return  ResultObj.DEPLOY_ERROR;
    //            return ToWeb.buildResult().status(Status.FAIL)
    //                    .msg("数据模型不符要求，请至少设计一条主线流程。");
            }
            byte[] bpmnBytes = new BpmnXMLConverter().convertToXML(model);

            //发布流程
            String processName = modelData.getName() + ".bpmn20.xml";
            Deployment deployment = this.repositoryService.createDeployment()
                    .name(modelData.getName())
                    .addString(processName, new String(bpmnBytes, "UTF-8"))
                    .deploy();
            modelData.setDeploymentId(deployment.getId());
            this.repositoryService.saveModel(modelData);
        } catch (Exception e) {
            e.printStackTrace();
            log.info("【{}】流程部署出现问题", id,e);
            return ResultObj.DEPLOY_ERROR;
        }
        return ResultObj.DEPLOY_SUCCESS;
    }

    /**
     * 在线设计模型
     * @return
     */
    @Override
    public DataGridView onlineModel()
    {
        String id="";
        try
        {
            //初始化一个空模型
            Model model = this.repositoryService.newModel();

            //设置一些默认信息
            String name = "new-process";
            String description = "";
            int revision = 1;
            String key = "process";

            ObjectNode modelNode = objectMapper.createObjectNode();
            modelNode.put(ModelDataJsonConstants.MODEL_NAME, name);
            modelNode.put(ModelDataJsonConstants.MODEL_DESCRIPTION, description);
            modelNode.put(ModelDataJsonConstants.MODEL_REVISION, revision);

            model.setName(name);
            model.setKey(key);
            model.setMetaInfo(modelNode.toString());

            this.repositoryService.saveModel(model);
            id = model.getId();

            //完善ModelEditorSource
            ObjectNode editorNode = objectMapper.createObjectNode();
            editorNode.put("id", "canvas");
            editorNode.put("resourceId", "canvas");
            ObjectNode stencilSetNode = objectMapper.createObjectNode();
            stencilSetNode.put("namespace",
                    "http://b3mn.org/stencilset/bpmn2.0#");
            editorNode.put("stencilset", stencilSetNode);
            this.repositoryService.addModelEditorSource(id,editorNode.toString().getBytes("utf-8"));
        } catch (Exception e)
        {
            e.printStackTrace();
            return new DataGridView();
        }
        return new DataGridView(id);
    }
}
