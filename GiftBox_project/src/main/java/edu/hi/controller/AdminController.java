package edu.hi.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.hi.model.Criteria;
import edu.hi.model.GiftVO;
import edu.hi.model.PageDTO;
import edu.hi.model.ShopVO;
import edu.hi.service.AdminService;
import edu.hi.service.ShopService;

@Controller
@RequestMapping("/admin")
public class AdminController {
 
    private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
    
    @Autowired
    private ShopService shopService;
    
	@Autowired
	private AdminService adminService;
    
    /** 관리자 메인 페이지 이동 */
    @RequestMapping(value="main", method = RequestMethod.GET)
    public void adminMainGET() throws Exception{
        
        logger.info("관리자 페이지 이동");
        
    }
    
    /** 상품 등록 페이지 접속 */
    @RequestMapping(value = "goodsManage", method = RequestMethod.GET)
    public void goodsManageGET() throws Exception{
        logger.info("상품 등록 페이지 접속");
    }
    
    /** 상품 등록 페이지 접속 */
    @RequestMapping(value = "goodsEnroll", method = RequestMethod.GET)
    public void goodsEnrollGET() throws Exception{
        logger.info("상품 등록 페이지 접속");
    }
    
    /** 가게 등록 페이지 접속 */
    @RequestMapping(value = "shopEnroll", method = RequestMethod.GET)
    public void shopEnrollGET() throws Exception{
        logger.info("가게 등록 페이지 접속");
    }
    
    /** 가게 관리 페이지 접속 */
    @RequestMapping(value = "shopManage", method = RequestMethod.GET)
    public void shopManageGET(Criteria cri, Model model) throws Exception{
        logger.info("가게 관리 페이지 접속.........." + cri);
        
        /** 가게 목록 출력 데이터 */
        List list = shopService.shopGetList(cri);
        
		if(!list.isEmpty()) {
			model.addAttribute("list",list);	// 작가 존재 경우
		} else {
			model.addAttribute("listCheck", "empty");	// 작가 존재하지 않을 경우
		} 
        
        /** 페이지 이동 인터페이스 데이터 */
        int total = shopService.shopGetTotal(cri);
        
        PageDTO pageMaker = new PageDTO(cri, total);
        
        model.addAttribute("pageMaker", pageMaker);
        
    }
    
    @RequestMapping(value="shopEnroll.do", method = RequestMethod.POST)
    public String authorEnrollPOST(ShopVO shop, RedirectAttributes rttr) throws Exception{
     
            logger.info("shopEnroll :" +  shop);
            
            shopService.shopEnroll(shop);      // 작가 등록 쿼리 수행
            
            rttr.addFlashAttribute("shop_result", shop.getShopName());
            
            return "redirect:/admin/shopManage";
            
 
    }
    
	/** 가게 상세 페이지 */
	@GetMapping({"/shopDetail", "/shopModify"})
	public void shopGetInfoGET(int shopId, Criteria cri, Model model) throws Exception {
		
		logger.info("shopDetail......." + shopId);
		
		/** 가게 관리 페이지 정보 */
		model.addAttribute("cri", cri);
		
		/** 선택 가게 정보 */
		model.addAttribute("shopInfo", shopService.shopGetDetail(shopId));
		
	}
	
	/** 가게 정보 수정 */
	@PostMapping("/shopModify")
	public String shopModifyPOST(ShopVO shop, RedirectAttributes rttr) throws Exception{
		
		logger.info("shopModifyPOST......." + shop);
		
		int result = shopService.shopModify(shop);
		
		rttr.addFlashAttribute("modify_result", result);
		
		return "redirect:/admin/shopManage";
		
	}
	
	
    /** 상품 등록 */
	@PostMapping("/goodsEnroll")
	public String goodsEnrollPOST(GiftVO gift, RedirectAttributes rttr) {
		
		logger.info("goodsEnrollPOST......" + gift);
		
		adminService.giftEnroll(gift);
		
		rttr.addFlashAttribute("enroll_result", gift.getGiftName());
		
		return "redirect:/admin/goodsManage";
	}
	
	/** 작가 검색 팝업창 */
	@GetMapping("/shopPop")
	public void shopPopGET(Criteria cri, Model model) throws Exception{
		
		logger.info("shopPopGET.......");

		cri.setAmount(5);
		
		/** 게시물 출력 데이터 */
		List list = shopService.shopGetList(cri);
		
		if(!list.isEmpty()) {
			model.addAttribute("list",list);	// 가게 존재 경우
		} else {
			model.addAttribute("listCheck", "empty");	// 가게 존재하지 않을 경우
		}
		
		
		/** 페이지 이동 인터페이스 데이터 */
		model.addAttribute("pageMaker", new PageDTO(cri, shopService.shopGetTotal(cri)));			
		
	}
    
}