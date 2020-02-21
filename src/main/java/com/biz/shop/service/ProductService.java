package com.biz.shop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.biz.shop.domain.ProductVO;
import com.biz.shop.persistence.ProductRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class ProductService {
	
	private final ProductRepository pDao;
	
	public void save(ProductVO productVO) {
		
		
		ProductVO p = pDao.save(productVO);
		log.debug("상품정보:" + p.toString());
		
	}
	
	
	public List<ProductVO> selectAll(){
		
		
		
		List<ProductVO> proList = pDao.findAll();
		return proList;
		
	}


	


	public ProductVO findById(long id) {
		// TODO Auto-generated method stub
		
		/*
		 * hibernate의 기본 조회 method들은 모두 VO Class를 Optional Class로 감싸 return
		 * 이것은 혹시 모를 NullPointException을 방지하기 위한 조치
		 * 실제 VO 객체를 추출할 때는 ret.get()을 사용
		 */
		Optional<ProductVO> proVO = pDao.findById(id);
		return proVO.get();
	}

}
