package com.ms.controller;

import com.ms.response.DataGridView;
import com.ms.response.ResultObj;
import com.ms.service.IWorkFlowService;
import com.ms.vo.WorkFlowVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * 流程部署控制器
 */
@Slf4j
@RequestMapping("prodeploy")
@RestController
public class ProcessDeployController {
    @Autowired
    private IWorkFlowService workFlowService;
    /**
     * 加载流程部署信息
     */
    @RequestMapping("loadAllDeployment")
    @ResponseBody
    public DataGridView loadAllDeploys(WorkFlowVo vo) {
        return workFlowService.queryProcessDeploy(vo);
    }
    /**
     * 删除流程部署
     */
    @RequestMapping("deleteworkflow")
    public ResultObj deleteProcessDeployById(Integer id) {
        try {
            this.workFlowService.deleteProcessDeployById(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }
    /**
     * 批量删除流程部署
     */
    @RequestMapping("batchDeleteworkflow")
    @ResponseBody
    public ResultObj batchDeleteProcessDeploy(WorkFlowVo vo) {
        try {
            for (Integer id : vo.getIds()) {
                this.deleteProcessDeployById(id);
            }
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }
}
