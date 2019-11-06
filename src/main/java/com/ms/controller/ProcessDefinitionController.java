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
 * 流程定义控制器
 */
@Slf4j
@RestController
@RequestMapping("prodef")
public class ProcessDefinitionController {
    @Autowired
    private IWorkFlowService workFlowService;
    /**
     * 加载流程定义信息
     */
    @RequestMapping("loadAllProcessDefinition")
    public DataGridView loadAllProcessDefinition(WorkFlowVo vo) {
        return workFlowService.queryProcessDefinition(vo);
    }
    /**
     * 删除流程定义
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
    /**
     * 批量删除流程定义
     */
    @RequestMapping("batchDeleteworkflow")
    @ResponseBody
    public ResultObj batchDeleteNotice(WorkFlowVo vo) {
        try {
            for (Integer id : vo.getIds()) {
                this.deleteNotice(id);
            }
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }
}
