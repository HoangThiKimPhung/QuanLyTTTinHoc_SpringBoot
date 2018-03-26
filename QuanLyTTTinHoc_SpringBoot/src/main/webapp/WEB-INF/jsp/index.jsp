<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Trang chủ</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge,chrome=1">
    <!-- Boostrap -->
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <script src="static/js/jquery-3.2.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <!-- Glyphicons -->
    <link rel="stylesheet" href="static/css/font-awesome.min.css">
    <!-- W3 CSS -->
    <link rel="stylesheet" href="static/css/w3.css" />
    <!-- My CSS -->    
    <link rel="stylesheet" href="static/css/header-menu-fooder.css" />
    <link rel="stylesheet" href="static/css/index.css"/>
    <!-- TƯ VẤN -->
    <script src="static/js/tuvan.js"></script>
    <script src="static/js/index.js"></script>
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
		                    <li style="background-color: #56A1B0"><a href="/index">Trang chủ</a></li>
		                    <li><a href="#">Lịch khai giảng</a></li>
		                    <li><a href="tintuc">Tin tức</a></li>
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
		                        <a href="login">
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
    <!-- Image Slide -->
    <section>
        <div class="container">
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="static/Pic/pic4.jpg" alt="Image1">
                    </div>
        
                    <div class="item">
                        <img src="static/Pic/pic3.jpg" alt="Image2">
                    </div>
                    
                    <div class="item">
                        <img src="static/Pic/pic2.jpg" alt="Image3">
                    </div>
                </div>
                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" data-slide="prev" role="button">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next" role="button">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </section>
    <!-- Thống kê -->
    <section>
        <div class="tieu-de-thong-ke" >
            <h3> Cảm ơn các bạn đã tin tưởng và đồng hành<br> cùng chúng tôi </h3>
        </div>
        <div class="group-thong-ke">
            <div class="container">
                <div class="box">
                   <div class="bieu-tuong div-square">
                       <i class="fa fa-calendar"></i>    
                       <p><span>></span> 10 </p>
                       <p class="small"> năm </p>                    
                   </div>   
                </div>
                <div class="box">
                    <div class="bieu-tuong div-square">
                        <i class="fa fa-user-circle"></i>    
                        <p><span>></span> 100 000 </p> 
                        <p> học viên </p>                  
                    </div>   
                </div>
                <div class="box">
                    <div class="bieu-tuong div-square">
                        <i class="fa fa-user-circle-o"></i>  
                        <p><span>></span> 100 </p> 
                        <p> giáo viên </p>                     
                    </div>   
                </div>
                <div class="box">
                     <div class="bieu-tuong div-square">
                         <i class="fa fa-address-book"></i>   
                         <p><span>></span> 100 </p>   
                         <p> CT đào tạo </p>                   
                     </div>   
                </div>
            </div>
        </div>
    </section>
    <!-- Lịch thi -->
    <section>
        <div class="container lich-thi">
            <img src="static/Pic/lichthi.png" alt="Lịch thi">
        </div>
    </section>
    <!-- Tiện ích: tin tức, thông báo, lịch thi, đăng ký trực tuyến -->
    <section>
        <div class="container">
            <div class="col-xs-12 col-md-4 col-sm-12 khung-tien-ich">
                <div class="tab-tin-tuc-thong-bao">
                    <ul class="nav nav-tabs header-tabs">
                        <li class="active"><a data-toggle="tab" href="#thongbao">THÔNG BÁO</a></li>
                        <li><a data-toggle="tab" href="#tintuc">TIN TỨC</a></li>
                    </ul>
                    <div class="tab-content">
                        <div id="thongbao" class="tab-pane fade in active">
                            <ul id="dsThongBaoNoiBat" class="noidung-tab">
                            </ul>
                            <a class="noidung-tab-all" href="#">See all</a>
                        </div>
                        <div id="tintuc" class="tab-pane fade">
                            <ul id="dsTinTucNoiBat" class="noidung-tab">
                            </ul>
                            <a class="noidung-tab-all" href="tintuc">See all</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-md-4 col-sm-12 khung-tien-ich">
                <a href="dangkykhoahoc"><img src="static/Pic/dangkykhoahoc.gif" alt="Đăng ký khóa học"></a>
            </div>
            
            <div class="col-xs-12 col-md-4 col-sm-12 khung-tien-ich slide">
                <a href="lichkhaigiang">
                    <img src="static/Pic/lichkhaigiangmoi.jpg" alt="Lịch khai giảng mới nhất">
                    <div class="slide-caption">
                        <h4 style="font-weight: bold !important;">Khai giảng từ ngày 06/06/2017 đến ngày 26/06/2017</h4>
                        <p style="color:black">(Giờ học từ 18g đến 20g30)</p>
                    </div>
                </a>
            </div>
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