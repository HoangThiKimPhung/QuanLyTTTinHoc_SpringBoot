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
    <script src="static/js/login.js"></script>
    <script src="static/js/include-html.js"></script>
    <!-- <script src="./JS/tintuc.js"></script> -->
    <!-- TƯ VẤN -->
    <script src="static/js/tuvan.js"></script>
</head>
<body>
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
		                    <li><a href="#">Lịch khai giảng</a></li>
		                    <li  style="background-color: #56A1B0"><a href="tintuc">Tin tức</a></li>
		                    <li><a href="#">Thông báo</a></li>
		                    <li><a href="#">Liên hệ</a></li>
		                </ul>
		                <ul class="nav navbar-nav navbar-right">
		                    <li id="dang-ky-khoa-hoc">
		                        <a href="#">
		                            <i class="fa fa-address-card"></i>
		                            <span class="menu-right">Đăng ký khóa học</span>
		                        </a>
		                    </li>
		                    <li>
		                        <a href="#">
		                            <i class="fa fa-user-circle-o"></i>
		                            <span class="menu-right">Đăng nhập</span>
		                        </a>
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
    <section class="container" style="padding: 0;">
    	<div id="tintucChinh" style="display: none;">
    		<div class="col-xs-12 col-sm-12 col-md-12">
            <div class="col-md-12 line"></div>
	            <div class="col-xs-12 col-sm-12 col-md-7">
	                <video id="divVideoTinTuc" width="100%" controls style="display: none;">
	                    <source id="videoTTChinh" type="video/mp4" >
	                </video>
	                <img id="imageTTChinh" alt="Tin tức" width="100%" style="display: none;">
	            </div>
	            <div class="col-xs-12 col-sm-12 col-md-5 thong-bao-tin-tuc">
	            	<h3>
		            	<a id="tieuDeTTChinh" style="font-weight: bold;"></a>
		            	<image src="static/Pic/icon-new.gif" style="width: 50px"></image>
		            </h3>
		            <i class="fa fa-clock-o"></i>
		            <span id="ngayDangTTChinh"></span>
		            <p id="noiDungTomTatTTChinh" class="noi-dung-tom-tat-chinh"></p>
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
		        <div class="col-xs-5 col-sm-5 col-md-3">
		        	<video id="divVideoTinTucPhu1" width="100%" controls style="display: none;">
	                    <source id="videoTTPhu1" type="video/mp4" >
	                </video>
	                <img id="imageTTPhu1" alt="Tin tức" width="100%" style="display: none;">
		        </div>
		        <div class="col-xs-7 col-sm-7 col-md-9 thong-bao-tin-tuc">
		            <h3>
		            	<a id="tieuDeTTPhu1"></a>
		            </h3>
		            <i class="fa fa-clock-o"></i>
		            <span id="ngayDangTTPhu1"></span>
		            <p id="noiDungTomTatTTPhu1" class="noi-dung-tom-tat"></p>            
		        </div>
		    </div>
		</div>
		
        <!-- TT Phụ 2 -->
	    <div id="TTPhu2" style="display: none">
	    	<div class="col-xs-12 col-sm-12 col-md-12">
		        <div class="col-md-12 line"></div>
		        <div class="col-xs-5 col-sm-5 col-md-3">
		        	<video id="divVideoTinTucPhu2" width="100%" controls style="display: none;">
	                    <source id="videoTTPhu2" type="video/mp4" >
	                </video>
		            <img id="imageTTPhu2" alt="Tin tức" width="100%">
		        </div>
		        <div class="col-xs-7 col-sm-7 col-md-9 thong-bao-tin-tuc">
		            <h3>
		            	<a id="tieuDeTTPhu2"></a>
		            </h3>
		            <i class="fa fa-clock-o"></i>
		            <span id="ngayDangTTPhu2"></span>
		            <p id="noiDungTomTatTTPhu2" class="noi-dung-tom-tat"></p>            
		        </div>
		    </div>
	    </div>
	    
	    <!-- TT Phụ 3 -->
	    <div id="TTPhu3" style="display: none">
	    	<div class="col-xs-12 col-sm-12 col-md-12">
		        <div class="col-md-12 line"></div>
		        <div class="col-xs-5 col-sm-5 col-md-3">
		        	<video id="divVideoTinTucPhu3" width="100%" controls style="display: none;">
	                    <source id="videoTTPhu3" type="video/mp4" >
	                </video>
		            <img id="imageTTPhu3" alt="Tin tức" width="100%">
		        </div>
		        <div class="col-xs-7 col-sm-7 col-md-9 thong-bao-tin-tuc">
		            <h3>
		            	<a id="tieuDeTTPhu3"></a>
		            </h3>
		            <i class="fa fa-clock-o"></i>
		            <span id="ngayDangTTPhu3"></span>
		            <p id="noiDungTomTatTTPhu3" class="noi-dung-tom-tat"></p>            
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