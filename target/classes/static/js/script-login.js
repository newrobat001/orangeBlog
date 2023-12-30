$(document).ready(function(){
			$(".veen .rgstr-btn button").click(function(){
				$('.veen .wrapper').addClass('move');
				// $('.body').css('background','#e0b722');
				$('.body').css('background','rgb(103, 148, 255)');
				$(".veen .login-btn button").removeClass('active');
				$(this).addClass('active');

			});
			$(".veen .login-btn button").click(function(){
				$('.veen .wrapper').removeClass('move');
				// $('.body').css('background','#ff4931');
				$('.body').css('background','rgb(255, 173, 124)');
				$(".veen .rgstr-btn button").removeClass('active');
				$(this).addClass('active');
			});
});