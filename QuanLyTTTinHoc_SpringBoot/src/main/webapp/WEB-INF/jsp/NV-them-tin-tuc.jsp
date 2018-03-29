<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Thêm tin tức</title>
    <meta charset="UTF-8">
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
    <script src="static/js/NV_themtintuc.js"></script>
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
                        <a href=#><i class="glyphicon glyphicon-globe"></i><span class="page-trich-dan"> THÊM TIN TỨC</span> </a>  
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
            <div>
                <form action="addtintuc" method="POST" enctype="multipart/form-data" class="form-horizontal">
                    <div class="form-group">
                        <label class="control-label col-xs-12 col-sm-2 col-md-2">Mã tin tức:</label>
                        <div class="col-xs-12 col-sm-8 col-md-8">
                            <input type="text" id="maTinTuc" class="form-control" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-12 col-sm-2 col-md-2">Tiêu đề tin tức:</label>
                        <div class="col-xs-12 col-sm-8 col-md-8">
                            <!-- <input type="text" name="tieuDeTinTuc" class="form-control"> -->
                            <textarea class="form-control" name="tieuDeTinTuc" rows="2" cols="50" id="ck_tieuDeTinTuc"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-12 col-sm-2 col-md-2">Tóm tắt tin tức:</label>
                        <div class="col-xs-12 col-sm-8 col-md-8">
                            <!-- <textarea class="form-control" name="tomTatTinTuc" rows="10" cols="50"></textarea> -->
                            <textarea class="form-control" name="tomTatTinTuc" rows="15" cols="50" id="ck_tomTatTinTuc"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-12 col-sm-2 col-md-2">Ngày đăng tin tức:</label>
                        <div class="col-xs-12 col-sm-8 col-md-8">
                            <input type="date" name="ngayDangTinTuc" class="form-control"
                            <%
                       			Date date = new Date();                        			  
                       			String strDateFormat = "yyyy-MM-dd";                        			  
                       			SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat(strDateFormat);
                        	%>
                        		value= <%=simpleDateFormat1.format(date)%>
                             >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-12 col-sm-2 col-md-2">Hình ảnh:</label>
                        <div class="col-xs-12 col-sm-8 col-md-8">
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
                </form>
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




</body>
</html>