package com.ms.controller;

import com.ms.entity.Leavebill;
import com.ms.service.ILeavebillService;
import com.ms.service.IWorkFlowService;
import com.ms.vo.WorkFlowVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
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
    @Autowired
    private ILeavebillService leavebillService;
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

    /**
     * 根据任务ID查看流程图
     * @param vo
     * @return
     */
    @RequestMapping("toViewProcessByTaskId")
    public String toViewProcessByTaskId(WorkFlowVo vo,Model model){
        model.addAttribute("taskId",vo.getTaskId());
        return "workflow/viewProcessTaskImage";
    }
    /**
     * 根据任务ID查看流程图的高亮显示
     */
    @RequestMapping("viewTaskProcessImageByTaskId")
    public ResponseEntity<Object> viewTaskProcessImageByTaskId(WorkFlowVo workFlowVo) {
        String deploymentId = workFlowVo.getDeploymentId();
        InputStream is = this.workFlowService.viewTaskProcessImageByTaskId(workFlowVo.getTaskId());
        //把输入流转成字节数组
        ByteArrayOutputStream swapStream = new ByteArrayOutputStream();
        byte[] buff = new byte[100]; //buff用于存放循环读取的临时数据
        int rc = 0;
        try {
            while ((rc = is.read(buff, 0, 100)) > 0) {
                swapStream.write(buff, 0, rc);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 将下载的文件，封装byte[]
        byte[] bytes = swapStream.toByteArray();
        // 创建封装响应头信息的对象
        HttpHeaders header = new HttpHeaders();
        // 封装响应内容类型(APPLICATION_OCTET_STREAM 响应的内容不限定)
        header.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        // 设置下载的文件的名称
        header.setContentDispositionFormData("attachment", "saaa.jpg");

        // 创建ResponseEntity对象
        ResponseEntity<Object> entity = new ResponseEntity<Object>(bytes, header, HttpStatus.CREATED);

        return entity;

    }

    /**
     * 请假单的审批进度查询
     * @param vo
     * @return
     */
    @RequestMapping("toViewSPQuery")
    public String toViewSPQuery(WorkFlowVo vo,Model model){
        Leavebill leavebill = this.leavebillService.getById(vo.getId());
        model.addAttribute("leavebill", leavebill);
        return "workflow/viewSpManager";
    }


    @RequestMapping("toRetainTask")
    public String toRetainTask(){
        return "workflow/retainTask";
    }
}
