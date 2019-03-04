package com.wgoa.business.base;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.wgoa.business.annotaion.CatAnnotation;
import com.wgoa.repository.base.MyBaseMapper;
import com.wgoa.repository.utils.MyEntityWrapper;
import com.wgoa.utils.response.ResponseData;
import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

/**
 * 父类service实现
 * @Author Arno
 * @Date 2019/1/23 22:20
 * @Version 1.0
 **/
public class BaseServiceImpl<M extends MyBaseMapper<T>, T> implements BaseService<T> {

    private static final Logger logger = LoggerFactory.getLogger(BaseServiceImpl.class);

    @Autowired
    protected M baseMapper;

    @Override
    @CatAnnotation
    public void insert(T t) throws Exception {
        this.baseMapper.insert(t);
    }

    @Override
    @CatAnnotation
    public void update(T t) throws Exception  {
        this.baseMapper.update(t,null);
    }

    @Override
    public void updateWrapper(T t, MyEntityWrapper<T> myEntityWrapper) throws Exception {
        this.baseMapper.update(t,myEntityWrapper == null? null : myEntityWrapper.toSqlString());
    }

    @Override
    @CatAnnotation
    public void delete(Integer id) throws Exception  {
        MyEntityWrapper<T> myEntityWrapper = new MyEntityWrapper<>();
        myEntityWrapper.eq("id",id);
        Map<String,Object> map = new HashedMap();
        map.put("queryParams",myEntityWrapper.toSqlString());
        this.baseMapper.delete(map);
    }

    @Override
    public void deleteWrapper(MyEntityWrapper<T> myEntityWrapper) throws Exception {
        Map<String,Object> map = new HashedMap();
        if(myEntityWrapper != null){
            map.put("queryParams",myEntityWrapper.toSqlString());
            this.baseMapper.delete(map);
        }
    }

    @Override
    @CatAnnotation
    public List<T> list(MyEntityWrapper<T> myEntityWrapper) throws Exception {
        Map<String,Object> map = new HashedMap();
        if(myEntityWrapper != null){
            map.put("queryParams",myEntityWrapper.toSqlString());
        }
        return this.baseMapper.list(map);
    }

    @Override
    @CatAnnotation
    public ResponseData<T> listPage(MyEntityWrapper<T> myEntityWrapper, int pageNum, int pageSize) throws Exception  {
        Page page = PageHelper.startPage(pageNum,pageSize);
        Map<String,Object> map = new HashedMap();
        if(myEntityWrapper != null){
            map.put("queryParams",myEntityWrapper.toSqlString());
        }
        List<T> list = this.baseMapper.list(map);
        return new ResponseData<>(0,"",page.getTotal(),list);
    }

    @Override
    @CatAnnotation
    public T findById(Integer id) throws Exception  {
        MyEntityWrapper<T> myEntityWrapper = new MyEntityWrapper<>();
        myEntityWrapper.eq("id",id);
        Map<String,Object> map = new HashedMap();
        map.put("queryParams",myEntityWrapper.toSqlString());
        return this.baseMapper.selectOne(map);
    }

    @Override
    @CatAnnotation
    public T selectOne(MyEntityWrapper<T> myEntityWrapper) throws Exception {
        Map<String,Object> map = new HashedMap();
        if(myEntityWrapper != null){
            map.put("queryParams",myEntityWrapper.toSqlString());
        }
        return this.baseMapper.selectOne(map);
//        List<T> list = this.baseMapper.list(map);
//        if(CollectionUtils.isNotEmpty(list)) {
//            int size = list.size();
//            if(size > 1) {
//                logger.warn(String.format("Warn: execute Method There are  %s results.", new Object[]{Integer.valueOf(size)}));
//            }
//            return list.get(0);
//        } else {
//            return null;
//        }
    }
}
