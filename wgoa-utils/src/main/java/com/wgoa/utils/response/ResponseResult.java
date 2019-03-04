package com.wgoa.utils.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 请求返回封装类
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResponseResult<T> {

	/**
	 * 返回的代码
	 */
	protected int code;

	/**
	 * 信息
	 */
	protected String message;

	/**
	 * 返回的数据
	 */
	protected T data;
}
