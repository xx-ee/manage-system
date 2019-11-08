package com.ms.vo.act;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.activiti.engine.task.Comment;

import java.io.Serializable;
import java.util.Date;

/**
 * @Classname： CommentEntity
 * @Description：
 * @Author： xiedong
 * @Date： 2019/11/8 10:02
 * @Version： 1.0
 **/
@Data
@EqualsAndHashCode(callSuper = false)
public class CommentEntityVo implements Serializable {

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date time;
    private String userId;
    private String message;

    public CommentEntityVo(Comment comment) {
        setTime(comment.getTime());
        setUserId(comment.getUserId());
        setMessage(comment.getFullMessage());
    }
}
