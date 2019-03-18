$(function(){
	
/*放大镜    开始*/
	var _smallImg = $(".jqzoom");             //图片区域
	var _smallArea = $("#smallArea");         //小区域
	var _bigImg = $(".bigImg");               //大图
	var _bigArea = $("#bigArea");             //大区域	
	//计算小区域_smallArea的宽高
	_smallArea.width( _smallImg.width()/_bigImg.width() * _bigArea.width() );
	_smallArea.height( _smallImg.height()/_bigImg.height() * _bigArea.height() );
	//放大系数(放大倍数)
	var scale = _bigImg.width() / _smallImg.width();
	
/*鼠标移入图片区域*/
	_smallImg.mousemove(function(e){					
		_smallArea.show();            //显示小区域	
		_bigArea.show();              //显示大区域			
		var x = e.pageX - _smallImg.offset().left - _smallArea.width()/2;     //移动小区域, 跟随鼠标移动
		var y = e.pageY - _smallImg.offset().top - _smallArea.height()/2;		
		//判断x不超出左边界,也不超出右边界
		if (x < 0) {
			x = 0;
		}
		else if (x > _smallImg.width() - _smallArea.width()) {
			x = _smallImg.width() - _smallArea.width();
		}		
		//判断y不超出上边界,也不超出下边界
		if (y < 0) {
			y = 0;
		}
		else if (y > _smallImg.height() - _smallArea.height()) {
			y = _smallImg.height() - _smallArea.height();
		}		
		_smallArea.css({left: x, top: y});		
		//移动大图
		_bigImg.css({left: -x*scale, top: -y*scale});						
	})	
	//鼠标移出
	_smallImg.mouseleave(function(){
		_smallArea.hide(); //隐藏小区域
		_bigArea.hide(); //隐藏大区域
	})
	/*放大镜    结束*/
	
	
	
	
/*图片  tab  切换*/
	$('.mini_list li img').mouseenter(function(){		
		var srcx=$(this).attr("src");
		$('#smallImg').attr('src',srcx);
		$('.bigArea img').attr('src',srcx);
		
	})
	
	
	
	
/*添加 /减少 购物件数*/
	$('.icon_add').on('click',function(){
		var num = $('#quantity').attr('value');
		num++;
		$('#quantity').attr('value',num)
	})
	$('.icon_rec').on('click',function(){
		var num = $('#quantity').attr('value');
		num--;
		$('#quantity').attr('value',num)
		if($('#quantity').attr('value') <= 1 ){
			$('#quantity').attr('value',1)
		}
	})
	
	
	
	
	/*点击 close_btn  关闭弹出购物框*/
	$('.close_btn').on('click',function(){
		$('#j_cartInfo').css('display','none')
	})	
	/*点击继续购物关闭 弹出购物框*/
	$('.close_a').on('click',function(){
		$('#j_cartInfo').css('display','none')
	})
	
//点击加入购物车
    $(".add_cart").click(function () {
        request_data = {
            'goodsid':$(this).attr('data-goodsid'),
			'goodsNum' : $('#quantity').attr('value')
        }
        var $that = $(this)
        console.log(request_data)
        $.get('/bbf/addgoods/',request_data,function (response) {
            console.log(response)
            if (response.status == -1){
                $.cookie('back','product_details',{expires:3,path: '/'})
                window.open('/bbf/login/','_self')
            }

        })
    })




	$(".add_cart").click(function(){		
	/*点击加入购物车  弹出添加购物框*/
		$('#j_cartInfo').css('display','block')
		$('#CartProductNum').html($('#quantity').attr('value'))

		var pics = (parseFloat( $('#pic2').html() ) * ( parseFloat($('#quantity').attr('value') ) ) ).toFixed(2)
		$('#CartTotalMoney').html(pics)

	})	
	
	
	//清除
	$("#clearCart").click(function(){
		//删除cookie
		$.cookie("cart", "", {expires:0, path:"/"}); 
	})
	
})