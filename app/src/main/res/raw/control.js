var path;
var startX;
var startY;
var moveX;
var moveY;
var endX;
var endY;
var layoutHeight;
var layoutWidth;
var pages;
var moveTemp = 0;
var tempX = 0;
var currentPage;
var tempPosition = 0;
var chapterSize;
var size;
var bookSize;
var chapterSize;
var chapterTotleNum;
var chap_page;
var now_page;
var total_page;
var flag_next_before;
var brightness;
var move = 0;
var leftPosition = 0;
var preventMove =0;
var showMenu =1;
var bookIdentifier;
var bookmarkIndexArray = new Array();
var injectBackJS = "unInjectBackJS";
var inReadingPage = "inReadingPage";
var androidLongtouch = 0;
var multipleTouch = 0;
var bookmark = new Array();
var androidVersion = 0;
var Longtouch = 0;
var chapterIndex =0;
var floatrightlayoutWidth;
var flag_onEnd = 0;
var flag_menushow = 0;
var flag_menuhide = 0;
var gapsize = 1;
var flag_onStopend = 0;
var videotouch = 0;
var minbrightness = 0.7;//add kao 20130805 设置亮度最小值
var chapterTitle = "";//章节名
var diviceModel = ""; //设备型号
/** Inject span tag */
function injectSpanTag(pArray){
    for (var j=0;j<pArray.length;j++){
        var pTag = pArray[j][0];
        
        var pIndex = pArray[j][1];
        if (typeof($(pTag).find("afdbooktag")[0])=='undefined'||$($(pTag).find("afdbooktag")[0]).attr("id")!='afd_span'){
            var text = $(pTag).html();
            var svgElements = getSvgTag(pTag,'svg');
            var canvasElements = getSvgTag(pTag,'canvas');
            text = "<afdbooktag id='afd_span'>"+text+"</afdbooktag>";
            text = text.replace(/,/g,"</afdbooktag>afd_mark<afdbooktag>").replace(/afd_mark/g,",");
            text = text.replace(/\. /g,"</afdbooktag>afd_mark<afdbooktag>").replace(/afd_mark/g,". ");
            text = text.replace(/，/g,"</afdbooktag>afd_mark<afdbooktag>").replace(/afd_mark/g,"，");
            text = text.replace(/。/g,"</afdbooktag>afd_mark<afdbooktag>").replace(/afd_mark/g,"。");
            $(pTag).html(text);
            //$(pTag).append(text);
            setSvgTag(pTag,svgElements,'svg');
            setSvgTag(pTag,canvasElements,'canvas');
        }
        var spanArray = $(pTag).find("afdbooktag");
        for (var i=0;i<spanArray.length;i++){
    		var left = $(spanArray[i]).offset().left;
    		//var top = $(elements[i]).offset().top;
    		var top = getElementTop(spanArray[i]);
            if (navigator.userAgent.match(/Android/i)&&androidVersion<14) {
                if (($afd_content.height()-13)*(currentPage-1)<top){
                    var sText = $(spanArray[i]).text();
                    if (i<spanArray.length-1&&sText.length<3)
                        sText = $(spanArray[i+1]).text();
                    else
                        sText = $(spanArray[i]).text();
						
                    sText = sText.substring(0,30)+"......";
					
                    var bookmarkData = new Array();
                    bookmarkData.push(chapterIndex);
                    bookmarkData.push(pIndex);
                    bookmarkData.push(i);
                    sText = getsText(sText,chapterIndex,pIndex);
                    bookmarkData.push(sText);
                    bookmarkData.push($(pTag).html());
                    return bookmarkData;
                }
                if (i==spanArray.length-1){
					
                    var sText = $(spanArray[i]).text().substring(0,30)+"......";
                    var bookmarkData = new Array();
                    bookmarkData.push(chapterIndex);
                    bookmarkData.push(pIndex);
                    bookmarkData.push(i);
                     sText = getsText(sText,chapterIndex,pIndex);
                    bookmarkData.push(sText);
                    bookmarkData.push($(pTag).html());
                    return bookmarkData;
                }
            }
            else{
            	if (0<left){
                	//alert(top+";"+$(spanArray[i]).offset().top);
                    var sText = $(spanArray[i]).text();
                    if (i<spanArray.length-1&&sText.length<3)
                        sText = $(spanArray[i+1]).text();
                    else
                        sText = $(spanArray[i]).text();
						
                    sText = sText.substring(0,30)+"......";
                    var bookmarkData = new Array();
                    bookmarkData.push(chapterIndex);
                    bookmarkData.push(pIndex);
                    bookmarkData.push(i);
                    sText = getsText(sText,chapterIndex,pIndex);
                    bookmarkData.push(sText);
                    bookmarkData.push($(pTag).html());
                    return bookmarkData;
                }
                if (j<pArray.length-1)continue;
                if (i==spanArray.length-1){
					
                    var sText = $(spanArray[i]).text().substring(0,30)+"......";
                    var bookmarkData = new Array();
                    bookmarkData.push(chapterIndex);
                    bookmarkData.push(pIndex);
                    bookmarkData.push(i);
                     sText = getsText(sText,chapterIndex,pIndex);
                    bookmarkData.push(sText);
                    bookmarkData.push($(pTag).html());
                    return bookmarkData;
                }
            }
        }
    }
}
function getsText(tempsText,tempchapterIndex,temppIndex){
	
	
	 if(tempsText.trim()=="......"){
		 
		if(chapterTitle.trim()==""){
							
			if(tempchapterIndex==0){
				
				tempsText = "封面";
			}else{
				if(temppIndex==0){
										
					tempsText = "第"+tempchapterIndex+"章";
				}else{
					tempsText = "第"+tempchapterIndex+"章"+temppIndex+"%";
				}
									
			}
							
							
		}else{
								
			tempsText = chapterTitle;
								
		}
						
	}
	return tempsText;
}
/** store data with localStorage */
function storeData(bookmarkData){
    if (typeof(localStorage) == 'undefined' ) {
		loading({text:"你的浏览器不支持 HTML5！请升级",timer:3000});
        //alert('Your browser does not support HTML5 localStorage. Try upgrading.');
    } else {
        try {
            var cIndex = bookmarkData[0];
            var pIndex = bookmarkData[1];
            var sIndex = bookmarkData[2];
			var sText = bookmarkData[3];
            var pText = bookmarkData[4];
            var tempArray = new Array();
            tempArray.push(pIndex);
            tempArray.push(sIndex);
            bookmarkIndexArray.push(tempArray);
            var tempBookmark = localStorage.getItem(bookIdentifier);
            if (tempBookmark==null){
                tempBookmark = cIndex+"afd_item"+pIndex+"afd_item"+sIndex+"afd_item"+sText+"afd_item"+pText;
            }
            else
                tempBookmark = cIndex+"afd_item"+pIndex+"afd_item"+sIndex+"afd_item"+sText+"afd_item"+pText+"afd_divide"+tempBookmark;
            localStorage.setItem(bookIdentifier,tempBookmark);
        } catch (e) {
            if (e == QUOTA_EXCEEDED_ERR) {
				loading({text:"超出配额！",timer:3000});
                //alert('Quota exceeded!');
            }
        }
    }
}

/**
 * Get the current element content
 */
function getCurrentElementContent() {
	var elements = $afd_content.find("p");
    if (elements.length==0){
        var pArrayTemp = new Array();
        pArrayTemp.push(document.getElementById("afd_content"));
        pArrayTemp.push(-1);
        var pArray = new Array();
        pArray.push(pArrayTemp);
        return pArray;
    }
	for ( var i = 0; i < elements.length; i++) {
		if (elements[i].innerHTML=='undefined'||$(elements[i]).text().replace(/ /g,"").replace(/ /,"").length==0&&i<elements.length-1)continue;
		var left = $(elements[i]).offset().left;
		var top = getElementTop(elements[i]);
		if (navigator.userAgent.match(/Android/i)&&androidVersion<14) {
			var heightTemp = $afd_content.height()-13;
			if (heightTemp* (currentPage - 1)< top&&top<=heightTemp*currentPage) {
				var pArrayTemp1 = new Array();
                var pArrayTemp2 = new Array();
                var pArray = new Array();
                pArrayTemp1.push(elements[i]);
                pArrayTemp1.push(i);
                pArray.push(pArrayTemp1);
                if (i+1<elements.length){
                    pArrayTemp2.push(elements[i+1]);
                    pArrayTemp2.push(i+1);
                    pArray.push(pArrayTemp2);
                }
                return pArray;
			}
			if (top>heightTemp*currentPage){
				if (i==0){
                    var pArrayTemp = new Array();
                    pArrayTemp.push(elements[i]);
                    pArrayTemp.push(i);
                    var pArray = new Array();
                    pArray.push(pArrayTemp);
                    return pArray;
                }
                if (i>0){
                	var pArrayTemp1 = new Array();
                    var pArrayTemp2 = new Array();
                    var pArray = new Array();
                    pArrayTemp1.push(elements[i-1]);
                    pArrayTemp1.push(i-1);
                    pArray.push(pArrayTemp1);
                    pArrayTemp2.push(elements[i]);
                    pArrayTemp2.push(i);
                    pArray.push(pArrayTemp2);
                    return pArray;
                }
			}
			if (top<=heightTemp* (currentPage - 1)&&i==elements.length-1){
                var pArrayTemp = new Array();
                pArrayTemp.push(elements[i]);
                pArrayTemp.push(i);
                var pArray = new Array();
                pArray.push(pArrayTemp);
                return pArray;
            }
		}
		else{
			if (0<left&&left<layoutWidth){
                var pArrayTemp1 = new Array();
                var pArrayTemp2 = new Array();
                var pArray = new Array();
                pArrayTemp1.push(elements[i]);
                pArrayTemp1.push(i);
                pArray.push(pArrayTemp1);
                if (i+1<elements.length){
                    pArrayTemp2.push(elements[i+1]);
                    pArrayTemp2.push(i+1);
                    pArray.push(pArrayTemp2);
                }
                return pArray;
            }
            if (left>=layoutWidth){
                if (i==0){
                    var pArrayTemp = new Array();
                    pArrayTemp.push(elements[i]);
                    pArrayTemp.push(i);
                    var pArray = new Array();
                    pArray.push(pArrayTemp);
                    return pArray;
                }
                if (i>0){
                	var pArrayTemp1 = new Array();
                    var pArrayTemp2 = new Array();
                    var pArray = new Array();
                    pArrayTemp1.push(elements[i-1]);
                    pArrayTemp1.push(i-1);
                    pArray.push(pArrayTemp1);
                    pArrayTemp2.push(elements[i]);
                    pArrayTemp2.push(i);
                    pArray.push(pArrayTemp2);
                    return pArray;
                }
            }
            if (left<=0&&i==elements.length-1){
                var pArrayTemp = new Array();
                pArrayTemp.push(elements[i]);
                pArrayTemp.push(i);
                var pArray = new Array();
                pArray.push(pArrayTemp);
                return pArray;
            }
		}
	}
}
/**
 * Native codes invoke the method when the webview loading finished
 */
function resizePage(current_percent, pIndex, sIndex, clickBk) {
    setTimeout(function(){
               if (clickBk=="clickBk"){
               var element;
               if (pIndex==-1){
               element = document.getElementById("afd_content");
               }
               else
               element = $afd_content.find("p")[pIndex];
               var span = $(element).find("afdbooktag")[sIndex];
               
               var i;
               if (navigator.userAgent.match(/iPhone/i)||navigator.userAgent.match(/iPad/i)) {
               //alert($(span).offset().left/layoutWidth+":"+$(span).offset().left+":"+layoutWidth+":"+$(window).width());
               i = parseInt($(span).offset().left/layoutWidth);
               }
               if (navigator.userAgent.match(/Android/i)) {
               i = parseInt(getElementTop(span)/($afd_content.height()-13));
               }
               currentPage = currentPage + i;
               leftPosition = leftPosition - i*floatrightlayoutWidth;
               tempPosition = leftPosition;
               $afd_content.css({
                                "left" : leftPosition + "px"
                                });
               }
               else {
               
               pages = getPages();
               if (current_percent != 0) {
               currentPage = parseInt((current_percent * pages) / 10000.0);
               if ((currentPage - (current_percent * pages) / 10000.0) < 0) {
               currentPage = currentPage + 1;
               }
               
               leftPosition = leftPosition - (currentPage - 1) * floatrightlayoutWidth;
               tempPosition = leftPosition;
               $afd_content.css({
                                "left" : leftPosition + "px"
                                });
               }
               }
               
               getReadingPercent();},1);
    
}

/**
 * Figure out the total pages
 */
function getPages() {
	//var layoutLeft1 = $("#afd_break").position().left;
    var docWidth = document.getElementById("afd_content").scrollWidth;
	if (navigator.userAgent.match(/Android/i)) {
		    Android.printmessage("getPages",docWidth,"docWidth");
			 Android.printmessage("getPages",layoutWidth,"layoutWidth");
			 }
    //alert(layoutLeft1+":::::"+layoutLeft+":::::"+layoutWidth);
	var pagesTemp = docWidth / floatrightlayoutWidth;
    
	if (parseInt(pagesTemp)<pagesTemp){
		Android.printmessage("getPages",parseInt(pagesTemp),"layoutWidth");
        pagesTemp = parseInt(pagesTemp) + 1;
    }
	return pagesTemp;
}
/** Exit application */
function openBookshelf() {
	if (navigator.userAgent.match(/iPhone/i)||navigator.userAgent.match(/iPad/i)) {
		window.location = 'anreader:afd:myaction:afd:openBookshelf';
	}
	if (navigator.userAgent.match(/Android/i)) {
		Android.openBookshelf();
	}
}
/** Open toc page */
function openPage(pageName) {
	var url = "file://" + path + "/html/"+pageName;
	window.location = url;
}
/** Add bookmark */
function addBookmark() {
    if ($("#afd_bkImg").attr("src")==path+"/image/afd_bookmark_yellow.png"){
        var lastBookmarkArray = deleteBookmark();
        refreshBookmark(lastBookmarkArray);
        $("#afd_bkImg").attr("src",path+"/image/afd_bookmark.png");
        return;
    }
    storeData(bookmark);
	$("#afd_bkImg").attr("src",path+"/image/afd_bookmark_yellow.png");
}
/** Delete bookmark */
function deleteBookmark() {
    if (typeof(localStorage) == 'undefined' ) {
		loading({text:"你的浏览器不支持 HTML5！请升级",timer:3000});
        //alert('Your browser does not support HTML5 localStorage. Try upgrading.');
    } else {
        try {
            var bookmarkArray = new Array();
            var tempBookmark = localStorage.getItem(bookIdentifier);
            if (tempBookmark==null)return;
            
            var tempBookmarkArray = tempBookmark.split("afd_divide");
            var num = tempBookmarkArray.length;
            
            for (var i=0;i<num;i++){
                var bookmarkData = tempBookmarkArray[i].split("afd_item");
                bookmarkArray.push(bookmarkData);
            }
            for (var i=0;i<bookmarkArray.length;i++){
                if (chapterIndex==bookmarkArray[i][0]){
                    var pIndex = bookmarkArray[i][1];
                    var sIndex = bookmarkArray[i][2];
                    var element;
                    if (pIndex==-1){
                        element = document.getElementById("afd_content");
                    }
                    else
                        element = $afd_content.find("p")[pIndex];
                    var span = $(element).find("afdbooktag")[sIndex];
                    
                    if (navigator.userAgent.match(/Android/i)) {
                        for (var j=0;j<bookmarkIndexArray.length;j++){
                            if (pIndex==bookmarkIndexArray[j][0]&&sIndex==bookmarkIndexArray[j][1]){
                                bookmarkIndexArray.splice(j,1);
                                break;
                            }
                        }
                        var lastBookmarkArray = new Array();
                        lastBookmarkArray.push(bookmarkArray);
                        lastBookmarkArray.push(i);
                        //refreshBookmark(bookmarkArray,i);
                        return lastBookmarkArray;
                	}
                	if (navigator.userAgent.match(/iPhone/i)||navigator.userAgent.match(/iPad/i)) {
                        for (var j=0;j<bookmarkIndexArray.length;j++){
                            if (pIndex==bookmarkIndexArray[j][0]&&sIndex==bookmarkIndexArray[j][1]){
                                bookmarkIndexArray.splice(j,1);
                                break;
                            }
                        }
                        var lastBookmarkArray = new Array();
                        lastBookmarkArray.push(bookmarkArray);
                        lastBookmarkArray.push(i);
                        //refreshBookmark(bookmarkArray,i);
                        return lastBookmarkArray;
                	}
                }
            }
        } catch (e) {
            if (e == QUOTA_EXCEEDED_ERR) {
                loading({text:"超出配额！",timer:3000});
				//alert('Quota exceeded!');
            }
        }
    }
    
}

/** refresh bookmark data */

function refreshBookmark(lastBookmarkArray){
    var deleteBKIndex = lastBookmarkArray[1];
    var bookmarkArray = lastBookmarkArray[0];
    bookmarkArray.splice(deleteBKIndex,1);
    var tempBookmarkArray = new Array();
    var tempBookmark;
    if (bookmarkArray.length==0){
        localStorage.removeItem(bookIdentifier);
    }
    else {
        for (var i=0;i<bookmarkArray.length;i++){
            var bookmarkData = bookmarkArray[i];
            var temp = bookmarkData.join("afd_item");
            tempBookmarkArray.push(temp);
        }
        tempBookmark = tempBookmarkArray.join("afd_divide");
        
        if (typeof(localStorage) == 'undefined') {
			loading({text:"你的浏览器不支持 HTML5！请升级",timer:3000});
            //alert('Your browser does not support HTML5 localStorage. Try upgrading.');
        } else {
            try {
                localStorage.setItem(bookIdentifier,tempBookmark);
            } catch (e) {
                if (e == QUOTA_EXCEEDED_ERR) {
					loading({text:"超出配额！",timer:3000});
                    //alert('Quota exceeded!');
                }
            }
        }
    }
}
/** Set bookmark image */
function markImg(){
	var halfWidthStart = layoutWidth*0.25;
	var halfWidthend = layoutWidth*0.75;
    if (startX>halfWidthStart && startX<halfWidthend &&$afd_menu.css("display")=="none"&&$afd_scale_panel.css("display")=="none"){
        $("#afd_bkImg").attr("src",path+"/image/afd_bookmark.png");
        var pArray = getCurrentElementContent();
        var bookmarkData = injectSpanTag(pArray);
        bookmark = bookmarkData;
        var tempPIndex = bookmarkData[1];
        var tempSIndex = bookmarkData[2];
        for (var i=0;i<bookmarkIndexArray.length;i++){
            var pIndex = bookmarkIndexArray[i][0];
            var sIndex = bookmarkIndexArray[i][1];
            if (pIndex==tempPIndex&&sIndex==tempSIndex){
                $("#afd_bkImg").attr("src",path+"/image/afd_bookmark_yellow.png");
                break;
            }
            var element;
            if (pIndex==-1){
                element = document.getElementById("afd_content");
            }
            else
                element = $afd_content.find("p")[pIndex];
            
            var span = $(element).find("afdbooktag")[sIndex];
            if (navigator.userAgent.match(/iPhone/i)||navigator.userAgent.match(/iPad/i)) {
                if (0<$(span).offset().left&&$(span).offset().left<layoutWidth){
                    $("#afd_bkImg").attr("src",path+"/image/afd_bookmark_yellow.png");
                    break;
                }
            }
            if (navigator.userAgent.match(/Android/i)) {
                if (($afd_content.height()-13)*(currentPage-1)<getElementTop(span)&&getElementTop(span)<($afd_content.height()-13)*currentPage){
                    $("#afd_bkImg").attr("src",path+"/image/afd_bookmark_yellow.png");
                    break;
                }
            }
        }
        $afd_menu.show();
		
		$afd_page_totalpage.hide();
		$afd_currentPage.hide();
		$afd_page_totalpage_left.hide();
	    $afd_page_totalpage_right.hide();
		$afd_currentPage_progress.show();
		displayScalepanel("jumping");
        $afd_bottomMenu.hide();
		flag_menuhide =1;
		flag_menushow =1;
		Android.getFlag_menushow(flag_menushow);
		
    }
    else{
        $afd_menu.hide();
		$afd_currentPage_progress.hide();
        $afd_bottomMenu.hide();
        $afd_currentPage.show();
/*	    $afd_page_totalpage.show();
		$afd_page_totalpage_left.show();
	    $afd_page_totalpage_right.show();*/
		$afd_page_totalpage.show();
		$afd_page_totalpage_left.hide();
	    $afd_page_totalpage_right.hide();
        $afd_scale_panel.hide();
		flag_menushow =0;
		Android.getFlag_menushow(flag_menushow);
    }
	$afd_zoomtable.hide();
    $afd_zoomin.hide();
    $afd_zoomout.hide();
	$afd_brightness0.hide();
	$afd_brightness1.hide();
	$afd_brightness2.hide();
	$afd_brightness3.hide();
	$afd_brightness4.hide();
	$afd_screen_orientation_landscape.hide();
	$afd_screen_orientation_portrait.hide();
	
	$afd_scale_panel1.hide();
	displayScalepanel1("jumping");
}

/** replace the p text */
function replacePText(){
    if (typeof(localStorage) == 'undefined' ) {
		loading({text:"你的浏览器不支持 HTML5！请升级",timer:3000});
        //alert('Your browser does not support HTML5 localStorage. Try upgrading.');
    } else {
        try {
            var tempBookmark = localStorage.getItem(bookIdentifier);
            if (tempBookmark==null)return;
            var tempBookmarkArray = tempBookmark.split("afd_divide");
            var num = tempBookmarkArray.length;
            
            for (var i=0;i<num;i++){
                var bookmarkData = tempBookmarkArray[i].split("afd_item");
                if (chapterIndex==bookmarkData[0]){
                    var pIndex = bookmarkData[1];
                    var sIndex = bookmarkData[2];
                    var tempArray = new Array();
                    tempArray.push(pIndex);
                    tempArray.push(sIndex);
                    bookmarkIndexArray.push(tempArray);
                    var element;
                    if (pIndex==-1){
                        element = document.getElementById("afd_content");
                    }
                    else
                        element = $afd_content.find("p")[pIndex];
                    var pText = bookmarkData[4];
                    var svgElements = getSvgTag(element,'svg');
                    var canvasElements = getSvgTag(element,'canvas');
                    $(element).html(pText);
                    setSvgTag(element,svgElements,'svg');
                    setSvgTag(element,canvasElements,'canvas');
                }
            }
        } catch (e) {
            if (e == QUOTA_EXCEEDED_ERR) {
				loading({text:"超出配额！",timer:3000});
                //alert('Quota exceeded!');
            }
        }
    }
}

/**
 * Get the size from native code
 */
function getBookData(tempchapterTitle,tempflag_next_before,tempchap_page,tempnow_page,temptotal_page,tempSize, tempChapterSize, tempBookSize, tempChapterIndex, tempchapterTotleNum,tempIdentifier,tempFilePath,title) {
	flag_next_before = tempflag_next_before;
	if(flag_next_before==21 ||flag_next_before==22 || flag_next_before ==101 || flag_next_before ==102 ||flag_next_before ==103 ||flag_next_before ==104 ){now_page = tempnow_page-1;}else{now_page = tempnow_page;}
	chap_page = tempchap_page;
	chapterTitle = tempchapterTitle;
	total_page = temptotal_page;
	chapterSize = tempChapterSize;
	size = tempSize;
	bookSize = tempBookSize;
	chapterIndex = tempChapterIndex;
    chapterTotleNum = tempchapterTotleNum;
    bookIdentifier = tempIdentifier;
    path = tempFilePath;
    saveSettingData("afd_bookname",bookIdentifier);
   // $("#afd_title").html(title);
	// $("#afd_title1").html(title);
	$("#afd_booktitleleft").html(title);
	$("#afd_booktitleright").html(title);
	$("#afd_booktitleportrait").html(title);
    setLayoutImag();
    replacePText();
    pages = getPages();
	getReadingPercent();
}

/** Figure out the percent */
function getReadingPercent() {
	//alert(pages+"::::"+currentPage);
	var value = (size + chapterSize * (currentPage / pages)) / bookSize;
	if (navigator.userAgent.match(/Android/i)) {
		    Android.printmessage("getReadingPercent",size,"size");
			 Android.printmessage("getReadingPercent",chapterSize,"chapterSize");
			 Android.printmessage("getReadingPercent",bookSize,"bookSize");
			 Android.printmessage("getReadingPercent",currentPage,"currentPage");
			 Android.printmessage("getReadingPercent",pages,"pages");
			 }
	value = parseInt(value * 100 * 10000) / 10000.0;

	var widthpro = parseInt(8*value);
	var widthpro1 = parseInt(8*value)-6;
	var widthpro2 = parseInt(8*value)-96;
	var widthpro3 = parseInt(8*value)-46;
	if (navigator.userAgent.match(/Android/i)) {
			 Android.printmessage("getReadingPercent",value,"value");
		    Android.printmessage("getReadingPercent",widthpro,"widthpro");
			 }
	$afd_currentPage.html(value + "%");
	$("#afd_currentPage_progress #progress2 img").css({"width":widthpro+"px"});
	$("#afd_currentPage_progress #progress3").css({"left":widthpro1+"px"});
	$("#afd_currentPage_progress #progress3 img").css({"left":widthpro1+"px"});
	$("#afd_currentPage_progress #progress4").css({"left":widthpro2+"px"});
	$("#afd_currentPage_progress #progress4 img").css({"left":widthpro2+"px"});
	$progress_html.html(value + "%");
	$("#afd_currentPage_progress #progress_html").css({"left":widthpro3+"px"});
	var thepageleft =now_page+(2*currentPage-1);
	var thepageright =now_page+(2*currentPage);
	//$afd_page_totalpage_left.html(thepageleft + "/"+total_page);
	//$afd_page_totalpage_right.html(thepageright + "/"+total_page);
	
}
/** sreenchange */
/*function screenchange(screen_orientation) {
	
	//note8 962X601
	//note10 1232X800 1280X752    1280X800 800X1280
	 if ($(window).width()<720){
		layoutHeight = $(window).height();
		layoutWidth = $(window).width()-60;
		floatrightlayoutWidth = $(window).width();
		 $body.css({"background":"url('/sdcard/CloudClient/.System/MultiMediaMaterial/Epub/image/afd_bookbg.png') no-repeat scroll 50% 50%"});
		  $afd_content.css({
                         "padding-right":"40px","padding-left":"60px","width":"360px","height":"520px", "-webkit-column-gap":"120px","top":"55px"});
						//  $afd_content.css({
                       //  "padding-right":"40px","padding-left":"40px","padding-top":"20px"});
        cWPadding = 80;
        cHPadding = 85;
        $("#afd_bookmark").css({ "right":"40px"});
        $("#afd_zoom").css({ "right":"80px"});
        $("#afd_TOC").css({ "left":"75px"});
        $("#afd_bookshelf").css({"left":"20px"});
		$("#afd_bookstore").css({"left":"180px"});
		
		   $("#afd_booktitle").show();
		   $("#afd_booktitleportrait").hide();
		   $("#afd_content img").css("maxWidth", (359) + "px");
           $("#afd_content img").css("maxHeight", (501) + "px");
		   $("#afd_content audio").css("maxWidth", (359) + "px");
		   $("#afd_content video").css("maxWidth", (359) + "px");
		   $("#afd_content video").css("width", (359) + "px");
		    $("#afd_content video").css("height", (200) + "px");
		 }
	 if ($(window).width()>=720){
		  layoutHeight = $(window).height();
          layoutWidth = $(window).width();
		   floatrightlayoutWidth = $(window).width();
		 $body.css({"background":"url('/sdcard/CloudClient/.System/MultiMediaMaterial/Epub/image/afd_bookbghalf.png') no-repeat scroll 50% 50%"});
		 $afd_content.css({
                         "padding-right":"30px","padding-left":"30px","width":"540px","height":"800px", "-webkit-column-gap":"60px","top":"100px"});
          cWPadding = 20;
          cHPadding = 35;
		   $("#afd_booktitle").hide();
		   $("#afd_booktitleportrait").show();
		   $("#afd_content img").css("maxWidth", (540) + "px");
		   $("#afd_content img").css("maxHeight", (800) + "px");
		   $("#afd_content audio").css("maxWidth", (540) + "px");
		   $("#afd_content video").css("maxWidth", (540) + "px");
		   $("#afd_content video").css("width", (540) + "px");
		    $("#afd_content video").css("height", (200) + "px");
		 }
}*/
/** Pass the reading data to native code */
function saveReadingData() {
	if (navigator.userAgent.match(/Android/i)) {
		Android.currentReadingData(currentPage, pages);
	}
	if (navigator.userAgent.match(/iPhone/i)||navigator.userAgent.match(/iPad/i)) {
		window.location = "anreader:afd:myaction:afd:currentReadingData:afd:" + currentPage
        + ":afd:" + pages;
	}
}
/** brightness in  size */
function brightnessin() {
  
	 brightness = brightness+0.1;
    if(brightness <1){//add kao 20130805
		var tempBrightness = brightness;
		tempBrightness =tempBrightness*minbrightness;
		 $afd_pageturn.css("background-color","rgba(0,0,0,"+tempBrightness+")");
		}
    //remove kao 20130805
	//$afd_pageturn.css("background-color","rgba(0,0,0,"+brightness+")");
	else
	{
		brightness = 1;
		//add kao 20130805
		var tempBrightness = brightness;
		tempBrightness =tempBrightness*minbrightness;
		$afd_pageturn.css("background-color","rgba(0,0,0,"+tempBrightness+")");
		//remove kao 20130805
		//$afd_pageturn.css("background-color","rgba(0,0,0,"+brightness+")");
	}
	
	var floatPercent;
    var currentValue;
	var afd_bar = document.getElementById("afd_bar1");
	var barWidth = $(afd_bar).width();

    floatPercent = 1-brightness;
    currentValue = floatPercent*barWidth;
	 var afd_button=document.getElementById("afd_btn1"); 
     afd_button.style.left = currentValue-11+"px";
	 var afd_step=document.getElementById("afd_bar1").getElementsByTagName("div")[0];
	 afd_step.style.width = currentValue+"px";
	 saveSettingData("brightness",brightness);
}
/** brightness out  size */
function brightnessout() {

	brightness = brightness-0.1;
	if(brightness >=0){//add kao 20130805
		var tempBrightness = brightness;
		tempBrightness =tempBrightness*minbrightness;
		$afd_pageturn.css("background-color","rgba(0,0,0,"+tempBrightness+")");
	}
	//remove kao 20130805
    //$afd_pageturn.css("background-color","rgba(0,0,0,"+brightness+")");
	else
	{
		brightness = 0;
		//add kao 20130805
		var tempBrightness = brightness;
		tempBrightness =tempBrightness*minbrightness;
		$afd_pageturn.css("background-color","rgba(0,0,0,"+tempBrightness+")");
		//remove kao 20130805
		//$afd_pageturn.css("background-color","rgba(0,0,0,"+brightness+")");
	}
	   var floatPercent;
    var currentValue;
	var afd_bar = document.getElementById("afd_bar1");
	var barWidth = $(afd_bar).width();
    floatPercent = 1-brightness;
    currentValue = floatPercent*barWidth;
	 var afd_button=document.getElementById("afd_btn1"); 
     afd_button.style.left = currentValue-11+"px";
	 var afd_step=document.getElementById("afd_bar1").getElementsByTagName("div")[0];
	 afd_step.style.width = currentValue+"px";
	 saveSettingData("brightness",brightness);
}
/** Hidden the fontsize button */
function hiddenFontSizeLayout() {

	if($afd_zoomtable.css("display")=="none" ){

		$afd_zoomtable.show();
		$afd_brightness0.show();
	    $afd_brightness1.show();
	    $afd_brightness2.hide();
	    $afd_brightness3.hide();
	    $afd_brightness4.show();
		$afd_screen_orientation_landscape.show();
		$afd_screen_orientation_portrait.show();
		displayScalepanel1("brightness");
		$afd_scale_panel1.show();
	}else{
		$afd_zoomtable.hide();
		$afd_brightness0.hide();
	    $afd_brightness1.hide();
	    $afd_brightness2.hide();
	    $afd_brightness3.hide();
	    $afd_brightness4.hide();
		$afd_screen_orientation_landscape.hide();
		$afd_screen_orientation_portrait.hide();
		
		$afd_scale_panel1.hide();
		displayScalepanel1("jumping");
	}
	$afd_zoomin.toggle();
	$afd_zoomout.toggle();
}
/** Zoom in font size */
function fontSizeZoomin() {
	var fontSize = $afd_content.css("font-size");
    if (parseInt(fontSize)>24) { return;}
	$afd_content.css("font-size", parseInt(fontSize) + 3 + "px");
    pages = getPages();
	getReadingPercent();
	saveSettingData("fontSize",parseInt(fontSize) + 3);
	saveReadingData();
	
	/*var padding_left = $afd_content.css("padding-left");
	var webkit_colum_gap = $afd_content.css("-webkit-column-gap");
	var addfontsize = ( parseInt(fontSize)+3-16)*gapsize;
		padding_left = parseInt(padding_left) -addfontsize;
		webkit_colum_gap =parseInt(padding_left)*2;
	$afd_content.css("padding-left", parseInt(padding_left) + "px");
	$afd_content.css("-webkit-column-gap", parseInt(webkit_colum_gap) + "px");*/
}
/** Zoom out font size */
function fontSizeZoomout() {
	var fontSize = $afd_content.css("font-size");
    if (parseInt(fontSize)<14) { return;}
	$afd_content.css("font-size", parseInt(fontSize) - 3 + "px");
    pages = getPages();
    if (currentPage > pages){
        var i = currentPage - pages;
        leftPosition = leftPosition + i*layoutWidth;
        tempPosition = leftPosition;
        currentPage = pages;
        $afd_content.css({
                         "left" : leftPosition + "px"
                         });
    }
	getReadingPercent();
	saveSettingData("fontSize",parseInt(fontSize) - 3);
	saveReadingData();
}
/** screen orientation  change */
function screenorientation_landscape() {
	
		Android.screenorientation_landscape("screenorientation");
		
		// 横屏
		setafd_content_css_landscape();
		$("#afd_booktitle").show();
		$("#afd_booktitleportrait").hide();
		if($(window).width()<1000){//note8 962X601
							
			setafd_content_landscape_note8();
			
		}else if($(window).width()>=1000&&$(window).width()<=1024){//Galaxy TabA 1024X768
		//2015.4.20 龚辉 为Galaxy TabA 单独添加限制方法
			setafd_content_landscape_galaxy_tab_a();
							  
		}else if($(window).width()>1024&&$(window).width()<1250){//note10 1232X800
								//note 10 不带物理按钮
			setafd_content_landscape_note10();
							  
		}else{//note 10 带物理按钮
									
			setafd_content_landscape_note10();
							  
		}
		//screenchange("screenorientation");
}
function screenorientation_portrait() {
	
		Android.screenorientation_portrait("screenorientation");
		setafd_content_css_portrait();
		$("#afd_booktitle").hide();
		$("#afd_booktitleportrait").show();
		if($(window).width()<650){//note8 601X962
								
			setafd_content_portrait_note8();
								
		}else if($(window).width()>=650&&$(window).width()<770){//note10 800X1232
									//note 10 不带物理按钮
		   setafd_content_portrait_note10();
								
		}else{//note 10 带物理按钮
										
		   setafd_content_portrait_note10();
		}				
		//screenchange("screenorientation");
}
/** Resize the menu */
function resizeMenu() {
	$("#afd_title").css("left",
                        150+"px");
	$("#afd_title").css("top",
                        ($afd_menu.height() - $("#afd_title").height()) / 2);
	$("#afd_title1").css("right",150 +"px");
	$("#afd_title1").css("top",
                        ($afd_menu.height() - $("#afd_title1").height()) / 2);
}
function rotateScreen() {
	var percent = currentPage * 10000 / pages;
	pages = getPages();
	currentPage = parseInt((percent * pages) / 10000.0);
	if ((currentPage - (percent * pages) / 10000.0) < 0) {
		currentPage = currentPage + 1;
	}
	leftPosition = 0;
	leftPosition = leftPosition - (currentPage - 1) * floatrightlayoutWidth;
	tempPosition = leftPosition;
	$afd_content.css({
                     "left" : leftPosition + "px"
                     });
	getReadingPercent();
}
function firstcontent() {

	Android.printmessage("firstcontent",1,"firstcontent");
}
function onStart(ev) {
	//foundaid();
	if (navigator.userAgent.match(/iPhone/i)||navigator.userAgent.match(/iPad/i)) {
	    if (ev.touches.length >1){multipleTouch = 1;return};
	    multipleTouch = 0;
	}
	//showMenu =1; kao 20130711
	showMenu =1;
	androidLongtouch =0;
	if ($afd_menu.css("display")=="none"&&$afd_scale_panel.css("display")=="none"){
		flag_menushow =0;
		Android.getFlag_menushow(flag_menushow);
   }else{
	   flag_menushow =1; 
  	 	Android.getFlag_menushow(flag_menushow);
   }
	
	//$afd_menu.hide();
    //$afd_bottomMenu.hide();
	//pages = getPages();
	startX = ev.touches[0].pageX;
	startY = ev.touches[0].pageY;
	 var halfWidthStart = layoutWidth*0.25;
	  var halfWidthend = layoutWidth*0.75;
	var flagturnpagewight =0;//标记是否有翻页动画
/*	 if(flag_next_before ==101 ||flag_next_before ==103 || flag_next_before==11)
	  var endchapter = chapterTotleNum-2;
	else*/
	var endchapter = chapterTotleNum-1;
	if(startX<halfWidthStart ||startX >halfWidthend )
	{
		
		if (navigator.userAgent.match(/Android/i)) {

		    Android.printmessage("startX",startX,"startX");
			Android.printmessage("startY",startY,"startY");
			Android.printmessage("layoutWidth",layoutWidth,"layoutWidth");
			Android.printmessage("layoutHeight",layoutHeight,"layoutHeight");
		}
		if(((chapterIndex==0&&currentPage==1&&startX<halfWidthStart)||(chapterIndex==endchapter&&currentPage==pages&&startX >halfWidthend)))
		{
			flag_menushow =1; 
  	 		Android.getFlag_menushow(flag_menushow);
			}else{
				//flagturnpagewight=1;
				}
		
	}
	//Android.onStartPageWight(flagturnpagewight);
	if (navigator.userAgent.match(/iPhone/i)||navigator.userAgent.match(/iPad/i)) {
		if(window.getSelection().toString().length > 1){
	        showMenu = 0;
	    }
	    setTimeout(function(){showMenu=0;},300);
    }
    
	if ((currentPage==1&&startX<layoutWidth/2)||(currentPage==pages&&startX>layoutWidth/2 ||pages ==1)){
		preventMove =1;
		return;
	}
    
	//alert(leftPosition+","+tempPosition);
	leftPosition = $afd_content.position().left;
	if (tempPosition != leftPosition) {
		leftPosition = tempPosition;
	}
	preventMove =0;
}

function onMove(ev){
	if (navigator.userAgent.match(/iPhone/i)||navigator.userAgent.match(/iPad/i)) {
		if (multipleTouch ==1)return;
	}
    
    showMenu =0;
    $afd_menu.hide();
	$afd_currentPage_progress.hide();
    $afd_bottomMenu.hide();
    $afd_scale_panel.hide();
    $afd_currentPage.show();
    $afd_sharingBox.hide();
    moveX = ev.touches[0].pageX;
	moveY = ev.touches[0].pageY;
	var halfWidthStart = layoutWidth*0.25;
    var halfWidthend = layoutWidth*0.75;
   if(flag_next_before ==101 ||flag_next_before ==103 || flag_next_before==11)
	  var endchapter = chapterTotleNum-2;
	else
	  var endchapter = chapterTotleNum-1;
   if(!((chapterIndex==0&&currentPage==1&&startX<halfWidthStart)||(chapterIndex==endchapter&&currentPage==pages&&startX >halfWidthend))){
	//Android.onMovePageWight(moveX,moveY);
   }
		
   
    if (preventMove == 1)
        return;
	 tempX = ev.touches[0].pageX;
     moveTemp = tempX - startX;
    $afd_content.css({
                     "left" : leftPosition + moveTemp + "px"
                     });
    if (navigator.userAgent.match(/Android/i)) {
        ev.preventDefault();
    }
}

function onEnd(ev){
	
	endX =moveX;
	endY =moveY;
	if (navigator.userAgent.match(/iPhone/i)||navigator.userAgent.match(/iPad/i)) {
	    if (multipleTouch ==1){
            $afd_content.animate({
                                 left : leftPosition
                                 }, 100);
            moveTemp = 0;
            tempX = 0;
            return;
        }
	}
    
	if(!($afd_sharingBox.css('display')=='none')){showMenu = 0;$afd_sharingBox.hide()};
	var halfWidthStart = layoutWidth*0.25;
	var halfWidthend = layoutWidth*0.75;
	/*if(flag_next_before ==101 ||flag_next_before ==103 || flag_next_before==11)
	  var endchapter = chapterTotleNum-2;
	else*/
	  var endchapter = chapterTotleNum-1;

 
    //    if (preventMove == 1)
    //    {
    //        //openChapter(chapterIndex,"preceding");
    //        return;
    //    }
	if (androidLongtouch==1) {
		//markImg();
		return;
	} 
	//var halfHeight = layoutHeight;
	var halfHeight = layoutHeight-100;
	var halfWidth = layoutWidth-100;
	//$afd_menu.css("display")=="none" &&
	if ($afd_menu.css("display")=="none"&&(!((startY <100&& startX>100&&startX<halfWidth)|| (startY >halfHeight&& startX>100&&startX<halfWidth))))
	{
	  var halfWidth = layoutWidth / 2;
	  var halfWidthStart = layoutWidth*0.25;
	  var halfWidthend = layoutWidth*0.75;
	  var endchapter = chapterTotleNum-1;
	  if(((chapterIndex==0&&currentPage==1&&startX<halfWidthStart)||(chapterIndex==endchapter&&currentPage==pages&&startX >halfWidthend)))
		{
			flag_menushow =1; 
  	 		Android.getFlag_menushow(flag_menushow);
			}else{
				//flagturnpagewight=1;
				}
    if (startX >= halfWidth) {
        
        if (currentPage == pages&& ( moveTemp < -halfWidth * 0.5 || startX>halfWidthend)){
		//	if(!(chapterIndex==endchapter&&currentPage==pages&&startX >halfWidthend))
			// Android.onEndPageWight(endX,endY);
            openChapter(chapterIndex,"next");
            return;
        }
        if (currentPage < pages &&( moveTemp < -halfWidth * 0.5 ||  startX>halfWidthend)) {
          //  Android.onEndPageWight(endX,endY);
            tempPosition = leftPosition - floatrightlayoutWidth;
            $afd_content.animate({
                                 left : tempPosition
                                 }, 1);
            currentPage = currentPage + 1;
			if (navigator.userAgent.match(/Android/i)) {
		    Android.printmessage("onend",currentPage,"null");
			 }
            getReadingPercent();
        } else {
            $afd_content.animate({
                                 left : leftPosition
                                 }, 1);
        }
    }
    if (startX < halfWidth) {
        
        if (currentPage==1&& ( moveTemp > halfWidth * 0.5 ||  startX<halfWidthStart)){
			//if(!(chapterIndex==0&&currentPage==1&&startX<halfWidthStart))
			// Android.onEndPageWight(endX,endY);
            openChapter(chapterIndex,"preceding");
            return;
        }
        if (currentPage > 1 && ( moveTemp > halfWidth * 0.5 ||  startX<halfWidthStart)) {
          //   Android.onEndPageWight(endX,endY);
            tempPosition = leftPosition + floatrightlayoutWidth;
            $afd_content.animate({
                                 left : tempPosition
                                 }, 1);
            currentPage = currentPage - 1;
			if (navigator.userAgent.match(/Android/i)) {
		    Android.printmessage("onend",currentPage,"null");
			 }
            getReadingPercent();
        } else {
            $afd_content.animate({
                                 left : leftPosition
                                 }, 1);
        }
    }
    moveTemp = 0;
    tempX = 0;
    saveReadingData();
	}
     if ( showMenu == 1 && startY > $('#afd_menu').height()&&startY<$('#afd_pageturn').height()-$('#afd_bottomMenu').height()) {	
		markImg();
    }
}

function onEndpage(){
    

	if (navigator.userAgent.match(/iPhone/i)||navigator.userAgent.match(/iPad/i)) {
	    if (multipleTouch ==1){
            $afd_content.animate({
                                 left : leftPosition
                                 }, 100);
            moveTemp = 0;
            tempX = 0;
            return;
        }
	}
    
	if(!($afd_sharingBox.css('display')=='none')){showMenu = 0;$afd_sharingBox.hide()};
	var halfWidthStart = layoutWidth*0.25;
	var halfWidthend = layoutWidth*0.75;
	if(flag_next_before ==101 ||flag_next_before ==103 || flag_next_before==11)
	  var endchapter = chapterTotleNum-2;
	else
	  var endchapter = chapterTotleNum-1;

    if (startX>halfWidthStart && startX<halfWidthend && showMenu == 1 && startY > $('#afd_menu').height()&&startY<$('#afd_pageturn').height()-$('#afd_bottomMenu').height()) {
		markImg();
		
    }
    //    if (preventMove == 1)
    //    {
    //        //openChapter(chapterIndex,"preceding");
    //        return;
    //    }
	if (androidLongtouch==1) {
		//markImg();
		return;
	} 
	//var halfHeight = layoutHeight;
	var halfHeight = layoutHeight-100;
	var halfWidth = layoutWidth-100;
	//$afd_menu.css("display")=="none" &&
	if (!((startY <100&& startX>100&&startX<halfWidth)|| (startY >halfHeight&& startX>100&&startX<halfWidth)))
	{
	  var halfWidth = layoutWidth / 2;
	  var halfWidthStart = layoutWidth*0.25;
	  var halfWidthend = layoutWidth*0.75;
    if (startX >= halfWidth) {
        
        if (currentPage == pages&& ( moveTemp < -halfWidth * 0.5 || startX>halfWidthend)){
            openChapter(chapterIndex,"next");
            return;
        }
        if (currentPage < pages &&( moveTemp < -halfWidth * 0.5 ||  startX>halfWidthend)) {
            tempPosition = leftPosition - layoutWidth;
            $afd_content.animate({
                                 left : tempPosition
                                 }, 1);
            currentPage = currentPage + 1;
			if (navigator.userAgent.match(/Android/i)) {
		    Android.printmessage("onend",currentPage,"null");
			 }
            getReadingPercent();
        } else {
            $afd_content.animate({
                                 left : leftPosition
                                 }, 1);
        }
    }
    if (startX < halfWidth) {
        
        if (currentPage==1&& ( moveTemp > halfWidth * 0.5 ||  startX<halfWidthStart)){
            openChapter(chapterIndex,"preceding");
            return;
        }
        if (currentPage > 1 && ( moveTemp > halfWidth * 0.5 ||  startX<halfWidthStart)) {

            tempPosition = leftPosition + layoutWidth;
            $afd_content.animate({
                                 left : tempPosition
                                 }, 1);
            currentPage = currentPage - 1;
			if (navigator.userAgent.match(/Android/i)) {
		    Android.printmessage("onend",currentPage,"null");
			 }
            getReadingPercent();
        } else {
            $afd_content.animate({
                                 left : leftPosition
                                 }, 1);
        }
    }
    moveTemp = 0;
    tempX = 0;
    saveReadingData();
	}
  
}

function addListener() {
	document.getElementById("afd_content").addEventListener("click",
                                                         firstcontent, false);
	document.getElementById("afd_pageturn").addEventListener('touchend',onEnd, false);
    
	//document.getElementById("afd_pageturn").addEventListener('touchmove',
                    //                                         onMove, false);
    
	document.getElementById("afd_pageturn").addEventListener("touchstart",
                                                             onStart, false);
	document.getElementById("afd_zoom").addEventListener("click",
                                                         hiddenFontSizeLayout, false);
	document.getElementById("afd_zoomin").addEventListener("click",
                                                           fontSizeZoomin, false);
	document.getElementById("afd_zoomout").addEventListener("click",
                                                            fontSizeZoomout, false);
	
	document.getElementById("afd_brightness1").addEventListener("click",
                                                            brightnessin, false);
	document.getElementById("afd_brightness4").addEventListener("click",
                                                            brightnessout, false);
	
	document.getElementById("afd_screen_orientation_landscape").addEventListener("click",
                                                            screenorientation_landscape, false);
	document.getElementById("afd_screen_orientation_portrait").addEventListener("click",
                                                            screenorientation_portrait, false);
	document.getElementById("afd_bookshelf").addEventListener("click",
                                                              openBookshelf, false);
	document.getElementById("afd_TOC").addEventListener("click", function(){openPage("toc.html");},
                                                        false);
	document.getElementById("afd_bookstore").addEventListener("click", function(){openbookstore();},
                                                        false);
		
    document.getElementById("afd_setting").addEventListener("click", function(){openPage("setting.html");},
                                                            false);
	document.getElementById("afd_bookmark").addEventListener("click",
                                                             addBookmark, false);
	
    document.getElementById("afd_jumping").addEventListener("click",function()
                                                            {displayScalepanel("jumping")}, false);
    document.getElementById("progress_html").addEventListener("click",function()
                                                            {displayScalepanel("jumping")}, false);
    document.getElementById("afd_brightness").addEventListener("click",function()
                                                               {displayScalepanel("brightness");}, false);
    document.getElementById("afd_precedingChapter").addEventListener("click",
                                                                     function(){openChapter(chapterIndex,"preceding","prev");}, false);
    document.getElementById("afd_nextChapter").addEventListener("click",
                                                                function(){openChapter(chapterIndex,"next");}, false);

   // document.getElementById("afd_nextChapterhtml").addEventListener("click",
                                                             //   function(){openChapter(chapterIndex,"next");}, false);
	//document.getElementById("afd_precedingChapterhtml").addEventListener("click",
                                                             //   function(){openChapter(chapterIndex,"preceding","prev");}, false);
	///document.getElementById("afd_TOChtml").addEventListener("click",
                                                              //  function(){openChapter(2,"preceding","prev");}, false);
	 

}
function foundaid(){

	var videoobjs=document.getElementsByTagName("video");
	var audioobjs = document.getElementsByTagName("audio");
	var aobjs = document.getElementsByTagName("a");
	if (navigator.userAgent.match(/Android/i)) {
		    Android.printmessage("foundaid",videoobjs.length,"videoobjs");
			Android.printmessage("foundaid",audioobjs.length,"audioobjs");
			Android.printmessage("foundaid",audioobjs.length,"aobjs");
			 }
	for(var i=0;i<videoobjs.length;i++)
	{
		videoobjs[i].id="videoclick"+i;
		//$("video").click(function(e){alert("video");e.stopPropagation();});
		//$("#videoclick"+i).click(function(e){alert("video");e.stopPropagation();});
		// Android.printmessage("onvideoclick",parseInt(top),"#videoclick"+i);
		document.getElementById("videoclick"+i).addEventListener("touchstart",
                                                                function(e){ 
																flag_menushow =1; 
																Android.getFlag_menushow(flag_menushow);
																e.stopPropagation(); 
																Android.printmessage("touchstart",1,"onvideoclick");
																}, false);
		document.getElementById("videoclick"+i).addEventListener("touchend",
                                                                function(e){ 
																flag_menushow =1; 
																Android.getFlag_menushow(flag_menushow);
																e.stopPropagation();
																Android.printmessage("touchend",1,"onvideoclick");
																}, false);
		//Android.printmessage("videoclick",1,objs[i].id);
	}
	for(var i=0;i<audioobjs.length;i++)
	{
		audioobjs[i].id="audioclick"+i;
		//$("video").click(function(e){alert("video");e.stopPropagation();});
		//$("#videoclick"+i).click(function(e){alert("video");e.stopPropagation();});
		// Android.printmessage("onvideoclick",parseInt(top),"#videoclick"+i);
		document.getElementById("audioclick"+i).addEventListener("touchstart",
                                                                function(e){ 
																flag_menushow =1; 
																Android.getFlag_menushow(flag_menushow);
																e.stopPropagation(); 
																Android.printmessage("touchstart",1,"audioclick");
																}, false);
		document.getElementById("audioclick"+i).addEventListener("touchend",
                                                                function(e){ 
																flag_menushow =1; 
																Android.getFlag_menushow(flag_menushow);
																e.stopPropagation();
																Android.printmessage("touchend",1,"audioclick");
																}, false);
		//Android.printmessage("videoclick",1,objs[i].id);
	}
	for(var i=0;i<aobjs.length;i++)
	{
		aobjs[i].id="aclick"+i;
		//$("video").click(function(e){alert("video");e.stopPropagation();});
		//$("#videoclick"+i).click(function(e){alert("video");e.stopPropagation();});
		// Android.printmessage("onvideoclick",parseInt(top),"#videoclick"+i);
		document.getElementById("aclick"+i).addEventListener("touchstart",
                                                                function(e){ 
																flag_menushow =1; 
																Android.getFlag_menushow(flag_menushow);
																e.stopPropagation(); 
																Android.printmessage("touchstart",1,"aclick");
																}, false);
		document.getElementById("aclick"+i).addEventListener("touchend",
                                                                function(e){ 
																flag_menushow =1; 
																Android.getFlag_menushow(flag_menushow);
																e.stopPropagation();
																Android.printmessage("touchend",1,"aclick");
																}, false);
		//Android.printmessage("videoclick",1,objs[i].id);
	}
}

/* 按 HOme 键 停止视频、音频播放*/
function playPause(){
	var videoobjs=document.getElementsByTagName("video");
	var audioobjs = document.getElementsByTagName("audio");
	for(var i=0;i<videoobjs.length;i++)
	{
		var myVideo = document.getElementsByTagName('video')[i]; 
		if (myVideo.play){
			myVideo.pause();
			}
	}
	for(var i=0;i<audioobjs.length;i++)
	{
		var myAudio = document.getElementsByTagName('audio')[i]; 
		if (myAudio.play){
			myAudio.pause();
			}
	}
	
}
function openbookstore(){

	Android.openbookstore();
}
function getSvgTag(element,type){
    var svgElements = new Array();
    var svgs;
    if (type == 'svg')
        svgs = element.getElementsByTagNameNS('http://www.w3.org/2000/svg','svg');
    if (type == 'canvas')
        svgs = element.getElementsByTagName('canvas');
    if (svgs.length==0)svgElements.push("0");
    for (var i=0;i<svgs.length;i++){
    	
        svgElements.push(svgs[i]);
    }
    return svgElements;
}
function setSvgTag(element,svgElements,type){
	if (svgElements[0]=="0")return;
    var svgTemps;
    if (type == 'svg')
        svgTemps = element.getElementsByTagName('svg');
    if (type == 'canvas')
        svgTemps = element.getElementsByTagName('canvas');
    for (var i=0;i<svgTemps.length;i++){
        var svgElement = svgElements[i];
        $(svgTemps[i]).replaceWith(svgElement);
    }
}
function initDom() {
    var svgElements = getSvgTag(document.body,'svg');
    var canvasElements = getSvgTag(document.body,'canvas');
	var bodyContent = document.body.innerHTML;
	if (navigator.userAgent.match(/Android/i)) {
		    Android.printmessage("bodyContent",bodyContent,"bodyContent");
			 }
    $body = $("body");
	$body.empty();
	//<div id='afd_brightness2'><img/></div><div id='afd_brightness3'><img/></div>
	var bookpagetitle = "<div id='afd_booktitle'><div id='afd_booktitleleft'></div><div id='afd_booktitleright'></div></div>";
	var bookpagetitleportrait = "<div id='afd_booktitleportrait'></div>";
	var menu = "<div id='afd_menu'><div id='afd_bookshelf'><img/></div><div id='afd_TOC'><img/></div><div id='afd_bookstore'><img/></div><div id='afd_title'></div><div id='afd_title1'></div><div id='afd_zoom'><img/></div><div id='afd_zoomtable'><img/></div><div id='afd_zoomout'><img/></div><div id='afd_zoomin'><img/></div><div id='afd_brightness0'><img/></div><div id='afd_brightness1'><img/></div><div id='afd_brightness2'><img/></div><div id='afd_brightness3'><img/></div><div class='afd_scale_panel1'><span id='afd_value1'></span><div class='afd_scale1' id='afd_bar1'><div></div><span id='afd_btn1'></span></div></div><div id='afd_brightness4'><img/></div><div id='afd_screen_orientation_landscape'><img/></div><div id='afd_screen_orientation_portrait'><img/></div><div id='afd_bookmark'><img id='afd_bkImg'/></div></div>";
    var bottomMenu = "<div id='afd_bottomMenu'><div id='afd_precedingChapter'><img/></div><div id='afd_divide_1' class='afd_divide'><img/></div><div id='afd_jumping'><img/></div><div id='afd_divide_2' class='afd_divide'><img/></div><div id='afd_brightness'><img/></div><div id='afd_divide_3' class='afd_divide'><img/></div><div id='afd_setting'><img/></div><div id='afd_divide_4' class='afd_divide'><img/></div><div id='afd_nextChapter'><img/></div></div>";
	var pageturn = "<div id='afd_pageturn'></div>"; 
	var content = "<div id='afd_content'></div>";
    var scalePanel = "<div class='afd_scale_panel'><span id='afd_value'></span><div class='afd_scale' id='afd_bar'><div></div><span id='afd_btn'></span></div></div>" ;
    var sharingBox = "<div id='afd_sharingBox'></div>";
	//添加阅读背景图片
   // $body.css({"background-image","url('"+path+"/image/afd_bookshelf.png')"});
    //$body.append(test);
	$body.append(bookpagetitle);
	$body.append(bookpagetitleportrait);
	$body.append(menu);
    $body.append(sharingBox);
    
    var twitter = "<div class='afd_shareItem'><a id='afd_twitter_button' target='_blank' href ='#'><span><img/>Twitter</span></a></div>";
    var googleShare = "<div class='afd_shareItem'><a id='afd_gplus' href='#'><span><img/>Google+</span></a></div>";
    $afd_sharingBox = $("#afd_sharingBox");
    $afd_sharingBox.append(googleShare);
    $afd_sharingBox.append(twitter);
    
	$body.append(pageturn);
	
    $afd_pageturn = $("#afd_pageturn");
	$afd_pageturn.append(content);
    $afd_content = $("#afd_content");
	var progress = "<div id='afd_currentPage_progress'><div id='progress1'><img/></div><div id='progress2'><img/></div><div id='progress3'><img/></div><div id='progress4'><img/></div><div id='progress_html'></div></div>";
	$body.append(progress);
	$body.append("<div id='afd_page_totalpage'><div id='afd_currentPage'></div><div id='afd_page_totalpage_left'></div><div id='afd_page_totalpage_right'></div></div>");
//	$body.append("<div id='afd_currentPage'></div>");
    $body.append(scalePanel);
    $body.append(bottomMenu);
    
	/*layoutHeight = $(window).height();
	layoutWidth = $(window).width()-60;
	floatrightlayoutWidth = $(window).width();

    if (navigator.userAgent.match(/Android/i)) {

			Android.printmessage("layoutWidth11",layoutWidth,"layoutWidth");
			Android.printmessage("layoutHeight",layoutHeight,"layoutHeight");
		}*/
    var cWPadding;
    var cHPadding;
	
	if ($(window).width()>=810){
		setafd_content_css_landscape();
		}
	if ($(window).width()<810){
		setafd_content_css_portrait();
		}
		
		
    $afd_menu = $("#afd_menu")
    $afd_bottomMenu = $("#afd_bottomMenu");
    $afd_currentPage = $("#afd_currentPage");
	$afd_page_totalpage = $("#afd_page_totalpage");

	$afd_currentPage_progress = $("#afd_currentPage_progress");

	$afd_page_totalpage_left = $("#afd_page_totalpage_left");
	$afd_page_totalpage_right = $("#afd_page_totalpage_right");
    $afd_scale_panel = $(".afd_scale_panel");
	$afd_scale_panel1 = $(".afd_scale_panel1");
	$afd_zoomtable = $("#afd_zoomtable");
    $afd_zoomin = $("#afd_zoomin");
    $afd_zoomout = $("#afd_zoomout");
	$afd_brightness0 = $("#afd_brightness0");
	$afd_brightness1 = $("#afd_brightness1");
	$afd_brightness2 = $("#afd_brightness2");
	$afd_brightness3 = $("#afd_brightness3");
	$afd_brightness4 = $("#afd_brightness4");
	$afd_screen_orientation_landscape = $("#afd_screen_orientation_landscape");
	$afd_screen_orientation_portrait = $("#afd_screen_orientation_portrait");
	$progress1 = $("#progress1");
	$progress2 = $("#progress2");
	$progress3 = $("#progress3");
	$progress4 = $("#progress4");
	$progress_html = $("#progress_html");
	$afd_menu.width(floatrightlayoutWidth-30);
	$afd_currentPage_progress.width(layoutWidth-55);
    $afd_bottomMenu.width(layoutWidth);
    $afd_scale_panel.width(layoutWidth);
	$afd_scale_panel1.width(107);
	$afd_pageturn.width(floatrightlayoutWidth);
	$afd_page_totalpage.width(layoutWidth);
	//$afd_content.width(layoutWidth - cWPadding);
	$afd_pageturn.height(layoutHeight);
	//$afd_content.height(layoutHeight - cHPadding);
	$afd_content.append(bodyContent);
    
    setSvgTag(document.getElementById("afd_content"),svgElements,'svg');
    setSvgTag(document.getElementById("afd_content"),canvasElements,'canvas');
    
	//$afd_content.append("<break id='afd_break'><br/>&#160;</break>");
   // $("#afd_content img").css("maxWidth", (359) + "px");
   // $("#afd_content img").css("maxHeight", (450) + "px");
 	if ($(window).width()>=810){// 横屏
		
		if($(window).width()<1000){//note8 962X601
			
		   $("#afd_booktitle").show();
		   $("#afd_booktitleportrait").hide();
		   setafd_content_landscape_note8();
		   
		}else if($(window).width()>=1000&&$(window).width()<=1024){//Galaxy TabA 1024X768
			$("#afd_booktitle").show();
			$("#afd_booktitleportrait").hide();
			//2015.4.20 龚辉 为Galaxy TabA 单独添加限制方法
			setafd_content_landscape_galaxy_tab_a();
		}else if($(window).width()>1024&&$(window).width()<1250){//note10 1232X800
				//note 10 不带物理按钮
		   $("#afd_booktitle").show();
		   $("#afd_booktitleportrait").hide();
			setafd_content_landscape_note10();
		}else{//note 10 带物理按钮
					
		   $("#afd_booktitle").show();
		   $("#afd_booktitleportrait").hide();
		   setafd_content_landscape_note10();
			  
		}
	}
    if ($(window).width()<810){//竖屏

		if($(window).width()<650){//note8 601X962
			
		   $("#afd_booktitle").hide();
		   $("#afd_booktitleportrait").show();
			setafd_content_portrait_note8();
			
		}else if($(window).width()>=650&&$(window).width()<770){//note10 800X1232
				//note 10 不带物理按钮
		   $("#afd_booktitle").hide();
		   $("#afd_booktitleportrait").show();
		   setafd_content_portrait_note10();
			
		}else{//note 10 带物理按钮
					
		   $("#afd_booktitle").hide();
		   $("#afd_booktitleportrait").show();
		   setafd_content_portrait_note10();
		}
	}
   // $("#afd_content img").css("maxHeight", (layoutHeight -165) + "px");
	//$("#afd_content img").css("padding-top", 60 + "px");
	//$("#firstjpg img").css("height", (450) + "px");

	currentPage = 1;
	resizeMenu();
	$(window).resize(function() {
					if ($(window).width()>=810){
						setafd_content_css_landscape();
					}
					if ($(window).width()<810){
						setafd_content_css_portrait();
					}		  
                     layoutHeight = $(window).height();
                     layoutWidth = $(window).width()-60;
					  floatrightlayoutWidth = $(window).width();
					$afd_menu.width(floatrightlayoutWidth-30);
					$afd_currentPage_progress.width(layoutWidth-55);
   				 	$afd_bottomMenu.width(layoutWidth);
    				$afd_scale_panel.width(layoutWidth);
					$afd_scale_panel1.width(107);
					$afd_pageturn.width(floatrightlayoutWidth);
					$afd_page_totalpage.width(layoutWidth);
					//$afd_content.width(layoutWidth - cWPadding);
					$afd_pageturn.height(layoutHeight);
					//$afd_content.height(layoutHeight - cHPadding);

					if ($(window).width()>=810){// 横屏
						
						if($(window).width()<1000){//note8 962X601
							
						   setafd_content_landscape_note8();
						   
						}else if($(window).width()>=1000&&$(window).width()<=1024){//Galaxy TabA 1024X768
							//2015.4.20 龚辉 为Galaxy TabA 单独添加限制方法
							setafd_content_landscape_galaxy_tab_a();
							  
						}else if($(window).width()>1024&&$(window).width()<1250){//note10 1232X800
								//note 10 不带物理按钮
							setafd_content_landscape_note10();
							  
						}else{//note 10 带物理按钮
									
						   setafd_content_landscape_note10();
							  
						}
					}
						if ($(window).width()<810){//竖屏
					
							if($(window).width()<650){//note8 601X962
								
								setafd_content_portrait_note8();
								
							}else if($(window).width()>=650&&$(window).width()<770){//note10 800X1232
									//note 10 不带物理按钮
							   setafd_content_portrait_note10();
								
							}else{//note 10 带物理按钮
										
							   setafd_content_portrait_note10();
							}
						}
                     rotateScreen();
                     resizeMenu();
                     });
	
	//foundaid();
	
}
	function setafd_content_css_landscape(){
		
		layoutHeight = $(window).height();
		layoutWidth = $(window).width()-60;
		floatrightlayoutWidth = $(window).width();
		if($(window).width()<1000){//note8 962X601
			
			$body.css({"background":"url('/sdcard/CloudClient/.System/MultiMediaMaterial/Epub/image/afd_bookbg.png') no-repeat scroll 50% 50%"});
			$afd_content.css({
                         "padding-right":"40px","padding-left":"60px","width":"360px","height":"520px", "-webkit-column-gap":"121px","top":"55px"});
			
		}else if($(window).width()>=1000&&$(window).width()<=1024){//Galaxy TabA 1024X768
		//2015.4.20 龚辉 为Galaxy TabA 横屏时单独设置背景  以及$afd_content css的属性值
			$body.css({"background":"url('/sdcard/CloudClient/.System/MultiMediaMaterial/Epub/image/afd_bookbg_galaxy_tab_a.png') no-repeat scroll 50% 50%"});
			  $afd_content.css({
                         "padding-right":"0px","margin-left":"40px","padding-left":"0px","width":"440px","height":"630px", "-webkit-column-gap":"72px","top":"85px"});//横屏
                         
		}else if($(window).width()>1024&&$(window).width()<1250){//note10 1232X800
				//note 10 不带物理按钮
			$body.css({"background":"url('/sdcard/CloudClient/.System/MultiMediaMaterial/Epub/image/afd_bookbgnote10.png') no-repeat scroll 50% 50%"});
			  $afd_content.css({
                         "padding-right":"60px","padding-left":"80px","width":"480px","height":"680px", "-webkit-column-gap":"160px","top":"55px"});
			  
		}else{//note 10 带物理按钮
			
			if (navigator.userAgent.match(/Android/i)&&diviceModel=="") {
					diviceModel = Android.getDiviceModel();
    		}
			if(diviceModel =="GT-N8000"){
					$body.css({"background":"url('/sdcard/CloudClient/.System/MultiMediaMaterial/Epub/image/afd_bookbgnote10.png') no-repeat scroll 50% 50%"});
			  		$afd_content.css({
                         "padding-right":"60px","padding-left":"80px","width":"480px","height":"680px", "-webkit-column-gap":"160px","top":"55px"});
			  
			}else if(diviceModel =="GT-P5210"){
					
					$body.css({"background":"url('/sdcard/CloudClient/.System/MultiMediaMaterial/Epub/image/afd_bookbgnote10_1.png') no-repeat scroll 50% 50%"});
			  		$afd_content.css({
                         "padding-right":"60px","padding-left":"80px","width":"480px","height":"680px", "-webkit-column-gap":"160px","top":"55px"});
					
			}else{
				
					$body.css({"background":"url('/sdcard/CloudClient/.System/MultiMediaMaterial/Epub/image/afd_bookbgnote10_1.png') no-repeat scroll 50% 50%"});
			  		$afd_content.css({
                         "padding-right":"60px","padding-left":"80px","width":"480px","height":"680px", "-webkit-column-gap":"160px","top":"55px"});
				}

			  
		}
		

						//  $afd_content.css({
                       //  "padding-right":"40px","padding-left":"40px","padding-top":"20px"});
        cWPadding = 80;
        cHPadding = 85;
        $("#afd_bookmark").css({ "right":"40px"});
        $("#afd_zoom").css({ "right":"80px"});
        $("#afd_TOC").css({ "left":"75px"});
        $("#afd_bookshelf").css({"left":"20px"});
		$("#afd_bookstore").css({"left":"180px"});
		
		
		}
	function setafd_content_css_portrait(){
		layoutHeight = $(window).height();
		layoutWidth = $(window).width()-60;
		floatrightlayoutWidth = $(window).width();
		if($(window).width()<650){//note8 601X962
			
			$body.css({"background":"url('/sdcard/CloudClient/.System/MultiMediaMaterial/Epub/image/afd_bookbghalf.png') no-repeat scroll 50% 50%"});
      		$afd_content.css({
                         "padding-right":"30px","padding-left":"40px","width":"520px","height":"800px", "-webkit-column-gap":"81px","top":"100px"});
			
		}else if($(window).width()>=650&&$(window).width()<768){//note10 800X1232
				//note 10 不带物理按钮
			$body.css({"background":"url('/sdcard/CloudClient/.System/MultiMediaMaterial/Epub/image/afd_bookbghalfnote10.png') no-repeat scroll 50% 50%"});
			$afd_content.css({
                         "padding-right":"40px","padding-left":"60px","width":"680px","height":"1100px", "-webkit-column-gap":"120px","top":"100px"});
			
		}else if($(window).width()>=768&&$(window).width()<770){//Galaxy TabA 768X1024
		//2015.4.20 龚辉 为Galaxy TabA 竖屏时单独设置背景  以及$afd_content css的属性值
		$body.css({"background":"url('/sdcard/CloudClient/.System/MultiMediaMaterial/Epub/image/afd_bookbghalf_galaxy_tab_a.png') no-repeat scroll 50% 50%"});
			$afd_content.css({
                        "margin-left":"60px","padding-right":"0px","padding-left":"0px","width":"660px","height":"900px", "-webkit-column-gap":"108px","top":"70px"});//竖屏
                        
		}else{//note 10 带物理按钮
			
			if (navigator.userAgent.match(/Android/i)&&diviceModel=="") {
					diviceModel = Android.getDiviceModel();
    		}
			if(diviceModel =="GT-N8000"){
				
					$body.css({"background":"url('/sdcard/CloudClient/.System/MultiMediaMaterial/Epub/image/afd_bookbghalfnote10.png') no-repeat scroll 50% 50%"});
					$afd_content.css({
                         "padding-right":"40px","padding-left":"60px","width":"680px","height":"1100px", "-webkit-column-gap":"120px","top":"100px"});			  
			}else if(diviceModel =="GT-P5210"){
					
					$body.css({"background":"url('/sdcard/CloudClient/.System/MultiMediaMaterial/Epub/image/afd_bookbghalfnote10_1.png') no-repeat scroll 50% 50%"});
					$afd_content.css({
                         "padding-right":"40px","padding-left":"60px","width":"680px","height":"1100px", "-webkit-column-gap":"120px","top":"100px"});
					
			}else{
				
					$body.css({"background":"url('/sdcard/CloudClient/.System/MultiMediaMaterial/Epub/image/afd_bookbghalfnote10_1.png') no-repeat scroll 50% 50%"});
					$afd_content.css({
                         "padding-right":"40px","padding-left":"60px","width":"680px","height":"1100px", "-webkit-column-gap":"120px","top":"100px"});
				}

		}
		

        cWPadding = 20;
        cHPadding = 35;
		
		}
	function setafd_content_landscape_note8(){//note8 横屏
		
		   $("#afd_content img").css("maxWidth", (359) + "px");
           $("#afd_content img").css("maxHeight", (501) + "px");
		   $("#afd_content audio").css("maxWidth", (359) + "px");
		   $("#afd_content video").css("maxWidth", (359) + "px");
		   $("#afd_content video").css("width", (359) + "px");
		   $("#afd_content video").css("height", (200) + "px");
	}
	function setafd_content_portrait_note8(){//note8 竖屏
	
		   $("#afd_content img").css("maxWidth", (500) + "px");
		   $("#afd_content img").css("maxHeight", (800) + "px");
		   $("#afd_content audio").css("maxWidth", (500) + "px");
		   $("#afd_content video").css("maxWidth", (500) + "px");
		   $("#afd_content video").css("width", (500) + "px");
		   $("#afd_content video").css("height", (200) + "px");
	}
	function setafd_content_landscape_note10(){//note10 不带物理按钮横屏
		
		   $("#afd_content img").css("maxWidth", (479) + "px");
           $("#afd_content img").css("maxHeight", (610) + "px");
		   $("#afd_content audio").css("maxWidth", (479) + "px");
		   $("#afd_content video").css("maxWidth", (479) + "px");
		    $("#afd_content video").css("width", (479) + "px");
			 $("#afd_content video").css("height", (200) + "px");
	}
	function setafd_content_portrait_note10(){//note10 不带物理按钮竖屏
	
		   $("#afd_content img").css("maxWidth", (660) + "px");
		   $("#afd_content img").css("maxHeight", (1100) + "px");
		   $("#afd_content audio").css("maxWidth", (660) + "px");
		   $("#afd_content video").css("maxWidth", (660) + "px");
		    $("#afd_content video").css("width", (660) + "px");
			 $("#afd_content video").css("height", (200) + "px");
	}
	
	/**
	 * 2015.4.20  龚辉
	 * Galaxy TabA 横屏时的css的属性值限制
	 */
	function setafd_content_landscape_galaxy_tab_a(){
		$("#afd_content img").css("maxWidth", (440) + "px");
		$("#afd_content img").css("maxHeight", (610) + "px");
		$("#afd_content audio").css("maxWidth", (479) + "px");
		$("#afd_content video").css("maxWidth", (479) + "px");
		$("#afd_content video").css("width", (479) + "px");
		$("#afd_content video").css("height", (200) + "px");
	}
/**
 * Invoke native code to pass data to js
 * native code calls getBookData() and resizePage()
 */
function getNativeDataAndResizePage(){
	if (navigator.userAgent.match(/Android/i)) {
		Android.resizePage();
	}
	if (navigator.userAgent.match(/iPhone/i)||navigator.userAgent.match(/iPad/i)) {
		window.location = 'anreader:afd:myaction:afd:resizePage';
	}
}
/**
 * Get the actual top
 */
function getElementTop(element){
    var actualTop = element.offsetTop;
    var current = element.offsetParent;
    while (current !== null){
        actualTop += current.offsetTop;
        current = current.offsetParent;
    }
    return actualTop;
}
function displayScalepanel(tag){
    $afd_scale_panel.show();
	//$afd_scale_panel.toggle();
    $afd_menu.show();
	$afd_currentPage_progress.hide();
    $afd_bottomMenu.hide();
    $afd_currentPage.hide();
/*	$afd_page_totalpage.show();
	$afd_page_totalpage_left.show();
	$afd_page_totalpage_right.show();*/
	$afd_page_totalpage.show();
	$afd_page_totalpage_left.hide();
	$afd_page_totalpage_right.hide();
    new scale('afd_btn','afd_bar','afd_value',tag);
}

function displayScalepanel1(tag){
    //$afd_scale_panel1.show();
	//$afd_scale_panel.toggle();
   
    new scale('afd_btn1','afd_bar1','afd_value1',tag);
}
scale=function (btn,bar,value,tag){
	this.btn=document.getElementById(btn);
	this.bar=document.getElementById(bar);
    this.value=document.getElementById(value);
	this.value1=document.getElementById('afd_currentPage');
	this.step=this.bar.getElementsByTagName("div")[0];
	this.init(tag);
};
scale.prototype={
init:function (tag){
    
    var afd_button = this.btn;
    var afd_bar = this.bar;
    var afd_step = this.step;
    var t = this;
    var floatPercent;
    var currentValue;
    var barWidth = $(afd_bar).width();
    if (tag=="jumping"){
        floatPercent = parseFloat($afd_currentPage.html());
        currentValue = floatPercent/100*barWidth;
    }
    if (tag=="brightness"){
        floatPercent = 1-brightness;
        currentValue = floatPercent*barWidth;
    }
    
    afd_button.style.left = currentValue-11+"px";
    afd_step.style.width = currentValue+"px";
    
    if (tag=="jumping"){
        currentValue = currentValue/barWidth;
        currentValue = parseInt(currentValue * 100 * 10000) / 10000.0;
        t.ondrag(currentValue+"%");
    }
    if (tag=="brightness"){
        currentValue = parseInt(floatPercent * 100) / 100.0;
        t.ondrag(currentValue);
    }
    afd_bar.ontouchstart=function (e){
        var value = e.touches[0].pageX-$(afd_bar).offset().left;
        if (0<value&&value<barWidth){
            afd_button.style.left = value-11+"px";
            afd_step.style.width = value+"px";
            value = value/barWidth;
            if (tag=="jumping"){
                value = parseInt(value * 100 * 10000) / 10000.0;
                t.ondrag(value+"%");
            }
            if (tag=="brightness"){
                value = parseInt(value * 100) / 100.0;
                t.ondrag(value);
                var tempBrightness = 1 - value;
                t.onbrightness(tempBrightness);
            }
        }
    }
    afd_bar.ontouchmove=function (e){
        var value = e.touches[0].pageX-$(afd_bar).offset().left;
        if (0<value&&value<barWidth){
            afd_button.style.left= value-11+"px";
            afd_step.style.width = value+"px";
            value = value/barWidth;
            if (tag=="jumping"){
                value = parseInt(value * 100 * 10000) / 10000.0;
                t.ondrag(value+"%");
            }
            if (tag=="brightness"){
                value = parseInt(value * 100) / 100.0;
                t.ondrag(value);
                var tempBrightness = 1 - value;
                t.onbrightness(tempBrightness);
            }
        }
        if (navigator.userAgent.match(/Android/i)) {
            e.preventDefault();
        }
    }
    afd_bar.ontouchend=function (e){
        if (tag=="jumping"){
            var percent = $(afd_step).width()/barWidth;
            t.onjump(percent);
        }
        if (tag=="brightness"){
            saveSettingData("brightness",brightness);
        }
    }
},
ondrag:function (value){
    this.value.innerHTML=value;
	
},
onjump:function (percent){
	if (navigator.userAgent.match(/Android/i)) {
		Android.sliderBarListener(percent);
    }
    if (navigator.userAgent.match(/iPhone/i)||navigator.userAgent.match(/iPad/i)) {
        window.location = 'anreader:afd:myaction:afd:sliderBarListener:afd:'+ percent;
    }
},
onbrightness:function (tempBrightness){
    brightness = tempBrightness;
	//Android.printmessage("brightness",parseFloat(tempBrightness),"brightness");
	//alert(tempBrightness);
	//add kao 20130805
	var tempBrightness1 =tempBrightness*minbrightness;
	$afd_pageturn.css("background-color","rgba(0,0,0,"+tempBrightness1+")");
	//remove kao 20130805
    //$afd_pageturn.css("background-color","rgba(0,0,0,"+tempBrightness+")");
}
}
function setLayoutImag(){
    //$afd_menu.css("background-image","url('"+path+"/image/afd_topmenu.png')");
    $("#afd_bookshelf img").attr("src",path+"/image/afd_back.png");
    $("#afd_TOC img").attr("src",path+"/image/afd_tablecontentsbtn.png");
	$("#afd_bookstore img").attr("src",path+"/image/afd_tablecontentsbtn.png");
    $("#afd_zoom img").attr("src",path+"/image/afd_fontsize.png");
	 $("#afd_zoomtable img").attr("src",path+"/image/afd_zoomtable.png");
    $("#afd_zoomout img").attr("src",path+"/image/afd_font_zoomout.png");
    $("#afd_zoomin img").attr("src",path+"/image/afd_font_zoomin.png");
	$("#afd_brightness0 img").attr("src",path+"/image/afd_brightness.png");
	$("#afd_brightness1 img").attr("src",path+"/image/afd_brightness1.png");
	$("#afd_brightness2 img").attr("src",path+"/image/afd_brightness2.png");
	$("#afd_brightness3 img").attr("src",path+"/image/afd_brightness3.png");
	$("#afd_brightness4 img").attr("src",path+"/image/afd_brightness4.png");
	$("#afd_screen_orientation_landscape img").attr("src",path+"/image/afd_landscape.png");
	$("#afd_screen_orientation_portrait img").attr("src",path+"/image/afd_portrait.png");
	$("#progress1 img").attr("src",path+"/image/afd_progress1.png");
	$("#progress2 img").attr("src",path+"/image/afd_progress2.png");
	$("#progress3 img").attr("src",path+"/image/afd_brightness3.png");
	$("#progress4 img").attr("src",path+"/image/afd_progress4.png");
    $("#afd_bookmark img").attr("src",path+"/image/afd_bookmark.png");
    $("#afd_precedingChapter img").attr("src",path+"/image/afd_prev.png");
    $("#afd_jumping img").attr("src",path+"/image/afd_skip.png");
    $("#afd_brightness img").attr("src",path+"/image/afd_bright.png");
    $("#afd_setting img").attr("src",path+"/image/afd_setting.png");
    $("#afd_nextChapter img").attr("src",path+"/image/afd_next.png");
    $(".afd_divide img").attr("src",path+"/image/afd_divide.png");
    
    $afd_bottomMenu.css("background-image","url('"+path+"/image/afd_topmenu.png')");
    $(".afd_scale span").css("background-image","url('"+path+"/image/afd_drug.png')");
    $(".afd_scale1 span").css("background-image","url('"+path+"/image/afd_drug.png')");
//	$("#afd_content").css("background-image","url('"+path+"/image/afd_bookself.png')");
}
/**
 * Open the chapter
 * @param i is the chapter index
 */
function openChapter(i,order,prev){
    if (order=="preceding"){
        if (i==0) {
			loading({text:"已经是第一章！",timer:3000});
            return;
        }
/*        else if(flag_next_before ==101 ||flag_next_before ==102 ||flag_next_before==21)	{
			i=i-2;
		}*/
		else{
		i=i-1;
		}
		
    }
    if (order=="next"){
        if (i==chapterTotleNum-1){
			loading({text:"已经是最后一章！",timer:3000});
            return;
        } 
		/*else if(flag_next_before ==101 ||flag_next_before ==103 || flag_next_before==11)	{
			if (i==chapterTotleNum-2){
			loading({text:"已经是最后一章！",timer:3000});
            return;
			}
			i=i+2;
		}*/
        else{ i=i+1;}
    }
    if (prev=="prev"){
        order = "order";
    }
	if (navigator.userAgent.match(/Android/i)) {
        Android.jsOpenChapter(i,order);
    }
    if (navigator.userAgent.match(/iPhone/i)||navigator.userAgent.match(/iPad/i)) {
        window.location = 'anreader:afd:myaction:afd:jsOpenChapter:afd:'+i+':afd:'+order;
    }
}
function readySettingData(key){
    if (typeof(localStorage) == 'undefined' ) {
		loading({text:"你的浏览器不支持 HTML5！请升级",timer:3000});
        //alert('Your browser does not support HTML5 localStorage. Try upgrading.');
		//alert('Your browser does not support HTML5 localStorage. Try upgrading.');
    } else {
        try {
            return localStorage.getItem(key);
        } catch (e) {
            if (e == QUOTA_EXCEEDED_ERR) {
				loading({text:"超出配额！",timer:3000});
                //alert('Quota exceeded!');
            }
        }
    }
}

function saveSettingData(key,value){
    if (typeof(localStorage) == 'undefined' ) {
		loading({text:"你的浏览器不支持 HTML5！请升级",timer:3000});
        //alert('Your browser does not support HTML5 localStorage. Try upgrading.');
    } else {
        try {
            localStorage.setItem(key,value);
        } catch (e) {
            if (e == QUOTA_EXCEEDED_ERR) {
               // alert('Quota exceeded!');
            }
        }
    }
    
}

function initSettings(){
    //$afd_pageturn.find("*").css({"background-color":"rgba(0,0,0,0)"});
	var fontSize = readySettingData("fontSize");
	
	if (fontSize !=null){
		$afd_content.css("font-size", parseInt(fontSize) + "px");
	}
	else{
		$afd_content.css("font-size", "16px");
	}
    brightness = readySettingData("brightness");
    if (brightness==null){brightness=0}
	//add kao 20130805
	var tempbrightness =brightness*minbrightness;
    $afd_pageturn.css("background-color","rgba(0,0,0,"+tempbrightness+")");
	//remove kao 20130805
    //$afd_pageturn.css("background-color","rgba(0,0,0,"+brightness+")");
    var fontColor = readySettingData("fontColor");
    if (fontColor!=null){
        $afd_pageturn.find("*").css({"color":fontColor});
    }
    var background = readySettingData("background");
    if (background!=null){
        $body.css({"background-color":background});
    }
    var fontStyle = readySettingData("fontStyle");
    if (fontStyle!=null){
        $afd_pageturn.find("*").css({"font-family":fontStyle});
    }
    var dayAndNightModel = readySettingData("dayAndNightModel");
    if (dayAndNightModel=="night"){
        $body.css({"background-color":"black"});
        $afd_pageturn.find("*").css({"color":"white"});
    }
}

function showSharingPage(){
    androidLongtouch = 0;
    var text = window.getSelection().toString();
    
    if (navigator.userAgent.match(/iPhone/i)||navigator.userAgent.match(/iPad/i)) {
        window.getSelection().empty();
        $("#afd_twitter_button").attr('href',"http://twitter.com/intent/tweet?source=sharethiscom&text="+text);
        $("#afd_twitter_button img").attr('src',path+"/image/twitter_bird_callout.png");
        $("#afd_gplus").attr('href',"https://m.google.com/app/plus/x/aoyapxt82rpw/?v=compose&group=m1c&hideloc=1&content="+text);
        $("#afd_gplus img").attr('src',path+"/image/gplus_64.png");
        $afd_sharingBox.show();
    }
    else
        Android.shareText(text);
}

function androidLongtouchModel(model){
	androidLongtouch = model;
	if (model==1){
	   //markImg();//kao 20130711
		$afd_menu.hide(); //kao 20130711
		$afd_currentPage_progress.hide();
		$afd_scale_panel.hide();
	    $afd_bottomMenu.hide();//kao 20130711
		//$afd_menu.hide();
	   // $afd_bottomMenu.hide();
	}
}

function androidCopySelectionText(){
	androidLongtouch = 0;
    var text = window.getSelection().toString();
	Android.copySelectionText(text);
}

function ttsSpeaking(){
	androidLongtouch = 0;
    var text = window.getSelection().toString();
	Android.textToSpeak(text);
}

function getAndroidVersion(andVersion){
	androidVersion = andVersion;
}
function resetViewport(){
    var metas = $("head").find("meta");
    for (var i=0;i<metas.length;i++){
        if ($(metas[i]).attr('name')=="viewport"){
            $(metas[i]).replaceWith("<meta name=\"viewport\" content=\"width=device-width, height=device-height\"/>");
            return;
        }
    }
}
$(document).ready(function() {
                  resetViewport();
                  initDom();
				 // Android.printmessage("bodycai",startX,$("body"));
				  
                  initSettings();
/*				  $("video").touchstart(function(e){
											alert("video");
											return false;
											//e.stopPropagation();
											});*/
                  addListener();
				  foundaid();
                  getNativeDataAndResizePage();
                  });