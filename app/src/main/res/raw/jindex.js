var selectAll = 0;
var isDownloading = false;
var injectBackJS = "unInjectBackJS";
var displayAddButton = false;

$(document).ready(function(){
                  setLayoutLocation(document.body.scrollHeight);
                  getAllBooks();
                  addListener();
                  showAddButton();
                  });
function showAddButton(){
    if (!displayAddButton){
        $("#import").hide();
		$("#quit").show();
		$("#bookstore").show();
		$("#download").show();
        $("#edit").show();
		$("#edit_finish").hide();
		$("#afd_editDelete1").hide();
		$("#afd_editMove").hide();
		
    }else{  $("#import").hide();
	    $("#edit_finish").hide();
		$("#afd_editDelete1").hide();
		$("#afd_editMove").hide()}
}
function setLayoutLocation(bodyHeight){
	$("#afd_bookshelf").height(bodyHeight-43);
	$("#afd_bookshelf").width($("#container").width());
	$("#storemenubroderleft").height(bodyHeight-43);
	$("#storemenubroderright").height(bodyHeight-43);
}
function addListener(){
	
    $("#quit").bind("click",function(){exit();});
	$("#bookstore").bind("click",function(){bookstore();});
	$("#download").bind("click",function(){download();});
    $("#localbutton").bind("click",function(){androidLocalAddBooks();});
    $("#importbutton").bind("click",function(){importBook();$("#afd_local").hide();});
    $("#downloadbutton").bind("click",function(){downloadBook();});
    $("#downloadcancel").bind("click",function(){downloadCancel();});
    $("#import").bind("click",function(){openImportPage();});
    $("#edit").bind("click",function(){editing();});
	$("#edit_finish").bind("click",function(){editfinish();});
    $("#afd_editDelete").bind("click",function(){deleteBooks();});
	$("#afd_editDelete1").bind("click",function(){deleteBooks();});
	//$("afd_editMove").bind("click",function(){afd_editMove();});
    $("#afd_editAll").bind("click",function(){selectAllBooks();});
    $("#afd_editCancel").bind("click",function(){cancelDelete();});
    $("#afd_showInternet").bind("click",function(){internetOptionClicked();});
    $("#afd_showLocal").bind("click",function(){localOptionClicked()});
    $("#afd_showWifi").bind("click",function(){wifiOptionClicked();});
    $(".close").bind("click",function(){$("#afd_internet").hide();$("#afd_local").hide();});
}
/** click on local button and hide other options */
function localOptionClicked(){
    $("#afd_internet").hide();
    $("#afd_local").show();
    $("#afd_showLocal").css('color','#5A9A30');
    $("#afd_showWifi").css('color','#000000');
    $("#afd_showInternet").css('color','#000000');
}
function internetOptionClicked(){
    $("#afd_internet").show();
    $("#afd_local").hide();
    $("#afd_showLocal").css('color','#000000');
    $("#afd_showWifi").css('color','#000000');
    $("#afd_showInternet").css('color','#5A9A30');
}
function wifiOptionClicked(){
    $("#afd_internet").hide();
    $("#afd_local").hide();
    $("#afd_showLocal").css('color','#000000');
    $("#afd_showWifi").css('color','#5A9A30');
    $("#afd_showInternet").css('color','#000000');
    if (navigator.userAgent.match(/iPhone/i)||navigator.userAgent.match(/iPad/i)) {
        window.location = 'anreader:afd:myaction:afd:openWifi';
    }
}
/** open add-book page */
function openImportPage(){
    if (!isDownloading){$("#downloadcancel").css('color','grey');downloadProgress(0);}
    if (isDownloading){$("#downloadbutton").css('color','grey');downloadProgress(1);}
    $(".afd_selectBg").hide();
	// $(".afd_selectBg1").hide();
    $("#afd_editMenu").hide();
    
    $("#edit img").attr("src","../image/afd_index_edit.png");
    
    if (navigator.userAgent.match(/Android/i)) {
        $("#afd_showWifi").hide();
        $("#afd_local").show();
        $("#afd_showLocal").css('color','#5A9A30');
        $("#afd_showWifi").css('color','#000000');
        $("#afd_showInternet").css('color','#000000');
    }
    if (navigator.userAgent.match(/iPhone/i)||navigator.userAgent.match(/iPad/i)){
        $("#afd_showLocal").hide();
        $("#afd_showWifi").hide();
        $("#afd_internet").show();
        $("#afd_showLocal").css('color','#000000');
        $("#afd_showWifi").css('color','#000000');
        $("#afd_showInternet").css('color','#5A9A30');
    }
    
    window.location = "#openModa";
}

function downloadBook(){
    if (isDownloading){return;}
    //$("#downloadbutton").css('color','#5A9A30');
    //setTimeout(function(){$("#downloadbutton").css('color','#000000');},200);
	var fileurl = $("#fileurl").attr("value");
    if (fileurl==""){
		loading({text:"œ¬‘ÿ¡¥Ω”Œ™ø’£°",timer:3000});
        //alert("Please enter a book url!")
        return;
    }
	if (navigator.userAgent.match(/Android/i)) {
		setDownLoadButtonStatus(1);
		downloadProgress(0);
        Android.downloadBook(fileurl);
    }
    if (navigator.userAgent.match(/iPhone/i)||navigator.userAgent.match(/iPad/i)) {
        window.location = 'anreader:afd:myaction:afd:downloadBook:afd:'+fileurl;
    }
}
function downloadCancel(){
    if (!isDownloading){return;}
    //$("#downloadcancel").css('color','#5A9A30');
    //setTimeout(function(){$("#downloadcancel").css('color','#000000');},200);
	if (navigator.userAgent.match(/Android/i)) {
        Android.downloadCancel();
    }
    if (navigator.userAgent.match(/iPhone/i)||navigator.userAgent.match(/iPad/i)) {
        window.location = 'anreader:afd:myaction:afd:downloadCancel';
    }
}

function androidLocalAddBooks(){
    $("#localbutton").css('color','#5A9A30');
    setTimeout(function(){$("#localbutton").css('color','#000000');},200);
	if (navigator.userAgent.match(/Android/i)) {
        Android.addBooks();
    }
}
function deleteBooks(){
    var bookIdArray = checkBookStatus();
    var tempBooks = null;
    for (var i=0;i<bookIdArray.length;i++){
        tempBooks = tempBooks + bookIdArray[i]+"afd";
    }
    bookString = tempBooks;
    realizeDeleting(bookString)
}
/** invoke native code to delete book from db and cache folder */
function realizeDeleting(bookString){
	if (bookString==null) return;
	if (navigator.userAgent.match(/Android/i)) {
        Android.deleteBooks(bookString);
    }
    if (navigator.userAgent.match(/iPhone/i)||navigator.userAgent.match(/iPad/i)) {
        window.location = 'anreader:afd:myaction:afd:deleteBooks:afd:'+bookString;
    }
}
/** show the edit-buttons */
function editing(){
   		
	//$(".afd_selectBg1").toggle();
   // if ($("#edit img").attr("src")=="../image/afd_index_edit.png"){
		//$("#edit")({  "float":"left","width":"100px","padding-left":"10px","padding-top":"5px"});
       // $("#edit img").attr("src","../image/afd_edit_back.png");
       
		$("#quit").hide();
		$("#bookstore").hide();
		$("#edit").hide();
		$("#download").hide();
		$("#edit_finish").show();
		$("#afd_editDelete1").show();
		$("#afd_editMove").show();
		 $(".afd_selectBg").toggle();
		$("#afd_editMenu").hide("fast");
  //  }
 //   else{
      //  $("#edit img").attr("src","../image/afd_index_edit.png");
		//$("#edit")({  "float":"right","width":"68px","padding-left":"10px","padding-top":"5px"});
	//	$("#quit").show();
		//$("#bookstore").show();
        //$("#afd_editMenu").hide("fast");
 //   }
}
function editfinish(){
    $(".afd_selectBg").toggle();
	// $(".afd_selectBg1").toggle();
       //   $("#edit img").attr("src","../image/afd_index_edit.png");
		//$("#edit")({  "float":"right","width":"68px","padding-left":"10px","padding-top":"5px"});
		$("#quit").show();
		$("#bookstore").show();
        $("#edit").show();
		$("#download").show();
		$("#edit_finish").hide();
	    $("#afd_editDelete1").hide();
		$("#afd_editMove").hide();
		$("#afd_editMenu").hide("fast");
}
function selectAllBooks(){
    if (selectAll == 0){
        $("#afd_books").find(".afd_edit_selectedPng").show();
        //$("#afd_editAll img").attr("src","../image/afd_edit_allorang.png");
        selectAll = 1;
    }
    else {
        $("#afd_books").find(".afd_edit_selectedPng").hide();
        //$("#afd_editAll img").attr("src","../image/afd_edit_all.png");
        selectAll = 0;
    }
}
function cancelDelete(){
    $("#afd_books").find(".afd_edit_selectedPng").hide();
    //$("#afd_editAll img").attr("src","../image/afd_edit_all.png");
    selectAll = 0;
}
/** pass the bookpath to native code to open the book */
function openBook(bookPath,coverimage){
    if (navigator.userAgent.match(/Android/i)) {
		Android.openBook(bookPath,coverimage);
	}
	if (navigator.userAgent.match(/iPhone/i)||navigator.userAgent.match(/iPad/i)) {
		window.location = 'anreader:afd:myaction:afd:openBook:afd:'+bookPath;
	}
}

function exit(){
    if (navigator.userAgent.match(/Android/i)) {
		Android.exit();
	}
	if (navigator.userAgent.match(/iPhone/i)||navigator.userAgent.match(/iPad/i)) {
		window.location = 'anreader:afd:myaction:afd:exit';
	}
}
function bookstore(){
    if (navigator.userAgent.match(/Android/i)) {
		Android.openbookstore();
	}
	if (navigator.userAgent.match(/iPhone/i)||navigator.userAgent.match(/iPad/i)) {
		window.location = 'anreader:afd:myaction:afd:exit';
	}
}
function download(){
    if (navigator.userAgent.match(/Android/i)) {
		Android.showdownloadlist();
	}
	if (navigator.userAgent.match(/iPhone/i)||navigator.userAgent.match(/iPad/i)) {
		window.location = 'anreader:afd:myaction:afd:exit';
	}
}
/** invoke android native code to add the book into db and then create it in bookshelf */
function importBook(){
    $("#importbutton").css('color','#ffffff');
    setTimeout(function(){$("#importbutton").css('color','#000000');},200);
	var bookPath = $('#filepath').attr('value');
    if (navigator.userAgent.match(/Android/i)) {
		Android.jsImportBook(bookPath);
	}
	window.location = "#close";
}
/** get all books in db and then invoke native code to create them in bookshelf */
function getAllBooks()
{
    if (navigator.userAgent.match(/Android/i)) {
		Android.getAllBooks();
	}
	if (navigator.userAgent.match(/iPhone/i)||navigator.userAgent.match(/iPad/i)) {
		window.location = 'anreader:afd:myaction:afd:getAllBooks';
	}
}

function selectBook(ev,element,element1){
    $(element).toggle();
	$(element1).toggle();
    ev.stopPropagation();
}
function selectBook1(ev,element){
    $(element).toggle();
    ev.stopPropagation();
}

function getnearestbook(x,y){
	
	//alert(x);
	//alert(y);
    var uls = $("#afd_books").find("ul");
    for (var i=0;i<uls.length;i++){
        var element = $(uls[i]).find(".coverimage");
		//var left1 = $(element).style.left;
		//alert(i);
    }
}
/** check the book status, if the "display" is "none" that means the book will be deleted */
function checkBookStatus(){
    var bookIdArray = new Array();
    var uls = $("#afd_books").find("ul");
    for (var i=0;i<uls.length;i++){
        var element = $(uls[i]).find(".afd_edit_selectedPng");
        if ($(element).css("display")!="none"){
            bookIdArray.push(i);
            var key = $(element).attr("value");
            deleteBookmark(key);
        }
    }
    return bookIdArray;
}

function deleteBookmark(key){
	if (typeof(localStorage) == 'undefined' ) {
		loading({text:"ƒ„µƒ‰Ø¿¿∆˜≤ª÷ß≥÷ HTML5£°«Î…˝º∂",timer:3000});
        //alert('Your browser does not support HTML5 localStorage. Try upgrading.');
    } else {
        try {
            localStorage.removeItem(key);
        } catch (e) {
            if (e == QUOTA_EXCEEDED_ERR) {
				loading({text:"≥¨≥ˆ≈‰∂Ó£°",timer:3000});
                //alert('Quota exceeded!'); 
            }
        }
    }
}
function downloadProgress(progress){
    $("#afd_dprogress").css({"width":progress+"%"});
    $("#afd_dpercent").text(progress+"%");
}
function screenchange(){
   	//add kao 20130730 µ˜’˚∫· ˙∞Êƒø¬º±ﬂøÚ
	if ($(window).width()>=720){
		$("#afd_books ul").css({"padding-left":"20px"}); 
	}
   	if ($(window).width()<720){
			
		$("#afd_books ul").css({ "padding-left":"10px"}); 
   	}
}
function setDownLoadButtonStatus(downloadStatus){
    if (downloadStatus==0){
        isDownloading = false;
    }
    else
        isDownloading = true;
    if (!isDownloading){$("#downloadcancel").css('color','grey');$("#downloadbutton").css('color','#000000');}
    if (isDownloading){$("#downloadbutton").css('color','grey');$("#downloadcancel").css('color','#000000');}
}
/** the native code invoke this method to create bookshelf */
function creatBS(bookinfolist)
{

  	if($.isArray(bookinfolist)){
		for(var i=0;i<bookinfolist.length;i++){
			var bookinfo = bookinfolist[i];
			if($.isArray(bookinfo)){
				if(bookinfo.length==5){
					creatBookShelf(bookinfo[0],bookinfo[1],bookinfo[2],bookinfo[3],bookinfo[4]);
				}
			}
		}
	}else{
		//alert(bookinfolist);
	}
		//add kao 20130730 µ˜’˚∫· ˙∞Êƒø¬º±ﬂøÚ
	if ($(window).width()>=720){
		$("#afd_books ul").css({"padding-left":"20px"}); 
	}
   	if ($(window).width()<720){
			
		$("#afd_books ul").css({ "padding-left":"10px"}); 
   	}
	
	//$(".afd_selectBg").bind("click",function(ev){selectBook(ev,this.getElementsByTagName("img")[0],this.getElementsByTagName("img")[1]);});
	setLayoutLocation(document.body.scrollHeight);
//	alert("22222");
}
function creatBookShelf(id, name, author, coverimage, bookpath)
{
	//alert(id+"  " +name);
	//onclick='openBook(\'"+bookpath+"\',\'"+coverimage+"\')'
    var bookTag ="<ul><li class='li_coverimage' ><div class='afd_selectBg'><img class='afd_edit_selectedPng1' value='"+id+"' src='../image/afd_editbook_bg.png'/><img class='afd_edit_selectedPng' value='"+id+"' src='../image/afd_edit_selected.png'/></div><span class='bookname'>"+name+"</span><img class='coverimage' value='"+id+"' src='"+coverimage+"'/></ul>";
    $("#afd_books").append(bookTag);
 //   $(".bookname::last").text(name);
  //  $(".afd_edit_selectedPng::last").attr("value",id);
//	$(".afd_edit_selectedPng1::last").attr("value",id);
//	$(".coverimage::last").attr("value",id);
   $(".afd_selectBg::last").bind("click",function(ev){selectBook(ev,this.getElementsByTagName("img")[0],this.getElementsByTagName("img")[1]);});
   $(".li_coverimage::last").bind("click",function(){openBook(bookpath,coverimage);});
 //   setLayoutLocation(document.body.scrollHeight);
	
}
/** the native code invoke this method to create bookshelf */
function appendstoremenu()
{	var _rows = 3;
	var rows = -1,topHeight = 150,lineHeight = 171.5;
	var height = document.body.scrollHeight-43;
	rows = height/lineHeight;
	if(height%lineHeight!=0){
		rows++;
	}
	 if(parseInt(rows,10)>_rows){
		 var marginTop = topHeight + ((lineHeight) * 2);
		for(var i=_rows;i<rows;i++){
			var html = '';
			marginTop +=lineHeight;
			html = '<img class="afd_bookshelf storemenu21" src="../image/afd_storemenu2.png" style="margin-top:'+marginTop+'px;"/>';
			$('#container').append(html);
		}
		_rows = rows;
	 }
	 setLayoutLocation(document.body.scrollHeight);
}


