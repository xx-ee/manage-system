package com.ms.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ms.entity.Leavebill;
import com.ms.entity.Notice;
import com.ms.entity.User;
import com.ms.response.DataGridView;
import com.ms.response.ResultObj;
import com.ms.service.ILeavebillService;
import com.ms.utils.WebUtils;
import com.ms.vo.LeaveBillVo;
import com.ms.vo.LeaveBillVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

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
    @RequestMapping("loadAllBills")
    public DataGridView loadAllBills(LeaveBillVo leaveBillVo)
    {
        IPage<Leavebill> page=new Page<>(leaveBillVo.getPage(), leaveBillVo.getLimit());
        QueryWrapper<Leavebill> queryWrapper=new QueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(leaveBillVo.getTitle()), "title", leaveBillVo.getTitle());
        queryWrapper.like(StringUtils.isNotBlank(leaveBillVo.getContent()), "content", leaveBillVo.getContent());
        queryWrapper.ge(leaveBillVo.getStartTime()!=null, "leavetime", leaveBillVo.getStartTime());
        queryWrapper.le(leaveBillVo.getEndTime()!=null, "leavetime", leaveBillVo.getEndTime());
        queryWrapper.orderByDesc("leavetime");
        this.leavebillService.page(page, queryWrapper);
        return new DataGridView(page.getTotal(), page.getRecords());
    }
    /**
     * 添加
     */
    @RequestMapping("addBill")
    public ResultObj addNotice(LeaveBillVo leaveBillVo) {
        try {
            leaveBillVo.setLeavetime(new Date());
            User user = (User) WebUtils.getSession().getAttribute("user");
            leaveBillVo.setUserid(user.getId());
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
    @RequestMapping("updateBill")
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
    @RequestMapping("deleteBill")
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
    @RequestMapping("batchDeleteNotice")
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
}

