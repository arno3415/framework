package com.wgoa.upload.utils;

import com.wgoa.upload.enums.FileType;
import com.wgoa.upload.utils.vo.FileVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

/**
 * 文件操作工具类
 * @Author Arno
 * @Date 2019/2/11 10:03
 * @Version 1.0
 **/
@Component
@Data
@NoArgsConstructor
@AllArgsConstructor
public class FileUtils {

    @Value("${ftp.server}")
    private String server;
    @Value("${ftp.port}")
    private Integer port;
    @Value("${ftp.username}")
    private String userName;
    @Value("${ftp.password}")
    private String userPassword;
    @Value("${ftp.root-path}")
    private String rootPath;

    /**
     * 将文件头转换成16进制字符串
     * @param src 二进制字节
     * @return 16进制字符串
     */
    private static String bytesToHexString(byte[] src){
        StringBuilder stringBuilder = new StringBuilder();
        if (src == null || src.length <= 0) {
            return null;
        }
        for (int i = 0; i < src.length; i++) {
            int v = src[i] & 0xFF;
            String hv = Integer.toHexString(v);
            if (hv.length() < 2) {
                stringBuilder.append(0);
            }
            stringBuilder.append(hv);
        }
        return stringBuilder.toString();
    }

    /**
     * 判断文件类型
     * @param inputStream 文件流
     * @return 文件类型
     */
    public static FileType getType(InputStream inputStream) throws IOException {
        byte[] b = new byte[28];
        try {
            //获取文件流头部信息
            inputStream.read(b, 0, 28);
            //头部信息转16进制字符串
            String fileHead = bytesToHexString(b);
            if (fileHead == null || fileHead.length() == 0) {
                return null;
            }

            fileHead = fileHead.toUpperCase();
            FileType[] fileTypes = FileType.values();

            for (FileType type : fileTypes) {
                if (fileHead.startsWith(type.getValue())) {
                    return type;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                    throw e;
                }
            }
        }
        return null;
    }

    /**
     * 检查文件并上传
     * @param multipartFile
     * @return
     * @throws IOException
     */
    public FileVO checkFile(MultipartFile multipartFile) throws IOException{
        FileType fileType = getType(multipartFile.getInputStream());
        FileVO fileVO = new FileVO();
        fileVO.setSuccess(true);
        if(fileType == null){
            fileVO.setSuccess(false);
            fileVO.setMessage("文件类型错误");
            return fileVO;
        }

        FtpUtils ftpUtils = new FtpUtils(server,port,userName,userPassword);
        if(!ftpUtils.open()){
            fileVO.setSuccess(false);
            fileVO.setMessage("连接FTP失败");
            return fileVO;
        }
        //文件后缀
        String suffix = multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf(".") + 1,multipartFile.getOriginalFilename().length());
        String filename = UUID.randomUUID().toString();
        //文件名加后缀
        StringBuffer sb = new StringBuffer();
        sb.append(filename).append(".").append(suffix);
        //文件对象组装
        fileVO.setSuffix(suffix);
        fileVO.setFilename(multipartFile.getOriginalFilename());
        fileVO.setSaveFilename(sb.toString());
        fileVO.setFileulr("/" + suffix + "/" + fileVO.getSaveFilename());
        fileVO.setSize(multipartFile.getSize());
        fileVO.setContentType(multipartFile.getContentType());

        ftpUtils.uploadInput(multipartFile.getInputStream(),fileVO.getSaveFilename(),rootPath + fileVO.getSuffix() + "/");
        return fileVO;
    }

    /**
     * 文件下载
     * @param ftpDirectoryAndFileName 文件路径与文件名
     * @return
     * @throws IOException
     */
    public FileVO getFileInputStream(String ftpDirectoryAndFileName) throws IOException{
        FileVO fileVO = new FileVO();
        if(StringUtils.isBlank(ftpDirectoryAndFileName)){
            fileVO.setMessage("文件路径为空");
            return fileVO;
        }
        FtpUtils ftpUtils = new FtpUtils(server,port,userName,userPassword);
        if(!ftpUtils.open()){
            fileVO.setMessage("连接FTP失败");
            return fileVO;
        }
        InputStream inputStream = ftpUtils.getInput(ftpDirectoryAndFileName);
        if(inputStream == null){
            fileVO.setMessage("文件不存在");
            return fileVO;
        }
        //获取文件后缀名
        String suffix = ftpDirectoryAndFileName.substring(ftpDirectoryAndFileName.lastIndexOf("."),ftpDirectoryAndFileName.length());
        fileVO.setSuffix(suffix);
        fileVO.setInputStream(inputStream);
        fileVO.setSuccess(true);
        return fileVO;
    }
}
