package com.ms.service.Impl;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
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
import org.activiti.editor.language.json.converter.BpmnJsonConverter;
import org.activiti.engine.*;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.Model;
import org.activiti.engine.repository.ModelQuery;
import org.activiti.engine.repository.ProcessDefinition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
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

    /**
     * 查询流程部署信息
     */
    @Override
    public DataGridView queryProcessDeploy(WorkFlowVo vo){
        if (vo.getDeploymentName()==null)
        {
            vo.setDeploymentName("");
        }
        //查询总条数
        long count = repositoryService.createDeploymentQuery().deploymentNameLike("%" + vo.getDeploymentName() + "%").count();
        //查询
        int firstResult=(vo.getPage()-1)*vo.getLimit();
        int maxResult=vo.getLimit();
        List<Deployment> deployments = repositoryService.createDeploymentQuery().deploymentNameLike("%" + vo.getDeploymentName() + "%").listPage(firstResult, maxResult);
        ArrayList<DeploymentEntityVo> data = new ArrayList<>();
        for(Deployment deployment: deployments){
            data.add(new DeploymentEntityVo(deployment));
        }
        return new DataGridView(count,data);
    }

    /**
     * 查询流程定义信息
     * @param vo
     * @return
     */
    @Override
    public DataGridView queryProcessDefinition(WorkFlowVo vo)
    {
//        if (vo.getDeploymentName()==null)
//        {
//            vo.setDeploymentName("");
//        }
//        String deploymentName = vo.getDeploymentName();
//        //根据部署的名称模糊查询出所有的部署ID
//        List<Deployment> list = repositoryService.createDeploymentQuery().deploymentNameLike("%" + vo.getDeploymentName() + "%").list();
//        HashSet<String> deploymentIds = new HashSet<>();
//        for (Deployment deployment : list) {
//            deploymentIds.add(deployment.getId());
//        }
//        long count = this.repositoryService.createProcessDefinitionQuery().deploymentIds(deploymentIds).count();
//        //查询
//        int firstResult=(vo.getPage()-1)*vo.getLimit();
//        int maxResult=vo.getLimit();
//        List<ProcessDefinition> processDefinitions = this.repositoryService.createProcessDefinitionQuery().deploymentIds(deploymentIds).listPage(firstResult, maxResult);
//        ArrayList<ActProcessDefinition> objects = new ArrayList<>();
//        for (ProcessDefinition processDefinition : processDefinitions) {
//            ActProcessDefinition actProcessDefinition = new ActProcessDefinition(processDefinition);
//            objects.add(actProcessDefinition);
//        }
//        return new DataGridView(count,objects);
        int firstResult=(vo.getPage()-1)*vo.getLimit();
        int maxResult=vo.getLimit();
        List<Model> list = repositoryService.createModelQuery().listPage(firstResult
                , maxResult);
        long count = repositoryService.createModelQuery().count();
        ArrayList<ModelEntityVo> objects = new ArrayList<>();

        for (Model model : list)
        {
            objects.add(new ModelEntityVo(model));
        }
        return new DataGridView(count,objects);
    }

    @Override
    public void deleteProcessDefById(Integer id) {
        try
        {
            this.repositoryService.deleteModel(id+"");
        } catch (Exception e) {
            log.info("删除出现异常",e);
        }
    }

    @Override
    public void deleteProcessDeployById(Integer id) {
        this.repositoryService.deleteDeployment(id+"",true);
    }

    @Override
    public DataGridView queryProcessModel(WorkFlowVo vo) {
        int firstResult=(vo.getPage()-1)*vo.getLimit();
        int maxResult=vo.getLimit();
        List<Model> queryResult=new ArrayList<>();
//        boolean fl = vo.getModelId().equals("");
        if (vo.getModelId()!=null&&!vo.getModelId().equals(""))
        {
            queryResult = repositoryService.createModelQuery().modelId(vo.getModelId()).modelNameLike("%" + vo.getModelName() + "%").listPage(firstResult, maxResult);
        }
        //根据模型名称查询
        if (vo.getModelId()==null||vo.getModelId().equals(""))
        {
            if (vo.getModelName()==null){
                vo.setModelName("");
            }
            queryResult = repositoryService.createModelQuery().modelNameLike("%" + vo.getModelName() + "%").listPage(firstResult, maxResult);
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
            Model modelData = repositoryService.getModel(id);
            byte[] bytes = repositoryService.getModelEditorSource(modelData.getId());

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
            Deployment deployment = repositoryService.createDeployment()
                    .name(modelData.getName())
                    .addString(processName, new String(bpmnBytes, "UTF-8"))
                    .deploy();
            modelData.setDeploymentId(deployment.getId());
            repositoryService.saveModel(modelData);
        } catch (Exception e) {
            e.printStackTrace();
            log.info("【{}】流程部署出现问题", id,e);
            return ResultObj.DEPLOY_ERROR;
        }
        return ResultObj.DEPLOY_SUCCESS;
    }
}
