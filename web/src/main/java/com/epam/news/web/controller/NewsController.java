package com.epam.news.web.controller;


import com.epam.news.dao.dao.NewsDAO;
import com.epam.news.domain.entity.News;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class NewsController {

    @Autowired
    NewsDAO newsDAO;

    /*
    @RequestMapping(value = {"/", "/login"})
    public ModelAndView loginPage(@RequestParam(value = "error", required = false) String error) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("login");

        if(error != null){
            mv.addObject("error", "Invalid username or password");
        }

        return mv;
    }

    @RequestMapping("/accessdenied")
    public ModelAndView accessDeniedPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("accessdenied");

        return mv;
    }
    */

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

    @RequestMapping(value = "/addnews", method = RequestMethod.POST)
    public ResponseEntity createNews(@Valid @RequestBody News news, BindingResult result) {
        if(result.hasErrors()) {
            Map<String,String> errorsMap = new HashMap<>();
            result.getFieldErrors().stream().forEach(f -> errorsMap.put(f.getField(), f.getDefaultMessage()));

            return new ResponseEntity(errorsMap, HttpStatus.BAD_REQUEST);
        }
        else {
            newsDAO.addNews(news);
            return new ResponseEntity(HttpStatus.OK);
        }
    }

    @RequestMapping(value = "/viewnews")
    public @ResponseBody News viewNewsPOST(@RequestBody Long newsId) {
        return newsDAO.viewNews(newsId);
    }

    @RequestMapping(value = "/editnews", method = RequestMethod.POST)
    public @ResponseBody News editNews(@RequestBody  Long newsId) {
        return newsDAO.viewNews(newsId);
    }

    @RequestMapping(value = "/savechanges", method = RequestMethod.POST)
    public void saveChanges(@Valid @RequestBody News news) {
        newsDAO.updateNews(news);
    }

    @RequestMapping(value = "/deletenews", method = RequestMethod.POST)
    public void deleteNews(@RequestBody Long newsId) {
        newsDAO.deleteNews(newsId);
    }

    @RequestMapping(value = "/deletesignednews", method = RequestMethod.POST)
    public void deleteSignedNews(@RequestBody Long[] newsId) {
        for (long id : newsId) {
            newsDAO.deleteNews(id);
        }
    }


}
