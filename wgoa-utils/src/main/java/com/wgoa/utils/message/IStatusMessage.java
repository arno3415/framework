package com.wgoa.utils.message;

/**
 * @Author Arno
 * @Date 2018/12/26 19:02
 * @Version 1.0
 **/
public interface IStatusMessage {

    Integer getCode();

    String getMessage();

    enum SystemStatus implements IStatusMessage{

        SUCCESS(1000,"SUCCESS"), //请求成功
        ERROR(1001,"ERROR"),	   //请求失败
        PARAM_ERROR(1002,"PARAM_ERROR"), //请求参数有误
        SUCCESS_MATCH(1003,"SUCCESS_MATCH"), //表示成功匹配
        NO_LOGIN(1100,"NO_LOGIN"), //未登录
        MANY_LOGINS(1101,"MANY_LOGINS"), //多用户在线（踢出用户）
        UPDATE(1102,"UPDATE"), //用户信息或权限已更新（退出重新登录）
        LOCK(1111,"LOCK"); //用户已锁定
        private Integer code;
        private String message;

        SystemStatus(Integer code,String message){
            this.code = code;
            this.message = message;
        }

        public Integer getCode(){
            return this.code;
        }

        public String getMessage(){
            return this.message;
        }
    }
}