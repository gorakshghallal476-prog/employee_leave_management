package com.employee.config;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

public class WebAppInitializer implements WebApplicationInitializer {

    @Override
    public void onStartup(ServletContext servletContext)
            throws ServletException {

        AnnotationConfigWebApplicationContext context =
                new AnnotationConfigWebApplicationContext();

        context.register(WebMvcConfig.class);

        DispatcherServlet dispatcherServlet =
                new DispatcherServlet(context);

        ServletRegistration.Dynamic servlet =
                servletContext.addServlet(
                        "dispatcher",
                        dispatcherServlet
                );

        servlet.setLoadOnStartup(1);

        servlet.addMapping("/");
    }
}