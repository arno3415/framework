package com.wgoa.repository.base;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.wgoa.repository.funcation.CreatedOnFuncation;
import com.wgoa.repository.funcation.UpdatedOnFuncation;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Data
@EqualsAndHashCode(callSuper=false)
public abstract class DataEntity<T> extends BaseEntity<T> {

    /**
     *  创建者
     */
    protected Integer createBy;

    /**
     * 创建日期
     */
    @CreatedOnFuncation
    protected Date createDate;

    /**
     * 更新者
     */
    protected Integer updateBy;

    /**
     * 更新日期
     */
    @UpdatedOnFuncation
    protected Date updateDate;

    /**
     * 当前状态（0：正常；1：删除；2：禁用；）
     */
    protected Integer status;

    /**
     * 备注
     */
    protected String remarks;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getCreateDate() {
        return createDate;
    }

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    public Date getUpdateDate() {
        return updateDate;
    }
}
