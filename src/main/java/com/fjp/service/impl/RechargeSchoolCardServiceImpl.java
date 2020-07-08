package com.fjp.service.impl;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.AlipayRequest;
import com.fjp.dao.RechargeSchoolCardDao;
import com.fjp.dao.SchoolCardDao;
import com.fjp.dao.StudentDao;
import com.fjp.entity.RechargeSchoolCard;
import com.fjp.entity.SchoolCard;
import com.fjp.service.RechargeSchoolCardService;
import com.fjp.util.AlipayConfig;
import com.fjp.util.GetPageUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("RechargeSchoolCardService")
public class RechargeSchoolCardServiceImpl implements RechargeSchoolCardService {
    @Resource
    private RechargeSchoolCardDao rechargeSchoolCardDao;
    @Resource
    private StudentDao studentDao;
    @Resource
    private SchoolCardDao schoolCardDao;
    @Override
    public void rechargeSchoolCardList(HttpServletRequest request, String condition, Integer page) {
        if (condition == null) condition = "";
        List<RechargeSchoolCard> rechargeSchoolCards = rechargeSchoolCardDao.rechargeSchoolCardList("%" + condition + "%");
        Map<String, Object> map = GetPageUtil.getPage(rechargeSchoolCards, page, 13);
        request.setAttribute("page", map.get("currentPage"));
        request.setAttribute("count", map.get("count"));
        request.setAttribute("rechargeSchoolCards", map.get("list"));
        request.setAttribute("condition", condition);
    }

    @Override
    public void getRechargeSchoolCardsByStudentNum(HttpServletRequest request, Integer page) {
        String username = (String) request.getSession().getServletContext().getAttribute("username");
        List<RechargeSchoolCard> rechargeSchoolCards = rechargeSchoolCardDao.getRechargeSchoolCardsByStudentNum(username);
        SchoolCard schoolCard = schoolCardDao.getSchoolCardById(studentDao.getStudentByNum(username).getSchoolCardId());
        Map<String, Object> map = GetPageUtil.getPage(rechargeSchoolCards, page, 13);
        request.setAttribute("schoolCard", schoolCard);
        request.setAttribute("rechargeSchoolCards", map.get("list"));
        request.setAttribute("page", map.get("currentPage"));
        request.setAttribute("count", map.get("count"));
    }

    @Override
    public void recharge(HttpServletRequest request, HttpServletResponse response, String password, Double rechargeMoney) throws Exception {
        String username = (String) request.getSession().getServletContext().getAttribute("username");
        SchoolCard schoolCard = schoolCardDao.getSchoolCardById(studentDao.getStudentByNum(username).getSchoolCardId());
        request.getSession().getServletContext().setAttribute("rechargeMoney", rechargeMoney);
        if (schoolCard.getStatus().equals("挂失")) {
            request.setAttribute("message", "此校园卡已挂失！");
            request.getRequestDispatcher("/student/rechargeSchoolCard").forward(request, response);
        } else {
            AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
            AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
            alipayRequest.setReturnUrl(AlipayConfig.return_url);
            alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
            String out_trade_no = request.getParameter("out_trade_no");
            String total_amount = request.getParameter("total_amount");
            String subject = new String(request.getParameter("subject").getBytes("ISO-8859-1"),"UTF-8");
            String body = new String(request.getParameter("body").getBytes("ISO-8859-1"),"UTF-8");
            alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                    + "\"total_amount\":\""+ total_amount +"\","
                    + "\"subject\":\""+ subject +"\","
                    + "\"body\":\""+ body +"\","
                    + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
            String result = alipayClient.pageExecute(alipayRequest).getBody();
            response.setContentType("text/html");
            response.getWriter().println(result);
        }
    }

    @Override
    public void recharge2(HttpServletRequest request) {
        Map<String, Object> params = new HashMap<String, Object>();
        String studentNum = (String) request.getSession().getServletContext().getAttribute("username");
        params.put("studentNum", studentNum);
        params.put("rechargeTime", new Date());
        params.put("rechargeMoney", request.getSession().getServletContext().getAttribute("rechargeMoney"));
        rechargeSchoolCardDao.recharge(params);
    }
}
