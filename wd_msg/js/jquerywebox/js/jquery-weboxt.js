/**
*
*	Plugin: Jquery.weboxt
*	Developer: Blank
*	Version: 1.0 Beta
*	Update: 2012.07.08
*
**/
$.extend({
    weboxt: function (option) {
        var _x, _y, m, allscreen = false;
        if (!option) {
            alert('options can\'t be empty');
            return;
        };
        if (!option['html'] && !option['iframe']) {
            alert('html attribute and iframe attribute can\'t be both empty');
            return;
        };
        option['parent'] = 'weboxt';
        option['locked'] = 'locked';
        $(document).ready(function (e) {
            $('.weboxt').remove();
            $('.background').remove();
            var width = option['width'] ? option['width'] : 400;
            var height = option['height'] ? option['height'] : 240;
            $('body').append('<div class="background" style="display:none;"></div><div class="weboxt" style="width:' + width + 'px;height:' + height + 'px;display:none;"><div id="inside" style="height:' + height + 'px;"><h1 id="locked" onselectstart="return false;">' + (option['title'] ? option['title'] : 'weboxt') + '<a class="span" href="javascript:void(0);"></a></h1>' + (option['iframe'] ? '<iframe class="w_iframe" src="' + option['iframe'] + '" frameborder="0" width="100%" scrolling="yes" style="border:none;overflow-x:hidden;height:' + parseInt(height - 30) + 'px;"></iframe>' : option['html'] ? option['html'] : '') + '</div></div>');
            if (navigator.userAgent.indexOf('MSIE 7') > 0 || navigator.userAgent.indexOf('MSIE 8') > 0) {
                $('.weboxt').css({ 'filter': 'progid:DXImageTransform.Microsoft.gradient(startColorstr=#55000000,endColorstr=#55000000)' });
            } if (option['bgvisibel']) {
                $('.background').fadeTo('slow', 0.3);
            };
            $('.weboxt').css({ display: 'block' });
            $('#' + option['locked'] + ' .span').click(function () {
                $('.weboxt').css({ display: 'none' });
                $('.background').css({ display: 'none' });
            });
            var marginLeft = parseInt(width / 2);
            var marginTop = parseInt(height / 2);
            var winWidth = parseInt($(window).width() / 2);
            var winHeight = parseInt($(window).height() / 2.2);
            var left = option['left'] ? option['left'] : winWidth - marginLeft;
            var top = option['top'] ? option['top'] : winHeight - marginTop;

            $('.weboxt').css({ left: left, top: top });
            $('#' + option['locked']).mousedown(function (e) {
                if (e.which) {
                    m = true;
                    _x = e.pageX - parseInt($('.weboxt').css('left'));
                    _y = e.pageY - parseInt($('.weboxt').css('top'));
                }
            }).dblclick(function () {
                if (allscreen) {
                    $('.weboxt').css({ height: height, width: width });
                    $('#inside').height(height);
                    $('.w_iframe').height(height - 30);
                    $('.weboxt').css({ left: left, top: top });
                    allscreen = false;
                } else {
                    allscreen = true;
                    var screenHeight = $(window).height();
                    var screenWidth = $(window).width(); $
						('.weboxt').css({ 'width': screenWidth - 18, 'height': screenHeight - 18, 'top': '0px', 'left': '0px' });
                    $('#inside').height(screenHeight - 20);
                    $('.w_iframe').height(screenHeight - 50);
                }
            });
        }).mousemove(function (e) {
            if (m && !allscreen) {
                var x = e.pageX - _x;
                var y = e.pageY - _y;
                $('.weboxt').css({ left: x });
                $('.weboxt').css({ top: y });
            }
        }).mouseup(function () {
            m = false;
        });
        $(window).resize(function () {
            if (allscreen) {
                var screenHeight = $(window).height();
                var screenWidth = $(window).width();
                $('.weboxt').css({ 'width': screenWidth - 18, 'height': screenHeight - 18, 'top': '0px', 'left': '0px' });
                $('#inside').height(screenHeight - 20);
                $('.w_iframe').height(screenHeight - 50);
            }
        });
    }
});