package com.wgoa.manager.controller;

import com.google.common.collect.Maps;
import com.wgoa.manager.base.BaseController;
import com.wgoa.manager.utils.Digests;
import com.wgoa.manager.utils.constants.Constants;
import com.wgoa.utils.codes.Encodes;
import com.wgoa.utils.response.ResResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * 登录controller
 * @Author Arno
 * @Date 2019/1/24 19:11
 * @Version 1.0
 **/
@Api(value = "登录、登出")
@RestController
public class LoginController extends BaseController {

    private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

    @ApiOperation(value="用户登录", notes="验证用户名、密码登录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "username", value = "用户名",paramType = "query", required = true, dataType = "string"),
            @ApiImplicitParam(name = "password", value = "密码",paramType = "query", required = true, dataType = "string")
    })
    @RequestMapping(value="/login/main", method= RequestMethod.POST)
    public ResResponse loginMain(@RequestParam("username") String username,@RequestParam("password") String password,HttpServletRequest request) {

        if (StringUtils.isBlank(username) || StringUtils.isBlank(password)) {
            return ResResponse.failure("用户名或者密码不能为空");
        }

        Map<String, Object> map = Maps.newHashMap();
        String error = null;
        HttpSession session = request.getSession();
        if (session == null) {
            return ResResponse.failure("session超时");
        }

//        new RSAUtil();
//        PrivateKey privateKey = RSAUtil.getRSAPrivateKey(RSAUtil.privateModulus, RSAUtil.privateExponent);
//        String newSource = RSAUtil.decryptString(privateKey, password);
//        password = newSource;

        /**
         * 就是代表当前的用户
         */
        Subject user = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(username.trim(), password.trim());

        try {
            user.login(token);
            if (user.isAuthenticated()) {
                map.put("url", "index");
            }
        } catch (IncorrectCredentialsException e) {
            error = "登录密码错误.";
        } catch (ExcessiveAttemptsException e) {
            error = "登录失败次数过多";
        } catch (LockedAccountException e) {
            error = "帐号已被锁定.";
        } catch (DisabledAccountException e) {
            error = "帐号已被禁用.";
        } catch (ExpiredCredentialsException e) {
            error = "帐号已过期.";
        } catch (UnknownAccountException e) {
            error = "帐号不存在";
        } catch (UnauthorizedException e) {
            error = "您没有得到相应的授权！";
        }

        if (StringUtils.isBlank(error)) {
            return ResResponse.success("登录成功").setData(map);
        } else {
            return ResResponse.failure(error);
        }
    }

    @GetMapping("systemLogout")
    @ApiOperation(value="用户登出", notes="用户登出")
    @RequestMapping(value="/systemLogout", method= RequestMethod.GET)
    public ResResponse mobileLogout() {
        SecurityUtils.getSubject().logout();
        return ResResponse.success();
    }

    public static void main(String[] args) {
        byte[] salt = Digests.generateSalt(Constants.SALT_SIZE);
        System.out.println(Encodes.encodeHex(salt));
        byte[] hashPassword = Digests.sha1("123456".getBytes(), salt, Constants.HASH_INTERATIONS);
        System.out.println(Encodes.encodeHex(hashPassword));
    }
}
