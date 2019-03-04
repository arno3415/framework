package com.wgoa.utils.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 封装的LayUITable返回结果
 * 
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResponseData<T> {

	/**
	 * 状态码，0代表成功，其它失败
	 */
	private int code = 0;

	/**
	 * 状态信息，一般可为空
	 */
	private String message;

	/**
	 * 数据总量
	 */
	private long count;

	/**
	 * 返回的数据
	 */
	private List<T> data;

}
