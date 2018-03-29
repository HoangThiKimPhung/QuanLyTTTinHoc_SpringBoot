package com.example.demo.dao;


import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.model.TinTuc;
import com.google.api.client.http.FileContent;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.model.File;
import com.google.api.services.drive.model.Permission;


@Repository
public class TinTucRepository{

	@PersistenceContext
	private EntityManager entityManager;
	
	//Lấy Tin tức có stt từ firstParam đến endParam
	public List<TinTuc> LayTinTucPhu(int firstParam, int endParam){
	   StoredProcedureQuery storedProcedure = entityManager.createStoredProcedureQuery("spLayTinTucPhu");
		   
	   // Set the parameters of the stored procedure.
	   storedProcedure.registerStoredProcedureParameter(1, Integer.class, ParameterMode.IN);
	   storedProcedure.registerStoredProcedureParameter(2, Integer.class, ParameterMode.IN);
	   storedProcedure.setParameter(1, firstParam);
	   storedProcedure.setParameter(2, endParam);
 
	   // Call the stored procedure. 
	   List<Object[]> storedProcedureResults = storedProcedure.getResultList();
 
	   List<TinTuc> tintucs = new ArrayList<>();
	   TinTuc tintuc = null;
	   for (Object[] a : storedProcedureResults) {
		   tintuc = new TinTuc(a[0].toString(), a[1].toString(), 
				   				a[2].toString(), a[3].toString(), 
				   				a[4].toString(), (int)a[5], (int)a[6]);
		   tintucs.add(tintuc);
		}	      
	   return tintucs;
	}
	
	//Lấy tất cả tin tức
	public List<TinTuc> GetAllTinTuc(){
	   StoredProcedureQuery storedProcedure = entityManager.createStoredProcedureQuery("spLayTinTuc");
 
	   // Call the stored procedure. 
	   List<Object[]> storedProcedureResults = storedProcedure.getResultList();
 
	   List<TinTuc> tintucs = new ArrayList<>();
	   TinTuc tintuc = null;
	   for (Object[] a : storedProcedureResults) {
		   tintuc = new TinTuc(a[0].toString(), a[1].toString(), 
				   				a[2].toString(), a[3].toString(), 
				   				a[4].toString(), (int)a[5], (int)a[6]);
		   tintucs.add(tintuc);
		}
	   return tintucs;
	}
	
	//Lấy mã tin tức tiếp theo
	public String LayMaTinTucTiepTheo() {
		StoredProcedureQuery storedProcedure = entityManager.createStoredProcedureQuery("spTaoMaTinTuc");
		   
	   // Set the parameters of the stored procedure.
	   storedProcedure.registerStoredProcedureParameter(1, String.class, ParameterMode.OUT);
		 
	   // Call the stored procedure. 
	   storedProcedure.execute();
	   String result = (String)storedProcedure.getOutputParameterValue(1);
	   return result;
	}
	
	//Thêm 1 tin tức mới
	public String AddTinTuc(String tieuDeTinTuc,String tomTatTinTuc, String ngayDangTinTuc,String fileTT) {
			StoredProcedureQuery storedProcedure = entityManager.createStoredProcedureQuery("spThemTinTuc");
		   
		   // Set the parameters of the stored procedure.
		   storedProcedure.registerStoredProcedureParameter(1, String.class, ParameterMode.IN);
		   storedProcedure.registerStoredProcedureParameter(2, String.class, ParameterMode.IN);
		   storedProcedure.registerStoredProcedureParameter(3, String.class, ParameterMode.IN);
		   storedProcedure.registerStoredProcedureParameter(4, String.class, ParameterMode.IN);
		   storedProcedure.registerStoredProcedureParameter(5, String.class, ParameterMode.OUT);
		   storedProcedure.setParameter(1, tieuDeTinTuc);
		   storedProcedure.setParameter(2, tomTatTinTuc);
		   storedProcedure.setParameter(3, ngayDangTinTuc);
		   storedProcedure.setParameter(4, fileTT);
	 
		   // Call the stored procedure. 
		   storedProcedure.execute();
		   String result = (String)storedProcedure.getOutputParameterValue(5);
		   if(result != null) {
			   return result;
		   }
		   return null;
	}
	
	//Xóa 1 tin tức
	public boolean DeleteTinTuc(String maTT) {
			StoredProcedureQuery storedProcedure = entityManager.createStoredProcedureQuery("spXoaTinTuc");
		   
		   // Set the parameters of the stored procedure.
		   storedProcedure.registerStoredProcedureParameter(1, String.class, ParameterMode.IN);
		   storedProcedure.setParameter(1, maTT);
		   
		   boolean kq = storedProcedure.execute();
		   return kq;
	}
	
	//Cập nhật 1 tin tức 
	public boolean EditTinTuc(String maTinTuc, String tieuDeTinTuc,String tomTatTinTuc, String ngayDangTinTuc,String fileTT) {
		   StoredProcedureQuery storedProcedure = entityManager.createStoredProcedureQuery("spCapNhatTinTuc");
		   if(fileTT == null) {
				fileTT = "null";
		   }
		   // Set the parameters of the stored procedure.
		   storedProcedure.registerStoredProcedureParameter(1, String.class, ParameterMode.IN);
		   storedProcedure.registerStoredProcedureParameter(2, String.class, ParameterMode.IN);
		   storedProcedure.registerStoredProcedureParameter(3, String.class, ParameterMode.IN);
		   storedProcedure.registerStoredProcedureParameter(4, String.class, ParameterMode.IN);
		   storedProcedure.registerStoredProcedureParameter(5, String.class, ParameterMode.IN);
		   storedProcedure.setParameter(1, maTinTuc);
		   storedProcedure.setParameter(2, tieuDeTinTuc);
		   storedProcedure.setParameter(3, tomTatTinTuc);
		   storedProcedure.setParameter(4, ngayDangTinTuc);
		   storedProcedure.setParameter(5, fileTT);
		   
		   // Call the stored procedure. 
		   boolean result = storedProcedure.execute();
		   
		   return result;
	}

	public int SoLuongTinTuc() {
		StoredProcedureQuery storedProcedure = entityManager.createStoredProcedureQuery("spSoLuongTinTuc");
		storedProcedure.registerStoredProcedureParameter(1, Integer.class, ParameterMode.OUT);
		storedProcedure.execute();
		int soLuong = (int)storedProcedure.getOutputParameterValue(1);
		if(soLuong > 0) {
			   return soLuong;
		}
		return 0;
	}
	
	//Cập nhật 1 tin tức 
	public boolean EditTieuDeWebpage(String maTinTuc, String tieuDeTinTuc) {
		   StoredProcedureQuery storedProcedure = entityManager.createStoredProcedureQuery("spChinhSuaTieuDeTinTuc");
		   
		   // Set the parameters of the stored procedure.
		   storedProcedure.registerStoredProcedureParameter(1, String.class, ParameterMode.IN);
		   storedProcedure.registerStoredProcedureParameter(2, String.class, ParameterMode.IN);
		   storedProcedure.setParameter(1, maTinTuc);
		   storedProcedure.setParameter(2, tieuDeTinTuc);
		   
		   // Call the stored procedure. 
		   boolean result = storedProcedure.execute();
		   
		   return result;
	}
	
	public boolean EditNoiDungWebpage(String maTinTuc, String tomTatTinTuc) {
		   StoredProcedureQuery storedProcedure = entityManager.createStoredProcedureQuery("spChinhSuaNoiDungTinTuc");
		   
		   // Set the parameters of the stored procedure.
		   storedProcedure.registerStoredProcedureParameter(1, String.class, ParameterMode.IN);
		   storedProcedure.registerStoredProcedureParameter(2, String.class, ParameterMode.IN);
		   storedProcedure.setParameter(1, maTinTuc);
		   storedProcedure.setParameter(2, tomTatTinTuc);
		   
		   // Call the stored procedure. 
		   boolean result = storedProcedure.execute();
		   
		   return result;
	}
}
