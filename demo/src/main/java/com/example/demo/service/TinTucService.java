package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.dao.ITinTucRepository;
import com.example.demo.dao.TinTucRepository;
import com.example.demo.model.TinTuc;


@Service
@Transactional
public class TinTucService {

	private final ITinTucRepository ItinTucRepository;
	private final TinTucRepository tinTucRepository;
	
	public TinTucService(ITinTucRepository ItinTucRepository, TinTucRepository tinTucRepository) {
		this.ItinTucRepository = ItinTucRepository;
		this.tinTucRepository = tinTucRepository;
	}
	
	//Tìm 1 tin tức
	public Optional<TinTuc> findOneTinTuc(String maTT){
		return ItinTucRepository.findById(maTT);
	}
	
	//Lấy tin tức có stt từ a -> b
	public List<TinTuc> LayTinTucPhu(int firstParam, int endParam){
		return tinTucRepository.LayTinTucPhu(firstParam, endParam);
	}
	
	//Lấy toàn bộ tin tức
	public List<TinTuc> GetAllTinTuc(){
		return tinTucRepository.GetAllTinTuc();
	}

	//Lấy mã tin tức mới tiếp theo
	public String LayMaTinTucTiepTheo() {
		return tinTucRepository.LayMaTinTucTiepTheo();
	}
	
	//Thêm mới 1 tin tức
	public String AddTinTuc(String tieuDeTinTuc,String tomTatTinTuc, String ngayDangTinTuc,String fileTT) {
		String kq = tinTucRepository.AddTinTuc(tieuDeTinTuc, tomTatTinTuc, ngayDangTinTuc, fileTT);
		if(kq == null)
			return null;
		return kq;
	}
	
	//Thêm mới 1 tin tức
	public boolean EditTinTuc(String maTinTuc, String tieuDeTinTuc,String tomTatTinTuc, String ngayDangTinTuc,String fileTT) {
		boolean kq = tinTucRepository.EditTinTuc(maTinTuc, tieuDeTinTuc, tomTatTinTuc, ngayDangTinTuc, fileTT);
		return kq;
	}

	//Xóa một tin tức
	public boolean DeleteTinTuc(String maTT) {
		return tinTucRepository.DeleteTinTuc(maTT);
	}
}
