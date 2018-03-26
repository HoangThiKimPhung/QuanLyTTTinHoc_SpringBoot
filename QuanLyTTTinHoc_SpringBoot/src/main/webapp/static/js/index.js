$(document).ready(function(){
	//Load 4 tin tức nổi bật lên Trang chủ
	$.ajax({
		type:"GET",
		url: "/get4TinTuc",
		dataType:"json",
		success:function(result){
			if(result == null){
				alert("Server bận!");
				return;
			}
			else{
				var n = Object.keys(result).length;
				for(i=0; i<n; i++){
					$('#dsTinTucNoiBat').append(
						$('<li>').append(
							$('<a href="#">').text(result[i].tieudeTT)
							).append(
							$('<br>')		
							).append(
							$('<i class="fa fa-clock-o">')		
							).append(
							$('<span>').text(" " + result[i].dateTT)		
							)
					)
				}
			}
		}
	})
	
	//Load 4 thông báo nổi bật lên Trang chủ
	$.ajax({
		type:"GET",
		url:"/get4ThongBao",
		dataType:"json",
		success:function(result){
			if(result.check == "fail"){
				alert("Server bận!");
				return;
			}
			else{
				var n = Object.keys(result).length;
				for(i=0; i<n; i++){
					$('#dsThongBaoNoiBat').append(
						$('<li>').append(
							$('<a href="#">').text(result[i].tieudeTB)
							).append(
							$('<br>')		
							).append(
							$('<i class="fa fa-clock-o">')		
							).append(
							$('<span>').text(" " + result[i].dateTB)		
							)
					)
				}
			}
		}
	})
})