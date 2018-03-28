$(document).ready(function(){
	var fileTTEdit;
	
	CKEDITOR.replace('ck_tomTatTinTuc');
	CKEDITOR.replace('ck_tieuDeTinTuc');
	
	//Load thông tin tin tức cũ lên form
	$.ajax({
		type:"GET",
		url:"getTinTucEdit",
		dataType:"json",
		success:function(result){
			$("#maTinTuc").val(result.maTT);
			//$("#tieuDeTinTuc").val(result.tieudeTT);
			CKEDITOR.instances.ck_tieuDeTinTuc.setData(result.tieudeTT);
			//$("#tomTatTinTuc").val(result.tomtatTT);
			CKEDITOR.instances.ck_tomTatTinTuc.setData(result.tomtatTT);
			$("#ngayDangTinTuc").val(result.dateTT);
			fileTTEdit = result.fileTT;
		}
	})
	
	// Sự kiện click vào tên file hình ảnh tin tuc cũ
	$("#tenHinhAnh").click(function(e){
		e.preventDefault();
		$("#myModal").css("display","block");
		$("input.btn.btn-default").css("display","none");
		$("#img01").attr("src","https://drive.google.com/uc?export=view&id="+fileTTEdit);
		$("#caption").innerHTML = this.alt;
	})

	// Sự kiện click vào nút đóng (close X ) trên modal image
	$("span.close").click(function(e){
		e.preventDefault();
		$("input.btn.btn-default").css("display","block");
		$("#myModal").css("display","none");
	})

	
})