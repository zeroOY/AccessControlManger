package com.yang.service.impl;

import com.yang.mapper.DeviceMapper;
import com.yang.pojo.Device;
import com.yang.service.DeviceService;
import com.yang.util.PageUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class DeviceServiceImpl implements DeviceService {
    @Resource
    DeviceMapper dm;
    @Override
    public int update(Integer status, long id) {
        return dm.update(status, id);
    }

    @Override
    public PageUtil<Device> getDeviceLimit(long hotId, Integer pageIndex, Integer pageSize) {
        PageUtil<Device> pageUtil=new PageUtil<>();
        pageUtil.setPageIndex(pageIndex);
        pageUtil.setPageSize(pageSize);
        pageUtil.setTotalCount(dm.getCount(hotId));
        pageUtil.setList(dm.getDeviceLimit(hotId, (pageIndex-1)*pageSize, pageSize));
        return pageUtil;
    }

    @Override
    public int insert(Device device) {
        return dm.insert(device);
    }
}
