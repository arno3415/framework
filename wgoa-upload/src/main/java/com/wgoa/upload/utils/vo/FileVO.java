package com.wgoa.upload.utils.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.InputStream;

/**
 * 文件信息对象vo
 * @Author Arno
 * @Date 2019/2/11 15:49
 * @Version 1.0
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class FileVO {

    /**
     * 上传的文件名
     */
    private String filename;
    /**
     * 保存的文件名
     */
    private String saveFilename;
    /**
     * 文件访问路径
     */
    private String fileulr;
    /**
     * 文件大小（字节）
     */
    private long size;
    /**
     * 文件后缀
     */
    private String suffix;
    /**
     * 文件类型
     */
    private String contentType;

    private Boolean success;

    private String message;

    private InputStream inputStream;
}
