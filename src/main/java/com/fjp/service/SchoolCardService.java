package com.fjp.service;

import javax.servlet.http.HttpServletRequest;

public interface SchoolCardService {
    void reportTheLoss(HttpServletRequest request, String password, String c);
    void resetPassword(HttpServletRequest request, String newPassword, String oldPassword);
    void findTheSchoolCard(HttpServletRequest request, String password);
}
