/**
 * Copyright (c) 2011-2014, hubin (jobob@qq.com).
 * <p>
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 * <p>
 * http://www.apache.org/licenses/LICENSE-2.0
 * <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */
package com.wgoa.repository.utils;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.toolkit.StringUtils;
import com.wgoa.repository.domain.sys.UserDetails;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * <p>
 * Entity 对象封装操作类，定义T-SQL语法
 * </p>
 *
 * @author hubin , yanghu , Dyang , Caratacus
 * @Date 2016-11-7
 */
@SuppressWarnings("serial")
public class MyEntityWrapper<T> extends Wrapper<T> {

    private static final Logger logger = LoggerFactory.getLogger(MyEntityWrapper.class);

    /**
     * 数据库表映射实体类
     */
    protected T entity = null;

    public MyEntityWrapper() {
        /* 注意，传入查询参数 */
    }

    public MyEntityWrapper(T entity) {
        this.entity = entity;
    }

    public MyEntityWrapper(T entity, String sqlSelect) {
        this.entity = entity;
        this.sqlSelect = sqlSelect;
    }

    public T getEntity() {
        return entity;
    }

    public void setEntity(T entity) {
        this.entity = entity;
    }

    /**
     * SQL 片段
     */
    @Override
    public String getSqlSegment() {
        /*
         * 无条件
		 */
        String sqlWhere = sql.toString();
        if (StringUtils.isEmpty(sqlWhere)) {
            return null;
        }

        /*
         * 根据当前实体判断是否需要将WHERE替换成 AND 增加实体不为空但所有属性为空的情况
		 */
        return sqlWhere;
//        return isWhere != null ? (isWhere ? sqlWhere : sqlWhere.replaceFirst("WHERE", AND_OR)) : sqlWhere.replaceFirst("WHERE", AND_OR);
    }

    public String toSqlString(boolean isAndOr){
        String str = getSqlSegment();
        str = !isAndOr ? str : str.replaceFirst("WHERE", AND_OR);
        for (String key : getParamNameValuePairs().keySet()
                ) {
            if(getParamNameValuePairs().get(key) instanceof Integer){
                str = str.replaceAll("#\\{" + getParamAlias() + ".paramNameValuePairs." + key + "}", getParamNameValuePairs().get(key).toString());
            }else{
                str = str.replaceAll("#\\{" + getParamAlias() + ".paramNameValuePairs." + key + "}", "\"" + getParamNameValuePairs().get(key).toString() + "\"");
            }
        }
        logger.debug(str);
        return str;
    }

    public String toSqlString(){
        String str = getSqlSegment();
        for (String key : getParamNameValuePairs().keySet()
                ) {
            if(getParamNameValuePairs().get(key) instanceof Integer){
                str = str.replaceAll("#\\{" + getParamAlias() + ".paramNameValuePairs." + key + "}", getParamNameValuePairs().get(key).toString());
            }else{
                str = str.replaceAll("#\\{" + getParamAlias() + ".paramNameValuePairs." + key + "}", "\"" + getParamNameValuePairs().get(key).toString() + "\"");
            }
        }
        logger.debug(str);
        return str;
    }

    public static void main(String[] args) {
        MyEntityWrapper<UserDetails> entityWrapper = new MyEntityWrapper<>();
        entityWrapper.eq("dfdsfa","fddsfs");
        entityWrapper.ne("fdsafdas",232);
        System.out.println(entityWrapper.toSqlString(false));
        System.out.println(entityWrapper.getSqlSegment());
        System.out.println(entityWrapper.toString());
        System.out.println(entityWrapper.getParamNameValuePairs());
    }

}
