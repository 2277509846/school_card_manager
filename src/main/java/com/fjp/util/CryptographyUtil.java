package com.fjp.util;

import org.apache.shiro.crypto.hash.Md5Hash;

public class CryptographyUtil {
	/**
	 * 使用md5生成密码
	 * @param str
	 * @param salt
	 * @return
	 */
	public static String md5(String str, String salt) {
		return new Md5Hash(str, salt).toString();
	}
}
