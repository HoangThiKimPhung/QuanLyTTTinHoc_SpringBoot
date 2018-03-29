package com.example.demo.dao;



import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.model.TinTuc;

public interface ITinTucRepository extends CrudRepository<TinTuc, String> {
	
}
