package com.kh.final3.board.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.final3.board.model.service.DocumentService;
import com.kh.final3.board.model.vo.Board;
import com.kh.final3.board.model.vo.BoardAttachment;
import com.kh.final3.common.template.Pagination;
import com.kh.final3.common.template.SaveFile;
import com.kh.final3.common.vo.PageInfo;
import com.kh.final3.member.model.vo.Member;

@RequestMapping(value = {"/member", "/admin"})
@Controller
public class DocumentController {
	
	@Autowired
	public DocumentService documentService;
	
	//changeName 생성class 
	@Autowired
	public SaveFile saveFile;
	
	//게시글 목록 이동 
	@RequestMapping(value="list.dc")
	public String documentList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		
		//게시글 목록 조회해오기
		int listCount = documentService.selectDocumentListCount();

		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList <Board> bList = documentService.selectDocumentList(pi);
		
		model.addAttribute("bList", bList);
		model.addAttribute("pi", pi);
		
		return "board/board_document/board_DocumentList";
	}
	
	//게시글 검색 조회 
	@RequestMapping(value="search.dc")
	public String searchList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, String deptCode, String keyword, Model model){
		
		HashMap<String, String> searchMap = new HashMap<>();
		
		searchMap.put("keyword", keyword);
		searchMap.put("deptCode", deptCode);
		
		//System.out.println("deptCode: " + deptCode + ", keyword: "+keyword);
		
		//조회된 결과물 숫자 구해오기 
		int searchCount = documentService.selectSearchCount(searchMap);
		
		//System.out.println(searchCount);
		
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, pageLimit, boardLimit);
		
		ArrayList <Board> bList = documentService.selectSearchList(searchMap, pi);
		
		model.addAttribute("bList", bList);
		model.addAttribute("pi", pi);
		model.addAttribute("keyword", keyword);
		model.addAttribute("deptCode", deptCode);
		
		return "board/board_document/board_DocumentList";
		
	}
	
	//게시글 상세페이지 이동 메소드(게시글 조회) 
	@RequestMapping("detail.dc")
	public ModelAndView selectDocument(int bno, ModelAndView mv) {
		
		//게시글 조회수 증가 
		int count = documentService.boardCount(bno);
		
		if(count>0) {
			Board b = documentService.selectDocument(bno);
			ArrayList <BoardAttachment> atList = documentService.selectBoardAttachmentList(bno);
			
			mv.addObject("b", b).addObject("atList", atList).setViewName("board/board_document/board_DocumentDetailView");
		}else {
			mv.addObject("errorMsg", "게시글 조회에 실패하였습니다. 다시 시도해주세요").setViewName("redirect:/member/list.dc");
		}
		return mv ;
	}
	
	//게시글 작성 페이지 이동 메소드
	@RequestMapping("enroll.dc")
	public String documentEnrollFrom() {
		
		return "board/board_document/board_DocumentEnrollForm";
	}

	//게시글 작성 메소드 
	@RequestMapping(value="/insert.dc", method= RequestMethod.POST)
	public ModelAndView insertDocument(Board b,  ArrayList<MultipartFile> upfile, ModelAndView mv, HttpSession session) {
		
		//첨부파일이 한개일수도 여러개일 수도 있기 때문에 첨부파일을 담아줄 list생성 
		ArrayList<BoardAttachment> atList = new ArrayList<>();
		
			for(MultipartFile file : upfile) {
				
				if(!file.getOriginalFilename().equals("")) {
					//BoardAttachment (bno, categoryCode, originName, changeName, filePath)
					
					//changeName
					String changeName = saveFile.getSaveFile(file, session);
					
					//업로드 할 경로 알아내기 
					String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/boardDocument/");
	
					//파일 업로드 하기 
					try {
						file.transferTo(new File(savePath+changeName));
						
					} catch (IllegalStateException e) {
						
						e.printStackTrace();
					} catch (IOException e) {
						
						e.printStackTrace();
					}
					
					//Attachment에refBno, categoryCode, originName, changeName, filePath 세팅하기 
					BoardAttachment at = BoardAttachment.builder()
														.refBno(b.getBoardNo())
														.categoryCode(b.getCategoryCode())
														.originName(file.getOriginalFilename())
														.changeName(changeName)
														.filePath("/resources/uploadFiles/boardDocument/"+changeName).build();
					//atList에 at 담기
					atList.add(at);
					
					
				}
				
			}
		
		String userNo = String.valueOf(((Member)session.getAttribute("loginUser")).getUserNo());
		
		b.setBoardWriter(userNo); //로그인 가능 후 지우고 로그인 유저 번호로 바꾸기 
		
		int result = documentService.insertDocument(b,atList);
		
		if(result>0) { //게시글 작성 성공 
			session.setAttribute("alertMsg", "게시글 작성이 완료되었습니다.");
			mv.setViewName("redirect:/member/list.dc");
			
		}else { //게시글 작성 실패 
			
			//게시글 작성 실패시 업로드된 파일 삭제해주기 
			for(BoardAttachment atl : atList) {
				new File(session.getServletContext().getRealPath(atl.getFilePath())).delete();
			}
			
			session.setAttribute("errorMsg", "게시글 작성에 실패하였습니다.");
			mv.setViewName("redirect:/member/list.dc");
			
		}
		
		return mv;
	}
	
	//수정페이지 이동 메소드 
	@RequestMapping(value="update.dc", method= RequestMethod.GET)
	public ModelAndView documentUpdateForm(int bno, ModelAndView mv, HttpSession session) {
		//글번호 가지고 가서 게시글+첨부파일 조회 해오기
		Board b = documentService.selectDocument(bno);
		
		ArrayList <BoardAttachment> atList = documentService.selectBoardAttachmentList(bno);
		
		if(b != null && !atList.isEmpty()) {
			mv.addObject("b", b).addObject("atList", atList).setViewName("board/board_document/board_DocumentUpdateForm");
		}else {
			session.setAttribute("errorMsg", "수정페이지로 이동이 실패하였습니다.");
			mv.setViewName("redirect:/member/detail.dc?bno="+bno);
		} 
		
		return mv;
	}
	
	
	//게시글 수정 메소드 
	@RequestMapping(value="update.dc", method= RequestMethod.POST)
	public ModelAndView updateDocument(Board b, ArrayList<MultipartFile> upfile,
									   ModelAndView mv, HttpSession session) {
		
		int result1 = 0;
		
		ArrayList <BoardAttachment> atList = new ArrayList<>();
			
			for(MultipartFile file : upfile) {
				//새로운 첨부파일이 있을 경우
				if(!file.getOriginalFilename().equals("")) {
					//글번호를 가지고가서 기존 첨부파일 목록 가져오기 
					ArrayList<BoardAttachment> defaultAttch = documentService.selectBoardAttachmentList(b.getBoardNo());
					//조회해온 첨부파일 목록이 비어있지 않다면 기존 파일 목록 삭제하기 
					if (!defaultAttch.isEmpty()) {
						for(BoardAttachment defaultFile : defaultAttch) {
							
							new File(session.getServletContext().getRealPath(defaultFile.getFilePath())).delete();
						}					
						//기존 첨부파일 DB에서도 삭제(상태값 변경 -> N)
						result1 = documentService.deleteAttachment(b.getBoardNo());
					}
				}
				//changeName만들기 
				String changeName = saveFile.getSaveFile(file, session);
				
				//파일 업로드시킬 경로 구하기 
				String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/boardDocument/");
				
				//파일 업로드 하기 
				try {
					file.transferTo(new File(savePath+changeName));
					
				} catch (IllegalStateException e) {
					
					e.printStackTrace();
				} catch (IOException e) {
					
					e.printStackTrace();
				}
				
				//Attachment에refBno, categoryCode, originName, changeName, filePath 세팅하기 
				BoardAttachment at = BoardAttachment.builder()
													.refBno(b.getBoardNo())
													.categoryCode(b.getCategoryCode())
													.originName(file.getOriginalFilename())
													.changeName(changeName)
													.filePath("/resources/uploadFiles/boardDocument/"+changeName).build();
				//atList에 at 담기
				atList.add(at);
				
		}
		
		//System.out.println(atList); // 확인용 
		
		//게시글과 첨부파일 수정 
		int result2 = documentService.updateDocument(b, atList);
		
		if(result1*result2>0) {
			session.setAttribute("alertMsg","게시글 수정 완료");
			mv.setViewName("redirect:/member/detail.dc?bno="+b.getBoardNo());
		}else {
			mv.addObject("errorMsg","게시글 수정 실패").setViewName("redirect:/member/list.dc");
		}
		
		return mv;
	}
	
	//게시글 삭제 
	@ResponseBody
	@RequestMapping(value="delete.dc")
	public String deleteDocument(int bno, HttpSession session) {
		
		String message="";
		
		//게시글번호로 보드,첨부파일 삭제 - 업로드파일,DB
		int result = documentService.deleteDocument(bno);
		
		if(result>0) {
			
			//첨부파일, 게시글 삭제 됐으면 업로드된 첨부파일 조회해와서 삭제하기 
			ArrayList<BoardAttachment> deleteAtt = documentService.selectDeleteAttachList(bno);
			
			if(!deleteAtt.isEmpty()) {
				for (BoardAttachment file : deleteAtt) {
					new File(session.getServletContext().getRealPath(file.getFilePath())).delete();
				}
			}
			
			message="YYYY";
			
		}else {
			message="NNNN";
		}
		
		return message;
	}
	
	//게시글 선택 삭제 
	@ResponseBody
	@RequestMapping(value="selectDelete.dc")
	public String selectDelete(int[] bnoArr, HttpSession session) {
		
		//글번호 들고가서 첨부파일, 게시글 삭제하기 
		int result = documentService.selectDelete(bnoArr);
		
		String message="";
		
		if(result>0) {
			for (int bno : bnoArr) {
				ArrayList<BoardAttachment> deleteAtt = documentService.selectDeleteAttachList(bno);
				
				if(!deleteAtt.isEmpty()) {
					for (BoardAttachment file : deleteAtt) {
						new File(session.getServletContext().getRealPath(file.getFilePath())).delete();
					}
				}
			}
			
			message="YYYY";
		}else {
			message="NNNN";
		}
		
		return message;
	}
	
	@ResponseBody
	@RequestMapping(value="fileDown.dc", produces ="application/json; charset=UTF-8")
	public String fileDown(int bno) {
		
		ArrayList<BoardAttachment> atList = documentService.selectBoardAttachmentList(bno);
		
		return new Gson().toJson(atList);
		
	}
	
	
}
