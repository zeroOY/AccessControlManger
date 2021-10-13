package com.yang.pojo;

import lombok.Data;

import java.io.Serializable;
@Data
public class Device implements Serializable {
    private long id;
            private String  principal;
    private String  supplier;
            private String  brand;
    private long hospital_id;
            private int status;
    private String add_time;
    private String name;//楼的名称
}
