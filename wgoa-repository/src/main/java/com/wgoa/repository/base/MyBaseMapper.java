package com.wgoa.repository.base;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 父级mapper接口
 * 用于定义公共方法
 * 所有类mapper继承此类
 * @Author Arno
 * @Date 2019/1/23 16:41
 * @Version 1.0
 **/
public interface MyBaseMapper<T> {

    void insert(T t) throws Exception;

    void update(@Param("t")T t, @Param("queryParams") String queryParams) throws Exception;

    void delete(Map<String,Object> map) throws Exception;

    List<T> list(Map<String,Object> map) throws Exception;

    T selectOne(Map<String,Object> map) throws Exception;
}
