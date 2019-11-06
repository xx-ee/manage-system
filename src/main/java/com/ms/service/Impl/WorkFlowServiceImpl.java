package com.ms.service.Impl;

import com.ms.response.DataGridView;
import com.ms.service.IWorkFlowService;
import com.ms.vo.WorkFlowVo;
import com.ms.vo.act.ActDeployment;
import com.ms.vo.act.ActProcessDefinition;
import com.ms.vo.act.DeploymentVo;
import com.ms.vo.act.ModelEntityVo;
import org.activiti.engine.*;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.Model;
import org.activiti.engine.repository.ProcessDefinition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        ArrayList<ActDeployment> data = new ArrayList<>();
        for(Deployment deployment: deployments){
            data.add(new ActDeployment(deployment));
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
}
