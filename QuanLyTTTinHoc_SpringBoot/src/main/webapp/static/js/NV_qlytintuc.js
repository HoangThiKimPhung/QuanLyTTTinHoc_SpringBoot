$(document).ready(function(){
	$("#danh-sach-trong").css("display","none");
	$("#ket-qua-thong-ke").css("display","none");
	
	//Lấy toàn bộ tin tức
	$.ajax({
		type:"GET",
		url:"/getAllTinTuc",
		dataType:"json",
		success:function(result){
			if(result == null){
				$("#danh-sach-trong").text("Không có tin tức nào");
				$("#danh-sach-trong").css("display","block");
				return;
			}
			else{
				ShowAllTinTuc(result);
			}
		}
	});
	
	function ShowAllTinTuc(result){
		var n = Object.keys(result).length;
		
		$("#table-dsTinTuc > tbody").children().remove();
		
		var tinhTrang;
		for(i=0; i<n; i++){
			if(result[i].tinhtrang == 1)
				tinhTrang = "Hiện";
			else
				tinhTrang = "Ẩn";
			
			$("#table-dsTinTuc > tbody").append(
				$('<tr>').append(
					$('<td>').text(i+1)	
					).append(
					$('<td>').text(result[i].maTT.trim())		
					).append(
					$('<td>').html(result[i].tieudeTT)		
					).append(
					$('<td>').html(result[i].tomtatTT)		
					).append(
					$('<td>').text(result[i].dateTT)		
					).append(
					$('<td>').text(tinhTrang)		
					).append(
					$('<td>').append(
						$('<div class="w3-dropdown-hover">').append(
							$('<button class="w3-button w3-round-xxlarge">').append(
								$('<span class="glyphicon glyphicon-edit">')	
								)	
							).append(
							$('<div class="w3-dropdown-content w3-bar-block w3-card-4">').append(
								$('<a>').text("Đưa lên đầu")
										.addClass("w3-bar-item w3-button")
								).append(
								$('<a>').text("Chỉnh sửa")
										.addClass("w3-bar-item w3-button")		
										.click(function(e){
											e.preventDefault();
											var maTT = $(this).closest('tr').find('td:nth-child(2)').text();
											//Lấy maTT để lấy toàn bộ thông tin về tin tức đó, chuẩn bị cho update
											$.ajax({
												type:"POST",
												url:"findTinTuc",
												data:{
													maTT:maTT
												},
												dataType:"text",
												success:function(result){
													window.location.assign("NV-chinhsuatintuc");
												}
											})
											
										})
								).append(
								$('<a>').text("Hiện")	
										.addClass("w3-bar-item w3-button")
								).append(
								$('<a>').text("Ẩn")
										.addClass("w3-bar-item w3-button")
								).append(
								$('<a>').text("Xóa")
										.addClass("w3-bar-item w3-button")
										.click(function(e){
											e.preventDefault();
											
											if(confirm('Bạn có chắc chắn muốn xóa không?')){
												var maTT = $(this).closest('tr').find('td:nth-child(2)').text();
												var temp = this;
												$.ajax({
													type:"DELETE",
													url:"deleteTinTuc?maTT="+maTT,
													dataType:"text",
													success:function(result){
														alert("Xóa tin tức thành công!");
														$(temp).closest('tr').remove();
														window.location.assign("NV-quanlytintuc");
													}
												})
											}
										})
								)		
							)	
						)		
					)
			)
		}
		$("#ket-qua-thong-ke").css("display","block");
	}
})
