package com.wgoa.manager.controller;

import com.wgoa.manager.base.BaseController;
import com.wgoa.repository.domain.DemoUser;
import com.wgoa.utils.response.ResResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 示例controller
 * swagger2 常用paramType：body、path、query
 * @Author Arno
 * @Date 2019/1/24 19:11
 * @Version 1.0
 **/
@Api(value = "示例swagger2")
@RestController
@RequestMapping("demoUser")
public class DemoUserController extends BaseController {

    private static final Logger LOGGER = LoggerFactory.getLogger(DemoUserController.class);

    @ApiOperation(value="获取用户列表", notes="根据查询参数获取列表")
    @RequestMapping(value="list", method= RequestMethod.GET)
    public ResResponse getUserList() {
        try {
            List<DemoUser> list = demoUserService.list(null);
            return ResResponse.success("查询成功").setData(list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @ApiOperation(value="创建用户", notes="根据DemoUser对象创建用户")
    @ApiImplicitParam(name = "demoUser", paramType = "body", value = "用户详细实体demoUser", required = true, dataType = "DemoUser")
    @RequestMapping(value="", method= RequestMethod.POST)
    public ResResponse postUser(@RequestBody DemoUser demoUser) {
        try {
            demoUserService.insert(demoUser);
            return ResResponse.success();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResResponse.failure("出现异常");
    }

    //注意{id}：paramType需要指定为path,不然不能正常获取
    @ApiOperation(value="更新用户详细信息", notes="根据url的id来指定更新对象，并根据传过来的demoUser信息来更新用户详细信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "用户ID",paramType = "path", required = true, dataType = "Integer"),
            @ApiImplicitParam(name = "demoUser", paramType = "body",value = "用户详细实体DemoUser", required = true, dataType = "DemoUser")
    })
    @RequestMapping(value="/{id}", method=RequestMethod.PUT)
    public ResResponse putUser(@PathVariable Integer id, @RequestBody DemoUser demoUser) {
        try {
            demoUser.setId(id);
            demoUserService.update(demoUser);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResResponse.success(componentProperties.getJedisHost());
    }

    //注意{id}：paramType需要指定为path,不然不能正常获取
    @ApiOperation(value="删除用户", notes="根据url的id来指定删除对象")
    @ApiImplicitParam(name = "id",paramType = "path" , value = "用户ID", required = true, dataType = "Integer")
    @RequestMapping(value="/{id}", method=RequestMethod.DELETE)
    public ResResponse deleteUser(@PathVariable Integer id) {
        return ResResponse.success();
    }
}
