package com.wgoa.utils.response;

import java.util.HashMap;

/**
 * ResponseBody构造器。一般用于ajax、rest等类型的Web服务
 */
@SuppressWarnings("serial")
public class ResResponse extends HashMap<String, Object> {
	
	public static boolean flag = false;
    public static ResResponse success(){
        return success("success");
    }
    public static ResResponse success(String message){
        ResResponse restResponse = new ResResponse();
        restResponse.setSuccess(true);
        restResponse.setMessage(message);
        flag = true;
        return restResponse;
    }

    public static ResResponse failure(String message){
        ResResponse restResponse = new ResResponse();
        restResponse.setSuccess(false);
        flag = false;
        restResponse.setMessage(message);
        return restResponse;
    }


    public ResResponse setSuccess(Boolean success) {
        if (success != null) put("success", success);
        return this;
    }

    public ResResponse setMessage(String message) {
        if (message != null) put("message", message);
        return this;
    }

    public ResResponse setData(Object data) {
        if (data != null) put("data", data);
        return this;
    }

    public ResResponse setPage(Integer page) {
        if (page != null) put("page", page);
        return this;
    }
    
    public ResResponse setCurrentPage(Integer currentPage){
    	if (currentPage != null) put("currentPage", currentPage);
        return this;
    }

    public ResResponse setLimit(Integer limit) {
        if (limit != null) put("limit", limit);
        return this;
    }

    public ResResponse setTotal(Long total) {
        if (total != null) put("total", total);
        return this;
    }

    public ResResponse setAny(String key, Object value) {
        if (key != null && value != null) put(key, value);
        return this;
    }
}
