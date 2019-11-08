package com.ms.controller;

import com.ms.entity.Leavebill;
import com.ms.service.IWorkFlowService;
import com.ms.vo.WorkFlowVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @Classname： WorkFlowController
 * @Description：工作流控制器
 * @Author： xiedong
 * @Date： 2019/11/6 16:26
 * @Version： 1.0
 **/
@Controller
@RequestMapping("workflow")
public class WorkFlowController {

    @Autowired
    private IWorkFlowService workFlowService;
    /**
     * 跳转到模型管理界面
     */
    @RequestMapping("toWorkFlowModel")
    public String toWorkFlowModel()
    {
        return "workflow/processModelManager";
    }
    /**
     * 跳转到流程定义管理界面
     */
    @RequestMapping("toWorkFlowDef")
    public String toWorkFlowDef()
    {
        return "workflow/processDefManager";
    }
    /**
     * 跳转到流程部署管理界面
     */
    @RequestMapping("toWorkFlowDeploy")
    public String toWorkFlowDeploy()
    {
        return "workflow/processDeployManager";
    }
    /**
     * 查看流程图
     */
    @RequestMapping("toViewProcessImage")
    public String toViewProcessImage(Model model, WorkFlowVo workFlowVo){
        model.addAttribute("deploymentId", workFlowVo.getDeploymentId());
        return "workflow/viewProcessImage";}

    /**
     * 跳转到待办任务界面
     * @return
     */
    @RequestMapping("toTaskManager")
    public String toTaskManager() {return "workflow/taskManager";}
    /**
     * 跳转到办理任务界面
     */
    @RequestMapping("toDoTask")
    public String toDoTask(Model model, WorkFlowVo vo){
        model.addAttribute("taskId", vo.getTaskId());
        //1.根据任务id查询请假单的信息
        Leavebill leavebill =this.workFlowService.queryLeaveBillByTaskId(vo.getTaskId());
        model.addAttribute("leaveBill",leavebill);
        //2.根据任务id查询连线信息
       List<String> outComeNames =this.workFlowService.queryOutComeByTaskId(vo.getTaskId());
        model.addAttribute("outcomes",outComeNames);
        return"workflow/doTask";
    }


}
