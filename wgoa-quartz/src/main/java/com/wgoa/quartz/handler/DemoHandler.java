package com.wgoa.quartz.handler;

import com.xxl.job.core.biz.model.ReturnT;
import com.xxl.job.core.handler.IJobHandler;
import com.xxl.job.core.handler.annotation.JobHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
  * 调度任务示例
  *@Author Arno
  *@Date 2019/2/20 15:52
  *@Version 1.0
  **/
@JobHandler("demoHandler")
@Service
public class DemoHandler extends IJobHandler {

    private static final Logger LOGGER = LoggerFactory.getLogger(DemoHandler.class);

    /**
     * 具体执行的调度任务
     * @param params 参数
     * @return ReturnT
     * @throws Exception
     */
    @Override
    public ReturnT<String> execute(String params) throws Exception {
        LOGGER.info("执行demoHandler任务！！！！！参数：{0}",params);
        return ReturnT.SUCCESS;
    }
}
