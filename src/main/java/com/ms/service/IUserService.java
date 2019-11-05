package com.ms.service;

import com.ms.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author xiedong
 * @since 2019-11-05
 */
public interface IUserService extends IService<User> {
    /**
     * 保存用户和角色之间的关系
     * @param uid
     * @param ids
     */
    void saveUserRole(Integer uid, Integer[] ids);
}
