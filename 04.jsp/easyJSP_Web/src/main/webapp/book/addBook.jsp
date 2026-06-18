<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>도서 등록</title>
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container py-4">
		<%@ include file="menu.jsp"%>

		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">도서 등록</h1>
				<p class="col-md-8 fs-4">Book Addition</p>
			</div>
		</div>

		<div class="row align-items-md-stretch">
      <form class="form-horizontal" name="newBook" action="./processAddBook.jsp" method="post" enctype="multipart/form-data">
        <div class="mb-3 row">
          <label class="col-sm-2">도서코드</label>
          <div class="col-sm-3">
            <input type="text" name="bookId" class="form-control">
          </div>
        </div>
        <div class="mb-3 row">
          <label class="col-sm-2">도서명</label>
          <div class="col-sm-3">
            <input type="text" name="name" class="form-control">
          </div>
        </div>
        <div class="mb-3 row">
          <label class="col-sm-2">가격</label>
          <div class="col-sm-3">
            <input type="text" name="unitPrice" class="form-control">
          </div>
        </div>
        <div class="mb-3 row">
          <label class="col-sm-2">저자</label>
          <div class="col-sm-3">
            <input type="text" name="author" class="form-control">
          </div>
        </div>
        <div class="mb-3 row">
          <label class="col-sm-2">출판사</label>
          <div class="col-sm-3">
            <input type="text" name="publisher" class="form-control">
          </div>
        </div>
        <div class="mb-3 row">
          <label class="col-sm-2">출판일</label>
          <div class="col-sm-3">
            <input type="text" name="releaseDate" class="form-control">
          </div>
        </div>

        <div class="mb-3 row">
          <label class="col-sm-2">상세정보</label>
          <div class="col-sm-5">
            <textarea name="description" cols="50" rows="2" class="form-control" placeholder="100자 이상 적어주세요"></textarea>
          </div>
        </div>
        <div class="mb-3 row">
          <label class="col-sm-2">분류</label>
          <div class="col-sm-3">
            <input type="text" name="category" class="form-control">
          </div>
        </div>
        <div class="mb-3 row">
          <label class="col-sm-2">재고수</label>
          <div class="col-sm-3">
            <input type="text" name="unitsInStock" class="form-control">
          </div>
        </div>
        <div class="mb-3 row">
          <label class="col-sm-2">상태</label>
          <div class="col-sm-5">
            <input type="radio" name="condition" value="New"> 신규도서
            <input type="radio" name="condition" value="Old"> 중고도서
            <input type="radio" name="condition" value="EBook"> E-Book
          </div>
        </div>
        <div class="mb-3 row">
          <label class="col-sm-2">이미지</label>
          <div class="col-sm-5">
            <input class="form-control" type="file" name="BookImage">
          </div>
        </div>
        <div class="mb-3 row">
          <div class="col-sm-offset-2 col-sm-10">
            <input type="submit" class="btn btn-primary" value="등록">
          </div>
        </div>
      </form>
		</div>
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>
