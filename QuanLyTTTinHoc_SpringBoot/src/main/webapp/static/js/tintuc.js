$(document).ready(function(){
	var flagchinh = false; //Kiểm tra chỉnh sửa xong chưa
	var flag1 = false;
	var flag2 = false;
	var flag3 = false;
	var fl = 1;
	
	//Load 4 tin tức nổi bật lên Trang chủ
	var src = "https://drive.google.com/uc?export=view&id=";
	LoadAllTinTuc();
	
	$("#edittintucchinh").click(function(e){
		$("#chinhsuatieudechinh").css('display','block');
		$("#textchinhsuatieudechinh").css('display','block');
		$("#chinhsuatintucchinh").css('display','block');
		$("#textchinhsuatintucchinh").css('display','block');
		$("#submittintucchinh").css('display','block');
		$("#tieuDeTTChinh").css('display','none');
		$("#noiDungTomTatTTChinh").css('display','none');
		$("#ngayDangTTChinh").css('display','none');
		$("#iconnew").css('display','none');
		$("#edittintucchinh").css('display','none');
		$("#clockchinh").css('display','none');
		flagchinh = true;
		
		$("#textchinhsuatieudechinh").val($("#tieuDeTTChinh").text());
		$("#textchinhsuatintucchinh").val($("#noiDungTomTatTTChinh").text());
	});
	
	$("#submittintucchinh").click(function(e){
		e.preventDefault();
		$.ajax({
			type:"POST",
			url: "/editTinTucWebpage",
			data:{
				maTinTuc: $('#maTTchinh').val(),
        		tieuDeTinTuc: $('#textchinhsuatieudechinh').val(),
        		tomTatTinTuc: $('#textchinhsuatintucchinh').val()
			},
			dataType:"json",
			success:function(result){
				if(result == false){
					$.ajax({
						type:"GET",
						url: "/getAllTinTuc",
						dataType:"json",
						success:function(result){
							if(result == null){
								alert("Không chỉnh sửa được tin tức!");
								return;
							}
							else{
								$('#imageTTChinh').attr("src",src + result[0].fileTT);
								$("#imageTTChinh").css('display','block');
								$('#tieuDeTTChinh').text(result[0].tieudeTT);
								$('#ngayDangTTChinh').text(result[0].dateTT);
								$('#noiDungTomTatTTChinh').text(result[0].tomtatTT);
								$('#maTTchinh').val(result[0].maTT);
								$("#tintucChinh").css('display','block');
							}
						}
					});
				}
				else{
					alert("Không chỉnh sửa được tin tức!");
					return;
				}
			}
		});
		
		$("#chinhsuatieudechinh").css('display','none');
		$("#textchinhsuatieudechinh").css('display','none');
		$("#chinhsuatintucchinh").css('display','none');
		$("#textchinhsuatintucchinh").css('display','none');
		$("#submittintucchinh").css('display','none');
		$("#tieuDeTTChinh").css('display','block');
		$("#noiDungTomTatTTChinh").css('display','block');
		$("#ngayDangTTChinh").css('display','block');
		$("#iconnew").css('display','block');
		$("#edittintucchinh").css('display','block');
		$("#clockchinh").css('display','block');
		flagchinh = false;
	});
	
	$("#edittintucphu1").click(function(e){
		$("#chinhsuatieudephu1").css('display','block');
		$("#textchinhsuatieudephu1").css('display','block');
		$("#chinhsuatintucphu1").css('display','block');
		$("#textchinhsuatintucphu1").css('display','block');
		$("#submittintucphu1").css('display','block');
		$("#tieuDeTTPhu1").css('display','none');
		$("#noiDungTomTatTTPhu1").css('display','none');
		$("#ngayDangTTPhu1").css('display','none');
		$("#edittintucphu1").css('display','none');
		$("#clockphu1").css('display','none');
		flag1 = true;
		
		$("#textchinhsuatieudephu1").val($("#tieuDeTTPhu1").text());
		$("#textchinhsuatintucphu1").val($("#noiDungTomTatTTPhu1").text());
	});
	
	$("#edittintucphu2").click(function(e){
		$("#chinhsuatieudephu2").css('display','block');
		$("#textchinhsuatieudephu2").css('display','block');
		$("#chinhsuatintucphu2").css('display','block');
		$("#textchinhsuatintucphu2").css('display','block');
		$("#submittintucphu2").css('display','block');
		$("#tieuDeTTPhu2").css('display','none');
		$("#noiDungTomTatTTPhu2").css('display','none');
		$("#ngayDangTTPhu2").css('display','none');
		$("#edittintucphu2").css('display','none');
		$("#clockphu2").css('display','none');
		flag2 = true;
		
		$("#textchinhsuatieudephu2").val($("#tieuDeTTPhu2").text());
		$("#textchinhsuatintucphu2").val($("#noiDungTomTatTTPhu2").text());
	});
	
	$("#edittintucphu3").click(function(e){
		$("#chinhsuatieudephu3").css('display','block');
		$("#textchinhsuatieudephu3").css('display','block');
		$("#chinhsuatintucphu3").css('display','block');
		$("#textchinhsuatintucphu3").css('display','block');
		$("#submittintucphu3").css('display','block');
		$("#tieuDeTTPhu3").css('display','none');
		$("#noiDungTomTatTTPhu3").css('display','none');
		$("#ngayDangTTPhu3").css('display','none');
		$("#edittintucphu3").css('display','none');
		$("#clockphu3").css('display','none');
		flag3 = true;
		
		$("#textchinhsuatieudephu3").val($("#tieuDeTTPhu3").text());
		$("#textchinhsuatintucphu3").val($("#noiDungTomTatTTPhu3").text());
	});
	
	$("#submittintucphu1").click(function(e) {
        e.preventDefault();
        $.ajax({
			type:"POST",
			url: "/editTinTucWebpage",
			data:{
				maTinTuc: $('#maTTphu1').val(),
        		tieuDeTinTuc: $('#textchinhsuatieudephu1').val(),
        		tomTatTinTuc: $('#textchinhsuatintucphu1').val()
			},
			dataType:"json",
			success:function(result){
				if(result == false){
					if(fl == 1)
						LoadTinTucPhu(2,4);
					else
						LoadTinTucPhu(5,7);
				}
				else{
					alert("Không chỉnh sửa được tin tức!");
					return;
				}				
			}
		});
        
        $("#chinhsuatieudephu1").css('display','none');
		$("#textchinhsuatieudephu1").css('display','none');
		$("#chinhsuatintucphu1").css('display','none');
		$("#textchinhsuatintucphu1").css('display','none');
		$("#submittintucphu1").css('display','none');
		$("#tieuDeTTPhu1").css('display','block');
		$("#noiDungTomTatTTPhu1").css('display','block');
		$("#ngayDangTTPhu1").css('display','block');
		$("#edittintucphu1").css('display','block');
		$("#clockphu1").css('display','block');
		flag1 = false;
    });
	
	$("#submittintucphu2").click(function(e) {
        e.preventDefault();
        $.ajax({
			type:"POST",
			url: "/editTinTucWebpage",
			data:{
				maTinTuc: $('#maTTphu2').val(),
        		tieuDeTinTuc: $('#textchinhsuatieudephu2').val(),
        		tomTatTinTuc: $('#textchinhsuatintucphu2').val()
			},
			dataType:"json",
			success:function(result){
				if(result == false){
					if(fl == 1)
						LoadTinTucPhu(2,4);
					else
						LoadTinTucPhu(5,7);
				}
				else{
					alert("Không chỉnh sửa được tin tức!");
					return;
				}				
			}
		});
        
        $("#chinhsuatieudephu2").css('display','none');
		$("#textchinhsuatieudephu2").css('display','none');
		$("#chinhsuatintucphu2").css('display','none');
		$("#textchinhsuatintucphu2").css('display','none');
		$("#submittintucphu2").css('display','none');
		$("#tieuDeTTPhu2").css('display','block');
		$("#noiDungTomTatTTPhu2").css('display','block');
		$("#ngayDangTTPhu2").css('display','block');
		$("#edittintucphu2").css('display','block');
		$("#clockphu2").css('display','block');
		flag2 = false;
    });
	
	$("#submittintucphu3").click(function(e) {
        e.preventDefault();
        $.ajax({
			type:"POST",
			url: "/editTinTucWebpage",
			data:{
				maTinTuc: $('#maTTphu3').val(),
        		tieuDeTinTuc: $('#textchinhsuatieudephu3').val(),
        		tomTatTinTuc: $('#textchinhsuatintucphu3').val()
			},
			dataType:"json",
			success:function(result){
				if(result == false){
					if(fl == 1)
						LoadTinTucPhu(2,4);
					else
						LoadTinTucPhu(5,7);
				}
				else{
					alert("Không chỉnh sửa được tin tức!");
					return;
				}				
			}
		});
        
        $("#chinhsuatieudephu3").css('display','none');
		$("#textchinhsuatieudephu3").css('display','none');
		$("#chinhsuatintucphu3").css('display','none');
		$("#textchinhsuatintucphu3").css('display','none');
		$("#submittintucphu3").css('display','none');
		$("#tieuDeTTPhu3").css('display','block');
		$("#noiDungTomTatTTPhu3").css('display','block');
		$("#ngayDangTTPhu3").css('display','block');
		$("#edittintucphu3").css('display','block');
		$("#clockphu3").css('display','block');
		flag3 = false;
    });
	
	function LoadAllTinTuc(){
		$.ajax({
			type:"GET",
			url: "/getAllTinTuc",
			dataType:"json",
			success:function(result){
				if(result == null){
					alert("Server bận!");
					return;
				}
				else{
					$('#imageTTChinh').attr("src",src + result[0].fileTT);
					$("#imageTTChinh").css('display','block');
					$('#tieuDeTTChinh').text(result[0].tieudeTT);
					$('#ngayDangTTChinh').text(result[0].dateTT);
					$('#noiDungTomTatTTChinh').text(result[0].tomtatTT);
					$('#maTTchinh').val(result[0].maTT);
					$("#tintucChinh").css('display','block');
				}
				LoadTinTucPhu(2,4);
			}
		});
		
		//Đếm số lượng Tin tức để tạo số trang paginationTinTuc
		//Và sự kiện click cho từng page của paginationTicTuc
		$.ajax({
			type:"GET",
			url:"/soLuongTinTuc",
			dataType:"json",
			success:function(result){
				var soTrangTinTuc = Math.floor((result-1)/3);
				
				if(result > 4){
					var temp = result;
					$("ul#paginationTinTuc").append(
						$("<li class='active'>").append(
							$('<a>').text('1')
									.click(function(e){
										e.preventDefault();
										window.location.assign('tintuc');
									})
							)
					);
					
					var nLap = soTrangTinTuc;
					
					if(((result-1)%3) > 0)
						nLap = soTrangTinTuc+1;
					
					for(i=2; i<=nLap; i++){
						$("ul#paginationTinTuc").append(
							$('<li>').append(
								$('<a>').text(i)	
										.click(function(e){
											e.preventDefault();
											if(flagchinh || flag1 || flag2 || flag3){
												alert("Vui lòng hoàn tất chỉnh sửa trước khi qua trang mới!");
											}
											else{
												fl=2;
												var tbMax = this.text;
												$("ul#paginationTinTuc li").removeClass("active");
												LoadTinTucPhu(tbMax*3-1,tbMax*3+1);
											}
										})
								).click(function(e){
									$(this).addClass("active");
								})
						);
					}
				}
			}
		})
	}
	
	//Hàm load 3 Tin tức phụ
	function LoadTinTucPhu(start,end){
		//flag=3: Load 3 tin tức phụ lên trang tin tức theo stt từ [start,end]
		flag=3;
		
		$.ajax({
			type:"GET",
			url:"/lay3TinTucPhu",
			data:{
				start:start,
				end:end
			},
			dataType:"json",
			success:function(result){
				if(result == null){
					alert('Server đang bận!');
					return;
				}
				else{
					$('#TTPhu1').css('display','none');
					$('#TTPhu2').css('display','none');
					$('#TTPhu3').css('display','none');
					$("#imageTTPhu1").css('display','none');
					$("#imageTTPhu2").css('display','none');
					$("#imageTTPhu3").css('display','none');
					
					var n = Object.keys(result).length;
					//Load 3 thông báo phụ
					for(i=0; i<n; i++){
						
						if(i==0){
							$('#imageTTPhu1').attr("src",src + result[0].fileTT);
							$("#imageTTPhu1").css('display','block');
							$('#tieuDeTTPhu1').text(result[0].tieudeTT);
							$('#ngayDangTTPhu1').text(result[0].dateTT);
							$('#noiDungTomTatTTPhu1').text(result[0].tomtatTT);
							$('#maTTphu1').val(result[0].maTT);
							$("#TTPhu1").css('display','block');
						}
						if(i==1){
							$('#imageTTPhu2').attr("src",src + result[1].fileTT);
							$("#imageTTPhu2").css('display','block');
							$('#tieuDeTTPhu2').text(result[1].tieudeTT);
							$('#ngayDangTTPhu2').text(result[1].dateTT);
							$('#noiDungTomTatTTPhu2').text(result[1].tomtatTT);
							$('#maTTphu2').val(result[1].maTT);
							$("#TTPhu2").css('display','block');
						}
						if(i==2){
							$('#imageTTPhu3').attr("src",src + result[2].fileTT);
							$("#imageTTPhu3").css('display','block');
							$('#tieuDeTTPhu3').text(result[2].tieudeTT);
							$('#ngayDangTTPhu3').text(result[2].dateTT);
							$('#noiDungTomTatTTPhu3').text(result[2].tomtatTT);
							$('#maTTphu3').val(result[2].maTT);
							$("#TTPhu3").css('display','block');
						}
					}
				}
			}
		});
	}
})