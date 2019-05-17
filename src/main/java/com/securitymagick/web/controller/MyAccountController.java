package com.securitymagick.web.controller;

import static com.securitymagick.AppConstants.CSRF_COOKIE_NAME;
import static com.securitymagick.AppConstants.ACCOUNT_URL;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.securitymagick.domain.FrontEndValidation;
import com.securitymagick.domain.MenuItem;
import com.securitymagick.domain.SiteLook;
import com.securitymagick.domain.dao.MenuDao;
import com.securitymagick.domain.dao.SiteLookDao;

@Controller
public class MyAccountController {

	@Autowired
	MenuDao menuDao;
	
	@Autowired
	SiteLookDao siteLookDao;
	
	@RequestMapping(value = "/" + ACCOUNT_URL, method = RequestMethod.GET)
	public String about(ModelMap model, HttpServletRequest request) {
		List<MenuItem> menuItems = menuDao.getMenuDB("account");
		List<MenuItem> navbarMenuItems = menuDao.getMenuDB("navbar");
		List<SiteLook> siteLooks = siteLookDao.getSiteLook();
		if (!siteLooks.isEmpty()) {
			model.addAttribute("siteLook", siteLooks.get(0));
		}
		model.addAttribute("menuItems", menuItems);
		model.addAttribute("navbarMenuItems", navbarMenuItems);

		FrontEndValidation validation = new FrontEndValidation(request);
		model.addAttribute("validation", validation);
		
		return "myAccount";

	}

}