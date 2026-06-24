package golf;

import golf.dao.GolfDAO;
import golf.vo.ClassVO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/golf")
public class GolfServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final GolfDAO dao = new GolfDAO();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		if (action == null) {
			action = "home";
		}

		String path = "/index.jsp";

		switch (action) {
			case "teacher":
				try {
					req.setAttribute("teacherList", dao.getTeacherList());
				} catch (Exception e) {
					req.setAttribute("errorMsg", e.getMessage());
				}
				path = "/views/teacher.jsp";
				break;
			case "insert":
				try {
					req.setAttribute("memberList", dao.getMemberList());
					req.setAttribute("teacherList", dao.getTeacherList());
				} catch (Exception e) {
					req.setAttribute("errorMsg", e.getMessage());
				}
				path = "/views/insert.jsp";
				break;
			case "member":
				try {
					req.setAttribute("memberList", dao.getMemberList());
				} catch (Exception e) {
					req.setAttribute("errorMsg", e.getMessage());
				}
				path = "/views/member.jsp";
				break;
			case "result":
				try {
					req.setAttribute("salesList", dao.getSalesList());
				} catch (Exception e) {
					req.setAttribute("errorMsg", e.getMessage());
				}
				path = "/views/result.jsp";
				break;
			case "home":
			default:
				path = "/index.jsp";
				break;
		}

		req.getRequestDispatcher(path).forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("insert".equals(action)) {
			try {
				ClassVO vo = new ClassVO();
				vo.setRegistMonth(req.getParameter("regist_month"));
				vo.setcNo(Integer.parseInt(req.getParameter("c_no")));
				vo.setClassArea(req.getParameter("class_area"));
				vo.setTuition(Integer.parseInt(req.getParameter("tuition")));
				vo.setTeacherCode(Integer.parseInt(req.getParameter("teacher_code")));

				dao.insertClass(vo);

				resp.setContentType("text/html; charset=UTF-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>");
				out.println("alert('수강신청이 정상적으로 완료되었습니다.');");
				out.println("location.href='" + req.getContextPath() + "/golf?action=member';");
				out.println("</script>");
				out.close();
				return;
			} catch (Exception e) {
				resp.setContentType("text/html; charset=UTF-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>");
				out.println("alert('수강신청 오류: " + e.getMessage().replace("'", "\\'") + "');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
				return;
			}
		}

		doGet(req, resp);
	}
}
