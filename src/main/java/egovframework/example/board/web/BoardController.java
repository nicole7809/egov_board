package egovframework.example.board.web;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.board.service.BoardService;
import egovframework.example.board.service.BoardVO;

@Controller
public class BoardController {
	
	/** EgovSampleService */
	@Resource(name = "boardService")
	private BoardService boardService;

	@RequestMapping(value = "/list.do")
	public String list(ModelMap model , @ModelAttribute("BoardVO") BoardVO vo ) throws Exception {
	
		 System.out.println("111111"); 
		 List<BoardVO> list= (List<BoardVO>) boardService.selectBoardList(vo);
		 System.out.println("22222");
		 model.addAttribute("listAll", list);
		
		
		return "board/list";
	}

	@RequestMapping(value = "/mgmt.do")
		public String writePro(BoardVO vo,HttpSession session)throws Exception {
			/*
			 * String id = (String) session.getAttribute("id"); dto.setId(id);
			 * boardService.insertBoard(vo);
			 */
			return "board/list";
		
	}

	@RequestMapping(value = "/view.do")
	public String view(ModelMap model) throws Exception {
		System.out.println("333333");
		return "board/view";
	}

	@RequestMapping(value = "/login.do")
	public String login(@RequestParam("id") String id, @RequestParam("password") String password, ModelMap model,
			HttpServletRequest request) throws Exception {
		// String aa = request.getParameter("id");
		System.out.println("id:" + id);
		System.out.println("password:" + password);
		
		BoardVO boardVO = new BoardVO();
		boardVO.setId(id);
		boardVO.setPassword(password);
		String name = boardService.selectLoginCheck(boardVO);
		
		if(name != null && !"".equals(name) ) {
			request.getSession().setAttribute("id", id);
			request.getSession().setAttribute("name", name);
			
		}else {
			request.getSession().setAttribute("id", "");
			request.getSession().setAttribute("name", "");
			model.addAttribute("msg", "사용자 존재하지않습니다");
		}
		
		return "redirect:/list.do";
	}

	@RequestMapping(value = "/logout.do")
	public String logout(ModelMap model, HttpServletRequest request) throws Exception {
		request.getSession().invalidate();
		
		return "redirect:/list.do";
	}
	

}
