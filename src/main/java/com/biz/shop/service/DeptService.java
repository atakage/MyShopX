package com.biz.shop.service;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.stereotype.Service;

import com.biz.shop.dao.DeptDao;
import com.biz.shop.domain.DeptVO;
import com.biz.shop.persistence.DeptRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class DeptService {
	
	private final DeptRepository deptRepo;
	private final DeptDao deptDao;

	public DeptVO save(DeptVO deptVO) {
		// TODO Auto-generated method stub
		
		DeptVO ret = deptRepo.save(deptVO);
		
		return ret;
		
	}

	public List<DeptVO> selectAll() {
		// TODO Auto-generated method stub
		
		
		List<DeptVO> deptList = deptRepo.findAll();
		
		return deptList;
	}

	public DeptVO selectById(long d_id) {
		// TODO Auto-generated method stub
		
	 	Optional<DeptVO> deptVO = deptRepo.findById(d_id);
		
		return deptVO.get();
	}

	public List<DeptVO> findByDName(String search) {
		// TODO Auto-generated method stub
		
		return deptDao.findByDName(search);
		
	}

}
