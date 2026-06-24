var calendarYear = new Date().getFullYear();

function showMonthCalendar() {
    var popup = document.getElementById("calendar_popup");
    if (popup.style.display === "block") {
        popup.style.display = "none";
        return;
    }
    renderCalendar();
    popup.style.display = "block";
}

function changeCalendarYear(offset) {
    var today = new Date();
    var baseYear = today.getFullYear();
    var targetYear = calendarYear + offset;

    if (targetYear >= baseYear - 1 && targetYear <= baseYear + 1) {
        calendarYear = targetYear;
        renderCalendar();
    }
}

function renderCalendar() {
    var today = new Date();
    var baseYear = today.getFullYear();
    var todayYear = today.getFullYear();
    var todayMonth = today.getMonth() + 1;

    var html = '<div style="background:#2c3e50; color:white; padding:8px; display:flex; justify-content:space-between; align-items:center; border-radius:3px 3px 0 0;">';

    if (calendarYear > baseYear - 1) {
        html += '<span onclick="changeCalendarYear(-1)" style="cursor:pointer; font-weight:bold; display:inline-block; width:30px; text-align:center; font-size:16px;">&lt;</span>';
    } else {
        html += '<span style="color:#7f8c8d; font-weight:bold; display:inline-block; width:30px; text-align:center; font-size:16px; cursor:not-allowed;">&lt;</span>';
    }

    html += '<span style="font-weight:bold; font-size:15px;">' + calendarYear + '</span>';

    if (calendarYear < baseYear + 1) {
        html += '<span onclick="changeCalendarYear(1)" style="cursor:pointer; font-weight:bold; display:inline-block; width:30px; text-align:center; font-size:16px;">&gt;</span>';
    } else {
        html += '<span style="color:#7f8c8d; font-weight:bold; display:inline-block; width:30px; text-align:center; font-size:16px; cursor:not-allowed;">&gt;</span>';
    }
    html += '</div>';

    html += '<div style="display:grid; grid-template-columns:repeat(4, 1fr); gap:8px; padding:12px; background:white;">';

    for (var m = 1; m <= 12; m++) {
        var monthStr = m + '월';
        var padMonth = m < 10 ? '0' + m : '' + m;
        var dateStr = calendarYear + '-' + padMonth;
        var dbStr = calendarYear + '' + padMonth;

        var isDisabled = false;

        if (calendarYear < todayYear || (calendarYear === todayYear && m < todayMonth)) {
            isDisabled = true;
        }
        if (calendarYear > todayYear + 1 || (calendarYear === todayYear + 1 && m > todayMonth)) {
            isDisabled = true;
        }

        if (isDisabled) {
            html += '<button type="button" disabled style="padding:10px 0; background:#f1f1f1; border:1px solid #ddd; color:#bdc3c7; border-radius:3px; font-size:13px; cursor:not-allowed;">' + monthStr + '</button>';
        } else {
            html += '<button type="button" onclick="selectMonth(\'' + dateStr + '\', \'' + dbStr + '\')" style="padding:10px 0; background:#f8f9fa; border:1px solid #dee2e6; color:#2c3e50; font-weight:bold; border-radius:3px; font-size:13px; cursor:pointer;" onmouseover="this.style.background=\'#3498db\'; this.style.color=\'white\'" onmouseout="this.style.background=\'#f8f9fa\'; this.style.color=\'#2c3e50\'">' + monthStr + '</button>';
        }
    }
    html += '</div>';

    var popup = document.getElementById("calendar_popup");
    popup.innerHTML = html;
}

function selectMonth(displayVal, dbVal) {
    document.getElementById("regist_month_display").value = displayVal;
    document.getElementById("regist_month_hidden").value = dbVal;
    document.getElementById("calendar_popup").style.display = "none";
}

document.addEventListener("DOMContentLoaded", function() {
    var today = new Date();
    var year = today.getFullYear();
    var month = today.getMonth() + 1;
    if (month < 10) month = "0" + month;
    document.getElementById("regist_month_display").value = year + "-" + month;
    document.getElementById("regist_month_hidden").value = year + "" + month;
});

window.onclick = function(event) {
    const popup = document.getElementById('calendar_popup');
    const calBtn = document.querySelector('.btn-cal');
    if (!document.body.contains(event.target)) {
        return;
    }
    if (event.target !== popup && event.target !== calBtn && !popup.contains(event.target)) {
        popup.style.display = 'none';
    }
}

function changeMember() {
    var select = document.getElementById("c_no_select");
    var option = select.options[select.selectedIndex];

    if (option.value === "") {
        document.getElementById("c_no_display").value = "";
        document.getElementById("member_grade").value = "";
    } else {
        document.getElementById("c_no_display").value = option.value;
        document.getElementById("member_grade").value = option.getAttribute("data-grade");
    }
    calculateTuition();
}

function changeClass() {
    var select = document.getElementById("class_name_select");
    var option = select.options[select.selectedIndex];

    if (option.value === "") {
        document.getElementById("teacher_code_hidden").value = "";
        document.getElementById("teacher_name_display").value = "";
        document.getElementById("class_area_display").value = "";
        document.getElementById("class_area_hidden").value = "";
        document.getElementById("class_price_hidden").value = "";
        document.getElementById("tuition_display").value = "";
        document.getElementById("tuition_hidden").value = "";
        return;
    }

    var teacherCode = option.value;
    var teacherName = option.getAttribute("data-teacher");
    var classPrice = parseInt(option.getAttribute("data-price"));
    var classArea = option.getAttribute("data-area");

    document.getElementById("teacher_code_hidden").value = teacherCode;
    document.getElementById("teacher_name_display").value = teacherName;
    document.getElementById("class_area_display").value = classArea;
    document.getElementById("class_area_hidden").value = classArea;
    document.getElementById("class_price_hidden").value = classPrice;

    calculateTuition();
}

function calculateTuition() {
    var priceHidden = document.getElementById("class_price_hidden").value;
    if (!priceHidden) return;

    var basePrice = parseInt(priceHidden);
    var grade = document.getElementById("member_grade").value;

    var finalPrice = basePrice;
    if (grade === "A" || grade === "a") {
        finalPrice = basePrice * 0.5;
    }

    document.getElementById("tuition_hidden").value = finalPrice;
    document.getElementById("tuition_display").value = finalPrice.toLocaleString() + "원";
}

function resetForm() {
    document.frm.reset();
    document.getElementById("c_no_display").value = "";
    document.getElementById("member_grade").value = "";
    document.getElementById("teacher_code_hidden").value = "";
    document.getElementById("teacher_name_display").value = "";
    document.getElementById("class_area_display").value = "";
    document.getElementById("class_area_hidden").value = "";
    document.getElementById("class_price_hidden").value = "";
    document.getElementById("tuition_display").value = "";
    document.getElementById("tuition_hidden").value = "";

    var today = new Date();
    var year = today.getFullYear();
    var month = today.getMonth() + 1;
    if (month < 10) month = "0" + month;
    document.getElementById("regist_month_display").value = year + "-" + month;
    document.getElementById("regist_month_hidden").value = year + "" + month;
}

function checkForm() {
    var displayVal = document.getElementById("regist_month_display").value.trim();
    var reg = /^\d{4}-\d{2}$/;
    if (!reg.test(displayVal)) {
        alert("수강월 형식이 올바르지 않습니다. (예: 2026-06)");
        document.getElementById("regist_month_display").focus();
        return false;
    }

    var dbVal = displayVal.replace("-", "");
    document.getElementById("regist_month_hidden").value = dbVal;

    if (!document.getElementById("c_no_select").value) {
        alert("회원명을 선택해 주십시오.");
        document.getElementById("c_no_select").focus();
        return false;
    }
    if (!document.getElementById("class_name_select").value) {
        alert("강의명을 선택해 주십시오.");
        document.getElementById("class_name_select").focus();
        return false;
    }
    return true;
}
