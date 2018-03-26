package com.example.demo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.model.ThongBao;
import com.example.demo.service.ThongBaoService;

@RestController
public class ThongBaoRestController {
	@Autowired
	private ThongBaoService thongBaoService;

	@GetMapping("/get4ThongBao")
	public @ResponseBody List<ThongBao> LayTinTucPhu(HttpServletRequest request, 
			HttpServletResponse response) throws IOException {
		return thongBaoService.LayThongBaoPhu(1, 4);
	}
	
	
	@GetMapping("/allthongbao")
	public String allThongBao() {
		return thongBaoService.findAllThongBao().toString();
	}
	
}
