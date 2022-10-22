package edu.hi.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.hi.mapper.AdminMapper;
import edu.hi.mapper.AttachMapper;
import edu.hi.mapper.GiftMapper;
import edu.hi.model.AttachImageVO;
import edu.hi.model.CateFilterDTO;
import edu.hi.model.Criteria;
import edu.hi.model.GiftVO;
import edu.hi.model.SelectDTO;

@Service
public class GiftServiceImpl implements GiftService {
	
	private static final Logger log = LoggerFactory.getLogger(GiftServiceImpl.class);
	
	@Autowired
	private GiftMapper giftMapper;
	
	@Autowired
	private AttachMapper attachMapper;
	
	@Autowired
	private AdminMapper adminMapper;

	/** 상품 검색 */
	@Override
	public List<GiftVO> getGoodsList(Criteria cri) {
		
		log.info("getGoodsList().......");
		
		String type = cri.getType();
		String[] typeArr = type.split("");
		String[] shopArr = giftMapper.getShopIdList(cri.getKeyword());
		
		
		if(type.equals("A") || type.equals("AC") || type.equals("AT") || type.equals("ACT")) {
			if(shopArr.length == 0) {
				return new ArrayList();
			}
		}
		
		for(String t : typeArr) {
			if(t.equals("A")) {
				cri.setShopArr(shopArr);
			}
		}
		
		List<GiftVO> list = giftMapper.getGoodsList(cri);
		
		list.forEach(book -> {
			
			int giftId = book.getGiftId();
			
			List<AttachImageVO> imageList = attachMapper.getAttachList(giftId);
			
			book.setImageList(imageList);
			
		});
		
		return list;
	}

	/** 사품 총 갯수 */
	@Override
	public int goodsGetTotal(Criteria cri) {
		
		log.info("goodsGetTotal().......");
		
		return giftMapper.goodsGetTotal(cri);
		
	}
	
	/** 국내 카테고리 리스트 */
	@Override
	public List<GiftVO> getCateCode1() {
		
		log.info("getCateCode1().........");
		
		return giftMapper.getCateCode1();
	}

	/** 외국 카테고리 리스트 */
	@Override
	public List<GiftVO> getCateCode2() {
		
		log.info("getCateCode2().........");
		
		return giftMapper.getCateCode2();
	}
	
	/** 검색결과 카테고리 필터 정보 */
	@Override
	public List<CateFilterDTO> getCateInfoList(Criteria cri) {
		List<CateFilterDTO> filterInfoList = new ArrayList<CateFilterDTO>();
		
		String[] typeArr = cri.getType().split("");
		String[] shopArr;
		
		for(String type : typeArr) {
			if(type.equals("A")){
				shopArr = giftMapper.getShopIdList(cri.getKeyword());
				if(shopArr.length == 0) {
					return filterInfoList;
				}
				cri.setShopArr(shopArr);
			}
		}
		
		String[] cateList = giftMapper.getCateList(cri);
		
		String tempCateCode = cri.getCateCode();
		
		for(String cateCode : cateList) {
			cri.setCateCode(cateCode);
			CateFilterDTO filterInfo = giftMapper.getCateInfo(cri);
			filterInfoList.add(filterInfo);
		}
		
		cri.setCateCode(tempCateCode);
		
		return filterInfoList;
	}
	
	/** 상품 정보 */
	@Override
	public GiftVO getGoodsInfo(int giftId) {
		
		GiftVO goodsInfo = giftMapper.getGoodsInfo(giftId);
		goodsInfo.setImageList(adminMapper.getAttachInfo(giftId));
		
		return goodsInfo;
	}
	
	@Override
	public GiftVO getGiftIdName(int giftId) {
		
		return giftMapper.getGiftIdName(giftId);
	}
	
	@Override
	public List<SelectDTO> likeSelect() {
		
		List<SelectDTO> list = giftMapper.likeSelect();
		
		list.forEach(dto -> {
			
			int giftId = dto.getGiftId();
			
			List<AttachImageVO> imageList = attachMapper.getAttachList(giftId);
			
			dto.setImageList(imageList);
			
		});				
		
		
		return list;		
	}
	
}
