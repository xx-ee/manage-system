package com.ms.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ms.entity.Leavebill;
import com.ms.entity.User;
import com.ms.response.DataGridView;
import com.ms.service.ILeavebillService;
import com.ms.service.IWorkFlowService;
import com.ms.utils.WebUtils;
import com.ms.vo.WorkFlowVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Classname： DeskManagerController
 * @Description：首页工作台的控制器
 * @Author： xiedong
 * @Date： 2019/11/10 13:24
 * @Version： 1.0
 **/
@Slf4j
@RequestMapping("desk")
@RestController
public class DeskManagerController {
    @Autowired
    private ILeavebillService leavebillService;

    @Autowired
    private IWorkFlowService workFlowService;
    /**
     * 加载我的申请任务
     * @return
     */
    @RequestMapping("loadAllApply")
    public DataGridView loadAllApply(){
        User currentUser = WebUtils.getCurrentUser();
        Integer id = currentUser.getId();
        QueryWrapper<Leavebill> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("userid", id);
        queryWrapper.orderByDesc("id");
        List<Leavebill> list = leavebillService.list(queryWrapper);
        return new DataGridView(list);
    }
    //加载我的待办任务
    @RequestMapping("loadAllTask")
    public DataGridView loadAllTask(){
        WorkFlowVo workFlowVo = new WorkFlowVo();
        workFlowVo.setPage(1);
        workFlowVo.setLimit(5);
        return this.workFlowService.loadCurrentUserTask(workFlowVo);
    }
    /**
     * 查看经办任务
     */
    @RequestMapping("loadHistoyTask")
    public DataGridView loadHistoyTask(){
        WorkFlowVo workFlowVo = new WorkFlowVo();
        workFlowVo.setPage(1);
        workFlowVo.setLimit(5);
        return this.workFlowService.queryCurrentUserHistoryTask(workFlowVo);
    }
}
