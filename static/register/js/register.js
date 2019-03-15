
$(function(){
/*手机/邮箱注册切换*/
	$('.b_tab li').on('click',function(){
		$(this).removeClass("cur").addClass('cur').siblings().removeClass()	
	})

/*表单验证     开始*/
	var rdt_true = false;
	var rpd1_true = false;
	var rpd2_true = false;
	var idn_true = false;
	var sml_true = false;
	/*验证手机号*/
		$('#r_mobile').blur(function(){
			var pattern =/^(13|15|18)\d{9}$/;
			if(!(pattern.test($('#r_mobile').val()))){
				$('#r_mobileTip').hide();
				$('#r_mobileTip1').show();
				$('#r_mobileTip2').hide();
			}else if(pattern.test($('#r_mobile').val())){
				$('#r_mobileTip').hide();
				$('#r_mobileTip1').hide();
				$('#r_mobileTip2').show();
				rdt_true = true;				
			}
		})	
		$('#r_mobile').focus(function(){
			$('#r_mobileTip').show();
			$('#r_mobileTip1').hide();
			$('#r_mobileTip2').hide();
		})		
	/*密码验证*/
		$('#r_pwd').blur(function(){
			var pattern =/^\w{6,16}$/;	
			if(!(pattern.test($('#r_pwd').val()))){
				$('#r_pwdTip').hide();
				$('#r_pwdTip1').show();
				$('#r_pwdTip2').hide();
			}else if(pattern.test($('#r_pwd').val())){
				$('#r_pwdTip').hide();
				$('#r_pwdTip1').hide();
				$('#r_pwdTip2').show();
				rpd1_true = true;
			}
		})	
		$('#r_pwd').focus(function(){
				$('#r_pwdTip').show();
				$('#r_pwdTip1').hide();
				$('#r_pwdTip2').hide();
		})		
	/*确认密码验证*/
		$('#r_pwd2').blur(function(){
			var pattern =/^\w{6,16}$/;	
			if( !(pattern.test($('#r_pwd').val()) || !($('#r_pwd2').val() == $('#r_pwd').val()))){
				$('#r_pwd2Tip').hide();
				$('#r_pwd2Tip1').show();
				$('#r_pwd2Tip2').hide();
			}else if(pattern.test($('#r_pwd').val()) &&  ($('#r_pwd2').val() == $('#r_pwd').val())){
				$('#r_pwd2Tip').hide();
				$('#r_pwd2Tip1').hide();
				$('#r_pwd2Tip2').show();
				rpd2_true = true;
			}
		})	
		$('#r_pwd2').focus(function(){
				$('#r_pwd2Tip').show();
				$('#r_pwd2Tip1').hide();
				$('#r_pwd2Tip2').hide();
		})					
	/*获取验证码*/
		$('.ident_num').on('click',function(){
			var ret="";
			for(var i=0;i<4;i++){
				var isTrue=parseInt(Math.random()*100)%3;//0 出现数字     1大写字母    2小写字母  
				if(isTrue==0){
					var num=parseInt(Math.random()*100)%10+48;
				}else if(isTrue==1){
					var num=parseInt(Math.random()*100)%26+65;
				}else{
					var num=parseInt(Math.random()*100)%26+97;
				}
				var s=String.fromCharCode(num);
				ret=ret.concat(s);
			}			
			$('.ident_num').val(ret)		
		}).triggerHandler('click');   /*刚打开页面自动执行一次*/		
		$('#r_licence').blur(function(){
			if( $('#r_licence').val() == $('.ident_num').val() ){
				idn_true = true;
			}
			
		})
	
	/*获取手机验证码*/	
		$('#sendMobile').on('click',function(){
			$('#sp_checkMobile').show();
			var ret="";
			for(var i=0;i<4;i++){
				s =parseInt( Math.random()*10 );
				ret=ret.concat(s);
			}
			$('#sp_checkMobile .math').html(ret);
		})
		$('#mobileLicence').blur(function(){
			$('#sp_checkMobile').hide();
			if( $('#mobileLicence').val() &&  $('#mobileLicence').val() == $('.math').html()  ){
				sml_true = true;
			}				
		})	
/*表单验证     结束*/	


/*点击注册按钮*/
	$('.reg_btn').on('click',function(){
		console.log('jldksjf ')
		var users = $.cookie("users") ? JSON.parse($.cookie("users")) : [];
		for (var i=0; i<users.length; i++) {			
			if ( users[i].name == $("#RUserName").val() ) {
				$(".name_remind").html("用户名已存在! 不能注册相同的用户");
				return;
			}
		}		
		if(rdt_true  && rpd1_true && rpd2_true && idn_true && sml_true){
			alert('注册成功');
			window.setTimeout(function(){
				window.location.href = "login.html";
			},2000);
			var att = {
				name: $('#r_mobile').val(),
				pwd: $('#r_pwd').val(),
			}
			users.push(att);
			$.cookie("users", JSON.stringify(users), {expires:22, path:"/"});
			
		}
		else if(!rdt_true){
			alert('手机号输入有误');
		}
		else if(!rpd1_true){
			alert('密码格式有误');
		}
		else if(!rpd2_true){
			alert('确认密码有误');
		}
		else if(!idn_true){
			alert('验证码输入有误');
		}
		else if(!sml_true){
			alert('手机验证码输入有误');
		}
				
	})
	
	
	
	
	
	
	
})
