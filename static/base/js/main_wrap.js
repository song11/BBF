
$(function(){
	//轮播图
	var topSwiper = new Swiper('#topSwiper', {
        pagination: '.swiper-pagination',
        slidesPerView: 1,
        paginationClickable: true,
        spaceBetween: 30,
        loop: true,
        autoplay: 3000,
        effect: 'coverflow',

    });
	//侧栏楼梯
	indexSideNav();
})

$(function(){
	/*Tab切换 商家加盟  公告  小贴士  鼠标移动事件*/
	$('.ei-list .lat , .ei-box2').mouseenter(function(){
		$('.ei-box1').hide()
		$('.ei-box2').show()
		$('.ei-list li').eq(0).css({'color':'#acacac','background':'none','border':'none'})
		$('.ei-list li').eq(1).css({'color':'#acacac','background':'#1562b6','border':'#1562b6','color':'white'})
	})
	$('.ei-list .lat  , .ei-box2').mouseleave(function(){
		$('.ei-box1').show()
		$('.ei-box2').hide()
		$('.ei-list li').eq(1).css({'color':'#acacac','background':'none','border':'none'})
		$('.ei-list li').eq(0).css({'color':'#acacac','background':'#1562b6','border':'#1562b6','color':'white'})
	})
	
	/*Teb 切换  热门商品---友情链接*/
	$('.hd li').hover(function(){
		$(this).removeClass('cur').addClass('cur').siblings().removeClass('cur')
		var index = $(this).index()
		$('.ft').hide().eq(index).show().siblings('.ft').hide()
	})
	
	/*搜索框吸顶*/
	$(window).scroll(function(){
		if(($(window).scrollTop()) > ($(".nav_itme_box:first").offset().top)){
			$('.fixed_search_box').css('display','block');
		}else{
			$('.fixed_search_box').css('display','none');
		}
	})
	
	/*点击商品图片  跳转商品详情*/



})

/*侧栏楼梯导航*/	
function indexSideNav() {	
	var isMoving = false; //是否点击了楼梯按钮后正在移动...
	//点击楼层按钮
	$(".main_nav_a").on("click", function(){
		var index = $(this).index();
		var _top = $(".nav_itme_box").eq(index).offset().top-100;
		isMoving = true; 
		$("body, html").stop().animate({scrollTop: _top}, 1000, function(){
			isMoving = false; 
		});
		//改变按钮的选中状态
		$(this).removeClass("curs").addClass("curs").siblings().removeClass("curs");
	})
	
	//滚动页面, 改变按钮的选中状态 
	$(window).scroll(function(){
		var _scrollTops = $(window).scrollTop();	              //获取滚动条滚动的高度
		var _heTop = $(".nav_itme_box:first").offset().top-300;   //获取楼梯1 到顶部的位置 再向上偏移300
		var _botTop =  $(".nav_itme_box:last").offset().top ;     //获取最后一个楼梯距顶部的位置并向下偏移自身高度的一半
		//判断条件      显示 / 隐藏 楼梯
		if(_scrollTops > _heTop && _scrollTops < _botTop){
			$('.main_content_nav').css('display','block');
		}
		else if(_scrollTops < _heTop || _scrollTops > _botTop){
			$('.main_content_nav').css('display','none');
		}
		
		//如果没有点击按钮 则执行里面的代码
		if (!isMoving) {		
			var _scrollTop = $(document).scrollTop();	//获取滚动条的位置		
			var index = 0;                              //给楼梯定义一个下标               
			$(".nav_itme_box").each(function(i,ele ){
				var _top = $(this).offset().top-100;    //获取每个楼层的位置   并向上偏移100
				//判断 滚动条件
				if ((_scrollTop + $(window).height()/2) > _top + $(this).height()/2) {
					index = i;                          //得到所有满足条件的下标       把最终满足条件的下标赋值给下面
				}
			})
			//把楼梯的按钮状态改变
			$(".main_nav_a").eq(index).removeClass("curs").addClass("curs").siblings().removeClass("curs");               
		}
	})		
}	
	
