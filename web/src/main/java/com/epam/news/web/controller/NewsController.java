package com.epam.news.web.controller;


import com.epam.news.dao.dao.NewsDAO;
import com.epam.news.domain.entity.News;
import com.epam.news.service.service.ValidationErrorsHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;
import java.util.Locale;


@Controller
public class NewsController {

    @Autowired
    NewsDAO newsDAO;

    @Autowired
    ValidationErrorsHandler errorsHandler;

    @Autowired
    MessageSource messageSource;


    @RequestMapping("/")
    public ModelAndView homePage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("home");

        return mv;
    }

    @RequestMapping(value = "/newslistpage")
    public @ResponseBody List<News> newsListPage() {
        return newsDAO.getAllNews();
    }

    @RequestMapping(value = "/viewnews", method = RequestMethod.POST)
    public @ResponseBody News viewNews(@RequestBody Long newsId) {
        return newsDAO.viewNews(newsId);
    }

    @RequestMapping(value = "/addnews", method = RequestMethod.POST)
    public ResponseEntity addNews(@Valid @RequestBody News news, BindingResult result, Locale locale) {
        if(result.hasErrors()) {
            return new ResponseEntity(errorsHandler.getFieldMessages(result, locale), HttpStatus.BAD_REQUEST);
        }
        else{
            newsDAO.addNews(news);
            return new ResponseEntity(HttpStatus.OK);
        }
    }

    @RequestMapping(value = "/editnews", method = RequestMethod.POST)
    public ResponseEntity editNews(@Valid @RequestBody News news, BindingResult result, Locale locale) {
        if(result.hasErrors()) {
            return new ResponseEntity(errorsHandler.getFieldMessages(result, locale), HttpStatus.BAD_REQUEST);
        }
        else{
            newsDAO.updateNews(news);
            return new ResponseEntity(HttpStatus.OK);
        }

    }

    @RequestMapping(value = "/deletenews", method = RequestMethod.POST)
    public ResponseEntity deleteNews(@RequestBody Long newsId) {
        newsDAO.deleteNews(newsId);
        return new ResponseEntity(HttpStatus.OK);
    }

    @RequestMapping(value = "/deletesignednews", method = RequestMethod.POST)
    public ResponseEntity deleteSignedNews(@RequestBody Long[] newsId) {
        newsDAO.deleteNews(newsId);
        return new ResponseEntity(HttpStatus.OK);
    }


}