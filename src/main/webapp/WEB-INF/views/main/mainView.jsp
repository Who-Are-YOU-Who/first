
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 

   <!-- 검색 -->
      <form class="d-flex" style="margin:auto; width: 1000px">
        <input class="form-control me-sm-2" type="search" placeholder="Search">
        <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
      </form>
<br>

	<!-- 선택지 -->
  <div id="searchSortButton" style="text-align: center;">
  <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
  <button type="button" class="btn btn-primary">LOCATION</button>
  <div class="btn-group" role="group">
    <button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1" style="">
      <a class="dropdown-item" href="#">Dropdown link</a>
      <a class="dropdown-item" href="#">Dropdown link</a>
    </div>
  </div>
</div> &emsp;
  <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
  <button type="button" class="btn btn-primary">MENU</button>
  <div class="btn-group" role="group">
    <button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1" style="">
      <a class="dropdown-item" href="#">Dropdown link</a>
      <a class="dropdown-item" href="#">Dropdown link</a>
    </div>
  </div>
</div>&emsp;
<div class="btn-group" role="group" aria-label="Button group with nested dropdown">
  <button type="button" class="btn btn-primary">THEME</button>
  <div class="btn-group" role="group">
    <button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1" style="">
      <a class="dropdown-item" href="#">Dropdown link</a>
      <a class="dropdown-item" href="#">Dropdown link</a>
    </div>
  </div>
</div>
</div>
<br>
<table style="margin-left: 16%;">
<tr>
<td>
<ol class="breadcrumb" >
  <li class="breadcrumb-item"><a href="#">ALL</a></li>
  <li class="breadcrumb-item"><a href="#">KOREAN</a></li>
  <li class="breadcrumb-item active">BBQ</li>
</ol>
</td>
<td style="padding-left:900px">
<div class="btn-group" role="group" aria-label="Button group with nested dropdown" style="float: right;">
  <button type="button" class="btn btn-outline-primary">최신순</button>
  <div class="btn-group" role="group">
    <button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1" style="">
      <a class="dropdown-item" href="#">평점순</a>
      <a class="dropdown-item" href="#">거리순</a>
    </div>
  </div>
</div></td>
</tr>
</table>


<br>
<!-- 카드 -->
<table style="border-left-width: 30px; margin: auto; ">
<tr>
<td style="padding-left:50px">
<div class="card border-primary mb-3" style="max-width: 20rem;">
  <div class="card-header">솥고집</div>
  <div class="card-body">
    <!--  <svg xmlns="http://www.w3.org/2000/svg" class="d-block user-select-none" width="100%" height="200" aria-label="Placeholder: Image cap" focusable="false" role="img" preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180" style="font-size:1.125rem;text-anchor:middle">
    <rect width="100%" height="100%" fill="#868e96"></rect>
	<image href="resources/image/huchuchu.jpg" />
  </svg> -->
  		<a>
  		<img src="resources/image/res1.jpg" style=" width: 200px; height: 200px; margin-left: 0px">
  		</a>
  <br>
    <p class="card-text">한식/고기</p>
    <p class="card-text">👍100/👎18</p>
  </div>
   <div class="card-footer text-muted">
    2 days ago
  </div>
</div></td>
<td style="padding-left:50px">
<div class="card border-primary mb-3" style="max-width: 20rem;">
  <div class="card-header">솥고집</div>
  <div class="card-body">
    <!--  <svg xmlns="http://www.w3.org/2000/svg" class="d-block user-select-none" width="100%" height="200" aria-label="Placeholder: Image cap" focusable="false" role="img" preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180" style="font-size:1.125rem;text-anchor:middle">
    <rect width="100%" height="100%" fill="#868e96"></rect>
	<image href="resources/image/huchuchu.jpg" />
  </svg> -->
  		<a>
  		<img src="resources/image/res1.jpg" style=" width: 200px; height: 200px; margin-left: 0px">
  		</a>
  <br>
    <p class="card-text">한식/고기</p>
    <p class="card-text">👍100/👎18</p>
  </div>
   <div class="card-footer text-muted">
    2 days ago
  </div>
</div></td>
<td style="padding-left:50px">
<div class="card border-primary mb-3" style="max-width: 20rem;">
  <div class="card-header">솥고집</div>
  <div class="card-body">
    <!--  <svg xmlns="http://www.w3.org/2000/svg" class="d-block user-select-none" width="100%" height="200" aria-label="Placeholder: Image cap" focusable="false" role="img" preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180" style="font-size:1.125rem;text-anchor:middle">
    <rect width="100%" height="100%" fill="#868e96"></rect>
	<image href="resources/image/huchuchu.jpg" />
  </svg> -->
  		<a>
  		<img src="resources/image/res1.jpg" style=" width: 200px; height: 200px; margin-left: 0px">
  		</a>
  <br>
    <p class="card-text">한식/고기</p>
    <p class="card-text">👍100/👎18</p>
  </div>
   <div class="card-footer text-muted">
    2 days ago
  </div>
</div></td>
<td style="padding-left:50px">
<div class="card border-primary mb-3" style="max-width: 20rem;">
  <div class="card-header">솥고집</div>
  <div class="card-body">
    <!--  <svg xmlns="http://www.w3.org/2000/svg" class="d-block user-select-none" width="100%" height="200" aria-label="Placeholder: Image cap" focusable="false" role="img" preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180" style="font-size:1.125rem;text-anchor:middle">
    <rect width="100%" height="100%" fill="#868e96"></rect>
	<image href="resources/image/huchuchu.jpg" />
  </svg> -->
  		<a>
  		<img src="resources/image/res1.jpg" style=" width: 200px; height: 200px; margin-left: 0px">
  		</a>
  <br>
    <p class="card-text">한식/고기</p>
    <p class="card-text">👍100/👎18</p>
  </div>
   <div class="card-footer text-muted">
    2 days ago
  </div>
</div></td>
</tr>
</table>
