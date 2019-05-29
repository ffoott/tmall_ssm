<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<style>
  .slider-indicator-wrap {
    position: absolute;
    bottom: 24px;
    left: 50%;
    margin-left: -36px;
    padding: 0;

  }

  .slider-indicator {
    width: 8px;
    height: 8px;
    background-color: #313a43;
    border-radius: 50%;
    margin-right: 12px;
    cursor: pointer;
  }

  .slider-indicator-active {
    position: relative;
    top: -2px;
    background-color: #f7f8f9;
    border: 2px solid #858b92;
    box-sizing: content-box;
  }

  .slider-control {
    display: none;
    position: absolute;
    top: 50%;
    margin-top: -31px;
    width: 28px;
    height: 62px;
    line-height: 62px;
    background-color: #000;
    opacity: 0.8;
    filter: alpha(opacity=80);
    color: #fff;
    font-size: 22px;
    font-family: simsun;
    text-align: center;
  }

  .slider-control-left {
    left: 0;
  }

  .slider-control-right {
    right: 0;
  }

  .slider-fade .slider-item {
    display: none;
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
  }

  .slider-slide .slider-item {
    position: absolute;
    top: 0;

    left: 100%;
    width: 100%;
    height: 100%;
  }
  .slider-item img {
    display: block;
    margin: 0 auto;
  }

  .fl {
    float: left;
  }
  .text-hidden {
    text-indent: -9999px;
    overflow: hidden;
  }

  .transition {
    -webkit-transition:  all 1s;
    -moz-transition:  all 1s;
    -ms-transition:  all 1s ;
    -o-transition:  all 1s ;
    transition:  all 1s ;
  }

  .carousel {
    position: relative;
    overflow: hidden;
    width: 728px;
    height: 504px;
  }
</style>


<div id="carousel-of-product"  class="carousel-of-product carousel slide1" >
  <div class="slider-container">
    <div class="slider-item">
      <!-- <a href="###" target="_blank"><img src="../img/focus-slider/loading.gif" data-src="https://gratisography.com/pictures/407_1.jpg" alt="" class="slider-img" /></a> -->
      <a href="###" target="_blank"><img src="../img/focus-slider/loading.gif" data-src="../img/focus-slider/1.jpg" alt="" class="slider-img" /></a>
    </div>
    <div class="slider-item">
      <a href="###" target="_blank"><img src="../img/focus-slider/loading.gif" data-src="../img/focus-slider/2.jpg" alt="" class="slider-img" /></a>
    </div>
    <div class="slider-item">
      <a href="###" target="_blank"><img src="../img/focus-slider/loading.gif" data-src="../img/focus-slider/3.jpg" alt="" class="slider-img" /></a>
    </div>
    <div class="slider-item">
      <a href="###" target="_blank"><img src="../img/focus-slider/loading.gif" data-src="../img/focus-slider/4.jpg" alt="" class="slider-img" /></a>
    </div>
  </div>
  <ol class="slider-indicator-wrap">
    <li class="slider-indicator text-hidden fl">1</li>
    <li class="slider-indicator text-hidden fl">2</li>
    <li class="slider-indicator text-hidden fl">3</li>
    <li class="slider-indicator text-hidden fl">4</li>
  </ol>
  <a href="javascript:;" class="slider-control slider-control-left">&lt;</a>
  <a href="javascript:;" class="slider-control slider-control-right">&gt;</a>
</div>


<script src="${pageContext.request.contextPath}/js/transition.js"></script>
<script src="${pageContext.request.contextPath}/js/showHide.js"></script>
<script src="${pageContext.request.contextPath}/js/move.js"></script>
<script src="${pageContext.request.contextPath}/js/slider.js"></script>

<script>

  let $focusSlider = $('#carousel-of-product');

  $focusSlider.items = {};
  $focusSlider.loadedItemNum = 0;
  $focusSlider.totalItemNum = $focusSlider.find('.slider-img').length;
  $focusSlider.on('slider-show', $focusSlider.loadItem = function(e, index, elem) {
    if ($focusSlider.items[index] !== 'loaded') {
      $focusSlider.trigger('slider-loadItem', [index, elem]);
    }
  });
  $focusSlider.on('slider-loadItem', function(e, index, elem) {
    // 按需加载
    let $img = $(elem).find('.slider-img');

    _loadImg($img.data('src'), function(url) {
      $img.attr('src', url);
      $focusSlider.items[index] = 'loaded';
      $focusSlider.loadedItemNum++;
      console.log(index + ': loaded');
      if ($focusSlider.loadedItemNum === $focusSlider.totalItemNum) {
        // 全部加载完毕
        $focusSlider.trigger('slider-itemsLoaded');
      }
    }, function(url) {
      console.log('从' + url + '加载图片失败');
      // 多加载一次
      // 显示备用图片
      $img.attr('src', '../img/focus-slider/placeholder.png');
    });
  });

  $focusSlider.on('slider-itemsLoaded', function(e) {
    console.log('itemsLoaded');
    // 清除事件
    $focusSlider.off('slider-show', $focusSlider.loadItem);
  });


  function _loadImg(url, imgLoaded, imgFailed) {
    let image = new Image();
    image.onerror = function() {
      if (typeof imgFailed === 'function') imgFailed(url);
    };

    image.onload = function() {
      if (typeof imgLoaded === 'function') imgLoaded(url);
    };
    // image.src=url;
    setTimeout(function() {
      image.src = url;
    }, 1000);

  }



  $focusSlider.slider({
    css3: true,
    js: false,
    animation: 'slide', // fade  slide
    activeIndex: 0,
    interval: 3000
  });
</script>