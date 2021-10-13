package com.yang.service.impl;

import com.yang.mapper.BuidingMapper;
import com.yang.pojo.Buiding;
import com.yang.service.BuidingService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class BuidingServiceImpl implements BuidingService {
    @Resource
    BuidingMapper bm;
    @Override
    public List<Buiding> getAll() {
        return bm.getAll();
    }
}
