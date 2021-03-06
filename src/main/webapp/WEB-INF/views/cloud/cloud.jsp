<%@page import="com.mintest.board.vo.CloudVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%List<CloudVo> cloudList = (List)request.getAttribute("cloudList"); %>
<!DOCTYPE html>
<html lang="en">
<title>클라우드</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/script.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="/resources/css/main.css">
<body class="w3-light-grey w3-content" style="max-width:1600px">

<%@ include file="/WEB-INF/views/common/navi.jsp" %>

<!-- !PAGE CONTENT! -->
<div  style="margin-left:300px;background-color:#fff;">
	<form action="/clouds" id="fileUpload" method="post" enctype="multipart/form-data">
	    <input type="hidden" name="user_id" value="${user.user_id}"><br>
	    <input class="w3-button w3-white w3-padding-large" id="cloud_files" type="file" name="files" multiple>
	    <input class="w3-button w3-white w3-padding-large" type="button" value="등록" onClick="insertCloud()">
	</form>
</div>
<div class="w3-main" style="margin-left:300px;">

  <!-- Push down content on small screens --> 
  <div class="w3-hide-large" style="margin-top:83px"></div>
  
  <!-- Photo grid -->
  <div class="w3-row">
  <%for(int i=0; i<cloudList.size();i++){ %>
  	<%String path = "/resources/cloud/"+cloudList.get(i).getUser().getUser_id()+"/"+cloudList.get(i).getSave_file_name()+cloudList.get(i).getFile_ext(); %>
  	<%if(i%3==0){ %>
  		<div class="w3-third">
  	<%} %>
  	
  		<img src="<%=path %>" style="width:100%" onclick="onClick(this)" alt="<%=cloudList.get(i).getOri_file_name()%>">
  		
  	<%if((i%3==2)||i==(cloudList.size()-1)){ %>
  		</div>
  	<%} %>
  <%} %>
  </div>

  <!-- Pagination -->
  <div class="w3-center w3-padding-32">
    <div class="w3-bar">
      <a href="#" class="w3-bar-item w3-button w3-hover-black">«</a>
      <a href="#" class="w3-bar-item w3-black w3-button">1</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">2</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">3</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">4</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">»</a>
    </div>
  </div>
  
  <!-- Modal for full size images on click-->
  <div id="modal01" class="w3-modal w3-black" style="padding-top:0" onclick="this.style.display='none'">
    <span class="w3-button w3-black w3-xlarge w3-display-topright">×</span>
    <div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
      <img id="img01" class="w3-image">
      <p id="caption"></p>
    </div>
  </div>
  

  
  <div class="w3-black w3-center w3-padding-24">Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-opacity">w3.css</a></div>

<!-- End page content -->
</div>

<script>
// Script to open and close sidebar
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
}

// Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}

</script>


</body>
</html>
