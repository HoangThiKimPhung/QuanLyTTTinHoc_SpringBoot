$(document).ready(function(){
	var flagchinh = false; //Kiểm tra chỉnh sửa xong chưa
	var flag1 = false;
	var flag2 = false;
	var flag3 = false;
	var fl = 1;
	
	//Load 4 tin tức nổi bật lên Trang chủ
	var src = "https://drive.google.com/uc?export=view&id=";
	LoadAllTinTuc();
	
	$("#edittieudechinh").click(function(e){
		$("#chinhsuatieudechinh").css('display','block');
		$("#chinhsuatintucchinh").css('display','block');
		//$("#textchinhsuatieudechinh").css('display','block');
		$("#submittieudechinh").css('display','block');
		$("#tieuDeTTChinh").css('display','none');
		$("#ngayDangTTChinh").css('display','none');
		$("#iconnew").css('display','none');
		$("#edittieudechinh").css('display','none');
		$("#clockchinh").css('display','none');
		CKEDITOR.replace('editortieudechinh');
		flagchinh = true;
		
		$("#textchinhsuatieudechinh").val($("#tieuDeTTChinh").text());
	});
	
	$("#edittintucchinh").click(function(e){
		$("#chinhsuatintucchinh").css('display','block');
		//$("#textchinhsuatintucchinh").css('display','block');
		$("#submittintucchinh").css('display','block');
		$("#noiDungTomTatTTChinh").css('display','none');
		$("#ngayDangTTChinh").css('display','none');
		$("#iconnew").css('display','none');
		$("#edittintucchinh").css('display','none');
		$("#clockchinh").css('display','none');
		CKEDITOR.replace('editortintucchinh');
		flagchinh = true;
				
		$("#textchinhsuatintucchinh").val($("#noiDungTomTatTTChinh").text());
	});
	
	$("#submittieudechinh").click(function(e){
		e.preventDefault();
		$.ajax({
			type:"POST",
			url: "/editTieuDeWebpage",
			data:{
				maTinTuc: $('#maTTchinh').val(),
        		tieuDeTinTuc: CKEDITOR.instances.textchinhsuatieudechinh.getData(),
        		//tomTatTinTuc: CKEDITOR.instances.textchinhsuatintucchinh.getData()
			},
			dataType:"json",
			success:function(result){
				if(result == false){
					/*$.ajax({
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
					});*/
					$('#tieuDeTTChinh').html(CKEDITOR.instances.textchinhsuatieudechinh.getData());
					CKEDITOR.instances.textchinhsuatieudechinh.destroy();
					$("#chinhsuatieudechinh").css('display','none');
					$("#textchinhsuatieudechinh").css('display','none');
					$("#chinhsuatintucchinh").css('display','none');
					$("#textchinhsuatintucchinh").css('display','none');
					$("#submittieudechinh").css('display','none');
					$("#tieuDeTTChinh").css('display','block');
					$("#ngayDangTTChinh").css('display','inline-block');
					$("#iconnew").css('display','block');
					$("#edittieudechinh").css('display','block');
					$("#clockchinh").css('display','block');
					flagchinh = false;
					
				}
				else{
					alert("Không chỉnh sửa được tin tức!");
					return;
				}
			}
		});		
	});
	
	$("#submittintucchinh").click(function(e){
		e.preventDefault();
		$.ajax({
			type:"POST",
			url: "/editNoiDungWebpage",
			data:{
				maTinTuc: $('#maTTchinh').val(),
        		//tieuDeTinTuc: CKEDITOR.instances.textchinhsuatieudechinh.getData(),
        		tomTatTinTuc: CKEDITOR.instances.textchinhsuatintucchinh.getData()
			},
			dataType:"json",
			success:function(result){
				if(result == false){
					/*$.ajax({
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
					});*/
					$('#noiDungTomTatTTChinh').html(CKEDITOR.instances.textchinhsuatintucchinh.getData());
					CKEDITOR.instances.textchinhsuatintucchinh.destroy();
					$("#chinhsuatieudechinh").css('display','none');
					$("#textchinhsuatieudechinh").css('display','none');
					$("#chinhsuatintucchinh").css('display','none');
					$("#textchinhsuatintucchinh").css('display','none');
					$("#submittintucchinh").css('display','none');
					$("#noiDungTomTatTTChinh").css('display','block');
					$("#ngayDangTTChinh").css('display','inline-block');
					$("#iconnew").css('display','block');
					$("#edittintucchinh").css('display','block');
					$("#clockchinh").css('display','block');
					flagchinh = false;
					
				}
				else{
					alert("Không chỉnh sửa được tin tức!");
					return;
				}
			}
		});		
	});
	
	$("#edittieudephu1").click(function(e){		
		$("#chinhsuatieudephu1").css('display','block');
		//$("#textchinhsuatieudephu1").css('display','block');
		$("#chinhsuatintucphu1").css('display','block');
		//$("#textchinhsuatintucphu1").css('display','block');
		$("#submittieudephu1").css('display','block');
		$("#tieuDeTTPhu1").css('display','none');
		$("#ngayDangTTPhu1").css('display','none');
		$("#edittieudephu1").css('display','none');
		$("#clockphu1").css('display','none');
		CKEDITOR.replace('editortieudephu1');
		flag1 = true;
		
		$("#textchinhsuatieudephu1").val($("#tieuDeTTPhu1").text());
	});
	
	$("#edittintucphu1").click(function(e){		
		//$("#textchinhsuatieudephu1").css('display','block');
		$("#chinhsuatintucphu1").css('display','block');
		//$("#textchinhsuatintucphu1").css('display','block');
		$("#submittintucphu1").css('display','block');
		$("#noiDungTomTatTTPhu1").css('display','none');
		$("#ngayDangTTPhu1").css('display','none');
		$("#edittintucphu1").css('display','none');
		$("#clockphu1").css('display','none');
		CKEDITOR.replace('editortintucphu1');
		flag1 = true;
		
		$("#textchinhsuatintucphu1").val($("#noiDungTomTatTTPhu1").text());
	});
	
	
	$("#submittieudephu1").click(function(e){
		e.preventDefault();
		$.ajax({
			type:"POST",
			url: "/editTieuDeWebpage",
			data:{
				maTinTuc: $('#maTTphu1').val(),
        		tieuDeTinTuc: CKEDITOR.instances.textchinhsuatieudephu1.getData(),
        		//tomTatTinTuc: CKEDITOR.instances.textchinhsuatintucchinh.getData()
			},
			dataType:"json",
			success:function(result){
				if(result == false){
					/*$.ajax({
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
					});*/
					$('#tieuDeTTPhu1').html(CKEDITOR.instances.textchinhsuatieudephu1.getData());
					CKEDITOR.instances.textchinhsuatieudephu1.destroy();
					$("#chinhsuatieudephu1").css('display','none');
					$("#textchinhsuatieudephu1").css('display','none');
					$("#chinhsuatintucphu1").css('display','none');
					$("#textchinhsuatintucphu1").css('display','none');
					$("#submittieudephu1").css('display','none');
					$("#tieuDeTTPhu1").css('display','block');
					$("#ngayDangTTPhu1").css('display','inline-block');
					$("#edittieudephu1").css('display','block');
					$("#clockphu1").css('display','block');
					flag1 = false;
					
				}
				else{
					alert("Không chỉnh sửa được tin tức!");
					return;
				}
			}
		});		
	});
	
	$("#submittintucphu1").click(function(e){
		e.preventDefault();
		$.ajax({
			type:"POST",
			url: "/editNoiDungWebpage",
			data:{
				maTinTuc: $('#maTTphu1').val(),
        		//tieuDeTinTuc: CKEDITOR.instances.textchinhsuatieudechinh.getData(),
        		tomTatTinTuc: CKEDITOR.instances.textchinhsuatintucphu1.getData()
			},
			dataType:"json",
			success:function(result){
				if(result == false){
					/*$.ajax({
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
					});*/
					$('#noiDungTomTatTTPhu1').html(CKEDITOR.instances.textchinhsuatintucphu1.getData());
					CKEDITOR.instances.textchinhsuatintucphu1.destroy();
					$("#chinhsuatieudephu1").css('display','none');
					$("#textchinhsuatieudephu1").css('display','none');
					$("#chinhsuatintucphu1").css('display','none');
					$("#textchinhsuatintucphu1").css('display','none');
					$("#submittintucphu1").css('display','none');
					$("#noiDungTomTatTTPhu1").css('display','block');
					$("#ngayDangTTPhu1").css('display','inline-block');
					$("#edittintucphu1").css('display','block');
					$("#clockphu1").css('display','block');
					flag1 = false;
					
				}
				else{
					alert("Không chỉnh sửa được tin tức!");
					return;
				}
			}
		});		
	});
	
	
	$("#edittieudephu2").click(function(e){		
		$("#chinhsuatieudephu2").css('display','block');
		//$("#textchinhsuatieudephu2").css('display','block');
		$("#chinhsuatintucphu2").css('display','block');
		//$("#textchinhsuatintucphu2").css('display','block');
		$("#submittieudephu2").css('display','block');
		$("#tieuDeTTPhu2").css('display','none');
		$("#ngayDangTTPhu2").css('display','none');
		$("#edittieudephu2").css('display','none');
		$("#clockphu2").css('display','none');
		CKEDITOR.replace('editortieudephu2');
		flag2 = true;
		
		$("#textchinhsuatieudephu2").val($("#tieuDeTTPhu2").text());
	});
	
	$("#edittintucphu2").click(function(e){		
		//$("#textchinhsuatieudephu2").css('display','block');
		$("#chinhsuatintucphu2").css('display','block');
		//$("#textchinhsuatintucphu2").css('display','block');
		$("#submittintucphu2").css('display','block');
		$("#noiDungTomTatTTPhu2").css('display','none');
		$("#ngayDangTTPhu2").css('display','none');
		$("#edittintucphu2").css('display','none');
		$("#clockphu2").css('display','none');
		CKEDITOR.replace('editortintucphu2');
		flag2 = true;
		
		$("#textchinhsuatintucphu2").val($("#noiDungTomTatTTPhu2").text());
	});
	
	
	$("#submittieudephu2").click(function(e){
		e.preventDefault();
		$.ajax({
			type:"POST",
			url: "/editTieuDeWebpage",
			data:{
				maTinTuc: $('#maTTphu2').val(),
        		tieuDeTinTuc: CKEDITOR.instances.textchinhsuatieudephu2.getData(),
        		//tomTatTinTuc: CKEDITOR.instances.textchinhsuatintucchinh.getData()
			},
			dataType:"json",
			success:function(result){
				if(result == false){
					/*$.ajax({
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
					});*/
					$('#tieuDeTTPhu2').html(CKEDITOR.instances.textchinhsuatieudephu2.getData());
					CKEDITOR.instances.textchinhsuatieudephu2.destroy();
					$("#chinhsuatieudephu2").css('display','none');
					$("#textchinhsuatieudephu2").css('display','none');
					$("#chinhsuatintucphu2").css('display','none');
					$("#textchinhsuatintucphu2").css('display','none');
					$("#submittieudephu2").css('display','none');
					$("#tieuDeTTPhu2").css('display','block');
					$("#ngayDangTTPhu2").css('display','inline-block');
					$("#edittieudephu2").css('display','block');
					$("#clockphu2").css('display','block');
					flag2 = false;
					
				}
				else{
					alert("Không chỉnh sửa được tin tức!");
					return;
				}
			}
		});		
	});
	
	$("#submittintucphu2").click(function(e){
		e.preventDefault();
		$.ajax({
			type:"POST",
			url: "/editNoiDungWebpage",
			data:{
				maTinTuc: $('#maTTphu2').val(),
        		//tieuDeTinTuc: CKEDITOR.instances.textchinhsuatieudechinh.getData(),
        		tomTatTinTuc: CKEDITOR.instances.textchinhsuatintucphu2.getData()
			},
			dataType:"json",
			success:function(result){
				if(result == false){
					/*$.ajax({
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
					});*/
					$('#noiDungTomTatTTPhu2').html(CKEDITOR.instances.textchinhsuatintucphu2.getData());
					CKEDITOR.instances.textchinhsuatintucphu2.destroy();
					$("#chinhsuatieudephu2").css('display','none');
					$("#textchinhsuatieudephu2").css('display','none');
					$("#chinhsuatintucphu2").css('display','none');
					$("#textchinhsuatintucphu2").css('display','none');
					$("#submittintucphu2").css('display','none');
					$("#noiDungTomTatTTPhu2").css('display','block');
					$("#ngayDangTTPhu2").css('display','inline-block');
					$("#edittintucphu2").css('display','block');
					$("#clockphu2").css('display','block');
					flag2 = false;
					
				}
				else{
					alert("Không chỉnh sửa được tin tức!");
					return;
				}
			}
		});		
	});
	
	$("#edittieudephu3").click(function(e){		
		$("#chinhsuatieudephu3").css('display','block');
		//$("#textchinhsuatieudephu3").css('display','block');
		$("#chinhsuatintucphu3").css('display','block');
		//$("#textchinhsuatintucphu3").css('display','block');
		$("#submittieudephu3").css('display','block');
		$("#tieuDeTTPhu3").css('display','none');
		$("#ngayDangTTPhu3").css('display','none');
		$("#edittieudephu3").css('display','none');
		$("#clockphu3").css('display','none');
		CKEDITOR.replace('editortieudephu3');
		flag3 = true;
		
		$("#textchinhsuatieudephu3").val($("#tieuDeTTPhu3").text());
	});
	
	$("#edittintucphu3").click(function(e){		
		//$("#textchinhsuatieudephu3").css('display','block');
		$("#chinhsuatintucphu3").css('display','block');
		//$("#textchinhsuatintucphu3").css('display','block');
		$("#submittintucphu3").css('display','block');
		$("#noiDungTomTatTTPhu3").css('display','none');
		$("#ngayDangTTPhu3").css('display','none');
		$("#edittintucphu3").css('display','none');
		$("#clockphu3").css('display','none');
		CKEDITOR.replace('editortintucphu3');
		flag3 = true;
		
		$("#textchinhsuatintucphu3").val($("#noiDungTomTatTTPhu3").text());
	});
	
	
	$("#submittieudephu3").click(function(e){
		e.preventDefault();
		$.ajax({
			type:"POST",
			url: "/editTieuDeWebpage",
			data:{
				maTinTuc: $('#maTTphu3').val(),
        		tieuDeTinTuc: CKEDITOR.instances.textchinhsuatieudephu3.getData(),
        		//tomTatTinTuc: CKEDITOR.instances.textchinhsuatintucchinh.getData()
			},
			dataType:"json",
			success:function(result){
				if(result == false){
					/*$.ajax({
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
					});*/
					$('#tieuDeTTPhu3').html(CKEDITOR.instances.textchinhsuatieudephu3.getData());
					CKEDITOR.instances.textchinhsuatieudephu3.destroy();
					$("#chinhsuatieudephu3").css('display','none');
					$("#textchinhsuatieudephu3").css('display','none');
					$("#chinhsuatintucphu3").css('display','none');
					$("#textchinhsuatintucphu3").css('display','none');
					$("#submittieudephu3").css('display','none');
					$("#tieuDeTTPhu3").css('display','block');
					$("#ngayDangTTPhu3").css('display','inline-block');
					$("#edittieudephu3").css('display','block');
					$("#clockphu3").css('display','block');
					flag3 = false;
					
				}
				else{
					alert("Không chỉnh sửa được tin tức!");
					return;
				}
			}
		});		
	});
	
	$("#submittintucphu3").click(function(e){
		e.preventDefault();
		$.ajax({
			type:"POST",
			url: "/editNoiDungWebpage",
			data:{
				maTinTuc: $('#maTTphu3').val(),
        		//tieuDeTinTuc: CKEDITOR.instances.textchinhsuatieudechinh.getData(),
        		tomTatTinTuc: CKEDITOR.instances.textchinhsuatintucphu3.getData()
			},
			dataType:"json",
			success:function(result){
				if(result == false){
					/*$.ajax({
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
					});*/
					$('#noiDungTomTatTTPhu1').html(CKEDITOR.instances.textchinhsuatintucphu3.getData());
					CKEDITOR.instances.textchinhsuatintucphu3.destroy();
					$("#chinhsuatieudephu3").css('display','none');
					$("#textchinhsuatieudephu3").css('display','none');
					$("#chinhsuatintucphu3").css('display','none');
					$("#textchinhsuatintucphu3").css('display','none');
					$("#submittintucphu3").css('display','none');
					$("#noiDungTomTatTTPhu3").css('display','block');
					$("#ngayDangTTPhu3").css('display','inline-block');
					$("#edittintucphu3").css('display','block');
					$("#clockphu3").css('display','block');
					flag3 = false;
					
				}
				else{
					alert("Không chỉnh sửa được tin tức!");
					return;
				}
			}
		});		
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
					$('#tieuDeTTChinh').html(result[0].tieudeTT);
					$('#ngayDangTTChinh').html(result[0].dateTT);
					$('#noiDungTomTatTTChinh').html(result[0].tomtatTT);
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
							$('#tieuDeTTPhu1').html(result[0].tieudeTT);
							$('#ngayDangTTPhu1').html(result[0].dateTT);
							$('#noiDungTomTatTTPhu1').html(result[0].tomtatTT);
							$('#maTTphu1').val(result[0].maTT);
							$("#TTPhu1").css('display','block');
						}
						if(i==1){
							$('#imageTTPhu2').attr("src",src + result[1].fileTT);
							$("#imageTTPhu2").css('display','block');
							$('#tieuDeTTPhu2').html(result[1].tieudeTT);
							$('#ngayDangTTPhu2').html(result[1].dateTT);
							$('#noiDungTomTatTTPhu2').html(result[1].tomtatTT);
							$('#maTTphu2').val(result[1].maTT);
							$("#TTPhu2").css('display','block');
						}
						if(i==2){
							$('#imageTTPhu3').attr("src",src + result[2].fileTT);
							$("#imageTTPhu3").css('display','block');
							$('#tieuDeTTPhu3').html(result[2].tieudeTT);
							$('#ngayDangTTPhu3').html(result[2].dateTT);
							$('#noiDungTomTatTTPhu3').html(result[2].tomtatTT);
							$('#maTTphu3').val(result[2].maTT);
							$("#TTPhu3").css('display','block');
						}
					}
				}
			}
		});
	}
})