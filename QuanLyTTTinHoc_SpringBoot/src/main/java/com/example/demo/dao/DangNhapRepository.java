package com.example.demo.dao;

import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.PersistenceContext;
import javax.persistence.StoredProcedureQuery;

import org.springframework.stereotype.Repository;

@Repository
public class DangNhapRepository {

	@PersistenceContext
	private EntityManager entityManager;
	
	public String LayThongTinNV(String EmailNV) {
		
		StoredProcedureQuery storedProcedure = entityManager.createStoredProcedureQuery("spLoginWithGoogle");
		
		// Set the parameters of the stored procedure.
	    storedProcedure.registerStoredProcedureParameter(1, String.class, ParameterMode.IN);
	    storedProcedure.registerStoredProcedureParameter(2, String.class, ParameterMode.OUT);
	    
	    storedProcedure.setParameter(1, EmailNV);
	    storedProcedure.execute();
	    
	    String maNV = (String)storedProcedure.getOutputParameterValue(2);
	    
		return maNV;
	}
}
