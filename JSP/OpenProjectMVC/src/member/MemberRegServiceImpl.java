package member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.Service;

public class MemberRegServiceImpl implements Service {

	@Override
	public String getViewPage(HttpServletRequest request, HttpServletResponse response) {
		
		return "/WEB-INF/views/member/regForm.jsp";
	}

}
