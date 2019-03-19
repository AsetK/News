package com.epam.news.service.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Service
public class ValidationErrorsHandler {

    @Autowired
    MessageSource messageSource;

    public Map<String, String> getFieldMessages(BindingResult result, Locale locale) {
        Map<String,String> errorsMap = new HashMap<>();

        List<FieldError> errors = result.getFieldErrors();
        for(FieldError error: errors) {
            errorsMap.put(error.getField(), messageSource.getMessage(error, locale));
        }

        return errorsMap;
    }
}
