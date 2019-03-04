package com.wgoa.utils.io;

import javax.servlet.http.HttpServletRequest;
import java.util.regex.Pattern;

public class IpUtils {
	/**
	 * 正则表达式：验证IP地址
	 */
	public static final String REGEX_IP_ADDR_V4 = "\\d{1,3}.\\d{1,3}.\\d{1,3}.\\d{1,3}$";
	/**
	 * 正则表达式：验证IP地址
	 */
	public static final String REGEX_IP_ADDR_V6 = "^[A-Fa-f0-9:]+$";

	/**
	 * 获取登录用户IP地址
	 * 
	 * @param request
	 * @return
	 */
	public static String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		if (null == ip) {
			ip = "0.0.0.0";
		}
		if (ip.equals("0:0:0:0:0:0:0:1")) {
			ip = "127.0.0.1";
		}
		return ip;
	}

	public static String getIpAddrEx(HttpServletRequest request) {
		String ip = getIpAddr(request);
		if (15 < ip.length()) {
			String _ip = ip.substring(0, 15);
			if (isIPAddrV4(_ip)) {
				ip = _ip;
			}
		}
		return ip;
	}

	/**
	 * 校验IP地址V4
	 * 
	 * @param ipAddr
	 * @return
	 */
	public static boolean isIPAddrV4(String ipAddr) {
		return Pattern.matches(REGEX_IP_ADDR_V4, ipAddr);
	}

	/**
	 * 校验IP地址V6
	 * 
	 * @param ipAddr
	 * @return
	 */
	public static boolean isIPAddrV6(String ipAddr) {
		return Pattern.matches(REGEX_IP_ADDR_V6, ipAddr);
	}

	// public static void main(String[] args) {
	// System.out.println(String
	// .format("IPV6--V6:%s", isIPAddrV6("0:10:1af:AB")));
	// System.out.println(String
	// .format("IPV4--V6:%s", isIPAddrV4("0:10:1af:AB")));
	// System.out
	// .println(String.format("IPV6--V4:%s", isIPAddrV6("127.00.0.1")));
	// System.out
	// .println(String.format("IPV4--V4:%s", isIPAddrV4("127.000.500.221")));
	//
	// String ip = "255.235.123.147,123.0.0.1";
	// if (15 < ip.length()) {
	// String _ip = ip.substring(0, 15);
	// if (isIPAddrV4(_ip)) {
	// ip = _ip;
	// }
	// }
	// System.out.println("IPEX:" + ip);
	// }
}
