/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.wgoa.repository.base;


import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


/**
 * Entity支持类
 *
 * @param <T>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public abstract class BaseEntity<T>{

    /**
     * 实体编号（唯一标识）
     */
    protected Integer id;



    @JsonSerialize(using=ToStringSerializer.class)
    public Integer getId() {
        return id;
    }

    @Override
    public boolean equals(Object obj) {
        if (null == obj) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        if (!getClass().equals(obj.getClass())) {
            return false;
        }
        BaseEntity<T> that = (BaseEntity<T>) obj;
        return null != this.getId() && this.getId().equals(that.getId());
    }


}
