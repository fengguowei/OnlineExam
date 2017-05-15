package com.hpe.service;

import java.util.List;

import com.hpe.po.Manager;

public interface ManagerService {
	
	public Manager login(String name,String pwd);
	
	public List<Manager> getAllManager();
	
	public boolean addManager(Manager manager);

	public boolean deleteManager(String id);

	public boolean modifyManager(Manager manager);
}
