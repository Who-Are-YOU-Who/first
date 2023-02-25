<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>




     
<script>
    $(function(){
        $("#number_check").click(function(){
        var $numck=$(this).attr("data");
        var $gopages="https://www.ftc.go.kr/bizCommPop.do?wrkr_no="+$numck;

        window.open($gopages,"_blank");
        });
        $("#qnas").click(function(){
            location.href="http://wkeh0312.dothome.co.kr/portfolio/shop/qa.html"
        });

        $("#evet").click(function(){
            location.href="http://wkeh0312.dothome.co.kr/portfolio/shop/event.html"
        });
        
    });


</script>
<div style="position: absolute; left: 50%; transform: translateX(-50%); margin-top: 90%">
    <ul class="footer_top">
        <li class="open">
            <label>
                <span>CS CENTER</span>
                <span>070-1234-5678</span>
                <span>OPEN 10:00~CLOSE:18:00 SAT,SUN OFF</span>
            </label>
        </li>
        <li class="bank">
            <label>
                <span>BANK INFO</span>
                <span>신한은행 0000-00-00000</span>
                <span>예금주 : 정후추</span>
            </label>
        </li>
        <li class="about">
            <label>
                <span>ABOUT US</span>
                <span>AGREEMENT</span>
                <span style="font-weight: 800;">PRIVATE POLICY</span>
                <span>GUIDE</span>
            </label>
        </li>
        <li class="community">
            <div>
                <label>COMMUNITY</label>
                <span><img src=""><p>Notice</p></span>
                <span><img src=""><p>Review</p> </span>
                <span id="qnas"><img src=""><p>Q&A</p></span>
                <span id="evet"><img src=""><p>Event</p></span>
            </div>
        </li>
    </ul>

    <ol class="footer_bottom">
        <li class="company">
            <label>
                <span>상호명 : Rate Us</span>
                <span>주소 : 인천시 송도과학로 27번길 </span>
                <span>대표 : 정후추&nbsp;&nbsp;&nbsp;개인 정보 관리자 : 정후추 </span>
                <span id="number_check" data="4928700724" style="cursor:pointer;">사업자등록번호 : 123-45-67899 <b>[사업자정보확인]</b></span>
                <span>통신판매업 신고번호 : 제 2017 강남 00000호</span>
                <span>메일 : huchch@gmail.com</span>
                <span>Copyright ⓒ 2020 <b>http://wkeh0312.dothome.co.kr</b> All right Reserved</span>
            </label>
        </li>
    
    </ol>
</div>    