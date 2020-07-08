package com.fjp.service.impl;

import com.fjp.dao.BookDao;
import com.fjp.dao.LendBookRecordDao;
import com.fjp.dao.SchoolCardDao;
import com.fjp.dao.StudentDao;
import com.fjp.entity.Book;
import com.fjp.entity.LendBookRecord;
import com.fjp.entity.SchoolCard;
import com.fjp.entity.Student;
import com.fjp.service.LendBookRecordService;
import com.fjp.util.GetPageUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("LendBookRecordService")
public class LendBookRecordServiceImpl implements LendBookRecordService {
    @Resource
    private LendBookRecordDao lendBookRecordDao;
    @Resource
    private BookDao bookDao;
    @Resource
    private SchoolCardDao schoolCardDao;
    @Resource
    private StudentDao studentDao;
    @Override
    public void lendBookRecordList(HttpServletRequest request, String condition, Integer page) {
        if (condition == null) condition = "";
        List<LendBookRecord> lendBookRecords = lendBookRecordDao.lendBookRecordList("%" + condition + "%");
        for (LendBookRecord lendBookRecord: lendBookRecords) {
            lendBookRecord.setBookName(bookDao.getBookById(lendBookRecord.getBookId()).getName());
        }
        Map<String, Object> map = GetPageUtil.getPage(lendBookRecords, page, 13);
        request.setAttribute("lendBookRecords", map.get("list"));
        request.setAttribute("count", map.get("count"));
        request.setAttribute("page", map.get("currentPage"));
        request.setAttribute("condition", condition);
    }

    @Override
    public void lendBook(HttpServletRequest request, Integer schoolCardId, Integer bookId) {
        Book book = bookDao.getBookById(bookId);
        SchoolCard schoolCard = schoolCardDao.getSchoolCardById(schoolCardId);
        Student student = studentDao.getStudentBySchoolCard(schoolCardId);
        List<LendBookRecord> lendBookRecords = lendBookRecordDao.lendBookRecordList(null);
        int i = 0;
        for (i = 0; i < lendBookRecords.size(); i++) {
            if (lendBookRecords.get(i).getBookId().equals(bookId) && lendBookRecords.get(i).getBackTime() == null) {
                break;
            }
        }
        if (book == null) {
            request.setAttribute("message", "图书不存在！");
        } else if (book.getIsDelete() == 1) {
            request.setAttribute("message", "该图书已注销！");
        } else if (student == null) {
            request.setAttribute("message", "学生不存在！");
        } else if (schoolCard == null) {
            request.setAttribute("message", "校园卡号不存在！");
        } else if (i < lendBookRecords.size()) {
            request.setAttribute("message", "此书已被借走！");
        } else if(schoolCard.getStatus().equals("挂失")) {
            request.setAttribute("message", "该校园卡已挂失！");
        } else {
            Map<String, Object> record = new HashMap<String, Object>();
            record.put("studentNum", student.getNum());
            record.put("bookId", book.getId());
            record.put("lendTime", new Date());
            lendBookRecordDao.lendBook(record);
            request.setAttribute("message", "借书成功！");
        }
    }

    @Override
    public void giveBack(HttpServletRequest request, Integer bookId) {
        List<LendBookRecord> lendBookRecords = lendBookRecordDao.lendBookRecordList(null);
        int i = 0;
        for (i = 0; i < lendBookRecords.size(); i++) {
            if (lendBookRecords.get(i).getBookId().equals(bookId) && lendBookRecords.get(i).getBackTime() == null) {
                break;
            }
        }
        if (i == lendBookRecords.size()) {
            request.setAttribute("message", "没有找到此借书记录！");
        } else {
            lendBookRecordDao.giveBack(lendBookRecords.get(i).getBookId());
            request.setAttribute("message", "已归还此书！");
        }
    }

    @Override
    public void getLendBookRecordsByStudentNum(HttpServletRequest request, Integer page) {
        String username = (String) request.getSession().getServletContext().getAttribute("username");
        List<LendBookRecord> lendBookRecords = lendBookRecordDao.getLendBookRecordsByStudentNum(username);
        for (LendBookRecord lendBookRecord: lendBookRecords) {
            lendBookRecord.setBookName(bookDao.getBookById(lendBookRecord.getBookId()).getName());
        }
        Map<String, Object> map = GetPageUtil.getPage(lendBookRecords, page, 13);
        request.setAttribute("lendBookRecords", map.get("list"));
        request.setAttribute("page", map.get("currentPage"));
        request.setAttribute("count", map.get("count"));
    }
}
