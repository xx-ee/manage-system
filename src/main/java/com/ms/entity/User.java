package com.ms.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author xiedong
 * @since 2019-11-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_user")
public class User implements Serializable {

    private static final long serialVersionUID=1L;

    /**
     * id主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 用户姓名
     */
    private String name;

    /**
     * 登录用户名
     */
    private String loginname;

    /**
     * 用户地址
     */
    private String address;

    /**
     * 性别
     */
    private Integer sex;

    /**
     * 用户备注
     */
    private String remark;

    /**
     * 密码
     */
    private String pwd;

    /**
     * 部门id
     */
    private Integer deptid;

    /**
     * 入职时间
     */
    private Date hiredate;

    /**
     * 直属领导
     */
    private Integer mgr;

    /**
     * 是否可用
     */
    private Integer available;

    /**
     * 排序码
     */
    private Integer ordernum;

    /**
     * 用户类型[0超级管理员1，管理员，2普通用户]
     */
    private Integer type;

    /**
     * 头像地址
     */
    private String imgpath;

    private String salt;
    /**
     * 领导名称
     */
    @TableField(exist=false)
    private String leadername;
    /**
     * 部门名称
     */
    @TableField(exist=false)
    private String deptname;

}
