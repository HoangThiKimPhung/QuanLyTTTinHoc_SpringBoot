<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Tin tức</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge,chrome=1">
    <!-- Boostrap-->
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <script src="static/js/jquery-3.2.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <!-- Glyphicons -->
    <link rel="stylesheet" href="static/css/font-awesome.min.css">
    <!-- W3 CSS -->
    <link rel="stylesheet" href="static/css/w3.css"/>
    <!-- My CSS -->
    <link rel="stylesheet" href="static/css/thongbao_tintuc.css" />
    <link rel="stylesheet" href="static/css/header-menu-fooder.css" />
    <!-- My JS -->
    <script src="static/js/tintuc.js"></script>
    <!-- TƯ VẤN -->
    <script src="static/js/tuvan.js"></script>
    <script src="static/ckeditor/ckeditor.js"></script>
    
</head>
<body>
	<%
		boolean flag = false;
		String maNV = (String)request.getSession().getAttribute("maNV");
		if(maNV != null){
			flag = true;
		}
	%>
	<!-- Logo and menu bar -->
    <header>
    	<div class="container">
		        <img src="static/Pic/logo-TTTH.png" alt="logo" class="logo w3-animate-zoom">
		    </div>
		<div class="menu">
		    <nav class="navbar navbar-default">
		        <div class="container">
		            <div class="navbar-header">
		                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar">
		                    <span class="icon-bar"></span>
		                    <span class="icon-bar"></span>
		                    <span class="icon-bar"></span>
		                </button>
		                <a class="navbar-brand" href="/index"><i class="fa fa-home"></i></a>
		            </div>
		            <div id="navbar" class="navbar-collapse collapse">
		                <ul class="nav navbar-nav navbar-left">
		                    <li><a href="/index">Trang chủ</a></li>
		                    <li><a href="/lichkhaigiang">Lịch khai giảng</a></li>
		                    <li  style="background-color: #56A1B0"><a href="tintuc">Tin tức</a></li>
		                    <li><a href="/thongbao">Thông báo</a></li>
		                    <li><a href="/lienhe">Liên hệ</a></li>
		                </ul>
		                <ul class="nav navbar-nav navbar-right">
		                    <li id="dang-ky-khoa-hoc">
		                        <a href="#">
		                            <i class="fa fa-address-card"></i>
		                            <span class="menu-right">Đăng ký khóa học</span>
		                        </a>
		                    </li>
		                    <li>
		                    	<%if(flag){%>		                    		
			                        <a href="/index">
			                            <i class="fa fa-user-circle-o"></i>
			                            <span class="menu-right" id="btnDangXuat">Đăng xuất</span>
			                        </a>
		                        <%}else{ %>
		                        	<a href="/login">
			                            <i class="fa fa-user-circle-o"></i>
			                            <span class="menu-right" id="btnDangNhap">Đăng nhập</span>
			                        </a>
		                        <%} %>
		                    </li>
		                </ul>
		            </div>
		        </div>
		    </nav>
		</div>
    </header>
    <div class="container duong-dan">
        <p><a href="index">Trang chủ</a> / <a href="tintuc">Tin tức</a></p>
    </div>
    <!-- TIN TỨC CHÍNH -->
    <div style="text-align: center;">
     	<h5 style="color: red; font-weight: bold;">
     		<% if(request.getSession().getAttribute("errorinput") != null){ %>
     			<%=request.getSession().getAttribute("errorinput")%>
     		<%} %>
     	</h5>
    </div>
    <section class="container" style="padding: 0;">
    	<div id="tintucChinh" style="display: none;">
    		<div class="col-xs-12 col-sm-12 col-md-12">
            <div class="col-md-12 line"></div>
	            <div class="col-xs-12 col-sm-12 col-md-5">
	                <video id="divVideoTinTuc" width="100%" controls style="display: none;">
	                    <source id="videoTTChinh" type="video/mp4" >
	                </video>
	                <img src="" id="imageTTChinh" alt="Tin tức" width="100%" style="display: none;height:450px;">
	            </div>
	            <div class="col-xs-12 col-sm-12 col-md-7 thong-bao-tin-tuc">
	            	<input type="hidden" name="maTinTuc" id="maTTchinh" class="form-control">
	            	<h3>
		            	<div id="tieuDeTTChinh" class="tieude" style="font-weight: bold;cursor: pointer;"></div>
		            	<p id="chinhsuatieudechinh" style="font-weight: bold;display: none;">Tiêu đề tin tức:</p>
		            	<textarea id="textchinhsuatieudechinh" class="form-control" style="display:none;" rows="2" cols="50" name="editortieudechinh"></textarea>
		            	<image id="iconnew" src="static/Pic/icon-new.gif" style="width: 50px"></image>		            	
		            </h3>
		            <%if(flag){%><a id="edittieudechinh" style="float:right;color:#bfa145;cursor:pointer;">Chỉnh sửa tiêu đề</a><%} %>
		            <a id="submittieudechinh" style="margin-top:5px;float:right;color:#bfa145;display:none;cursor:pointer;">Xác nhận</a><br/><br/>
		            <i id="clockchinh" class="fa fa-clock-o"> <span id="ngayDangTTChinh"></span></i>
		            <p id="chinhsuatintucchinh" style="font-weight: bold; font-size: 25px;display: none;">Nội dung tin tức:</p>
		            <div id="noiDungTomTatTTChinh" class="noi-dung-tom-tat-chinh" style="margin-top:10px;"></div>
		            <textarea id="textchinhsuatintucchinh" class="form-control" style="display:none;" rows="7" cols="75" name="editortintucchinh"></textarea>
		            
		            <%if(flag){%><a id="edittintucchinh" style="float:right;color:#bfa145;cursor:pointer;">Chỉnh sửa nội dung</a><%} %>
		            <a id="submittintucchinh" style="margin-top:5px;float:right;color:#bfa145;display:none;cursor:pointer;">Xác nhận</a>
	            </div>
	        </div>
    	</div>
    </section>
    <!-- TIN TỨC PHỤ-->
    <section class="container" style="padding: 0;">
    	<!-- TT Phụ 1 -->
		<div id="TTPhu1" style="display: none">
			<div class="col-xs-12 col-sm-12 col-md-12">
		        <div class="col-md-12 line"></div>
		        <div class="col-xs-5 col-sm-5 col-md-4">
		        	<video id="divVideoTinTucPhu1" width="100%" controls style="display: none;">
	                    <source id="videoTTPhu1" type="video/mp4" >
	                </video>
	                <img src="" id="imageTTPhu1" alt="Tin tức" width="100%" style="display: none;">
		        </div>
		        <div class="col-xs-7 col-sm-7 col-md-8 thong-bao-tin-tuc">
		            	<input type="hidden" name="maTinTuc" id="maTTphu1" class="form-control">		            
			            <h3>
			            	<div id="tieuDeTTPhu1" class="tieude" style="cursor: pointer;"></div>
			            	<p id="chinhsuatieudephu1" style="font-weight: bold; font-size: 25px;display: none;">Tiêu đề tin tức:</p>
			            	<textarea id="textchinhsuatieudephu1" class="form-control" name="editortieudephu1" style="display:none;" rows="1" cols="72"></textarea>			            	
			            </h3>
			            <%if(flag){%><a id="edittieudephu1" style="float:right;color:#bfa145;cursor:pointer;">Chỉnh sửa tiêu đề</a><%} %>
			            <a id="submittieudephu1" style="margin-top:5px;float:right;color:#bfa145;display:none;cursor:pointer;">Xác nhận</a><br/><br/>
			            <i id="clockphu1" class="fa fa-clock-o">  <span id="ngayDangTTPhu1"></span></i>
			            <p id="chinhsuatintucphu1" style="font-weight: bold; font-size: 25px;display: none;">Nội dung tin tức:</p>
			            <div id="noiDungTomTatTTPhu1" class="noi-dung-tom-tat" style="margin-top:10px;"></div>
			            <textarea id="textchinhsuatintucphu1" class="form-control" style="display:none;" rows="2" cols="110" name="editortintucphu1"></textarea>
			            <%if(flag){%><a id="edittintucphu1" style="float:right;color:#bfa145;cursor:pointer;">Chỉnh sửa nội dung</a><%} %>  
			            <a id="submittintucphu1" style="margin-top:5px;float:right;color:#bfa145;display:none;cursor:pointer;">Xác nhận</a> 
		         
		        </div>
		    </div>
		</div>
		
        <!-- TT Phụ 2 -->
	    <div id="TTPhu2" style="display: none">
	    	<div class="col-xs-12 col-sm-12 col-md-12">
		        <div class="col-md-12 line"></div>
		        <div class="col-xs-5 col-sm-5 col-md-4">
		        	<video id="divVideoTinTucPhu2" width="100%" controls style="display: none;">
	                    <source id="videoTTPhu2" type="video/mp4" >
	                </video>
		            <img src="" id="imageTTPhu2" alt="Tin tức" width="100%">
		        </div>
		        <div class="col-xs-7 col-sm-7 col-md-8 thong-bao-tin-tuc">
		        	<input type="hidden" name="maTinTuc" id="maTTphu2" class="form-control">	
		            <h3>
		            	<div id="tieuDeTTPhu2" class="tieude" style="cursor: pointer;"></div>
		            	<p id="chinhsuatieudephu2" style="font-weight: bold; font-size: 25px;display: none;">Tiêu đề tin tức:</p>
		            	<textarea id="textchinhsuatieudephu2" class="form-control" style="display:none;" rows="1" cols="72" name="editortieudephu2"></textarea>
		            </h3>		            
		            <%if(flag){%><a id="edittieudephu2" style="float:right;color:#bfa145;cursor:pointer;">Chỉnh sửa tiêu đề</a><%} %>
		            <a id="submittieudephu2" style="margin-top:5px;float:right;color:#bfa145;display:none;cursor:pointer;">Xác nhận</a><br/><br/>
		            <i id="clockphu2" class="fa fa-clock-o"> <span id="ngayDangTTPhu2"></span></i>
		            <p id="chinhsuatintucphu2" style="font-weight: bold; font-size: 25px;display: none;">Nội dung tin tức:</p>
		            <div id="noiDungTomTatTTPhu2" class="noi-dung-tom-tat" style="margin-top:10px;"></div>		            
		            <textarea id="textchinhsuatintucphu2" class="form-control" style="display:none;" rows="2" cols="110" name="editortintucphu2"></textarea>
		            <%if(flag){%><a id="edittintucphu2" style="float:right;color:#bfa145;cursor: pointer;">Chỉnh sửa nội dung</a><%} %>
		            <a id="submittintucphu2" style="margin-top:5px;float:right;color:#bfa145;display:none;cursor:pointer;">Xác nhận</a>  
		        </div>
		    </div>
	    </div>
	    
	    <!-- TT Phụ 3 -->
	    <div id="TTPhu3" style="display: none">
	    	<div class="col-xs-12 col-sm-12 col-md-12">
		        <div class="col-md-12 line"></div>
		        <div class="col-xs-5 col-sm-5 col-md-4">
		        	<video id="divVideoTinTucPhu3" width="100%" controls style="display: none;">
	                    <source id="videoTTPhu3" type="video/mp4" >
	                </video>
		            <img src="" id="imageTTPhu3" alt="Tin tức" width="100%">
		        </div>
		        <div class="col-xs-7 col-sm-7 col-md-8 thong-bao-tin-tuc">
		        	<input type="hidden" name="maTinTuc" id="maTTphu3" class="form-control">	
		            <h3>
		            	<div id="tieuDeTTPhu3" class="tieude" style="cursor: pointer;"></div>
		            	<p id="chinhsuatieudephu3" style="font-weight: bold; font-size: 25px;display: none;">Tiêu đề tin tức:</p>
		            	<textarea id="textchinhsuatieudephu3" class="form-control" style="display:none;" rows="1" cols="72" name="editortieudephu3"></textarea>
		            </h3>
		            <%if(flag){%><a id="edittieudephu3" style="float:right;color:#bfa145;cursor:pointer;">Chỉnh sửa tiêu đề</a><%} %>
		            <a id="submittieudephu3" style="margin-top:5px;float:right;color:#bfa145;display:none;cursor:pointer;">Xác nhận</a><br/><br/>
		            <i id="clockphu3" class="fa fa-clock-o"> <span id="ngayDangTTPhu3"></span></i>
		            <p id="chinhsuatintucphu3" style="font-weight: bold; font-size: 25px;display: none;">Nội dung tin tức:</p>
		            <div id="noiDungTomTatTTPhu3" class="noi-dung-tom-tat" style="margin-top:10px;"></div>
		            <textarea id="textchinhsuatintucphu3" class="form-control" style="display:none;" rows="2" cols="110" name="editortintucphu3"></textarea>
		            <%if(flag){%><a id="edittintucphu3" style="float:right;color:#bfa145;cursor: pointer;">Chỉnh sửa nội dung</a><%} %>
		            <a id="submittintucphu3" style="margin-top:5px;float:right;color:#bfa145;display:none;cursor:pointer;">Xác nhận</a>           
		        </div>
		    </div>
	    </div>
	    <div class="col-md-12 line"></div>
	    
	    <div style="text-align: center;" >
	    	<ul class="pagination pagination-sm" id="paginationTinTuc">
			</ul>
	    </div>
    </section>

    <!-- ĐĂNG KÝ -->
    <section>
        <div>
            <a href="dangkykhoahoc"><img src="static/Pic/dangky-right.png" alt="Lịch thi" class="imgDKKH-right"></a>
        </div>
        <div>
            <a href="dangkykhoahoc"><img src="static/Pic/dangky-bottom.png" alt="Lịch thi" class="imgDKKH-bottom"></a>
        </div>
    </section>

    
    <br><br>
    <!-- Footer: Thông tin, địa chỉ -->
   <footer>
   		<div class="container">
		    <div class="col-xs-12 col-sm-12 col-md-6">
		        <p class="footer-name-trungtam">TRUNG TÂM TIN HỌC ANGEL</p>
		        <p><i class="fa fa-map-marker"></i> Địa chỉ: 01 Kha Vạn Cân, Phường Linh Đông, Quận Thủ Đức, Tp.HCM<br>
		            <i class="fa fa-phone"></i> Điện thoại: 01668174561 - 0964736522<br>
		            <i class="fa fa-envelope"></i> Email: hoangkimphung070994@gmail.com<br>
		            <i class="fa fa-calendar-times-o"></i> Giờ làm việc: 
		            								<br> Từ thứ 2 đến thứ 6: 07g30 đến 15g
		            								<br> TThứ 7 và Chủ nhật: 07g30 đến 11g30 </p>
		    </div>
		    <div class="col-xs-12 col-sm-12 col-md-6">
		        <a href="https://www.google.com/maps/place/Ng%C3%A3+b%E1%BA%A3y,+H%E1%BB%93+Ch%C3%AD+Minh,+Vi%E1%BB%87t+Nam/@10.7675662,106.6720446,17z/data=!3m1!4b1!4m5!3m4!1s0x31752ee0695b94c5:0xf563b73049b3d3c7!8m2!3d10.7675609!4d106.6742333?hl=vi"
		            target="_blank">
		            <img src="static/Pic/maps.png" alt="google map" style="width:100%"></a>
		    </div>
		</div>
   </footer>
    
</body>
</html>