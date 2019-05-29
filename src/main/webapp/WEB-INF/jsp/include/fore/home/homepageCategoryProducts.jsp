<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:if test="${empty param.categorycount}">
	<c:set var="categorycount" scope="page" value="100"/>
</c:if>

<c:if test="${!empty param.categorycount}">
	<c:set var="categorycount" scope="page" value="${param.categorycount}"/>
</c:if>

<div class="homepageCategoryProducts">
	<c:forEach items="${cs}" var="c" varStatus="stc">
		<c:if test="${stc.count<=categorycount}">
			<div class="eachHomepageCategoryProducts">
				<div class="left-mark"></div>
				<span class="categoryTitle">${c.name}</span>
				<br>
				<c:forEach items="${c.products}" var="p" varStatus="st">
					<c:if test="${st.count<=5}">
						<div class="productItem" >
							<a href="foreproduct?pid=${p.id}"><img width="100px" src="../img/loading.gif" img_src="img/productSingle_middle/${p.firstProductImage.id}.jpg"></a>
							<a class="productItemDescLink" href="foreproduct?pid=${p.id}">
								<span class="productItemDesc">[热销]
								${fn:substring(p.name, 0, 20)}
								</span>
						    </a>
							<span class="productPrice">
								<fmt:formatNumber type="number" value="${p.promotePrice}" minFractionDigits="2"/>
							</span>
						</div>
					</c:if>				
				</c:forEach>
				<div style="clear:both"></div>
			</div>
		</c:if>
	</c:forEach>
	
	
	<img id="endpng" class="endpng" src="img/site/end.png">

</div>

<script>
	var lazyImg=document.querySelectorAll(".productItem img");
	var lazyImgLen = lazyImg.length;
	var lazyImgArray = [];
	var winowBroswerHeight = document.documentElement.clientHeight;
	// 初始第一屏的图片
	loadImg();
	//滚动时候加载图片
	window.onscroll=loadImg;

	// 获取目录对象离 document 文档顶部的距离
	var lastTopDistance=0;
	function getTopDistance(obj) {
		var TopDistance = 0;
		while (obj) {
			lastTopDistance=
			TopDistance += obj.offsetTop;
		obj = obj.offsetParent;
		}
		return TopDistance;
	}

	// 获取滚动条的滚动距离
	function getScrollTop() {
		return document.documentElement.scrollTop || document.body.scrollTop;
	}

	for (var i = 0; i < lazyImgLen; i++) {
		lazyImg[i].loaded = false; // 标记为未加载
	}
	function loadImg() {
		for (let i = 0; i < lazyImgLen; i++) {
			let getTD = getTopDistance(lazyImg[i]);
			let getST = getScrollTop();
			if (!lazyImg[i].loaded && getST < getTD && getTD<(getST+window.innerHeight)) {
				setTimeout(function(){
					lazyImg[i].src = lazyImg[i].getAttribute("img_src");
				},2000);


				// lazyImg[i].classList.add("transition");
				lazyImg[i].loaded = true; // 标记为已加载
			}
		}
	}
</script>