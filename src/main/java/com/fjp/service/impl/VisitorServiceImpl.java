package com.fjp.service.impl;

import com.fjp.dao.VisitorDao;
import com.fjp.entity.Visitor;
import com.fjp.service.VisitorService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("VisitorService")
public class VisitorServiceImpl implements VisitorService {
    @Resource
    private VisitorDao visitorDao;
    @Override
    public List<Visitor> getUserList() {
        return visitorDao.getUserList();
    }
}
