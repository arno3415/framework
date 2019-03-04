package com.wgoa.repository.enums;

/**
  * 主从库枚举
  *@Author Arno
  *@Date 2019/1/21 9:21
  *@Version 1.0
  **/
public enum DataSourceEnums {

    read("read", "从库"),
    write("write", "主库");
    private String type;
    private String name;


    public String getType() {
        return type;
    }


    public void setType(String type) {
        this.type = type;
    }


    public String getName() {
        return name;
    }


    public void setName(String name) {
        this.name = name;
    }


    DataSourceEnums(String type, String name) {
        this.type = type;
        this.name = name;
    }
}
