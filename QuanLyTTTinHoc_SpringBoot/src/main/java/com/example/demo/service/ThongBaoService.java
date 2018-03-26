package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.PersistenceContext;
import javax.persistence.StoredProcedureQuery;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.example.demo.dao.IThongBaoRepository;
import com.example.demo.model.ThongBao;
import com.example.demo.model.TinTuc;

@Service
@Transactional
public class ThongBaoService {

	private final IThongBaoRepository thongBaoRepository;
	
	public ThongBaoService(IThongBaoRepository thongBaoRepository) {
		this.thongBaoRepository=thongBaoRepository;
	}
	
	public List<ThongBao> findAllThongBao(){
		List<ThongBao> thongbaos = new ArrayList<>();
		for(ThongBao thongbao: thongBaoRepository.findAll())
			thongbaos.add(thongbao);
		return thongbaos;
	}
	
	@PersistenceContext
	private EntityManager entityManager;
	
	public List<ThongBao> LayThongBaoPhu(int firstParam, int endParam){
	   StoredProcedureQuery storedProcedure = entityManager.createStoredProcedureQuery("spLayThongBaoPhu");
		   
	   // Set the parameters of the stored procedure.
	   storedProcedure.registerStoredProcedureParameter(1, Integer.class, ParameterMode.IN);
	   storedProcedure.registerStoredProcedureParameter(2, Integer.class, ParameterMode.IN);
	   storedProcedure.setParameter(1, firstParam);
	   storedProcedure.setParameter(2, endParam);
 
	   // Call the stored procedure. 
	   List<Object[]> storedProcedureResults = storedProcedure.getResultList();
 
	   List<ThongBao> thongbaos = new ArrayList<>();
	   ThongBao thongbao = null;
	   for (Object[] a : storedProcedureResults) {
		   thongbao=new ThongBao(a[0].toString(), a[1].toString(), a[2].toString(), a[3].toString(), 
				   a[4].toString(), a[5].toString(), (int)a[6], (int)a[7]);
		   thongbaos.add(thongbao);
		}
	   return thongbaos;
	}
}
