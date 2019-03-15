
/*轮播图  创建*/
	$(function(){

		
	/*创建 获取 JSON 数据	*/
		$.get("json/indexBanerSll.json", function(data){
			console.log(data)
			//创建节点
			for (var i=0; i<data.length; i++) {
				//console.log(data)
				var obj = data[i]; //每品牌的对象
				var li = $('<li style="background:  '+obj.backColor+' "><a title=" '+obj.title+' " href="#"><img alt=" '+obj.title+' " src=" '+obj.img+' "/></a></li>')
				$('#barss').append(li)
				
			}
			

		})
		
	})
liTimer();
/*轮播图*/
function liTimer(){
	var index = 0;
	
	var ulLi = $('.baner_scoller ul li')
	var olLi = $('.baner_scoller ol li')
	console.log($('.baner_scoller ul li').length)
	window.clearInterval(timer)
	//定时器切换
	var timer = setInterval(function(){
		
		console.log(index)
		index++;
		console.log(index)
		if(index >= ulLi.length){
			console.log(index)
			index = 0;
		}
		$(ulLi).eq(index).fadeIn().siblings().hide()
		$(olLi).eq(index).removeClass().addClass('ol_active1').siblings().removeClass().addClass('ol_active2')
		
	},5000)		
	//点击小圆圈切换
	$(olLi).click(function(){
		console.log('jfkdjsakfj')
		window.clearInterval(timer)
		var index = $(this).index()
		$(ulLi).eq(index).fadeIn().siblings().hide()
		$(olLi).eq(index).removeClass().addClass('ol_active1').siblings().removeClass().addClass('ol_active2')	
		liTimer();
	})
}	


/*品牌商家推荐*/
	$(function(){
		$.get("json/indexMrb.json", function(data){
//			console.log(data)
			//创建节点
			for (var i=0; i<data.length; i++) {
				var obj = data[i]; //每品牌的对象
				var li = $('<li class="rem_img"><a href="#"><img alt="" border="0" src=" '+obj.img+' " /></a></li>')
				$('.rm_list').append(li)
			}
		
		})	
	})
	
/*每日优惠*/
	$(function(){
		$.get("json/indexDrb.json", function(data){
//			console.log(data)
			//创建节点
			for (var i=0; i<data.length; i++) {
				var obj = data[i]; //每品牌的对象
				var lis = $('<li class="daily_rec_li"></li>')
				var a1 = $('<a href="#" class="pd_name" title=" '+obj.name+' ">'+obj.name+'</a>');
				var p1 = $('<p class="pd_desp">'+obj.tits+'</p>')
				var p2 = $('<p class="pd_price"><em>'+obj.price1+'</em><del>'+obj.price2+'</del></p>')
				var a2 = $('<a class="pd_img" href="#" title=" '+obj.name+' "><img alt=" '+obj.name+' " src=" '+obj.img+' " /></a>') 
				lis.append(a1, p1, p2, a2)
				$('.daily_rec_content .daily_rec_list').append(lis)
			}
		
		})	
	})
































