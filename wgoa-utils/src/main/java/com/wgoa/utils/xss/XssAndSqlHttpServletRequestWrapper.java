package com.wgoa.utils.xss;

import org.springframework.web.util.HtmlUtils;

import javax.servlet.ReadListener;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.*;

/**
 * 防止XSS攻击
 * @Author Arno
 * @Date 2019/1/18 16:13
 * @Version 1.0
 **/
public class XssAndSqlHttpServletRequestWrapper extends HttpServletRequestWrapper {

    HttpServletRequest orgRequest = null;

    /**
     * 描述 : 构造函数
     *
     * @param request 请求对象
     */
    public XssAndSqlHttpServletRequestWrapper(HttpServletRequest request) {
        super(request);
        orgRequest = request;
    }

    @Override
    public String getHeader(String name) {
        String value = super.getHeader(name);
        return HtmlUtils.htmlEscape(value);
    }

    @Override
    public String getParameter(String name) {
        String value = super.getParameter(name);
        return XssShieldUtil.stripXss(value);
    }

    @Override
    public String[] getParameterValues(String name) {
        String[] values = super.getParameterValues(name);
        if (values != null) {
            int length = values.length;
            String[] escapseValues = new String[length];
            for (int i = 0; i < length; i++) {
                escapseValues[i] = XssShieldUtil.stripXss(values[i]);
//                escapseValues[i] = values[i];
            }
            return escapseValues;
        }
        return super.getParameterValues(name);
    }

    @Override
    public ServletInputStream getInputStream() throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(orgRequest.getInputStream()));
        String line = br.readLine();
        String result = "";
        if (line != null) {
//            //对参数进行处理
//            Map<String,Object> object = JSONObject.parseObject(line);
//            for (String key : object.keySet()
//                 ) {
//                if(object.get(key) instanceof String){
//                    object.put(key,HtmlUtils.htmlEscape(object.get(key).toString()));
//                }
//            }
//            result = JSONObject.toJSONString(object);
            result = XssShieldUtil.stripXss(line);
        }

        return new WrappedServletInputStream(new ByteArrayInputStream(result.getBytes()));
    }

    private class WrappedServletInputStream extends ServletInputStream {
        public void setStream(InputStream stream) {
            this.stream = stream;
        }

        private InputStream stream;

        public WrappedServletInputStream(InputStream stream) {
            this.stream = stream;
        }

        @Override
        public int read() throws IOException {
            return stream.read();
        }

        @Override
        public boolean isFinished() {
            return true;
        }

        @Override
        public boolean isReady() {
            return true;
        }

        @Override
        public void setReadListener(ReadListener readListener) {

        }
    }

    /**
     * 获取原始的request
     */
    public HttpServletRequest getOrgRequest() {
        return orgRequest;
    }

    /**
     * 获取原始的request的静态方法
     */
    public static HttpServletRequest getOrgRequest(HttpServletRequest req) {
        if (req instanceof XssAndSqlHttpServletRequestWrapper) {
            return ((XssAndSqlHttpServletRequestWrapper) req).getOrgRequest();
        }
        return req;
    }
}
