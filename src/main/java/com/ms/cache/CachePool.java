package com.ms.cache;

import com.ms.utils.SpringUtil;
import com.ms.entity.Dept;
import com.ms.entity.User;
import com.ms.mapper.DeptMapper;
import com.ms.mapper.UserMapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Classname： CachePool
 * @Description：
 * @Author： xiedong
 * @Date： 2019/11/5 15:23
 * @Version： 1.0
 **/
public class CachePool {
    /**
     * 所有的缓存数据放到这个CACHE_CONTAINER类似于redis
     */
    public static volatile Map<String, Object> CACHE_CONTAINER = new HashMap<>();


    /**
     * 根据KEY删除缓存
     * @param key
     */
    public static void removeCacheByKey(String key) {
        if(CACHE_CONTAINER.containsKey(key)) {
            CACHE_CONTAINER.remove(key);
        }
    }
    /**
     * 清空所有缓存
     * @param key
     */
    public static void removeAll() {
        CACHE_CONTAINER.clear();
    }

    /**
     * 同步缓存
     */
    public static void syncData() {
        //同步部门数据
        DeptMapper deptMapper = SpringUtil.getBean(DeptMapper.class);
        List<Dept> deptList = deptMapper.selectList(null);
        for (Dept dept : deptList) {
            CACHE_CONTAINER.put("dept:"+dept.getId(), dept);
        }
        //同步用户数据
        UserMapper userMapper = SpringUtil.getBean(UserMapper.class);
        List<User> userList = userMapper.selectList(null);
        for (User user : userList) {
            CACHE_CONTAINER.put("user:"+user.getId(), user);
        }

    }
}
