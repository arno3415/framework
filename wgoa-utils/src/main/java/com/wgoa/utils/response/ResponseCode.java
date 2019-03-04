package com.wgoa.utils.response;

/**
 * 返回结果代码
 * 
 * @author LIZXLFFREEDOM
 *
 */
public class ResponseCode {

	/**
	 * 操作成功
	 */
	public static final int SUCCESS = 0;

	/**
	 * 操作失败
	 */
	public static final int FAILURE = 1;

	/**
	 * 参数错误
	 */
	public static final int PARAMETER_ERROR = 2;

	/**
	 * 出现异常
	 */
	public static final int EXCEPTION = 3;
	
	/**
	 * 没有权限
	 */
	public static final int NO_PERMISSIONS = 4;
	
	/**
	 * 登录超时
	 */
	public static final int LOGIN_TIME_OUT = 6;

}
