package com.epam.news.web.controller;


import com.epam.news.dao.dao.NewsDAO;
import com.epam.news.domain.entity.News;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
public class NewsController {

    @Autowired
    NewsDAO newsDAO;

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


    @RequestMapping("/newsmanagement")
    public ModelAndView newsManagementPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("newsmanagement");

        return mv;
    }

    @RequestMapping(value = "/newslistpage")
    public ModelAndView newsListPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("newslist");
        mv.addObject("newsList",newsDAO.getAllNews());
        return mv;
    }
    /*
    @RequestMapping(value = "/newslistpage")
    public @ResponseBody List<News> newsListPage() {
        return newsDAO.getAllNews();
    }*/

    @RequestMapping("/addnewspage")
    public ModelAndView createNewsPage(@ModelAttribute("news") News news) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("addnews");

        return mv;
    }

    @RequestMapping(value = "/addnews", method = RequestMethod.POST, produces = {MediaType.APPLICATION_JSON_VALUE}, consumes = {MediaType.APPLICATION_FORM_URLENCODED_VALUE})
    public ResponseEntity<News> createNews(@ModelAttribute("news") News news) {
        newsDAO.addNews(news);

        return new ResponseEntity<News>(news, HttpStatus.OK);
    }

    @RequestMapping(value = "/viewnews", method = RequestMethod.POST, produces = {MediaType.APPLICATION_JSON_VALUE})
    public @ResponseBody News viewNewsPOST(@RequestParam("newsId") Long newsId) {
        return newsDAO.viewNews(newsId);
    }

    @RequestMapping(value = "/viewnews/{newsId}", method = RequestMethod.GET, produces = {MediaType.APPLICATION_JSON_VALUE})
    public @ResponseBody News viewNewsGET(@PathVariable("newsId") Long newsId) {
        return newsDAO.viewNews(newsId);
    }

    @RequestMapping(value = "/editnews", method = RequestMethod.POST, produces = {MediaType.APPLICATION_JSON_VALUE})
    public ModelAndView editNews(@RequestParam("newsId") Long newsId) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("editnews");

        mv.addObject("news", newsDAO.viewNews(newsId));

        return mv;
    }

    @RequestMapping(value = "/savechanges", method = RequestMethod.POST)
    public ModelAndView saveChanges(@ModelAttribute("news") News news) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("newsisedited");

        newsDAO.updateNews(news);

        return mv;
    }

    @RequestMapping(value = "/deletenews", method = RequestMethod.POST)
    public ModelAndView deleteNews(@RequestParam("newsId") Long newsId) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("newsisdeleted");

        newsDAO.deleteNews(newsId);

        return mv;
    }

    @RequestMapping(value = "/deletesignednews", method = RequestMethod.POST)
    public ModelAndView deleteSignedNews(@RequestParam("newsId[]") Long[] newsId) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("newsisdeleted");

        for (long id : newsId) {
            newsDAO.deleteNews(id);
        }

        return mv;
    }


}
