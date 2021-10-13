package com.yang.mapper;

import com.yang.pojo.Device;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface DeviceMapper {
    int getCount(@Param("hotId") long hotId);
    List<Device> getDeviceLimit(@Param("hotId") long hotId,
                                @Param("form") Integer form,@Param("pageSize")Integer pageSize);
    int update(@Param("status") Integer status,@Param("id") long id);
    int insert(Device device);
}
