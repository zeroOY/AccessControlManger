package com.yang.mapper;

import com.yang.pojo.Buiding;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BuidingMapper {
    List<Buiding> getAll();
}
