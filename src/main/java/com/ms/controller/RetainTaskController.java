package com.ms.controller;

import com.ms.response.DataGridView;
import com.ms.service.IWorkFlowService;
import com.ms.vo.WorkFlowVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Classname： RetainTaskController
 * @Description：
 * @Author： xiedong
 * @Date： 2019/11/9 22:17
 * @Version： 1.0
 **/
@Slf4j
@RequestMapping("retainTask")
@RestController
public class RetainTaskController {
    @Autowired
    private IWorkFlowService workFlowService;
    @RequestMapping("loadMyRetainTask")
    public DataGridView loadMyRetainTask(WorkFlowVo vo){
        return this.workFlowService.queryCurrentUserHistoryTask(vo);
    }
}
