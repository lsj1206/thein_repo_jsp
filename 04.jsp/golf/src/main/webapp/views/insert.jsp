<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List,
                 golf.vo.MemberVO,
                 golf.vo.TeacherVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골프연습장 수강신청</title>
<script src="${pageContext.request.contextPath}/js/insert.js"></script>
</head>
<body>
<%@ include file="../layout/header.jsp" %>

<section>
    <div class="title">골프연습장 수강신청</div>

    <%
        List<MemberVO> memberList = (List<MemberVO>) request.getAttribute("memberList");
        List<TeacherVO> teacherList = (List<TeacherVO>) request.getAttribute("teacherList");
    %>

    <form name="frm" method="post" action="${pageContext.request.contextPath}/golf" onsubmit="return checkForm();">
        <input type="hidden" name="action" value="insert">

        <input type="hidden" name="regist_month" id="regist_month_hidden" value="">
        <input type="hidden" id="member_grade" value="">
        <input type="hidden" id="class_price_hidden" value="">
        <input type="hidden" name="teacher_code" id="teacher_code_hidden" value="">
        <input type="hidden" name="class_area" id="class_area_hidden" value="">
        <input type="hidden" name="tuition" id="tuition_hidden" value="">

        <table class="form-table">
            <tr>
                <th>수강월</th>
                <td>
                    <div style="position: relative; display: inline-block; vertical-align: middle;">
                        <input type="text" id="regist_month_display" style="width: 340px;" placeholder="연도-월 선택">
                        <button type="button" class="btn-cal" onclick="showMonthCalendar();">📅</button>
                        <div id="calendar_popup"></div>
                    </div>
                </td>
            </tr>
            <tr>
                <th>회원명</th>
                <td>
                    <select id="c_no_select" name="c_no" onchange="changeMember();" style="width: 400px;">
                        <option value="">-- 회원 선택 --</option>
                        <% if (memberList != null) {
                            for (MemberVO m : memberList) { %>
                                <option value="<%= m.getcNo() %>" data-grade="<%= m.getGrade() %>">
                                    <%= m.getcName() %>
                                </option>
                        <% } } %>
                    </select>
                </td>
            </tr>
            <tr>
                <th>회원번호</th>
                <td>
                    <input type="text" id="c_no_display" readonly tabindex="-1" placeholder="회원을 선택하면 자동 입력됩니다.">
                </td>
            </tr>
            <tr>
                <th>강의명</th>
                <td>
                    <select id="class_name_select" onchange="changeClass();" style="width: 400px;">
                        <option value="">-- 강의 선택 --</option>
                        <% if (teacherList != null) {
                            for (TeacherVO t : teacherList) {
                                String area = "제" + (t.getTeacherCode() / 100) + "연습장";
                        %>
                                <option value="<%= t.getTeacherCode() %>"
                                        data-teacher="<%= t.getTeacherName() %>"
                                        data-price="<%= t.getClassPrice() %>"
                                        data-area="<%= area %>">
                                    <%= t.getClassName() %>
                                </option>
                        <% } } %>
                    </select>
                </td>
            </tr>
            <tr>
                <th>강사명</th>
                <td>
                    <input type="text" id="teacher_name_display" readonly tabindex="-1" placeholder="강의를 선택하면 자동 입력됩니다.">
                </td>
            </tr>
            <tr>
                <th>강의장소</th>
                <td>
                    <input type="text" id="class_area_display" readonly tabindex="-1" placeholder="강의를 선택하면 자동 입력됩니다.">
                </td>
            </tr>
            <tr>
                <th>수강료</th>
                <td>
                    <input type="text" id="tuition_display" readonly tabindex="-1" placeholder="강의를 선택하면 자동 입력됩니다.">
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center; border: none; padding-top: 20px;">
                    <input type="submit" value="수강신청" style="background-color: #2c3e50; color: white; cursor: pointer; width: 100px; height: 38px; border: none; font-weight: bold; border-radius: 3px;">
                    <input type="button" value="다시쓰기" onclick="resetForm();" style="background-color: #7f8c8d; color: white; cursor: pointer; width: 100px; height: 38px; border: none; font-weight: bold; border-radius: 3px; margin-left: 10px;">
                </td>
            </tr>
        </table>
    </form>
</section>

<%@ include file="../layout/footer.jsp" %>
</body>
</html>
