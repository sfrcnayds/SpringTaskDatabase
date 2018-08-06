package com.project.web.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.web.dao.User;
import com.project.web.service.UserService;

@Controller
public class UsersController {
	@Autowired
	private UserService userService;

	@RequestMapping("/")
	public String showHome() {
		return "home";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("user") User user) {
		userService.createUser(user);
		return new ModelAndView("redirect:/add");
	}
	@RequestMapping(value = "/ara", method = RequestMethod.POST)
	public ModelAndView search(@ModelAttribute("search") Search search) {
		ModelAndView model = new ModelAndView("search","command",new Search());
		
		
		return model;
	}
	@RequestMapping("/add")
	public ModelAndView showAdd() {
		ModelAndView model = new ModelAndView("add", "command", new User());
		return model;
	}
	@RequestMapping("/search")
	public String showSearch(){
		return "search";
	}
	@RequestMapping(value="/doSearch",method = RequestMethod.GET)
	public String search(@RequestParam("name")String name,Model model){
		model.addAttribute("users", userService.getAllUserByName(name));
		return "search";
	}
	
	
	
	@RequestMapping("/delete")
	public String showDeletePage(Model model){
		model.addAttribute("users",userService.getAllUser());
		return "delete";
	}
	
	@RequestMapping(value="/doDelete",method = RequestMethod.GET)
	public String delete(@RequestParam("id") int id,Model model) {
		userService.deleteUser(id);
		model.addAttribute("users",userService.getAllUser());
		return "delete";
	}
	
	
	@RequestMapping("/show")
	public ModelAndView list() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("users", userService.getAllUser());
		modelAndView.setViewName("show");
		return modelAndView;
	}

}
