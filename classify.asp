<!--#include file="inc/conn.asp"-->
<!--#include file="inc/Config.Asp"-->
<!--#include file="inc/Function.asp"-->
<!--#include file="inc/Inc.Asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />

<title><%=t%></title>
	<meta name="keywords" content="<%=k%>" />
	<meta name="description" content="<%=d%>" />
<link rel="icon" href="icon.ico" type="image/x-icon"/>
<link rel="stylesheet" href="xgwl/css/lib/bootstrap.min.css" />
<link rel="stylesheet" href="xgwl/css/lib/animate.css"/>
<link rel="stylesheet" href="xgwl/css/lib/swiper-4.3.5.min.css"/>
<link rel="stylesheet" href="xgwl/css/xgwl.css"/>
<link rel="stylesheet" href="xgwl/css/list.css"/>
<link rel="stylesheet" href="xgwl/css/base.css"/>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="xgwl/css/lib/html5shiv.min.js"></script>
      <script src="xgwl/css/lib/respond.min.js"></script>
    <![endif]-->

</head>

<body style="overflow-x:hidden;">
<!---->
<div class="zero-navbar">

    <div class="container ">
        <div class="row">
            <div class="col-xs-10">
                <div class=" input-group">
                    <input class="form-control s-key" value="">
                    <span class="input-group-btn">
                        <button class="btn s-btn" type="button"><i class="pico pico-magw "></i><!--搜索--></button>
                    </span>
                </div>
                <!--<img src="xgwl/img/snailgarden.png" class="pagetit">-->
            </div>
            <div class="col-xs-2">
                <a href="tel:13585759393" target="blank" class="tel"><img src="xgwl/img/menu4.png"></a>
            </div>

        </div>
    </div>
</div>
<!--广告轮播-->
<!-- Swiper -->
  <div class="swiper-container swiper-container-horizontal">
    <div class="swiper-wrapper">
      <div class="swiper-slide swiper-slide-active" style="width: 414px;"><img src="/xgwl/img/ad/001.png"></div>
      <div class="swiper-slide swiper-slide-next" style="width: 414px;"><img src="/xgwl/img/ad/002.png"></div>

    </div>
    <!-- Add Pagination -->
    <div class="swiper-pagination swiper-pagination-bullets"><span class="swiper-pagination-bullet swiper-pagination-bullet-active"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span></div>
  <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>



<!--推荐课程-->

<!--精品课程-->

<!--免费课程-->

<div class="bottom"></div>
<!--底部菜单-->
<!--#include file="inc/footer.Asp"-->
<script src="xgwl/js/lib/jquery.js"></script>
<script src="xgwl/js/lib/bootstrap.min.js"></script>
<script src="xgwl/js/lib/wow.min.js"></script>
<script src="xgwl/js/lib/swiper-4.3.5.min.js"></script>
<script>
if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))){
	new WOW().init();
};
</script>

<script src="xgwl/js/base.js"></script>
</body>
</html>
