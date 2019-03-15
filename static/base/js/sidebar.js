$(function(){
	/*客服咨询*/
	$('.sidebar_kefu').mouseenter(function(){
		$('.drawer').show();
		$('.kefu_drawer').stop().animate({'left':-202},500)			
	})
	$('.sidebar_kefu').mouseleave(function(){
		$('.drawer').hide();
	})
	$('.close_kefu').click(function(){
		$('.drawer').hide();
		$('.kefu_drawer').stop().animate({'left':37},500)	
	})
	$('.sidebar_member').mouseenter(function(){
		$('.sm_handle').show()
		$('.kefu_drawer').stop().animate({'left':36},500)
		$('.sm_drawer').stop().animate({'left':-202},500)		
	})
	$('.sidebar_member').mouseleave(function(){
		$('.sm_handle').hide()
		$('.kefu_drawer').stop().animate({'left':-202},500)				
		$('.sm_drawer').stop().animate({'left':36},500)
	})
	/*客服咨询 结束*/
	
	/*返回顶部*/
	$('.icon_top').click(function(){
		$('html body').stop().animate({scrollTop:0},300)
	})

	/*客服电话回拨弹出框*/
	$('.mid_close').on('click',function(){
		$('.kefu_pop_mid').stop().animate({'left':0,'opacity':0,'display':'none','width':91,'height':32},500,function(){
			$('.kefu_pop_small').css('opacity',1)
		})
	})
	$('.kefu_pop_small').on('click',function(){
		$('.kefu_pop_big').stop().animate({'top':50, 'left':405,'opacity':1,'display':'block','width':541,'height':268},500,function(){
			$('.kefu_pop_small').css('opacity',0)
		})
	})
	$('.big_close').on('click',function(){
		$('.kefu_pop_big').stop().animate({'top':'100%', 'left':100,'opacity':0,'display':'none','width':140,'height':86},500,function(){
			$('.kefu_pop_mid').css({'opacity':1,'left':80, 'bottom':20,'height':140,'width':86})
		})		
	})
	/*客服电话回拨弹出框  结束*/
	
	
})