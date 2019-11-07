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
}
