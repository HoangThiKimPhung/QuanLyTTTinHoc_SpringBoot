package com.example.demo.controller;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.model.TinTuc;
import com.example.demo.service.TinTucService;
import com.google.api.services.drive.Drive;



@RestController
public class TinTucRestController {
	@Autowired
	private TinTucService tinTucService;
	
	@PostMapping("/findTinTuc") 
	public String FindTinTuc(@RequestParam("maTT") String maTT,HttpServletRequest request) {
		Optional<TinTuc> tintucEdit = tinTucService.findOneTinTuc(maTT);
		if(tintucEdit != null) {
			request.getServletContext().setAttribute("tintucEdit", tintucEdit);
			return "ok";
		}
		return "fail";
	}
	
	@GetMapping("/getTinTucEdit")
	public @ResponseBody Optional<TinTuc> GetTinTucEdit(HttpServletRequest request){
		Optional<TinTuc> tintucEdit = (Optional<TinTuc>)request.getServletContext().getAttribute("tintucEdit");
		return tintucEdit;
		
	}
	
	@GetMapping("/get4TinTuc")
	public @ResponseBody List<TinTuc> LayTinTucPhu() {
		return tinTucService.LayTinTucPhu(1,4);
	}
	
	@GetMapping("/getAllTinTuc")
	public @ResponseBody List<TinTuc> GetAllTinTuc() {
		return tinTucService.GetAllTinTuc();
	}
	
	@GetMapping("/layMaTTMoi")
	public String LayMaTinTucMoi() {
		return tinTucService.LayMaTinTucTiepTheo();
	}
	
	@DeleteMapping("/deleteTinTuc")
	public String DeleteTinTuc(@RequestParam("maTT") String maTT,HttpServletRequest request) throws IOException {
		Optional<TinTuc> tintuc = (Optional<TinTuc>)tinTucService.findOneTinTuc(maTT);
		String idFile = tintuc.get().getFileTT();
		
		Drive service = (Drive)request.getSession().getAttribute("service");
		service.files().delete(idFile).execute();
		
		boolean kq = tinTucService.DeleteTinTuc(maTT);
		
		return "ok";
	}
			
}
