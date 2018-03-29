<%@page import="java.util.Optional"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ page import="com.example.demo.model.TinTuc" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Chỉnh sửa tin tức</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- Boostrap -->
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <script src="static/js/jquery-3.2.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="static/css/w3.css">
     <!-- CK Editor -->
    <script type="text/javascript" src="static/ckeditor/ckeditor.js"></script>
    <!-- Glyphicons -->
    <link rel="stylesheet" href="static/css/font-awesome.min.css">
    <!-- MY CSS -->
    <link rel="stylesheet" href="static/css/menu-nhan-vien.css">
    <!--MY JS-->
    <script src="static/js/NV_chinhsuatintuc.js"></script>

    <style>
		#myImg {
		    border-radius: 5px;
		    cursor: pointer;
		    transition: 0.3s;
		}
		
		#myImg:hover {opacity: 0.7;}
		
		/* The Modal (background) */
		.modal {
		    display: none; /* Hidden by default */
		    position: fixed; /* Stay in place */
		    z-index: 1; /* Sit on top */
		    padding-top: 100px; /* Location of the box */
		    left: 0;
		    top: 0;
		    width: 100%; /* Full width */
		    height: 100%; /* Full height */
		    overflow: auto; /* Enable scroll if needed */
		    background-color: rgb(0,0,0); /* Fallback color */
		    background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
		}
		
		/* Modal Content (image) */
		.modal-content {
		    margin: auto;
		    display: block;
		    width: 80%;
		    max-width: 700px;
		}
		
		/* Caption of Modal Image */
		#caption {
		    margin: auto;
		    display: block;
		    width: 80%;
		    max-width: 700px;
		    text-align: center;
		    color: #ccc;
		    padding: 10px 0;
		    height: 150px;
		}
		
		/* Add Animation */
		.modal-content, #caption {    
		    -webkit-animation-name: zoom;
		    -webkit-animation-duration: 0.6s;
		    animation-name: zoom;
		    animation-duration: 0.6s;
		}
		
		@-webkit-keyframes zoom {
		    from {-webkit-transform:scale(0)} 
		    to {-webkit-transform:scale(1)}
		}
		
		@keyframes zoom {
		    from {transform:scale(0)} 
		    to {transform:scale(1)}
		}
		
		/* The Close Button */
		.close {
		    position: absolute;
		    top: 15px;
		    right: 35px;
		    color: #f1f1f1;
		    font-size: 40px;
		    font-weight: bold;
		    transition: 0.3s;
		}
		
		.close:hover,
		.close:focus {
		    color: #bbb;
		    text-decoration: none;
		    cursor: pointer;
		}
		
		/* 100% Image Width on Smaller Screens */
		@media only screen and (max-width: 700px){
		    .modal-content {
		        width: 100%;
		    }
		}
	</style>
</head>
<body>
	<!-- HEADER MENU -->
    <header> 
        <!-- LOGO HOTEL -->
        <div class="container">
            <img src="static/Pic/logo-TTTH.png" alt="logo" class="logo w3-animate-zoom ">
        </div>
        <nav class="navbar navbar-default">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#nav-left">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <div class="navbar-brand">
                        <a href=#><i class="glyphicon glyphicon-globe"></i><span class="page-trich-dan"> CHỈNH SỬA TIN TỨC</span> </a>  
                    </div>
                </div>
                <div class="nav navbar-nav navbar-right">
                    <a class="image-nhan-vien"  style="text-decoration:none">
                    	<img src="static/Pic/doremon.png" alt="NhanVien">
                    	<span>Hoàng Thị Kim Phụng</span> 
                    </a>
                </div>
            </div>
        </nav>
        <!-- MENU -->
        <nav class="navbar-default nav-menu">
            <div id="nav-left" class="navbar-collapse collapse">
                <ul class="nav">
                    <li><a href="nhanvien"><i class="fa fa-user-circle"></i> Trang của bạn</a></li>
                    <li><a href="#"><i class="fa fa-search"></i> Tra cứu đăng ký online</a></li>
                    <li><a href="#"><i class="glyphicon glyphicon-edit"></i> Đăng ký khóa học</a></li>
                    <li><a href="#" id="menu-thu-hoc-phi"><i class="glyphicon glyphicon-usd"></i> Thu học phí</a></li>
                    <li><a href="#"><i class="glyphicon glyphicon-list-alt"></i> Thống kê DS Đăng ký online</a></li>
                    <li><a href="#"><i class="glyphicon glyphicon-list-alt"></i> Thống kê DS Học viên</a></li>
                    <li><a href="#"><i class="glyphicon glyphicon-list-alt"></i> Thống kê DS Giáo viên</a></li>
                    <li><a href="#"><i class="glyphicon glyphicon-list-alt"></i> Thống kê DS Lớp học</a></li>
                    <li><a href="#"><i class="glyphicon glyphicon-globe"></i> Quản lý thông báo</a></li>
                    <li class="active"><a href="NV-quanlytintuc"><i class="glyphicon glyphicon-globe"></i> Quản lý tin tức</a></li>
                    <li><a href="index"><i class="glyphicon glyphicon-log-out"></i>  Thoát</a></li>
                </ul>
            </div>
            <script>
                $("#menu-thu-hoc-phi").click(function (e) {
                    alert("Mời bạn đăng ký khóa học cho học viên trước khi thu học phí!!!");
                });
            </script>
        </nav>
    </header>  
    
    <!-- CONTENT -->
    <section class="phan-noi-dung">
        <br />
        <div class="w3-row">
            <div class="w3-twothird">
                <form action="editTinTuc" method="POST" enctype="multipart/form-data" class="form-horizontal">
                    <div class="form-group">
                        <label class="control-label col-xs-12 col-sm-3 col-md-3">Mã tin tức:</label>
                        <div class="col-xs-12 col-sm-9 col-md-9">
                            <input type="text" name="maTinTuc" id="maTinTuc" class="form-control" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-12 col-sm-3 col-md-3">Tiêu đề tin tức:</label>
                        <div class="col-xs-12 col-sm-9 col-md-9">
                            <!-- <input type="text" name="tieuDeTinTuc" id="tieuDeTinTuc" class="form-control"> -->
                            <textarea class="form-control" name="tieuDeTinTuc" rows="2" cols="50" id="ck_tieuDeTinTuc"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-12 col-sm-3 col-md-3">Tóm tắt tin tức:</label>
                        <div class="col-xs-12 col-sm-9 col-md-9">
                            <!-- <textarea class="form-control" name="tomTatTinTuc" id="tomTatTinTuc" rows="10" cols="50"></textarea> -->
                        	<textarea class="form-control" name="tomTatTinTuc" rows="15" cols="50" id="ck_tomTatTinTuc"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-12 col-sm-3 col-md-3">Ngày đăng tin tức:</label>
                        <div class="col-xs-12 col-sm-9 col-md-9">
                            <input type="date" name="ngayDangTinTuc" id="ngayDangTinTuc" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-12 col-sm-3 col-md-3">Hình ảnh:</label>
                        <div class="col-xs-12 col-sm-9 col-md-9">
                        	<a id="tenHinhAnh" src="static/Pic/bou.jpg">File tin tức cũ</a> 
                        	<div class="input-group">
								<input id="file" type="file" name="file">
							</div>
                        </div>
                    </div>
                	<div class="form-group col-xs-9 col-sm-10 col-md-11">
	                    <div class="input-group-btn" style="float:right">
	                        <input type="submit" class="btn btn-default" style="background-color: #197485; color:white; width: 100px;"
	                            value="Lưu" <i class="glyphicon glyphicon-ok"></i>
	                        />
	                    </div>
	                </div>
                </from>
            </div>
        </div>
        
        <div style="text-align: center;">
        	<h5 style="color: red; font-weight: bold;">
        		<% if(request.getSession().getAttribute("errorinput") != null){ %>
        			<%=request.getSession().getAttribute("errorinput")%>
        		<%} %>
        	</h5>
        </div>
        
    </section>

    
    
    <!-- The Modal -->
	<div id="myModal" class="modal">
	  <span class="close">&times;</span>
	  <img class="modal-content" id="img01">
	  <div id="caption"></div>
	</div>
</body>
</html>