package com.wgoa.repository.interceptor;

import lombok.Data;
import lombok.experimental.Accessors;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.SqlCommandType;
import org.apache.ibatis.plugin.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

/**
 * 自动填充配置
 * 对于新增、修改操作，自动填充创建时间、修改时间字段值
 * @Author Arno
 * @Date 2019/1/23 16:08
 * @Version 1.0
 **/
@Component
@Configuration
@Data
@Accessors(chain = true)
@Intercepts( {
        @Signature(
                type = Executor.class,
                method = "update",
                args = {MappedStatement.class, Object.class})})
public class CreateUpdateTimeInterceptor implements Interceptor {

    private static final Logger LOGGER = LoggerFactory.getLogger(CreateUpdateTimeInterceptor.class);

    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        Object[] args = invocation.getArgs();

        LOGGER.info("----------> 参数拦截（update） <----------");

        // 设置公共属性
        Object object = args[1];

        if (object != null) {
            MappedStatement mappedStatement = (MappedStatement) args[0];
            //获得方法类型
            SqlCommandType sqlCommandType = mappedStatement.getSqlCommandType();

            // 插入或更新多条数据时
            if (object instanceof Map) {
                Map map = (Map) object;
                if (map.containsKey("collection")) {
                    List objectList = (List) map.get("collection");
                    for (Object obj : objectList) {
                        setProperty(sqlCommandType, obj);
                    }
                }
            } else {
                setProperty(sqlCommandType, object);
            }
        }

        return invocation.proceed();
    }

    private void setProperty(SqlCommandType sqlCommandType, Object object) throws Exception {
        //新增
        if (sqlCommandType == SqlCommandType.INSERT) {
            setInsertProperty(object);
        } else if (sqlCommandType == SqlCommandType.UPDATE) {
            //修改
            setUpdateProperty(object);
        }
    }

    /**
     * 设置更新时公共属性
     *
     * @param obj
     * @throws Exception
     */
    private void setUpdateProperty(Object obj) throws Exception {
        String updateDate = BeanUtils.getProperty(obj, "updateDate");
        if (updateDate == null) {
            // 获取当前用户信息
            BeanUtils.setProperty(obj, "updateDate", new Date());
        }
    }

    /**
     * 设置新增时公共属性
     *
     * @param obj
     * @throws Exception
     */
    private void setInsertProperty(Object obj) throws Exception {
        String createDate = BeanUtils.getProperty(obj, "createDate");
        if (createDate == null) {
            // 获取用户当前登录角色
            BeanUtils.setProperty(obj, "createDate", new Date());
        }
    }

    @Override
    public Object plugin(Object o) {
        return Plugin.wrap(o, this);
    }

    @Override
    public void setProperties(Properties properties) {
        // 无要设置的属性
    }
}
