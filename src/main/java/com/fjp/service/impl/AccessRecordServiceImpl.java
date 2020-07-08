package com.fjp.service.impl;

import com.fjp.dao.AccessRecordDao;
import com.fjp.entity.AccessRecord;
import com.fjp.service.AccessRecordService;
import com.fjp.util.GetPageUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Service("AccessRecordService")
public class AccessRecordServiceImpl implements AccessRecordService {
    @Resource
    private AccessRecordDao accessRecordDao;

    @Override
    public void accessRecordList(HttpServletRequest request, String condition, Integer page) {
        if (condition == null) condition = "";
        List<AccessRecord> accessRecords = accessRecordDao.accessRecordList("%" + condition + "%");
        Map<String, Object> map = GetPageUtil.getPage(accessRecords, page, 13);
        request.setAttribute("accessRecords", map.get("list"));
        request.setAttribute("page", map.get("currentPage"));
        request.setAttribute("count", map.get("count"));
        request.setAttribute("condition", condition);
    }

    @Override
    public void getAccessRecordsByStudentNum(HttpServletRequest request, Integer page) {
        String username = (String) request.getSession().getServletContext().getAttribute("username");
        List<AccessRecord> accessRecords = accessRecordDao.getAccessRecordsByStudentNum(username);
        Map<String, Object> map = GetPageUtil.getPage(accessRecords, page, 13);
        request.setAttribute("accessRecords", map.get("list"));
        request.setAttribute("page", map.get("currentPage"));
        request.setAttribute("count", map.get("count"));
    }
}
