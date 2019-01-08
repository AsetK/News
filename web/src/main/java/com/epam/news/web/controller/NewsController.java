package com.epam.news.web.controller;


import com.epam.news.dao.dao.NewsDAO;
import com.epam.news.domain.entity.News;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


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

    @RequestMapping(value = "/newslistpage", method = RequestMethod.POST)
    public ModelAndView newsListPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("newslist");

        mv.addObject("newsList", newsDAO.getAllNews());

        return mv;
    }

    @RequestMapping("/addnewspage")
    public ModelAndView createNewsPage(@ModelAttribute("news") News news) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("addnews");

        return mv;
    }

    @RequestMapping(value = "/addnews", method = RequestMethod.POST)
    public ModelAndView createNews(@ModelAttribute("news") News news) {

        newsDAO.addNews(news);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("newsisadded");

        return mv;
    }

    @RequestMapping(value = "/viewnews", method = RequestMethod.POST)
    public ModelAndView viewNews(@RequestParam("newsId") Long newsId) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("viewnews");

        mv.addObject("news", newsDAO.viewNews(newsId));

        return mv;
    }

    @RequestMapping(value = "/editnews", method = RequestMethod.POST)
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
