package com.epam.news.service.service;

import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ValidationErrorsHandler {

    public Map<String, String> getFieldMessages(BindingResult result) {
        Map<String,String> errorsMap = new HashMap<>();

        List<FieldError> errors = result.getFieldErrors();
        for(FieldError error: errors) {
            errorsMap.put(error.getField(), error.getDefaultMessage());
        }
        return errorsMap;
    }
}
