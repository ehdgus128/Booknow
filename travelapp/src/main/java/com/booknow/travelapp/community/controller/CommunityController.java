package com.booknow.travelapp.community.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.booknow.travelapp.community.domain.TLCommunityBoardVO;
import com.booknow.travelapp.community.domain.common.TLCommunityPagingDTO;
import com.booknow.travelapp.community.service.TLCommunityService;
 
@RequestMapping("/community")
@Controller
public class CommunityController {
	
	private TLCommunityService tlCommunityService;
	
	public CommunityController(TLCommunityService tlCommunityService) {
		this.tlCommunityService = tlCommunityService;
	}

	//게시판리스트 보기 
	@GetMapping("/list")
	public void showCommuList(@RequestParam(value="tvcCatId",required=false)Long tvcCatId,@RequestParam(value="pageNum",defaultValue="1")int pageNum,ModelMap model) {
		if(tvcCatId == null) {
			tvcCatId = 1L;
		}
		model.put("cateList", tlCommunityService.getCommuCateList());
		model.put("boardList", tlCommunityService.getCommuBoardList(tvcCatId,pageNum));
		
		TLCommunityPagingDTO pageBean = tlCommunityService.getTotalRowAmount(tvcCatId,pageNum);
		
		model.put("pageBean", pageBean);
	
	}
	
	//게시글 작성 화면 
	@GetMapping("/write")
	@PreAuthorize("isAuthenticated()")
	public void showWritePage(@RequestParam("tvcCatId")Long tvcCatId,TLCommunityBoardVO tlCommunityBoardVO,ModelMap model) {
		tlCommunityBoardVO.setTvcCatId(tvcCatId);
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = ((UserDetails)principal).getUsername();
		model.put("username", username);
		
	}
	
	//게시글 등록 처리
	@PostMapping("/write_pro")
	@PreAuthorize("isAuthenticated()")
	public String WritePage(@RequestParam("tvcCatId")Long tvcCatId,
								TLCommunityBoardVO tlCommunityBoardVO,ModelMap model) {
		
		tlCommunityBoardVO.setTvcCatId(tvcCatId);		
		tlCommunityService.registerBoard(tlCommunityBoardVO);
		
		model.put("boardVO", tlCommunityBoardVO);
		return "/community/write_success";
	}
		
	//상세페이지 보기
	@GetMapping("/detail")
	@PreAuthorize("isAuthenticated()")
	public void showCommuDetail(@RequestParam(value="tvcCatId")Long tvcCatId,
			@RequestParam(value="tvcBno")Long tvcBno,ModelMap model ) {
		model.put("boardDetail", tlCommunityService.getCommuBoardDetail(tvcCatId,tvcBno));	
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = ((UserDetails)principal).getUsername();
		model.put("username", username);		
	}
	
	//수정페이지 보기
	@GetMapping("/modify")
	@PreAuthorize("isAuthenticated()")
	public void showCommuModify(@RequestParam(value="tvcCatId")Long tvcCatId,
								@RequestParam(value="tvcBno")Long tvcBno,
								TLCommunityBoardVO communityBean,ModelMap model) {
		model.put("tvcCatId", tvcCatId);
		model.put("tvcBno", tvcBno);
		model.put("boardDetail", tlCommunityService.getCommuBoardDetail(tvcCatId,tvcBno));		
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = ((UserDetails)principal).getUsername();
		model.put("username", username);
	}
	
	
	//수정 페이지 등록 
	@PostMapping("/modify")
	@PreAuthorize("isAuthenticated()")
	public String CommuModify(@RequestParam(value="tvcCatId")Long tvcCatId,@RequestParam(value="tvcBno")Long tvcBno,TLCommunityBoardVO communityBean,ModelMap model) {
		communityBean.setTvcCatId(tvcCatId);
		communityBean.setTvcBno(tvcBno);
		tlCommunityService.modifyBoard(communityBean);
		
		model.put("communityBean", communityBean);
		return "community/modify_success";
	}
	
	//삭제 요청 js
	@GetMapping("/delete")
	@PreAuthorize("isAuthenticated()")
	public String showCommuDelete(@RequestParam(value="tvcCatId")Long tvcCatId,
								@RequestParam(value="tvcBno")Long tvcBno,
								ModelMap model) {
		if(tlCommunityService.updateBdelFlag(tvcBno, tvcCatId)) {
			return "community/delete_success";
		}
		else {
			model.put("fail", "deleteFail");
		return "community/detail";
		
		}
	}

	
}
