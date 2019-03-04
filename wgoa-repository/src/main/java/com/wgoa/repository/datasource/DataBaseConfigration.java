package com.wgoa.repository.datasource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.jdbc.DataSourceBuilder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

/**
  * 多数据源装载
 *  有几个数据源则配置几个bean
  *@Author Arno
  *@Date 2019/1/23 16:00
  *@Version 1.0
  **/
@Configuration
public class DataBaseConfigration {

    private Logger log = LoggerFactory.getLogger(DataBaseConfigration.class);

    @Value("${druid.type}")
    private Class<? extends DataSource> dataSourceType;

    /**
     * 写库
     * @return
     */
    @Bean(name = "writeDataSource", destroyMethod = "close", initMethod = "init")
    @Primary
    @ConfigurationProperties(prefix = "druid.master")
    public DataSource writeDataSource() {
        log.info("-------------------- writeDataSource init ---------------------");
        return DataSourceBuilder.create().type(dataSourceType).build();
    }

    /**
     * 读库1
     * @return
     */
    @Bean(name = "readDataSource1")
    @ConfigurationProperties(prefix = "druid.slave")
    public DataSource readDataSourceOne() {
        log.info("-------------------- readDataSourceOne init ---------------------");
        return DataSourceBuilder.create().type(dataSourceType).build();
    }

    /**
     * 读库2
     * @return
     */
    @Bean(name = "readDataSource2")
    @ConfigurationProperties(prefix = "druid.slave2")
    public DataSource readDataSourceTwo() {
        log.info("-------------------- readDataSourceTwo init ---------------------");
        return DataSourceBuilder.create().type(dataSourceType).build();
    }

    @Bean(name = "readDataSources")
    public List<DataSource> readDataSources() {
        List<DataSource> dataSources = new ArrayList<>();
        dataSources.add(readDataSourceOne());
        dataSources.add(readDataSourceTwo());
        return dataSources;
    }
}
