package com.wgoa.upload.controller;

import com.wgoa.upload.utils.FileUtils;
import com.wgoa.upload.utils.vo.FileVO;
import com.wgoa.utils.response.ResResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

/**
 * 文件图片上传controller
 * @Author Arno
 * @Date 2019/2/8 19:19
 * @Version 1.0
 **/
@Api(value = "文件上传")
@RestController
@RequestMapping("file")
public class uploadController {

    private static final Logger LOGGER = LoggerFactory.getLogger(uploadController.class);

    @Autowired
    FileUtils fileUtils;

    /**
     * 文件图片上传（单个或多个文件）
     * @param multipartFile  文件对象
     * @return
     */
    @ApiOperation(value="文件图片上传", notes="上传单个或多个文件")
    @ApiImplicitParam(name = "file", paramType = "form", value = "上传的文件", required = true, dataType = "File")
    @PostMapping(value="/multipartUpload", consumes = "multipart/*", headers = "content-type=multipart/form-data")
    public ResResponse multipartFiles(@RequestParam("file") MultipartFile[] multipartFile) {
        if(multipartFile == null || multipartFile.length <= 0){
            return ResResponse.failure("必须上传一个或多个文件");
        }
        try{
            List<FileVO> fileList = new ArrayList<>();
            //遍历文件集合
            for (int i = 0; i < multipartFile.length; i++) {
                FileVO fileVO = fileUtils.checkFile(multipartFile[i]);
                if(!fileVO.getSuccess()){//文件过滤
                    return ResResponse.failure(fileVO.getMessage());
                }
                fileList.add(fileVO);
            }
            return ResResponse.success().setData(fileList);
        }catch (IOException e){
            e.printStackTrace();
            return ResResponse.failure("文件上传异常");
        }
    }

    @ApiOperation(value="文件下载", notes="下载ftp中的指定文件")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "path", paramType = "query", value = "文件路径与文件名", required = true, dataType = "string"),
            @ApiImplicitParam(name = "fileName", paramType = "query", value = "下载后的文件名", dataType = "string")
    })
    @ResponseBody
    @GetMapping(value="/downLoad")
    public void downLoadOnline(@RequestParam("path") String ftpPath,String fileName,HttpServletResponse response){
        OutputStream out = null;
        BufferedInputStream br = null;
        try {
            FileVO fileVO = fileUtils.getFileInputStream(ftpPath);
            if(fileVO == null || fileVO.getInputStream() == null){
                response.sendError(404, "File not found!");
            }
            br = new BufferedInputStream(fileVO.getInputStream());
            byte[] buf = new byte[1024];
            int len;
            response.reset(); // 非常重要
            if(StringUtils.isBlank(fileName)){
                fileName = "默认文件名";
            }
            //输出的文件名，setHeader中文乱码解决
            String filename = URLEncoder.encode(fileName + fileVO.getSuffix(),"utf-8");
            response.setContentType("application/x-msdownload");
            response.setHeader("Content-Disposition", "attachment; filename=" + filename);
            out = response.getOutputStream();

            //输出文件流
            while ((len = br.read(buf)) > 0) {
                out.write(buf, 0, len);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if(br != null){
                    br.close();
                }
                if(out != null){
                    out.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
