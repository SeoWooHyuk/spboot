
	// 탭바 스크립트
    $(document).ready(function(){
	  
        $('ul.tabs li').click(function(){
            var tab_id = $(this).attr('data-tab');
    
            $('ul.tabs li').removeClass('current');
            $('.tab-content').removeClass('current');
    
            $(this).addClass('current');
            $("#"+tab_id).addClass('current');
        })
          
    })
    
    $(document).ready(function(){
    
        $(function(){        
            var slideCount = $('.slider ul li').length;
            var slideWidth = $('.slider ul li').width();
            var slideHeight = $('.slider ul li').height();
            var sliderUlWidth = slideCount * slideWidth;
            
            $('.slider').css({ width: slideWidth, height: slideHeight });
            
            $('.slider ul').css({ width: sliderUlWidth, marginLeft: - slideWidth });
            
            $('.slider ul li:last-child').prependTo('slider ul');
    
            function moveLeft() {
                var slideWidth1 = $('.slider ul li').width();
                $('.slider ul').stop().animate({
                    left: + slideWidth1
                }, 500, function () {
                    $('.slider ul li:last-child').prependTo('.slider ul');
                    $('.slider ul').css('left', '');
                });
            };
    
            function moveRight() {
                var slideWidth1 = $('.slider ul li').width();
                $('.slider ul').stop().animate({
                    left: - slideWidth1
                }, 500, function () {
                    $('.slider ul li:first-child').appendTo('.slider ul');
                    $('.slider ul').css('left','');
                });
            };
    
            //버튼 보이기 안보이기
            $(".control_next").hide();
            $(".control_prev").hide();
            
            $(".control_next").stop().click(function () {
                    moveRight();
            });
            
            $(".control_prev").stop().click(function () {
                    moveLeft();
            });
    
    
            
            $(".banner_sec2").children().hover(function () { 
          
                $(this).children(".control_next").show(function () {
                var hover_in = "#"+$(this).closest('div').attr('id');
                $(hover_in).children(".control_next").stop().click(function () {
                    moveRight(hover_in);
                });
            });
    
            $(this).children(".control_prev").show(function()
            {
                var hover_in = "#"+$(this).closest('div').attr('id');
                $(hover_in).children(".control_prev").stop().click(function () {
                    moveLeft(hover_in);
                });
            });  
    
                
            }, function() {
              
                $(this).children(".control_next").hide();
                $(this).children(".control_prev").hide();
               
            });
      
        
        function run() {
        return  setInterval(function () {
        moveRight()
         }, 4500);
      };
    
        let runs =  run();
        
        $("#slider").stop().mouseover(function()
        {
        clearInterval(runs);   
        });
    
        $("#slider").mouseleave(function()
        {
            runs =  run();
        }); 
    
        });
    
    });
    
    