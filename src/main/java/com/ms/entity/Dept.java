package com.ms.entity;

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
@TableName("sys_dept")
public class Dept implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private Integer pid;

    private String title;

    private Integer open;

    private String remark;

    private String address;

    /**
     * 状态【0不可用1可用】
     */
    private Integer available;

    /**
     * 排序码【为了调事显示顺序】
     */
    private Integer ordernum;

    private Date createtime;


}
