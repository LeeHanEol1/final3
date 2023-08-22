package com.kh.final3.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.final3.board.model.service.NoticeService;
import com.kh.final3.board.model.vo.Board;
import com.kh.final3.board.model.vo.BoardAttachment;
import com.kh.final3.board.model.vo.Reply;
import com.kh.final3.common.template.Pagination;
import com.kh.final3.common.template.SaveFile;
import com.kh.final3.common.vo.PageInfo;

@Controller
@RequestMapping(value = {"/member", "/admin"})
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	public SaveFile saveFile;
	
	@Autowired
	public BoardAttachment at; 
	
	// 게시판 메인으로 이동, 검색기능
	@RequestMapping("list.no")
	public String selectList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, String status, String keyword, Model model) {
		
		// 게시글 목록 조회
		HashMap<String, String> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("status", status);
		
		int listCount = noticeService.selectListCount(map);
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		
		ArrayList<Board> list = noticeService.selectList(pi, map);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("keyword", keyword);
		model.addAttribute("status", status);
		
		return "board/notice/noticeListView";
	}
	// 즐겨찾기 한 게시물 조회
	@RequestMapping("bookmarkList.no")
	public String bookmarkList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, int userNo, Model model) {
		// hidden으로 userNo 가져오기 또는 세션에서 꺼내기
		
		// 게시글 목록 조회
		int listCount = noticeService.selectBookmarkCount(userNo);
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
				
		ArrayList<Board> list = noticeService.selectBookmarkList(pi, userNo);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "board/notice/noticeListView";
	}
	
	
	// 디테일뷰
	@RequestMapping("detail.no")
	public ModelAndView selectBoard(int boardNo, ModelAndView mv) {
	
		// 조회수증가
		int result = noticeService.increaseCount(boardNo);
		
		if(result > 0) {
			Board b = noticeService.selectNotice(boardNo);
			BoardAttachment at = noticeService.selectAttachment(boardNo);
			
			mv.addObject("at", at);
			mv.addObject("b", b).setViewName("board/notice/noticeDetailView");
		}else {
			mv.addObject("errorMsg", "조회실패").setViewName("board/notice/noticeDetailView");
		}
		return mv;
	}
	
	// 글작성페이지 이동
	@RequestMapping("enroll.no")
	public String enrollForm() {
		return "board/notice/noticeEnrollForm";
	}
	
	// 글작성 insert
	@RequestMapping("insert.no")
	public ModelAndView insertBoard(ModelAndView mv, Board b, BoardAttachment at, MultipartFile upfile, HttpSession session) throws IllegalStateException, IOException {
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/boardDocument/");
		
		if(!upfile.getOriginalFilename().equals("")) { // 첨부파일이 있는 경우
			
			String changeName = saveFile.getSaveFile(upfile, session);
			
			at.setCategoryCode(b.getCategoryCode());
			at.setOriginName(upfile.getOriginalFilename());
			at.setChangeName(changeName);
			at.setFilePath("/resources/uploadFiles/boardDocument/" + changeName);
			
			upfile.transferTo(new File(savePath + at.getChangeName()));
			
		}else { // 첨부파일이 없는 경우
			at = null;
		}
		
		int result = noticeService.insertNotice(at, b);
		
		if(result > 0) {
			mv.addObject("alertMsg","게시글 작성 성공").setViewName("redirect:list.no");
		}else {
			new File(savePath + at.getChangeName()).delete();
			mv.addObject("errorMsg","게시글 작성 실패").setViewName("redirect:list.no");
		}
		
		return mv;
	}

	// 댓글 불러오기
	@ResponseBody
	@RequestMapping(value = "replyList.no", produces = "application/json; charset=UTF-8")
	public String selectReplyList(int boardNo) {
		ArrayList<Reply> list = noticeService.selectReplyList(boardNo);
		return new Gson().toJson(list);
	}

	// 댓글 작성하기
	@ResponseBody
	@RequestMapping("insertReply.no")
	public String insertReply(Reply reply) {

		int result = noticeService.insertReply(reply);

		return (result > 0) ? "success" : "fail";
	}
	
	// 댓글 수정하기
	@ResponseBody
	@RequestMapping("updateReply.no")
	public String updateReply(Reply reply) {

		int result = noticeService.updateReply(reply);

		return (result > 0) ? "success" : "fail";
	}

	// 댓글 수정하기
	@ResponseBody
	@RequestMapping("deleteReply.no")
	public String deleteReply(int replyNo) {

		int result = noticeService.deleteReply(replyNo);

		return (result > 0) ? "success" : "fail";
	}

	// 게시글 수정페이지로 이동
	@RequestMapping("updateForm.no")
	public String updateForm(int boardNo, Model model) {
		
		Board b = noticeService.selectNotice(boardNo);
		BoardAttachment at = noticeService.selectAttachment(boardNo);
		
		model.addAttribute("b",b);
		model.addAttribute("at", at);
		
		return "board/notice/noticeUpdateView";
	}
	// 게시글 수정하기
	@PostMapping("update.no")
	public ModelAndView updateBoard(ModelAndView mv, MultipartFile upfile, BoardAttachment at, Board b, HttpSession session) throws IllegalStateException, IOException {
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/boardDocument/");
		
		// 새로 등록하는 사진이 있다면
		if(!upfile.getOriginalFilename().equals("")) {
			
			// 기존에 사진이 있었다면 : 삭제하고 등록
			if(at.getOriginName() != null) { // hidden으로 가져온 originName
				
				new File(session.getServletContext().getRealPath(at.getChangeName())).delete();
				
			}
			
			// 처리된 변경이름, 넘어온 실제이름 
			
			String changeName = saveFile.getSaveFile(upfile, session);
			at.setCategoryCode(b.getCategoryCode());
			at.setOriginName(upfile.getOriginalFilename());
			at.setChangeName(changeName);
			at.setFilePath("/resources/uploadFiles/boardDocument/" + changeName);
			at.setRefBno(b.getBoardNo());
			
			// 새로 넘어온 첨부파일을 서버에 업로드
			upfile.transferTo(new File(savePath + changeName));
			
		} else {
			at = null;
		}
		
		/*
		 * 1. 새로 첨부된 파일이 없고, 기존에 파일이 없을 때 : 게시판 내용만 수정
		 * 2. 새로 첨부된 파일이 없고, 기존에 파일이 있을 때 : 기존 파일 삭세하고, 게시판 내용 수정
		 * 3. 새로 첨부된 파일이 있고, 기존에 파일이 없을 때 : 새로 전달된 파일을 서버에 저장하고 데이터베이스에 등록 
		 * 4. 새로 첨부된 파일이 있고, 기존에 파일도 있을 때 : 기존 파일을 삭제하고 새로 첨부된 파일을 저장 및 등록
		 */

		// 게시판 내용 수정
		int result = noticeService.updateBoard(b, at);

		if (result > 0) {
			session.setAttribute("alertMsg", "수정성공");
			mv.setViewName("redirect:detail.no?boardNo="+b.getBoardNo());
		} else {
			new File(session.getServletContext().getRealPath(at.getFilePath())).delete();
			mv.addObject("errorMsg", "수정실패").setViewName("redirect:/");
		}
		return mv;
	}
	// 게시글 삭제
	@RequestMapping("delete.no")
	public ModelAndView deleteBoard(int boardNo, String filePath, ModelAndView mv, HttpSession session) {
				
		int result = noticeService.deleteBoard(boardNo, filePath);

		if (result > 0) {
			if (!filePath.equals("")) { // 넘어온 파일 정보가 있을 때
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}

			session.setAttribute("alertMsg", "게시글 삭제완료");
			mv.setViewName("redirect:list.no");
		} else {
			mv.addObject("errorMsg", "삭제실패").setViewName("redirect:list.no");
		}
		return mv;
	}
	
	// 즐겨찾기 여부 조회
	@ResponseBody
	@RequestMapping("bookmark.no")
	public String selectBookmark(int boardNo, int userNo) {
		
		HashMap<String, Integer> map = new HashMap<>();
		map.put("boardNo", boardNo);
		map.put("userNo", userNo);
		
		int count = noticeService.selectBookmark(map);
		
		String result = "";
		if(count > 0) {
			result = "Y";
		}else {
			result = "N";
		}
		return result;
	} 
	
	// 즐겨찾기 선택 및 해제
	@ResponseBody
	@RequestMapping("checkBookmark.no")
	public String checkBookmark(int boardNo, int userNo) {
		
		HashMap<String, Integer> map = new HashMap<>();
		map.put("boardNo", boardNo);
		map.put("userNo", userNo);
		
		int count = noticeService.selectBookmark(map);
		
		String result = "";
		
		if(count > 0) { // 기존 즐겨찾기에 있음 - 즐겨찾기에서 삭제("D"전송)
			int deleteResult = noticeService.deleteBookmark(map);
			if(deleteResult > 0) {
				result = "D";
			}else {
				result = "F";
			}
		}else { // 기존 즐겨찾기에 없음 - 즐겨찾기에 추가("I"전송)
			int insertResult = noticeService.insertBookmark(map);
			if(insertResult > 0) {
				result = "I";
			}else {
				result = "F";
			}
		}

		return result;

	}
	
	
}
