<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Quản lý tin tức</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- Boostrap -->
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <script src="static/js/jquery-3.2.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="static/css/w3.css">
    <!-- Glyphicons -->
    <link rel="stylesheet" href="static/css/font-awesome.min.css">
    <!-- MY CSS -->
    <link rel="stylesheet" href="static/css/menu-nhan-vien.css">
    <!-- MY JS -->
	<script src="static/js/NV_qlytintuc.js"></script>
    <style>
        div.w3-dropdown-hover {
            position: static;
            background-color: white !important;
            float: right !important;
        }

        button.w3-button {
            background-color: #197485 !important;
            color: white;
        }

        a.w3-bar-item.w3-button {
            text-decoration: none;
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
                        <a href=#><i class="glyphicon glyphicon-globe"></i><span class="page-trich-dan"> QUẢN LÝ TIN TỨC</span> </a>  
                    </div>
                </div>
                <div class="nav navbar-nav navbar-right">
                    <a class="image-nhan-vien"  style="text-decoration:none">
                    	<img src="static/Pic/doremon.png" alt="NhanVien">
                    	<span>Hoàng Thị Kim Phụng</span> 
                    </a>
                    <a class="navbar-brand" href="/index" style="margin-right:-70px;margin-left:20px;float:right;"><i class="fa fa-home" style="margin-top: -12px;font-size: 45px;color:white;"></i></a>
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
                    <li><a href="/logout"><i class="glyphicon glyphicon-log-out"></i>  Thoát</a></li>
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
    <section class="phan-noi-dung" style="max-width: 1400px !important">
        <label> Tiêu đề: </label>
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-6">
                <div class="input-group search">
                    <input id="thongTinTimKiem" type="text" class="form-control" size="50" placeholder="Nhập tiêu đề tin tức vào đây">
                    <div class="input-group-btn">
                        <button id="timKiemTinTuc" class="btn btn-default" style="background-color: #197485; color:white">
                            Tìm <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6">
                <div class="form-group" style="float:right">
                    <a href="NV-themtintuc" class="btn btn-default" style="background-color: #197485; color:white; width: 280px;">
                        Thêm tin tức mới <i class="glyphicon glyphicon-plus "></i>
                    </a>
                </div>
            </div>
        </div>
        <hr />
        <label style="color: #197485; font-weight: bold; text-decoration: underline"> Danh sách tin tức: </label>

        <!-- Danh sách thông báo -->
        <fieldset id="ket-qua-thong-ke">
            <div class="table-responsive" style="max-height: 1000px">  
                <table class="table" id="table-dsTinTuc">
                    <thead>
                        <tr>
                        	<th>STT</th>
                            <th>Mã tin tức </th>
                            <th>Tiêu đề tin tức</th>
                            <th style="width:50%;">Tóm tắt tin tức</th>
                            <th>Ngày đăng tin tức</th>
                            <th>Tình trạng</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody id="myTable">
<!--                         <tr> -->
<!--                             <td>TB01</td> -->
<!--                             <td>Thông báo lịch khai giảng sắp tới</td> -->
<!--                             <td>Trung Tâm Tin Học thông báo lịch khai giảng các Lớp Tin Học Văn Phòng Chứng chỉ Quốc tế.</td> -->
<!--                             <td>16-10-2017</td> -->
<!--                             <td>Hiện</td> -->
<!--                             <td> -->
<!--                                 <div class="w3-dropdown-hover"> -->
<!--                                     <button class="w3-button w3-round-xxlarge"><span class="glyphicon glyphicon-edit"></span></button> -->
<!--                                     <div class="w3-dropdown-content w3-bar-block w3-card-4"> -->
<!--                                         <a href="#" class="w3-bar-item w3-button">Đưa lên đầu</a> -->
<!--                                         <a href="NV-chinh-sua-tin-tuc.html" class="w3-bar-item w3-button">Chỉnh sửa</a> -->
<!--                                         <a href="#" class="w3-bar-item w3-button">Hiện</a> -->
<!--                                         <a href="#" class="w3-bar-item w3-button">Ẩn</a> -->
<!--                                         <a href="#" class="w3-bar-item w3-button">Xóa</a> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </td> -->
<!--                         </tr> -->
                    </tbody>
                </table>
            </div>
            <br />
        </fieldset>
        <div style="text-align: center;">
        	<p><strong id="danh-sach-trong"></strong></p>
        </div>
    </section>
</body>
</html>