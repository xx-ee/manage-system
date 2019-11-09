package com.ms.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ms.entity.Leavebill;
import com.ms.entity.User;
import com.ms.response.Constast;
import com.ms.response.DataGridView;
import com.ms.response.ResultObj;
import com.ms.service.ILeavebillService;
import com.ms.service.IUserService;
import com.ms.service.IWorkFlowService;
import com.ms.utils.WebUtils;
import com.ms.vo.LeaveBillVo;
import com.ms.vo.WorkFlowVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author xiedong
 * @since 2019-11-06
 */
@RestController
@RequestMapping("/leavebill")
public class LeavebillController {
    @Autowired
    private ILeavebillService leavebillService;
    @Autowired
    private IUserService userService;
    @Autowired
    private IWorkFlowService workFlowService;

    @RequestMapping("loadAllBills")
    public DataGridView loadAllBills(LeaveBillVo leaveBillVo,HttpSession session)
    {
        IPage<Leavebill> page=new Page<>(leaveBillVo.getPage(), leaveBillVo.getLimit());
        QueryWrapper<Leavebill> queryWrapper=new QueryWrapper<>();
        User user = (User)session.getAttribute("user");
        if (user!=null&&user.getType()== Constast.USER_TYPE_NORMAL)
        {
            queryWrapper.eq("userid", user.getId());
        }
        queryWrapper.like(StringUtils.isNotBlank(leaveBillVo.getTitle()), "title", leaveBillVo.getTitle());
        queryWrapper.like(StringUtils.isNotBlank(leaveBillVo.getContent()), "content", leaveBillVo.getContent());
        queryWrapper.ge(leaveBillVo.getStartTime()!=null, "leavetime", leaveBillVo.getStartTime());
        queryWrapper.le(leaveBillVo.getEndTime()!=null, "leavetime", leaveBillVo.getEndTime());
        queryWrapper.orderByAsc("id");
        this.leavebillService.page(page, queryWrapper);
        List<Leavebill> records = page.getRecords();
        for (Leavebill record : records) {
            String userid = record.getUserid();
            QueryWrapper<User> temp=new QueryWrapper<>();
            temp.eq("id", userid);
            User one = this.userService.getOne(temp);
//            record.setUserid(one.getName());
            record.setUsername(one.getName());
        }
        return new DataGridView(page.getTotal(), page.getRecords());
    }
    /**
     * 添加
     */
    @RequestMapping("addleavebill")
    public ResultObj addNotice(LeaveBillVo leaveBillVo) {
        try {
            leaveBillVo.setLeavetime(new Date());
            User user = (User) WebUtils.getSession().getAttribute("user");
            leaveBillVo.setUserid(user.getId()+"");
            leaveBillVo.setState(0);
            this.leavebillService.save(leaveBillVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }
    /**
     * 修改
     */
    @RequestMapping("updateleavebill")
    public ResultObj updateNotice(LeaveBillVo leaveBillVo) {
        try {
            this.leavebillService.updateById(leaveBillVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }

    /**
     * 删除
     */
    @RequestMapping("deleteleavebill")
    public ResultObj deleteNotice(Integer id) {
        try {
            this.leavebillService.removeById(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }


    /**
     * 批量删除
     */
    @RequestMapping("batchDeleteleavebill")
    public ResultObj batchDeleteNotice(LeaveBillVo leaveBillVo) {
        try {
            Collection<Serializable> idList=new ArrayList<Serializable>();
            for (Integer id : leaveBillVo.getIds()) {
                idList.add(id);
            }
            this.leavebillService.removeByIds(idList);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }
    /**
     * 根据请假单ID查询审批信息
     */
    @RequestMapping("loadCommentsByLeaveBillId")
    public DataGridView loadCommentsByLeaveBillId(WorkFlowVo workFlowVo) {
        return this.workFlowService.queryCommentsByLeaveBillId(workFlowVo.getId());
    }
}

