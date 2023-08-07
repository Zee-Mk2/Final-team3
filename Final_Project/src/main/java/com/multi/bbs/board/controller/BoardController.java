package com.multi.bbs.board.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.multi.bbs.account.model.vo.Member;
import com.multi.bbs.board.model.service.BoardService;
import com.multi.bbs.board.model.vo.Board;
import com.multi.bbs.board.model.vo.Comment;
import com.multi.bbs.common.util.CalcTime;
import com.multi.bbs.common.util.PageInfo;

import jakarta.servlet.http.HttpSession;

@Controller
public class BoardController {
	@Autowired
	BoardService service;
	
	final static private String savePath = "C:\\upfiles\\";
	CalcTime calcTime = new CalcTime();

	@GetMapping("/board")
	public String boardMainPage(Model model, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		
		return "/board/board-main";
	}
	
	@GetMapping("/board/free")
	public String freeBoardPage(Model model, HttpSession session, @RequestParam Map<String, String> param) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		param.put("boardCat", "free");
		int page = 1;
		if (param.get("page") != null) {
			page = Integer.parseInt(param.get("page"));
		}
		int boardCount = service.getBoardCount(param);
		PageInfo pageInfo = new PageInfo(page, 5, boardCount, 10);
		List<Board> boards = service.getBoardList(param, pageInfo);
		for (Board board : boards) {
			board.setTimeDiff(calcTime.getTimeDiff(board.getWriteTime()));
		}
		model.addAttribute("boards", boards);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("param", param);
		
		return "/board/freeBoard";
	}
	
	@GetMapping("/board/noti")
	public String notiBoardPage(Model model, HttpSession session, @RequestParam Map<String, String> param) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		param.put("boardCat", "noti");
		param.put("searchType", "title");
		int page = 1;
		if (param.get("page") != null) {
			page = Integer.parseInt(param.get("page"));
		}
		int boardCount = service.getBoardCount(param);
		PageInfo pageInfo = new PageInfo(page, 5, boardCount, 10);
		List<Board> boards = service.getBoardList(param, pageInfo);
		for (Board board : boards) {
			board.setTimeDiff(calcTime.getTimeDiff(board.getWriteTime()));
		}
		model.addAttribute("boards", boards);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("param", param);
		
		return "/board/notiBoard";
	}
	
	@GetMapping("/board/photo")
	public String photoBoardPage(Model model, HttpSession session, @RequestParam Map<String, String> param) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		param.put("boardCat", "photo");
		param.put("searchType", "title");
		int page = 1;
		if (param.get("page") != null) {
			page = Integer.parseInt(param.get("page"));
		}
		int boardCount = service.getBoardCount(param);
		PageInfo pageInfo = new PageInfo(page, 5, boardCount, 8);
		List<Board> boards = service.getBoardList(param, pageInfo);
		model.addAttribute("boards", boards);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("param", param);
		
		return "/board/photoBoard";
	}
	
	@GetMapping("/board/post")
	public String postBoardPage(Model model, HttpSession session, String boardCat) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		if (loginMember == null) {
			model.addAttribute("msg", "게시글을 작성하려면 로그인이 필요합니다.");
			model.addAttribute("location", "/sign-in");
			return "common/msg";
		}
		model.addAttribute("boardCat", boardCat);
		
		return "/board/board-write";
	}
	
	@GetMapping("/board/update")
	public String updateBoardPage(Model model, HttpSession session, @RequestParam Map<String, String> param) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		if (loginMember == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("location", "/sign-in");
			return "common/msg";
		}
		Board board = service.getBoardByBno(Integer.valueOf(param.get("bno")));
		model.addAttribute("board", board);
		model.addAttribute("boardCat", param.get("boardCat"));
		
		return "/board/board-update";
	}
	
	@PostMapping("/board/post")
	public String postBoard(Model model, HttpSession session, Board board, MultipartFile upfile, String isUpdate, String bno) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		String url = "/board/" + board.getBoardCat();
		if (loginMember == null) {
			model.addAttribute("msg", "게시글을 작성하려면 로그인이 필요합니다.");
			model.addAttribute("location", "/sign-in");
			return "common/msg";
		}
		if (board.getBoardCat().equals("photo") && upfile.isEmpty()) {
			model.addAttribute("msg", "포토게시판은 사진을 필수로 첨부해야 합니다.");
			model.addAttribute("location", "/board/post?boardCat=photo");
			return "common/msg";
		}
		
		// 파일 저장 로직
		if(upfile != null && upfile.isEmpty() == false) {
			String renameFileName = service.saveFile(upfile, savePath); 
			
			if(renameFileName != null) {
				board.setFileName(upfile.getOriginalFilename());
				board.setReFileName(renameFileName);
			}
		}
		
		board.setMno(loginMember.getMno());
		board.setName(loginMember.getName());
		int result = service.insertBoard(board, isUpdate, bno);
		if (result < 1) {
			model.addAttribute("msg", "게시글 작성에 실패했습니다.");
			model.addAttribute("location", url);
		} else {
			model.addAttribute("msg", "게시글이 작성되었습니다.");
			model.addAttribute("location", url);
		}

		return "common/msg";
	}
	
	@GetMapping("/board/detail")
	public String boardDetailPage(Model model, HttpSession session, int bno) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		Board board = service.getBoardByBno(bno);
		board.setTimeDiff(calcTime.getTimeDiff(board.getWriteTime()));
		model.addAttribute("board", board);
		String[] lines = board.getContent().split("\n");
		model.addAttribute("lines", lines);
		List<Comment> comments = service.getComment(board.getBno());
		for (Comment comment : comments) {
			comment.setTimeDiff(calcTime.getTimeDiff(comment.getWriteTime()));
		}
		model.addAttribute("comments", comments);
		
		return "board/board-detail";
	}
	
	@GetMapping("/board/delete")
	public String boardDelete(Model model, @RequestParam Map<String, String> param) {
		int result = service.deleteBoard(param);
		String url = "/board/" + param.get("boardCat");
		if (result < 1) {
			model.addAttribute("msg", "게시글 삭제에 실패했습니다.");
			model.addAttribute("location", url);
		} else {
			model.addAttribute("msg", "게시글이 삭제되었습니다.");
			model.addAttribute("location", url);
		}
		return "common/msg";
	}
	
	@GetMapping("/board/file/{fileName}")
	@ResponseBody
	public Resource downloadImage(@PathVariable("fileName") String fileName, Model model) throws IOException {
		return new UrlResource("file:" + savePath + fileName);
	}
	
	@PostMapping("/board/comment")
	public String postComment(Model model, HttpSession session, Comment comment) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		String url = "/board/detail?bno=" + comment.getBno();
		if (loginMember == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("location", url);
			return "common/msg";
		}
		comment.setMno(loginMember.getMno());
		comment.setName(loginMember.getName());
		int result = service.postComment(comment);
		if (result < 1) {
			model.addAttribute("msg", "댓글 작성에 실패했습니다.");
			model.addAttribute("location", url);
			return "common/msg";
		}
		return "redirect:" + url;
	}
	
	@GetMapping("/board/comment/delete")
	public String deleteComment(Model model, int cno, int bno) {
		String url = "/board/detail?bno=" + bno;
		int result = service.deleteComment(cno);
		if (result < 1) {
			model.addAttribute("msg", "댓글 삭제에 실패했습니다.");
			model.addAttribute("location", url);
			return "common/msg";
		}
		
		return "redirect:" + url;
	}
	
}
