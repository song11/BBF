$(function () {
    function no_login() {
		$('.no_login').cookie('back','cart',{expires:3,path: '/'})
	   	window.open('/bbf/login/','_self')
		console.log('back已执行')
    }


    // $('.main_sh_wp').width(innerWidth)

    total()
    //单个商品选中/取消
    $('.cart .confirm-wrapper').click(function () {
        var $span = $(this).find('span')
        request_data = {
            'cartid': $(this).attr('data-cardid')
        }
        $.get('/bbf/changecartselect/', request_data, function (response) {
            console.log(response)

            if (response.status == 1) {
                if (response.isselect) {
                    $span.removeClass('no').addClass('glyphicon glyphicon-ok')
                } else {
                    $span.removeClass('glyphicon glyphicon-ok').addClass('no')
                }

                total()
            }
        })
    })
    //全选按钮的选中/取消
    $('.bill .all').click(function () {
        var isall = $(this).attr('data-all')    //获取
        $span = $(this).find('span')
        isall = (isall == 'false') ? true : false //取反

        $(this).attr('data-all', isall)  //设置

        if (isall) {
            $span.removeClass('no').addClass('glyphicon glyphicon-ok')
        } else {
            $span.removeClass('glyphicon glyphicon-ok').addClass('no')
        }
        request_data = {
            'isall': isall
        }
        $.get('/bbf/changecartall/', request_data, function (response) {
            console.log(response)
            if (response.status == 1) {
                $('.confirm-wrapper').each(function () {
                    if (isall) {
                        $(this).find('span').removeClass('no').addClass('glyphicon glyphicon-ok')
                    } else {
                        $(this).find('span').removeClass('glyphicon glyphicon-ok').addClass('no')
                    }
                    total()
                })
            }
        })
    })



// #correct code# =========================================================

	//点击加操作
    $('.bt-wrapper>.add').click(function () {
        request_data = {
            'goodsid':$(this).attr('data-goodsid')
        }
        var $that = $(this)

        console.log(request_data)
        $.get('/bbf/addcart/',request_data,function (response) {
            console.log(response)
            if (response.status == 1){
                if (response.number) {
                    $that.prev().html(response.number)
                    $that.prev().prev().show()
                }
            }
        })
    })

    //点击减操作
    $('.bt-wrapper>.rec').click(function () {
        var $that = $(this)
        request_data = {
            'goodsid':$(this).attr('data-goodsid')
        }
        $.get('/bbf/subcart/',request_data,function (response) {
            console.log(response)
            if (response.status == 1) {
                if (response.number){
                    $that.next().html(response.number)
                }
                else {
                    $that.hide()
                }
            }
        })
    })


	/*商品总价*/
	// function total(){
	// 	var x=[];
	// 	var amount = 0
	// 	$(".st").each(function(i){
	// 		x.push($(this).html());
	// 	})
	// 	for ( var i = 0; i < x.length; i++) {
	// 		amount += parseInt(x[i])
	// 	}
	// 	return $('.amount').html(amount.toFixed(2))
	// }
    function total() {
        var sum = 0
        var count = 0

    $('.cart tr').each(function () {
        var $confirm = $(this).find('.confirm-wrapper')
        var $content = $(this).find('.content-wrapper')

        if ($confirm.find('.glyphicon').length){

            var price = $content.find('.s_price').attr('data-price')
            var num = $content.find('.num').attr('data-number')

            console.log(price,num)
            sum += num * price
            console.log('总价:',sum)
            count += num
            console.log('总数量:',count)
            // $.cookie('count','count',{expires:3,path: '/'})
            // window.open('/bbf/base/','_self')
        }
    })
    $('.bill .total .amount').html(sum)
    }
})

