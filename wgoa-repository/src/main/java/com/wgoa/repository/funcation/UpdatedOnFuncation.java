package com.wgoa.repository.funcation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 实体类更新时间自动填充注解
 * @Author Arno
 * @Date 2019/1/23 16:23
 * @Version 1.0
 **/
@Retention(RetentionPolicy.RUNTIME)
@Target( {ElementType.FIELD})
public @interface  UpdatedOnFuncation {
    String value() default "";
}
