package com.example.demo.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.example.demo.dao.DangNhapRepository;

@Service
@Transactional
public class DangNhapService {

	private final DangNhapRepository dangNhapRepository;
	
	public DangNhapService(DangNhapRepository dangNhapRepository) {
		this.dangNhapRepository = dangNhapRepository;
	}
	
	
	public String LayThongTinNV(String EmailNV) {
		return dangNhapRepository.LayThongTinNV(EmailNV);
	}
	
}
