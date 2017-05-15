package com.hpe.dao;

import java.util.List;

import com.hpe.po.Manager;

public interface ManagerDao {
	
	public Manager getManagerByNameAndPwd(String name,String pwd);
	
	public List<Manager> getAllManager();
	
	public boolean saveManager(Manager manager);

	public boolean deleteManager(String id);

	public boolean updateManager(Manager manager);
}
