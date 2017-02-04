if(typeof $contextPath == 'undefined'){
	var $contextPath = "";
}else{
	$contextPath = $contextPath+"/template/h5020/code/";
}
function include(url){
  document.write('<script src="'+$contextPath+url+'"></script>');
  return false ;
}

/* cookie.JS
 ========================================================*/
include('js/jquery.cookie.js');


/* DEVICE.JS
 ========================================================*/
include('js/device.min.js');

/* Stick up menu
 ========================================================*/
include('js/tmstickup.js');
$(window).load(function () {
    if ($('html').hasClass('desktop')) {
        $('#stuck_container').TMStickUp({
        })
    }
});

/* Stellar.js
 ========================================================*/
include('js/jquery.stellar.js');
$(document).ready(function () {
    if ($('html').hasClass('desktop')) {
        $.stellar({
            horizontalScrolling: false
        });
    }
});


/* Easing library
 ========================================================*/
include('js/jquery.easing.1.3.js');

/* ToTop
 ========================================================*/
include('js/jquery.ui.totop.js');
$(function () {
    $().UItoTop({ easingType: 'easeOutQuart' });
});


/* DEVICE.JS AND SMOOTH SCROLLIG
 ========================================================*/
include('js/jquery.mousewheel.min.js');
include('js/jquery.simplr.smoothscroll.min.js');
$(function () {
    if ($('html').hasClass('desktop')) {
        $.srSmoothscroll({
            step: 150,
            speed: 800
        });
    }
});

/* Copyright Year
 ========================================================*/
var currentYear = (new Date).getFullYear();
$(document).ready(function () {
    $("#copyright-year").text((new Date).getFullYear());
});


/* Superfish menu
 ========================================================*/
include('js/superfish.js');
include('js/jquery.mobilemenu.js');

/* Unveil
 ========================================================*/
include('js/jquery.unveil.js');
$(document).ready(function () {
    $(".lazy-img").find('img').unveil(200, function () {
        $(this).load(function () {
            $(this).addClass("lazy-loaded");
        });
    });
});

/* Google Map
 ========================================================*/
/*
$(window).load()
{
    if ($('#useso-map').length > 0) {
        var mapOptions = {
            zoom: 14,
            center: new useso.maps.LatLng(parseFloat(40.646197), parseFloat(-73.9724068, 14)),
            scrollwheel: false
        }
        new useso.maps.Map(document.getElementById("useso-map"), mapOptions);
    }
}
*/
/* Orientation tablet fix
 ========================================================*/
$(function () {
    // IPad/IPhone
    var viewportmeta = document.querySelector && document.querySelector('meta[name="viewport"]'),
        ua = navigator.userAgent,

        gestureStart = function () {
            viewportmeta.content = "width=device-width, minimum-scale=0.25, maximum-scale=1.6, initial-scale=1.0";
        },

        scaleFix = function () {
            if (viewportmeta && /iPhone|iPad/.test(ua) && !/Opera Mini/.test(ua)) {
                viewportmeta.content = "width=device-width, minimum-scale=1.0, maximum-scale=1.0";
                document.addEventListener("gesturestart", gestureStart, false);
            }
        };

    scaleFix();
    // Menu Android
    if (window.orientation != undefined) {
        var regM = /ipod|ipad|iphone/gi,
            result = ua.match(regM);
        if (!result) {
            $('.sf-menu li').each(function () {
                if ($(">ul", this)[0]) {
                    $(">a", this).toggle(
                        function () {
                            return false;
                        },
                        function () {
                            window.location.href = $(this).attr("href");
                        }
                    );
                }
            })
        }
    }
});
var ua = navigator.userAgent.toLocaleLowerCase(),
    regV = /ipod|ipad|iphone/gi,
    result = ua.match(regV),
    userScale = "";
if (!result) {
    userScale = ",user-scalable=0"
}
document.write('<meta name="viewport" content="width=device-width,initial-scale=1.0' + userScale + '">')

$(document).ready(function () {
    var obj;

    if ((obj = $('#camera')).length > 0) {
        obj.camera({
            autoAdvance: true,
            height: '43.125%',
            minHeight: '280px',
            pagination: true,
            thumbnails: false,
            playPause: false,
            hover: false,
            loader: 'none',
            navigation: false,
            navigationHover: false,
            mobileNavHover: false,
            fx: 'simpleFade',
            
        })
    }

    if ((obj = $('#camera2')).length > 0) {
        obj.camera({
            autoAdvance: true,
            height: '80px',
            minHeight: '80px',
            pagination: false,
            thumbnails: false,
            playPause: false,
            hover: false,
            loader: 'none',
            navigation: false,
            navigationHover: false,
            mobileNavHover: false,
            fx: 'simpleFade',

        })
    }

    if ((obj = $('.owl')).length > 0) {
        obj.owlCarousel({
            navigation: false,
            autoPlay: true,
            stopOnHover: true,
            slideSpeed: 300,
            pagination: true,
            paginationSpeed: 400,
            singleItem: true,
            navigationText: ["", ""]
        })
    }
    
    if ((obj = $('.thumbnail')).length > 0) {
        obj.touchTouch();
    }
});

