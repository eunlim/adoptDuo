<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6ab82ffa0382bc2ff43fee8d8a9de90b"></script>
<div id="map" style="width: 1200px; height: 500px;"></div>

<p>
	<button onclick="setCenter()">지도 중심좌표 이동시키기</button>
	<button onclick="panTo()">지도 중심좌표 부드럽게 이동시키기</button>
</p>

<script>
	var MARKER_WIDTH = 33, // 기본, 클릭 마커의 너비
		MARKER_HEIGHT = 36, // 기본, 클릭 마커의 높이
		OFFSET_X = 12, // 기본, 클릭 마커의 기준 X좌표
		OFFSET_Y = MARKER_HEIGHT, // 기본, 클릭 마커의 기준 Y좌표
		OVER_MARKER_WIDTH = 40, // 오버 마커의 너비
		OVER_MARKER_HEIGHT = 42, // 오버 마커의 높이
		OVER_OFFSET_X = 13, // 오버 마커의 기준 X좌표
		OVER_OFFSET_Y = OVER_MARKER_HEIGHT, // 오버 마커의 기준 Y좌표
		SPRITE_MARKER_URL = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markers_sprites2.png', // 스프라이트 마커 이미지 URL
		SPRITE_WIDTH = 126, // 스프라이트 이미지 너비
		SPRITE_HEIGHT = 146, // 스프라이트 이미지 높이
		SPRITE_GAP = 10; // 스프라이트 이미지에서 마커간 간격

	var markerSize = new kakao.maps.Size(MARKER_WIDTH, MARKER_HEIGHT), // 기본, 클릭 마커의 크기
		markerOffset = new kakao.maps.Point(OFFSET_X, OFFSET_Y), // 기본, 클릭 마커의 기준좌표
		overMarkerSize = new kakao.maps.Size(OVER_MARKER_WIDTH, OVER_MARKER_HEIGHT), // 오버 마커의 크기
		overMarkerOffset = new kakao.maps.Point(OVER_OFFSET_X, OVER_OFFSET_Y), // 오버 마커의 기준 좌표
		spriteImageSize = new kakao.maps.Size(SPRITE_WIDTH, SPRITE_HEIGHT); // 스프라이트 이미지의 크기

	var positions = [ // 마커의 위치
		
		{
			key : 0,
			title : "예산군111",
			location : new kakao.maps.LatLng(36.682537, 126.849548)
		},
		
		{
			key : 1,
			title : "예산군222",
			location : new kakao.maps.LatLng(36.682709, 126.849526)
		},
		
		{
			key : 2,
			title : "예산군333",
			location : new kakao.maps.LatLng(36.683295, 126.849926) 
		},
		
	], 
	
	selectedMarker = null; // 클릭한 마커를 담을 변수

	var container = document.getElementById('map');
	var options = {
		center : new kakao.maps.LatLng(36.680871, 126.846594),
		level : 3
	};

	var map = new kakao.maps.Map(container, options);

	// 커스텀 오버레이에 표시할 컨텐츠 입니다
	// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
	// 별도의 이벤트 메소드를 제공하지 않습니다 
	var overlays = [];            
	var marker = null;
	
	// 지도 위에 마커를 표시합니다
	for (var i = 0, len = positions.length; i < len; i++) {
	    var gapX = (MARKER_WIDTH + SPRITE_GAP), // 스프라이트 이미지에서 마커로 사용할 이미지 X좌표 간격 값
	        originY = (MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 기본, 클릭 마커로 사용할 Y좌표 값
	        overOriginY = (OVER_MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 오버 마커로 사용할 Y좌표 값
	        normalOrigin = new kakao.maps.Point(0, originY), // 스프라이트 이미지에서 기본 마커로 사용할 영역의 좌상단 좌표
	        clickOrigin = new kakao.maps.Point(gapX, originY), // 스프라이트 이미지에서 마우스오버 마커로 사용할 영역의 좌상단 좌표
	        overOrigin = new kakao.maps.Point(gapX * 2, overOriginY); // 스프라이트 이미지에서 클릭 마커로 사용할 영역의 좌상단 좌표
	        
	    // 마커를 생성하고 지도위에 표시합니다 
	    addMarker(positions[i], normalOrigin, overOrigin, clickOrigin);
	}
	
	// 마커를 생성하고 지도 위에 표시하고, 마커에 mouseover, mouseout, click 이벤트를 등록하는 함수입니다
	function addMarker(position, normalOrigin, overOrigin, clickOrigin) {
		
		// 기본 마커이미지, 오버 마커이미지, 클릭 마커이미지를 생성합니다
    	var normalImage = createMarkerImage(markerSize, markerOffset, normalOrigin),
        	overImage = createMarkerImage(overMarkerSize, overMarkerOffset, overOrigin),
        	clickImage = createMarkerImage(markerSize, markerOffset, clickOrigin);
		
	    // 마커를 생성하고 이미지는 기본 마커 이미지를 사용합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: position.location,
	        image: normalImage
	    });
	    
	    var content = '<div class="wrap">' + 
			        '    <div class="info">' + 
			        '        <div class="title">' + 
			        '            '+position.title+'' + 
			        '            <div class="close" onclick="closeOverlay('+position.key+', '+null+')" title="닫기"></div>' + 
			        '        </div>' + 
			        '        <div class="body">' + 
			        '            <div class="img">' +
			        '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
			        '           </div>' + 
			        '            <div class="desc">' + 
			        '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
			        '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
			        '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
			        '            </div>' + 
			        '        </div>' + 
			        '    </div>' +    
			        '</div>';
	    
	    var createOverlay = createOrverlay(position, content);
	 	overlays.push(createOverlay);
 	 	//초기화
	 	closeOverlay(position.key, null);
	 	
	    // 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다
	    marker.normalImage = normalImage;

	    // 마커에 mouseover 이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'mouseover', function() {

	        // 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
	        // 마커의 이미지를 오버 이미지로 변경합니다
	        if (!selectedMarker || selectedMarker !== marker) {
	            marker.setImage(overImage);
	        }
	    });

	    // 마커에 mouseout 이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'mouseout', function() {

	        // 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면
	        // 마커의 이미지를 기본 이미지로 변경합니다
	        if (!selectedMarker || selectedMarker !== marker) {
	            marker.setImage(normalImage);
	        }
	    });

	    // 마커에 click 이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'click', function() {
	        // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
	        // 마커의 이미지를 클릭 이미지로 변경합니다
	        if (!selectedMarker || selectedMarker !== marker) {

	            // 클릭된 마커 객체가 null이 아니면
	            // 클릭된 마커의 이미지를 기본 이미지로 변경하고
	            !!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);

	            // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
	            marker.setImage(clickImage);
	            setOverlays(position.key, map);
	        } 

	        // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
	        selectedMarker = marker;
	    });
	    
	}

	// MakrerImage 객체를 생성하여 반환하는 함수입니다
	function createMarkerImage(markerSize, offset, spriteOrigin) {
	    var markerImage = new kakao.maps.MarkerImage(
	        SPRITE_MARKER_URL, // 스프라이트 마커 이미지 URL
	        markerSize, // 마커의 크기
	        {
	            offset: offset, // 마커 이미지에서의 기준 좌표
	            spriteOrigin: spriteOrigin, // 스트라이프 이미지 중 사용할 영역의 좌상단 좌표
	            spriteSize: spriteImageSize // 스프라이트 이미지의 크기
	        }
	    );
	    
	    return markerImage;
	}
	
	function createOrverlay(position, content) {
		// 마커 위에 커스텀오버레이를 표시합니다
	 	// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
	 	var overlay = new kakao.maps.CustomOverlay({
	     	map: map,
	     	content: content,
	     	position: position.location       
	 	});
		
	    return overlay;  
	}   
	
	
	function setOverlays(key, map) {
		overlays[key].setMap(map);	
	}
	
	
	// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	function closeOverlay(key, map) {
		setOverlays(key, map);     
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	function setCenter() {
		// 이동할 위도 경도 위치를 생성합니다 
		var moveLatLon = new kakao.maps.LatLng(36.680871, 126.846594);

		// 지도 중심을 이동 시킵니다
		map.setCenter(moveLatLon);
	}

	function panTo() {
		// 이동할 위도 경도 위치를 생성합니다 
		var moveLatLon = new kakao.maps.LatLng(36.682671, 126.848849);

		// 지도 중심을 부드럽게 이동시킵니다
		// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		map.panTo(moveLatLon);
	}

	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
</script>
