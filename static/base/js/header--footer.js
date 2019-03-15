
$(function(){
	//页头顶部栏开始
	//鼠标移入  a 标签  改变字体颜色
	$('.top_nav a').mouseover(function(){
		$(this).css('color', '#ec478e')
	})
	$('.top_nav a').mouseout(function(){
		if($(this).index() != 1){
			$(this).css('color', '#a8a8a8')
		}
	})

	//鼠标移入  我的八方  显示  下拉列表
	$('.top_right_menu').mouseover(function(){
		$(this).addClass('bor')
		$('.top_r_dingdan').show()
	})
	$('.top_right_menu').mouseout(function(){
		$(this).removeClass('bor')
		$('.top_r_dingdan').hide()
	})
	//页头顶部栏结束
	
	//鼠标移入  展开分类
	$('.sor_item .sor_item_box').mouseenter(function(){
		$(this).find('.item_box_list').show()
	})
	$('.sor_item .sor_item_box').mouseleave(function(){
		$(this).find('.item_box_list').hide()
	})
	
})




















