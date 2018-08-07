package com.project.web.controllers;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
		return new ModelAndView("redirect:/all");
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
	public ModelAndView search(@RequestParam("name")String name){
		ModelAndView model = showAllPage();
		if(name != "") {
			model.addObject("users", userService.getAllUserByName(name));
		}
		return model;
	}
	
	@RequestMapping("/delete")
	public String showDeletePage(Model model){
		model.addAttribute("users",userService.getAllUser());
		return "delete";
	}
	@RequestMapping(value="/update",method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute("user") User user) {
		userService.updateUser(user);
		return showAllPage();
	}
	@RequestMapping(value="/doDelete",method = RequestMethod.GET)
	public ModelAndView delete(@RequestParam("id") int id,Model model) {
		userService.deleteUser(id);
		return showAllPage();
	}
	
	
	@RequestMapping("/show")
	public ModelAndView list() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("users", userService.getAllUser());
		modelAndView.setViewName("show");
		return modelAndView;
	}
	
	@RequestMapping("/all")
	public ModelAndView showAllPage() {
		ModelAndView modelAndView = new ModelAndView("add", "command", new User());
		JSONArray array = new JSONArray();
		for (User u : userService.getAllUser())
		{
		    JSONObject obj = new JSONObject();
		    obj.put("id", u.getId());
		    obj.put("name", u.getName());
		    obj.put("surname", u.getSurname());
		    obj.put("age", u.getAge());
		    obj.put("gender", u.getGender());
		    obj.put("address", u.getAddress());
		    array.add(obj);
		}
		modelAndView.addObject("data", array.toJSONString());
		modelAndView.addObject("users", userService.getAllUser());
		modelAndView.setViewName("all");
		return modelAndView;
	}
	
	
	
	
	
	
	
	

}
