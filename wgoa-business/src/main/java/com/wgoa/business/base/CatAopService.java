package com.wgoa.business.base;

import com.dianping.cat.Cat;
import com.dianping.cat.message.Message;
import com.dianping.cat.message.Transaction;
import com.wgoa.business.annotaion.CatAnnotation;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;

/**
  * Cat SpringBoot AOP注解方式监控方法执行时间
  *@Author Arno
  *@Date 2019/2/15 19:48
  *@Version 1.0
  **/
@Aspect
@Component
public class CatAopService {

    @Around("@annotation(catAnnotation)")
    public Object aroundMethod(ProceedingJoinPoint pjp, CatAnnotation catAnnotation) {
        MethodSignature joinPointObject = (MethodSignature) pjp.getSignature();
        Method method = joinPointObject.getMethod();
        Transaction t = Cat.newTransaction("method", method.getName());
        try {
            Object result = pjp.proceed();
            t.setStatus(Message.SUCCESS);
            return result;
        } catch (Throwable e) {
            t.setStatus(e);
            Cat.logError(e);
        } finally {
            t.complete();
        }
        return null;
    }
}
