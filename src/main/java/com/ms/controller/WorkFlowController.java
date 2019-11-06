package com.ms.controller;

import com.ms.response.DataGridView;
import com.ms.response.ResultObj;
import com.ms.service.IWorkFlowService;
import com.ms.vo.WorkFlowVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
     * 跳转到流程定义管理界面
     */
    @RequestMapping("toWorkFlowDeploy")
    public String toWorkFlowDeploy()
    {
        return "workflow/processDefManager";
    }
    /**
     * 加载流程部署信息
     */
    @RequestMapping("loadAllDeployment")
    @ResponseBody
    public DataGridView loadAllDeploys(WorkFlowVo vo) {
        return workFlowService.queryProcessDeploy(vo);
    }
    /**
     * 加载流程定义信息
     */
    @RequestMapping("loadAllProcessDefinition")
    @ResponseBody
    public DataGridView loadAllProcessDefinition(WorkFlowVo vo) {
        return workFlowService.queryProcessDefinition(vo);
    }

    /**
     * 删除
     */
    @RequestMapping("deleteworkflow")
    public ResultObj deleteNotice(Integer id) {
        try {
            this.workFlowService.deleteworkflow(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }
}
