package com.ms.service;

import com.ms.response.DataGridView;
import com.ms.response.ResultObj;
import com.ms.vo.WorkFlowVo;

import java.io.InputStream;

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
     * 删除流程部署
     * @param id
     */
    void deleteProcessDeployById(Integer id);

    /**
     * 查询流程模型
     * @param vo
     * @return
     */
    DataGridView queryProcessModel(WorkFlowVo vo);

    /**
     * 删除流程模型
     * @param id
     */
    void deleteProcessModelById(Integer id);

    /**
     * 发布模型为流程定义
     * @param id
     */
    ResultObj deployModel(String id);

    /**
     * 在线设计模型
     * @return
     */
    DataGridView onlineModel();

    /**
     * 查看流程图片
     * @param deploymentId
     * @return
     */
    InputStream viewProcessImage(String deploymentId);
}
