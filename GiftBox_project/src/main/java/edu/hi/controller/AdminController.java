package edu.hi.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import edu.hi.model.AttachImageVO;
import edu.hi.model.Criteria;
import edu.hi.model.GiftVO;
import edu.hi.model.PageDTO;
import edu.hi.model.ShopVO;
import edu.hi.service.AdminService;
import edu.hi.service.ShopService;
import net.coobird.thumbnailator.Thumbnails;

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
    
	/** 상품 관리(상품목록) 페이지 접속 */
	@RequestMapping(value = "goodsManage", method = RequestMethod.GET)
	public void goodsManageGET(Criteria cri, Model model) throws Exception{
	
		/** 상품 리스트 데이터 */
		List list = adminService.goodsGetList(cri);
		
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}
		
		/** 페이지 인터페이스 데이터 */
		model.addAttribute("pageMaker", new PageDTO(cri, adminService.goodsGetTotal(cri)));
		

	}
    
    /** 상품 등록 페이지 접속 */
    @RequestMapping(value = "goodsEnroll", method = RequestMethod.GET)
    public void goodsEnrollGET(Model model) throws Exception{
    	
        logger.info("상품 등록 페이지 접속");
        
        ObjectMapper objm = new ObjectMapper();
        
        List list = adminService.cateList();
        
        String cateList = objm.writeValueAsString(list);
        
        model.addAttribute("cateList", cateList);
        
		logger.info("변경 전.........." + list);
		logger.info("변경 후.........." + cateList);
		
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
			model.addAttribute("list",list);	// 가게 존재 경우
		} else {
			model.addAttribute("listCheck", "empty");	// 가게 존재하지 않을 경우
		} 
        
        /** 페이지 이동 인터페이스 데이터 */
        int total = shopService.shopGetTotal(cri);
        
        PageDTO pageMaker = new PageDTO(cri, total);
        
        model.addAttribute("pageMaker", pageMaker);
        
    }
    
    @RequestMapping(value="shopEnroll.do", method = RequestMethod.POST)
    public String authorEnrollPOST(ShopVO shop, RedirectAttributes rttr) throws Exception{
     
            logger.info("shopEnroll :" +  shop);
            
            shopService.shopEnroll(shop);      // 가게 등록 쿼리 수행
            
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
	
	/** 가게 검색 팝업창 */
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
	
	/** 상품 조회 페이지 
	 * @throws JsonProcessingException */
	@GetMapping({"/goodsDetail", "/goodsModify"})
	public void goodsGetInfoGET(int giftId, Criteria cri, Model model) throws JsonProcessingException {
		
		logger.info("goodsGetInfo()........." + giftId);
		
		ObjectMapper mapper = new ObjectMapper();
		
		/* 카테고리 리스트 데이터 */
		model.addAttribute("cateList", mapper.writeValueAsString(adminService.cateList()));	
		
		/** 목록 페이지 조건 정보 */
		model.addAttribute("cri", cri);
		
		/** 조회 페이지 정보 */
		model.addAttribute("goodsInfo", adminService.goodsGetDetail(giftId));
		
	}

	/** 상품 정보 수정 */
	@PostMapping("/goodsModify")
	public String goodsModifyPOST(GiftVO vo, RedirectAttributes rttr) {
		
		logger.info("goodsModifyPOST.........." + vo);
		
		int result = adminService.goodsModify(vo);
		
		rttr.addFlashAttribute("modify_result", result);
		
		return "redirect:/admin/goodsManage";		
		
	}
	
	/** 상품 정보 삭제 */
	@PostMapping("/goodsDelete")
	public String goodsDeletePOST(int giftId, RedirectAttributes rttr) {
		
		logger.info("goodsDeletePOST..........");
		
		int result = adminService.goodsDelete(giftId);
		
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/admin/goodsManage";
		
	}
	
	/** 가게 정보 삭제 */
	@PostMapping("/shopDelete")
	public String shopDeletePOST(int shopId, RedirectAttributes rttr) {
		
		logger.info("authorDeletePOST..........");
		
		int result = 0;
		
		try {
			
			result = shopService.shopDelete(shopId);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			result = 2;
			rttr.addFlashAttribute("delete_result", result);
			
			return "redirect:/admin/authorManage";
				
		}
		
		
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/admin/authorManage";
		
	}	
    
	/** 첨부 파일 업로드 */
	@PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {
		
		logger.info("uploadAjaxActionPOST..........");
		
		/** 이미지 파일 체크 */
		for(MultipartFile multipartFile: uploadFile) {
			
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			
			try {
				type = Files.probeContentType(checkfile.toPath());
				logger.info("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(!type.startsWith("image")) {
				
				List<AttachImageVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
				
			}
			
		}// for
		
		String uploadFolder = "C:\\upload";
		
		/** 날짜 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		String datePath = str.replace("-", File.separator);
		
		/** 폴더 생성 */
		File uploadPath = new File(uploadFolder, datePath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		/* 이미저 정보 담는 객체 */
		List<AttachImageVO> list = new ArrayList();
		
		/** 향상된 for */
		for(MultipartFile multipartFile : uploadFile) {
			
			AttachImageVO vo = new AttachImageVO();
			
			
			/** 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);
			
			/** uuid 적용 파일 이름 */
			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);
			
			uploadFileName = uuid + "_" + uploadFileName;
			
			/** 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);
			
			/** 파일 저장 */
			try {
				multipartFile.transferTo(saveFile);
				
				/** 썸네일 이미지 생성 
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
				
				BufferedImage bo_image = ImageIO.read(saveFile);
				
					// 비율 
					double ratio = 3;
					// 넓이 높이
					int width = (int) (bo_image.getWidth() / ratio);
					int height = (int) (bo_image.getHeight() / ratio);	
				
				BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
								
				Graphics2D graphic = bt_image.createGraphics();
				
				graphic.drawImage(bo_image, 0, 0,width,height, null);
					
				ImageIO.write(bt_image, "jpg", thumbnailFile);
				*/
				
				/* 방법 2 */
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);	
				
				BufferedImage bo_image = ImageIO.read(saveFile);

					//비율 
					double ratio = 3;
					//넓이 높이
					int width = (int) (bo_image.getWidth() / ratio);
					int height = (int) (bo_image.getHeight() / ratio);					
				
				
				Thumbnails.of(saveFile)
		        .size(width, height)
		        .toFile(thumbnailFile);
				
			} catch (Exception e) {
				
				e.printStackTrace();
				
			} 
			
			list.add(vo);
		}
		
		ResponseEntity<List<AttachImageVO>> result = new ResponseEntity<List<AttachImageVO>>(list, HttpStatus.OK);
		
		return result;
	}
	
	/** 이미지 파일 삭제 */
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName){
		
		logger.info("deleteFile........" + fileName);
		
		File file = null;
		
		try {
			/* 썸네일 파일 삭제 */
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			/* 원본 파일 삭제 */
			String originFileName = file.getAbsolutePath().replace("s_", "");
			
			logger.info("originFileName : " + originFileName);
			
			file = new File(originFileName);
			
			file.delete();
			
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
			
		} // catch
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
		
	}
	
	
}
