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
	/*点击立即购买   和   去购物车结算*/
	$('#go_shop , #btn_buy').on('click',function(){
		location.href = "cart.html";
	})
	
//点击加入购物车
	$(".add_cart").click(function(){		
	/*点击加入购物车  弹出添加购物框*/
		$('#j_cartInfo').css('display','block')
		$('#CartProductNum').html($('#quantity').attr('value'))
		console.log(parseFloat( $('#pic2').html()));
		console.log( parseFloat($('#quantity').attr('value') ) );
		console.log()
		var pics = (parseFloat( $('#pic2').html() ) * ( parseFloat($('#quantity').attr('value') ) ) ).toFixed(2)
		$('#CartTotalMoney').html(pics)
		
		
		
		//将当前点击的商品加入购物车(使用cookie存储商品信息)
		var goodsSpName = $('#goodsSpName span').text();          //店铺名
		var goodsImg = $("#smallImg").attr('src');  //商品图片
		var goodsId = $("#goodsId").text();         //商品ID
		var goodsName = $(".goodsName").text();     //商品名称
		var goodsPrice = $("#pic1").text();         //市场价
		var price_shang = $("#pic2").text();        //会员价   
		var goodsStock = $("#STORAGE").text();      //库存数
		var goodsNum = $('#quantity').attr('value')    //一次性所添加的商品数
		//如果是第一次加入购物车(购物车中还没有商品, cookie中没有cart), 那就给一个空的数组
		//如果是第二次加入购物车(购物车中已经存在商品, cookie中存在cart), 那就在原来保存在cookie中的商品基础上添加新的商品 
		var goodsList = $.cookie("cart") ? JSON.parse( $.cookie("cart") ) : []; 
		
		//先判断购物车中是否存在我即将要添加的商品
		var isExists = false; //表示是否存在相同商品
		for (var i=0; i<goodsList.length; i++) {
			//如果存在相同的商品, 则把数量++, 不需要重新添加新的商品
			if (goodsImg == goodsList[i].img) {
				goodsList[i].num += parseInt(goodsNum);
				var num = goodsList[i].num
				isExists = true; //表示存在相同商品
			}
		}		
		//如果不存在相同商品, 则添加新商品
		if (!isExists) {
			//添加一个新商品到购物车
			var goods = {
				spName: goodsSpName,   //店铺名
				img: goodsImg,         //商品图片
				name: goodsName,	   //商品名
				price1: goodsPrice,    //市场价
				price2: price_shang,   //会员价
				stocks: goodsStock,    //库存数  
				num:  parseInt(goodsNum),				
			}
			goodsList.push(goods);
		}	
		
//		console.log( goods.num );
		$.cookie("cart", JSON.stringify(goodsList), {expires:22, path:"/"});
		console.log( $.cookie("cart") );
//		console.log( $.cookie("cart",{"goods":num}) );
		
	})	
	
	
	//清除
	$("#clearCart").click(function(){
		//删除cookie
		$.cookie("cart", "", {expires:0, path:"/"}); 
	})
	
})