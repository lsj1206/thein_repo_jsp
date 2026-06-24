package golf.dao;

import golf.DBconnection;
import golf.vo.TeacherVO;
import golf.vo.MemberVO;
import golf.vo.SalesVO;
import golf.vo.ClassVO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class GolfDAO {

	public List<TeacherVO> getTeacherList() throws Exception {
		List<TeacherVO> list = new ArrayList<>();
		String sql = "SELECT teacher_code, teacher_name, class_name, class_price, teacher_regist_date FROM golf_teacher ORDER BY teacher_code ASC";

		try (Connection conn = DBconnection.getConnection();
			 PreparedStatement pstmt = conn.prepareStatement(sql);
			 ResultSet rs = pstmt.executeQuery()) {

			while (rs.next()) {
				TeacherVO vo = new TeacherVO();
				vo.setTeacherCode(rs.getInt("teacher_code"));
				vo.setTeacherName(rs.getString("teacher_name"));
				vo.setClassName(rs.getString("class_name"));
				vo.setClassPrice(rs.getInt("class_price"));
				vo.setTeacherRegistDate(rs.getDate("teacher_regist_date"));
				list.add(vo);
			}
		}
		return list;
	}

	public List<MemberVO> getMemberList() throws Exception {
		List<MemberVO> list = new ArrayList<>();
		String sql = "SELECT m.c_no, m.c_name, m.phone, m.address, m.grade, t.class_name, c.class_area, c.tuition, c.regist_month " +
		             "FROM golf_member m " +
		             "LEFT JOIN golf_class c ON m.c_no = c.c_no " +
		             "LEFT JOIN golf_teacher t ON c.teacher_code = t.teacher_code " +
		             "ORDER BY m.c_no ASC";

		try (Connection conn = DBconnection.getConnection();
			 PreparedStatement pstmt = conn.prepareStatement(sql);
			 ResultSet rs = pstmt.executeQuery()) {

			while (rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setcNo(rs.getInt("c_no"));
				vo.setcName(rs.getString("c_name"));
				vo.setPhone(rs.getString("phone"));
				vo.setAddress(rs.getString("address"));
				vo.setGrade(rs.getString("grade"));
				vo.setClassName(rs.getString("class_name"));
				vo.setClassArea(rs.getString("class_area"));
				vo.setTuition(rs.getInt("tuition"));
				vo.setRegistMonth(rs.getString("regist_month"));
				list.add(vo);
			}
		}
		return list;
	}

	public List<SalesVO> getSalesList() throws Exception {
		List<SalesVO> list = new ArrayList<>();
		String sql = "SELECT t.teacher_code, t.teacher_name, t.class_name, COALESCE(SUM(c.tuition), 0) AS total_sales " +
		             "FROM golf_teacher t " +
		             "LEFT JOIN golf_class c ON t.teacher_code = c.teacher_code " +
		             "GROUP BY t.teacher_code, t.teacher_name, t.class_name " +
		             "ORDER BY t.teacher_code ASC";

		try (Connection conn = DBconnection.getConnection();
			 PreparedStatement pstmt = conn.prepareStatement(sql);
			 ResultSet rs = pstmt.executeQuery()) {

			while (rs.next()) {
				SalesVO vo = new SalesVO();
				vo.setTeacherCode(rs.getInt("teacher_code"));
				vo.setTeacherName(rs.getString("teacher_name"));
				vo.setClassName(rs.getString("class_name"));
				vo.setTotalSales(rs.getInt("total_sales"));
				list.add(vo);
			}
		}
		return list;
	}

	public int insertClass(ClassVO vo) throws Exception {
		String sql = "INSERT INTO golf_class (regist_month, c_no, class_area, tuition, teacher_code) VALUES (?, ?, ?, ?, ?)";
		try (Connection conn = DBconnection.getConnection();
			 PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, vo.getRegistMonth());
			pstmt.setInt(2, vo.getcNo());
			pstmt.setString(3, vo.getClassArea());
			pstmt.setInt(4, vo.getTuition());
			pstmt.setInt(5, vo.getTeacherCode());
			return pstmt.executeUpdate();
		}
	}
}
