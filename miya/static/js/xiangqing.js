$(function(){

	$("#count").val('1');
	/*数量点一次加1*/
	$("#add").click(function(){
		var num=$("#count").val();
		var a= Number(num);
		$("#count").val(a+1);
		//当	#count大于1时，#subtract的span的背景图中间为亮
		 if(Number($("#count").val())>1){
			$("#subtract").removeClass().addClass('bj');
		}

	});
	/*数量点一次减1*/
	$("#subtract").click(function(){
		if($("#count").val()>=2){
			var num=$("#count").val();
			var a= Number(num);
			$("#count").val(a-1);
			//当#count为1时，#subtract的span背景图中间为暗
			if(Number($("#count").val())===1){
				$("#subtract").removeClass().addClass('jian');
			}
		}
		else{
			$("#count").val("1")
		}
	});




//点击加入购物车按钮，购物车相应变化

	$("#join").click(function(){
		alert("添加成功")
		request_data={
			'goodid':$(this).attr('data_goodid'),
			'num':$("#count").val()
		}
		$.get('/miya/addshoppingcart/',request_data,function (response) {
			if(response.num == $("#count").val()){
				alert('成功')
			}
		})

	})
})


