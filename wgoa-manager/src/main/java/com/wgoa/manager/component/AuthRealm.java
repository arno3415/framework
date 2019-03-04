package com.wgoa.manager.component;

import com.google.common.base.Objects;
import com.google.common.collect.Sets;
import com.wgoa.business.service.intf.sys.RoleMenuService;
import com.wgoa.business.service.intf.sys.UserRoleService;
import com.wgoa.business.service.intf.sys.WgUserService;
import com.wgoa.manager.utils.constants.Constants;
import com.wgoa.repository.domain.sys.WgUser;
import com.wgoa.repository.utils.MyEntityWrapper;
import com.wgoa.utils.codes.Encodes;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.io.Serializable;
import java.util.Set;

/**
  *shiro权限校验
  *@Author Arno
  *@Date 2019/1/27 22:54
  *@Version 1.0
  **/
@Component(value = "authRealm")
public class AuthRealm extends AuthorizingRealm {

    @Autowired
    private WgUserService wgUserService;
    @Autowired
    private UserRoleService userRoleService;
    @Autowired
    private RoleMenuService roleMenuService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        ShiroUser shiroUser = (ShiroUser) principalCollection.getPrimaryPrincipal();
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        WgUser user;
        try {
            user = wgUserService.findById(shiroUser.getId());
            //获取用户角色与对应权限
            Set<String> roleNames = Sets.newHashSet();
            Set<String> permissions = Sets.newHashSet();
//            Map<String,Object> map = new HashedMap();
//            map.put("roleId",user.getRoleId());
//            List<RoleMenu> roleMenuList = roleMenuService.list(map);
//            Set<String> permissions = Sets.newHashSet();
//            for (RoleMenu role : roleMenuList) {
//                if (StringUtils.isNotBlank(role.getRoleName())) {
//                    roleNames.add(role.getRoleName());
//                }
//                if (StringUtils.isNotBlank(role.getPermission())) {
//                    permissions.add(role.getPermission());
//                }
//            }

            info.setRoles(roleNames);
            info.setStringPermissions(permissions);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return info;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        String username = (String) token.getPrincipal();
        WgUser user = null;
        try {
            //校验用户登录信息
            MyEntityWrapper<WgUser> entityWrapper = new MyEntityWrapper<>();
            entityWrapper.eq("user_name",username);
            user = wgUserService.selectOne(entityWrapper);
        } catch (Exception e) {
            e.printStackTrace();
        }
        SimpleAuthenticationInfo authenticationInfo;
        if (user == null) {
            throw new UnknownAccountException();//没找到帐号
        }
//            if (user.getStatus().equals(Constants.STATUS_DELETE)) {
//                throw new LockedAccountException(); //帐号禁用
//            }
        //盐
        byte[] salt = Encodes.decodeHex(user.getSalt());
        authenticationInfo = new SimpleAuthenticationInfo(
                new ShiroUser(user.getId(), user.getUserName(), "", user.getType()),
                user.getPassword(), //密码
                ByteSource.Util.bytes(salt),
                getName()  //realm name
        );
        return authenticationInfo;
    }

    public void removeUserAuthorizationInfoCache(String username) {
        SimplePrincipalCollection pc = new SimplePrincipalCollection();
        pc.add(username, super.getName());
        super.clearCachedAuthorizationInfo(pc);
    }

    /**
     * 设定Password校验的Hash算法与迭代次数.
     */
    @PostConstruct
    public void initCredentialsMatcher() {
        HashedCredentialsMatcher matcher = new HashedCredentialsMatcher(Constants.HASH_ALGORITHM);
        matcher.setHashIterations(Constants.HASH_INTERATIONS);
        setCredentialsMatcher(matcher);
    }

    /**
     * 自定义Authentication对象，使得Subject除了携带用户的登录名外还可以携带更多信息.
     */
    public static class ShiroUser implements Serializable {
        public Integer id;
        public String loginName;
        public String icon;
        public Integer type;

        public ShiroUser(Integer id, String loginName, String icon, Integer type) {
            this.id = id;
            this.loginName = loginName;
            this.icon = icon;
            this.type = type;
        }

        public String getLoginName() {
            return loginName;
        }

        public String getIcon() {
            return icon;
        }

        public Integer getId() {
            return id;
        }

        public Integer getType() { return type; }


        /**
         * 本函数输出将作为默认的<shiro:principal/>输出.
         */
        @Override
        public String toString() {
            return loginName;
        }

        /**
         * 重载hashCode,只计算loginName;
         */
        @Override
        public int hashCode() {
            return Objects.hashCode(loginName);
        }

        /**
         * 重载equals,只计算loginName;
         */
        @Override
        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (obj == null) {
                return false;
            }
            if (getClass() != obj.getClass()) {
                return false;
            }
            ShiroUser other = (ShiroUser) obj;
            if (loginName == null) {
                return other.loginName == null;
            } else return loginName.equals(other.loginName);
        }
    }
}
