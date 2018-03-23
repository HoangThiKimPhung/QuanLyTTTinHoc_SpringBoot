$(document).ready(function(){
	//Lấy mã tin tức tiếp theo
	$.ajax({
		type:"GET",
		url:"/layMaTTMoi",
		success:function(result){
			if(result == null){
				alert("Server đang bận!");
				window.location.assign("NV-quanlytintuc");
			}
			else{
				$("#maTinTuc").val(result);
				return;
			}
		}
	})
	
})