package com.ms.service.impl;

import com.ms.entity.Dept;
import com.ms.mapper.DeptMapper;
import com.ms.service.IDeptService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author xiedong
 * @since 2019-11-05
 */
@Service
public class DeptServiceImpl extends ServiceImpl<DeptMapper, Dept> implements IDeptService {

}
