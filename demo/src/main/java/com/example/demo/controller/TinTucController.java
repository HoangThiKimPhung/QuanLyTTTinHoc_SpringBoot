package com.example.demo.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.service.TinTucService;
import com.google.api.client.http.FileContent;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.model.File;
import com.google.api.services.drive.model.Permission;

@Controller
public class TinTucController {

	public static String errorinput = "";
	@Autowired
	private TinTucService tinTucService;

	@PostMapping("/addtintuc")
	public String ThemTinTuc(@RequestParam("tieuDeTinTuc") String tieuDeTinTuc, @RequestParam("tomTatTinTuc") String tomTatTinTuc,
			@RequestParam("ngayDangTinTuc") String ngayDangTinTuc, @RequestParam("file") MultipartFile file,
			HttpServletRequest request) throws IOException {
		errorinput = "";
		request.getSession().setAttribute("errorinput",errorinput);
		
        if(file == null || file.isEmpty() || tieuDeTinTuc.trim().length() <= 0 || tomTatTinTuc.trim().length() <= 0) {
        	errorinput = "Vui lòng nhập đầy đủ thông tin và chọn File cho Tin tức!!!";
        	request.getSession().setAttribute("errorinput",errorinput);
        	return "redirect:/NV-themtintuc";
        }
        
        Drive service = (Drive)request.getSession().getAttribute("service");
        String idFileTT = uploadFile(file, service);
		
        String maTTMoi = tinTucService.AddTinTuc(tieuDeTinTuc, tomTatTinTuc, ngayDangTinTuc, idFileTT);
    	
    	if(maTTMoi == null) {
    		errorinput = "Thêm tin tức mới không thành công!";
    		request.getSession().setAttribute("errorinput",errorinput);
        	return "redirect:/NV-themtintuc";
    	}
    	
		return "redirect:/NV-quanlytintuc";
	}
	
	@PostMapping("/editTinTuc")
	public String EditTinTuc(@RequestParam("maTinTuc") String maTinTuc,@RequestParam("tieuDeTinTuc") String tieuDeTinTuc, @RequestParam("tomTatTinTuc") String tomTatTinTuc,
			@RequestParam("ngayDangTinTuc") String ngayDangTinTuc, @RequestParam("file") MultipartFile file,
			HttpServletRequest request) throws IOException {
		errorinput = "";
		request.getSession().setAttribute("errorinput",errorinput);
		
        if(tieuDeTinTuc.trim().length() <= 0 || tomTatTinTuc.trim().length() <= 0) {
        	errorinput = "Vui lòng nhập đầy đủ thông tin cho Tin tức!!!";
        	request.getSession().setAttribute("errorinput",errorinput);
        	return "redirect:/NV-chinhsuatintuc";
        }
        
        
        String idFileTT = null;
        if(!file.getOriginalFilename().isEmpty()) {
        	Drive service = (Drive)request.getSession().getAttribute("service");
        	idFileTT = uploadFile(file, service);
        }
		
        tinTucService.EditTinTuc(maTinTuc, tieuDeTinTuc, tomTatTinTuc, ngayDangTinTuc, idFileTT);
    	
		return "redirect:/NV-quanlytintuc";
	}
	
	public String uploadFile(MultipartFile file, Drive service) throws IOException{
		//Lấy tên file
		String[] parts = (file.getOriginalFilename()).split("\\\\");
        String fileName = parts[parts.length - 1];
        
        //Tạo đường dẫn lưu tạm file
        Path sourceFile = Paths.get("file-upload/"+fileName);
        
    	try {
    		//Lưu tạm file
    		byte[] bytes = file.getBytes();
    		Files.write(sourceFile, bytes);
    	}catch(IOException e) {
    		e.printStackTrace();
    	}
    	
    	//Tạo các thông tin cần thiết để upload file lên drive
    	File fileMetadata = new File();
        fileMetadata.setTitle(file.getOriginalFilename());
        fileMetadata.setOriginalFilename(fileName);
        
        //Lấy file
        java.io.File filePath = new java.io.File("file-upload/"+fileName);
        FileContent mediaContent = new FileContent(file.getContentType(), filePath);
        
        //Upload file lên Drive
        File f = service.files().insert(fileMetadata, mediaContent)
            .setFields("id")
            .execute();
        
        //Xóa file đã lưu tạm
        Files.delete(sourceFile);
        
        //Thay đổi quyền truy cập file
        Permission newPermission = new Permission();
        newPermission.setValue("");
        newPermission.setType("anyone");
        newPermission.setRole("reader");
        service.permissions().insert(f.getId(), newPermission).execute();
        
		return f.getId();
	}


	
}
