package com.ms.service;

import com.ms.response.DataGridView;
import com.ms.vo.WorkFlowVo;

/**
 * 工作流的服务接口
 */
public interface IWorkFlowService
{
    /**
     * 查询所有的流程部署信息
     * @param vo
     * @return
     */
    DataGridView queryProcessDeploy(WorkFlowVo vo);

    /**
     * 查询所有的流程定义信息
     * @param vo
     * @return
     */
    DataGridView queryProcessDefinition(WorkFlowVo vo);

    /**
     * 删除流程定义
     * @param id
     */
    void deleteworkflow(Integer id);
}
