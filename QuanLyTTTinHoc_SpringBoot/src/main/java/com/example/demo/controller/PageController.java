package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class PageController {

	@GetMapping(value= {"/","/index"})
	public String Index() {
		return "index";
	}
	
	@GetMapping("/login")
	public String Login() {
		return "login";
	}
	
	@GetMapping(value="/tintuc")
	public String TinTuc() {
		return "tintuc";
	}
	
	
	@GetMapping(value="/test")
	public String NhanVien() {
		return "test";
	}
	
	@GetMapping(value="/NV-quanlytintuc")
	public String NV_QuanLyTinTuc() {
		return "NV-quan-ly-tin-tuc";
	}
	
	@GetMapping(value="/NV-themtintuc")
	public String NV_ThemTinTuc() {
		return "NV-them-tin-tuc";
	}
	
	@GetMapping(value="/NV-chinhsuatintuc")
	public String NV_ChinhSuaTinTuc() {
		return "NV-chinh-sua-tin-tuc";
	}
	
	
	@GetMapping("/logout")
	public String Logout(HttpServletRequest request) {
		request.getSession().removeAttribute("maNV");
		return "index";
	}
}
