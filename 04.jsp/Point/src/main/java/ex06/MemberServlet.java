package ex06;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ex06/member")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final MemberDAO dao = new MemberDAO();

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		if (action == null) action = "list";

		try {
			switch (action) {
			case "list": {
				List<MemberVO> list = dao.getList();
				req.setAttribute("memberList", list);
				forward(req, resp, "/ex06/list.jsp");
				break;
				}
			case "detail": {
				int viewId = Integer.parseInt(req.getParameter("id"));
				MemberVO member = dao.get(viewId);
				req.setAttribute("member", member);
				forward(req, resp, "/ex06/view.jsp");
				break;
				}
			case "form": {
				forward(req, resp, "/ex06/form.jsp");
                break;
				}
			case "edit": {
				int editId = Integer.parseInt(req.getParameter("id"));
                MemberVO editMember = dao.get(editId);
                req.setAttribute("member", editMember);
                forward(req, resp, "/ex06/form.jsp");
                break;
				}
			case "delete": {
				int delId = Integer.parseInt(req.getParameter("id"));
				dao.delete(delId);
				resp.sendRedirect(req.getContextPath() + "/ex06/member");
				break;
				}
			default:
				resp.sendRedirect(req.getContextPath() + "/ex06/member");
			}
		}
		catch (Exception e) {
			req.setAttribute("errorMsg", e.getMessage());
            forward(req, resp, "/ex06/error.jsp");
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		try {
			MemberVO vo = new MemberVO();
			vo.setUserId(req.getParameter("userid"));
				vo.setPassword(req.getParameter("password"));
				vo.setUserName(req.getParameter("username"));
				vo.setEmail(req.getParameter("email"));

				if ("insert".equals(action)) {
					dao.insert(vo);
				}
				else if ("update".equals(action)) {
					vo.setId(Integer.parseInt(req.getParameter("id")));
					dao.update(vo);
				}

				resp.sendRedirect(req.getContextPath() + "/ex06/member");
			}
			catch (Exception e) {
				req.setAttribute("errorMsg", e.getMessage());
				forward(req, resp, "/ex06/error.jsp");
			}
	}

	private void forward(HttpServletRequest req, HttpServletResponse resp, String path)
		throws ServletException, IOException {
		req.getRequestDispatcher(path).forward(req, resp);
	}
}
