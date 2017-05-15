package com.hpe.dao;

import java.util.List;

import com.hpe.po.Shiti;

public interface ShitiDao {
		
	public List<Shiti> getAllShitis();
	
	public boolean add(Shiti l);
	
	public boolean modify(Shiti l);
	
	public boolean deleteShiti(String id);
	
	public Shiti getShitiById(String id);

	public List<Shiti> getShitiByTaotiId(String taotiId);

}
