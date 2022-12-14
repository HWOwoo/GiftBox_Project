package edu.hi.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.hi.mapper.AttachMapper;
import edu.hi.model.AttachImageVO;
import edu.hi.model.Criteria;
import edu.hi.model.GiftVO;
import edu.hi.model.PageDTO;
import edu.hi.service.GiftService;


@Controller
public class BookController {

	private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	
	@Autowired
	private AttachMapper attachMapper;
	
	@Autowired
	private GiftService giftService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void mainPageGET(Model model) {
		
		logger.info("메인 페이지 진입");
		
		model.addAttribute("cate1", giftService.getCateCode1());
		model.addAttribute("cate2", giftService.getCateCode2());
		model.addAttribute("ls", giftService.likeSelect());
		
	}
	
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName){
	
		logger.info("getImage()........." + fileName);
		
		File file = new File("c:\\upload\\" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	/** 이미지 정보 반환 */
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> getAttachList(int giftId){
		
		logger.info("getAttachList.........." + giftId);
		
		return new ResponseEntity<List<AttachImageVO>>(attachMapper.getAttachList(giftId), HttpStatus.OK);
		
	}
	
	/** 상품 검색 */
	@GetMapping("/search")
	public String searchGoodsGET(Criteria cri, Model model) {
		
		logger.info("cri : " + cri);
		
		List<GiftVO> list = giftService.getGoodsList(cri);
		logger.info("pre list : " + list);
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			logger.info("list : " + list);
		} else {
			model.addAttribute("listcheck", "empty");
			
			return "search";
		}
		
		model.addAttribute("pageMaker", new PageDTO(cri, giftService.goodsGetTotal(cri)));
		
		String[] typeArr = cri.getType().split("");
		
		for(String s : typeArr) {
			if(s.equals("T") || s.equals("A")) {
				model.addAttribute("filter_info", giftService.getCateInfoList(cri));		
			}
		}
		
		return "search";
		
	}
	
	/** 상품 상세 */
	@GetMapping("/goodsDetail/{giftId}")
	public String goodsDetailGET(@PathVariable("giftId")int giftId, Model model) {
		
		logger.info("goodsDetailGET()..........");
		
		model.addAttribute("goodsInfo", giftService.getGoodsInfo(giftId));
		
		return "/goodsDetail";
	}
	
	/* 리뷰 쓰기 */
	@GetMapping("/replyEnroll/{memberId}")
	public String replyEnrollWindowGET(@PathVariable("memberId")String memberId, int giftId, Model model) {
		
		GiftVO gift = giftService.getGiftIdName(giftId);
		model.addAttribute("giftInfo", gift);
		model.addAttribute("memberId", memberId);
		
		return "/replyEnroll";
	}
	
}
