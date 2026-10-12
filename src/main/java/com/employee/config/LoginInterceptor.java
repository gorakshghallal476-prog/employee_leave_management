package com.employee.config;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler) throws Exception {

        HttpSession session = request.getSession(false);

        String path = request.getRequestURI()
                .substring(request.getContextPath().length());

        // Login page should always be accessible
     // Homepage and login page should be accessible
        if (path.equals("/") || path.equals("/login")) {
            return true;
        }

        // User must be logged in
        if (session == null || session.getAttribute("role") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login"
            );

            return false;
        }

        String role = (String) session.getAttribute("role");

        // ==========================================
        // ADMIN ONLY
        // ==========================================

        if (path.startsWith("/admin")
                || path.startsWith("/departments")
                || path.startsWith("/leave-types")) {

            if ("ADMIN".equalsIgnoreCase(role)) {
                return true;
            }

            response.sendError(
                    HttpServletResponse.SC_FORBIDDEN,
                    "Access Denied"
            );

            return false;
        }

        // ==========================================
        // MANAGER ONLY
        // ==========================================

        if (path.startsWith("/manager")) {

            if ("MANAGER".equalsIgnoreCase(role)) {
                return true;
            }

            response.sendError(
                    HttpServletResponse.SC_FORBIDDEN,
                    "Access Denied"
            );

            return false;
        }

        // ==========================================
        // ADMIN + MANAGER
        // Pending / Approve / Reject Leave
        // ==========================================

        if (path.equals("/leave/pending")
                || path.equals("/leave/approve")
                || path.equals("/leave/reject")) {

            if ("ADMIN".equalsIgnoreCase(role)
                    || "MANAGER".equalsIgnoreCase(role)) {

                return true;
            }

            response.sendError(
                    HttpServletResponse.SC_FORBIDDEN,
                    "Access Denied"
            );

            return false;
        }

        // ==========================================
        // PAYROLL - ADMIN ONLY
        // ==========================================

        if (path.startsWith("/payroll")) {

            if ("ADMIN".equalsIgnoreCase(role)) {
                return true;
            }

            response.sendError(
                    HttpServletResponse.SC_FORBIDDEN,
                    "Access Denied"
            );

            return false;
        }

        // ==========================================
        // OTHER LOGGED-IN PAGES
        // ==========================================

        return true;
    }
}