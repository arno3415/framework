/**
 * Copyright (c) 2005-2012 springside.org.cn
 */
package com.wgoa.utils.codes;

import com.wgoa.utils.Exceptions.Exceptions;
import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.binary.Hex;
import org.apache.commons.lang3.StringEscapeUtils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

/**
 * 封装各种格式的编码解码工具类.
 * 1.Commons-Codec的 hex/base64 编码
 * 2.自制的base62 编码
 * 3.Commons-Lang的xml/html escape
 * 4.JDK提供的URLEncoder
 * @author calvin
 * @version 2013-01-15
 */
public class Encodes {

	private static final String DEFAULT_URL_ENCODING = "UTF-8";
	private static final char[] BASE62 = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".toCharArray();
	private static final char[] DIGITS_LOWER = { '0', '1', '2', '3', '4', '5',
			'6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };
	private static final char[] DIGITS_UPPER = { '0', '1', '2', '3', '4', '5',
			'6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };

	/**
	 * Hex编码.
	 */
	public static String encodeHex(byte[] input) {
		return new String(Hex.encodeHex(input));
	}

	/**
	 * Hex解码.
	 */
	public static byte[] decodeHex(String input) {
		try {
			return Hex.decodeHex(input.toCharArray());
		} catch (DecoderException e) {
			throw Exceptions.unchecked(e);
		}
	}

	/**
	 * 16进制转byte数组
	 * @param data 16进制字符串
	 * @return byte数组
	 * @throws Exception 转化失败的异常
	 */
	public static byte[] hex2Bytes(final String data) throws Exception {
		final int len = data.length();

		if ((len & 0x01) != 0) {
			throw new Exception("Odd number of characters.");
		}

		final byte[] out = new byte[len >> 1];

		// two characters form the hex value.
		for (int i = 0, j = 0; j < len; i++) {
			int f = toDigit(data.charAt(j), j) << 4;
			j++;
			f = f | toDigit(data.charAt(j), j);
			j++;
			out[i] = (byte) (f & 0xFF);
		}
		return out;
	}

	/**
	 * bytes数组转16进制String
	 * @param data bytes数组
	 * @return 转化结果
	 */
	public static String bytes2Hex(final byte[] data) {
		return bytes2Hex(data, true);
	}

	/**
	 * bytes数组转16进制String
	 * @param data bytes数组
	 * @param toLowerCase 是否小写
	 * @return 转化结果
	 */
	public static String bytes2Hex(final byte[] data, final boolean toLowerCase) {
		return bytes2Hex(data, toLowerCase ? DIGITS_LOWER : DIGITS_UPPER);
	}


	/**
	 * bytes数组转16进制String
	 * @param data bytes数组
	 * @param toDigits DIGITS_LOWER或DIGITS_UPPER
	 * @return 转化结果
	 */
	private static String bytes2Hex(final byte[] data, final char[] toDigits) {
		final int l = data.length;
		final char[] out = new char[l << 1];
		// two characters form the hex value.
		for (int i = 0, j = 0; i < l; i++) {
			out[j++] = toDigits[(0xF0 & data[i]) >>> 4];
			out[j++] = toDigits[0x0F & data[i]];
		}
		return new String(out);
	}
	/**
	 * 16转化为数字
	 * @param ch 16进制
	 * @param index 索引
	 * @return 转化结果
	 * @throws Exception 转化失败异常
	 */
	private static int toDigit(final char ch, final int index)
			throws Exception {
		final int digit = Character.digit(ch, 16);
		if (digit == -1) {
			throw new Exception("Illegal hexadecimal character " + ch
					+ " at index " + index);
		}
		return digit;
	}

	/*
	 * 16进制字符串转字符串
	 */
	public static String hex2String(String hex) throws Exception{
		String r = bytes2String(hexString2Bytes(hex));
		return r;
	}

	/*
    * 字节数组转字符串
    */
	public static String bytes2String(byte[] b) throws Exception {
		String r = new String (b,"UTF-8");
		return r;
	}

	/*
	 * 16进制字符串转字节数组
	 */
	public static byte[] hexString2Bytes(String hex) {

		if ((hex == null) || (hex.equals(""))){
			return null;
		}
		else if (hex.length()%2 != 0){
			return null;
		}
		else{
			hex = hex.toUpperCase();
			int len = hex.length()/2;
			byte[] b = new byte[len];
			char[] hc = hex.toCharArray();
			for (int i=0; i<len; i++){
				int p=2*i;
				b[i] = (byte) (charToByte(hc[p]) << 4 | charToByte(hc[p+1]));
			}
			return b;
		}
	}

	/*
	 * 字符转换为字节
	 */
	private static byte charToByte(char c) {
		return (byte) "0123456789ABCDEF".indexOf(c);
	}

	/*
    * 字符串转16进制字符串
    */
	public static String string2HexString(String s) throws Exception{
		String r = bytes2HexString(string2Bytes(s));
		return r;
	}

	/*
     * 字节数组转16进制字符串
     */
	public static String bytes2HexString(byte[] b) {
		String r = "";

		for (int i = 0; i < b.length; i++) {
			String hex = Integer.toHexString(b[i] & 0xFF);
			if (hex.length() == 1) {
				hex = '0' + hex;
			}
			r += hex.toUpperCase();
		}

		return r;
	}

	/*
     * 字符串转字节数组
     */
	public static byte[] string2Bytes(String s){
		byte[] r = s.getBytes();
		return r;
	}

	/**
	 * Base64编码.
	 */
	public static String encodeBase64(byte[] input) {
		return new String(Base64.encodeBase64(input));
	}
	
	/**
	 * Base64编码.
	 */
	public static String encodeBase64(String input) {
		try {
			return new String(Base64.encodeBase64(input.getBytes(DEFAULT_URL_ENCODING)));
		} catch (UnsupportedEncodingException e) {
			return "";
		}
	}

//	/**
//	 * Base64编码, URL安全(将Base64中的URL非法字符'+'和'/'转为'-'和'_', 见RFC3548).
//	 */
//	public static String encodeUrlSafeBase64(byte[] input) {
//		return Base64.encodeBase64URLSafe(input);
//	}

	/**
	 * Base64解码.
	 */
	public static byte[] decodeBase64(String input) {
		return Base64.decodeBase64(input.getBytes());
	}
	
	/**
	 * Base64解码.
	 */
	public static String decodeBase64String(String input) {
		try {
			return new String(Base64.decodeBase64(input.getBytes()), DEFAULT_URL_ENCODING);
		} catch (UnsupportedEncodingException e) {
			return "";
		}
	}

	/**
	 * Base62编码。
	 */
	public static String encodeBase62(byte[] input) {
		char[] chars = new char[input.length];
		for (int i = 0; i < input.length; i++) {
			chars[i] = BASE62[((input[i] & 0xFF) % BASE62.length)];
		}
		return new String(chars);
	}

	/**
	 * Html 转码.
	 */
	public static String escapeHtml(String html) {
		return StringEscapeUtils.escapeHtml4(html);
	}

	/**
	 * Html 解码.
	 */
	public static String unescapeHtml(String htmlEscaped) {
		return StringEscapeUtils.unescapeHtml4(htmlEscaped);
	}

	/**
	 * Xml 转码.
	 */
	public static String escapeXml(String xml) {
		return StringEscapeUtils.escapeXml10(xml);
	}

	/**
	 * Xml 解码.
	 */
	public static String unescapeXml(String xmlEscaped) {
		return StringEscapeUtils.unescapeXml(xmlEscaped);
	}

	/**
	 * URL 编码, Encode默认为UTF-8. 
	 */
	public static String urlEncode(String part) {
		try {
			return URLEncoder.encode(part, DEFAULT_URL_ENCODING);
		} catch (UnsupportedEncodingException e) {
			throw Exceptions.unchecked(e);
		}
	}

	/**
	 * URL 解码, Encode默认为UTF-8. 
	 */
	public static String urlDecode(String part) {

		try {
			return URLDecoder.decode(part, DEFAULT_URL_ENCODING);
		} catch (UnsupportedEncodingException e) {
			throw Exceptions.unchecked(e);
		}
	}
}
