package com.yang.service;

import com.yang.pojo.Device;
import com.yang.util.PageUtil;

public interface DeviceService {
    int update(Integer status,long id);
    PageUtil<Device> getDeviceLimit(long hotId,Integer pageIndex,Integer pageSize);
    int insert(Device device);
}
