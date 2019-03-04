package com.wgoa.business.base;

import com.wgoa.repository.utils.MyEntityWrapper;
import com.wgoa.utils.response.ResponseData;

import java.util.List;

/**
 * 父类service接口
 * @Author Arno
 * @Date 2019/1/23 22:19
 * @Version 1.0
 **/
public interface BaseService<T> {

    void insert(T t) throws Exception;

    void update(T t) throws Exception;

    void updateWrapper(T t,MyEntityWrapper<T> myEntityWrapper) throws Exception;

    void delete(Integer id) throws Exception;

    void deleteWrapper(MyEntityWrapper<T> myEntityWrapper) throws Exception;

    List<T> list(MyEntityWrapper<T> myEntityWrapper) throws Exception;

    ResponseData<T> listPage(MyEntityWrapper<T> myEntityWrapper, int pageNum, int pageSize) throws Exception;

    T findById(Integer id) throws Exception;

    T selectOne(MyEntityWrapper<T> myEntityWrapper) throws Exception;

}
