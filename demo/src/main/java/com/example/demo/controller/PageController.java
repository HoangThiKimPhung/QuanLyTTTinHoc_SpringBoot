package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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
	
	
	/*@GetMapping(value="/nhanvien")
	public String NhanVien() {
		return "nhanvien";
	}*/
	
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
	
	@GetMapping("/test")
	public String Test() {
		return "test";
	}
	
	
	
	

}
