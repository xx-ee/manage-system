package com.ms.controller;

import com.ms.response.ResultObj;
import com.ms.service.IWorkFlowService;
import com.ms.vo.WorkFlowVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Classname： ProcessManagerController
 * @Description：
 * @Author： xiedong
 * @Date： 2019/11/7 17:58
 * @Version： 1.0
 **/
@Slf4j
@RestController()
@RequestMapping("process")
public class ProcessManagerController {
    @Autowired
    private IWorkFlowService workFlowService;
    /**
     * 启动流程
     * @param workFlowVo
     * @return
     */
    @RequestMapping("startProcess")
    public ResultObj startProcess(WorkFlowVo workFlowVo)
    {
        //启动请假流程
        return this.workFlowService.startProcess(workFlowVo.getId()+"");
    }
}
