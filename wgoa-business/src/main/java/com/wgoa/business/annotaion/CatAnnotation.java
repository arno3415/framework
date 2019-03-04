package com.wgoa.business.annotaion;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
  * Cat 自定义注解，可注到需要监控的方法上
  *@Author Arno
  *@Date 2019/2/15 19:44
  *@Version 1.0
  **/
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface CatAnnotation {
}
