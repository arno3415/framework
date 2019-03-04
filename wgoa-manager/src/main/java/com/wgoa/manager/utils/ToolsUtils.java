package com.wgoa.manager.utils;

import com.wgoa.manager.utils.constants.Constants;
import com.wgoa.repository.domain.sys.WgUser;
import com.wgoa.utils.codes.Encodes;
import org.apache.commons.lang3.StringUtils;

/**
 * 盐加解密工具类
 * @Author Arno
 * @Date 2019/1/27 22:54
 * @Version 1.0
 **/
public class ToolsUtils {

    /**
     * 设定安全的密码，生成随机的salt并经过1024次 sha-1 hash
     */
    public static void entryptPassword(WgUser user) {
        byte[] salt = Digests.generateSalt(Constants.SALT_SIZE);
        user.setSalt(Encodes.encodeHex(salt));
        byte[] hashPassword = Digests.sha1(user.getPassword().getBytes(), salt, Constants.HASH_INTERATIONS);
        user.setPassword(Encodes.encodeHex(hashPassword));
    }

    /**
     *
     * @param paramStr
     *            输入需要加密的字符串
     * @return
     */
    public static String entryptPassword(String paramStr, String salt) {
        if (StringUtils.isNotEmpty(paramStr)) {
            byte[] saltStr = Encodes.decodeHex(salt);
            byte[] hashPassword = Digests.sha1(paramStr.getBytes(), saltStr, Constants.HASH_INTERATIONS);
            String password = Encodes.encodeHex(hashPassword);
            return password;
        } else {
            return null;
        }

    }
}
