package com.ms.controller;

import com.ms.response.DataGridView;
import com.ms.response.ResultObj;
import com.ms.service.IWorkFlowService;
import com.ms.vo.WorkFlowVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 代办任务控制器
 */
@Slf4j
@RestController
@RequestMapping("task")
public class TaskController {
    @Autowired
    private IWorkFlowService workFlowService;

    /**
     * 查询当前用户的代办任务
     * @param vo
     * @return
     */
    @RequestMapping("loadCurrentUserTask")
    public DataGridView loadCurrentUserTask(WorkFlowVo vo){
        return this.workFlowService.loadCurrentUserTask(vo);
    }
    /**
     * 根据任务ID查询批注信息
     */
    @RequestMapping("loadCommentsByTaskId")
    public DataGridView loadCommentsByTaskId(WorkFlowVo vo)
    {
        return this.workFlowService.queryCommentsByTaskId(vo.getTaskId());
    }

    /**
     * 完成任务
     * @param vo
     * @return
     */
    @RequestMapping("completeTask")
    public ResultObj completeTask(WorkFlowVo vo)
    {
        return this.workFlowService.completeTask(vo);
    }

}
