/***********************************************************
 * SmartHome V3, 基础 Javascript 运行库, utf-8
 * 依赖于jQuery框架
 * BY Edutech & Alan & shedutech@gmail.com, 2011
 **********************************************************/

var DEBUG = true; //前端调试开关

/*//简化DOM原生方法调用
function $I(id){return document.getElementById(id);}
function $N(name,parent){var parent = parent||document;if (typeof(parent)=='string')parent=document.getElementById(parent);return parent.getElementsByName(name);}
function $T(tagName,parent){var parent = parent||document;if (typeof(parent)=='string')parent=document.getElementById(parent);return parent.getElementsByTagName(tagName);}

//删除首尾空格
String.prototype.trim = function()
{
    return this.replace(/(^\s*)|(\s*$)/g, '');
}*/

//返回字节数
String.prototype.bytes = function()
{
	return this.replace(/[^\x00-\xff]/g,'***').length;
}

//返回截取的长度为n的字符串
String.prototype.left = function (num, ext)
{
	var i,count,bytes = this.bytes();
	if (num < bytes) bytes = num;
	else if (ext) ext = null;
	for ( c = i = 0; i < bytes && c < bytes; i++)
	{
		c += this.substr(i,1).bytes();
	}
	return ext ? this.substr(0,i)+ext : this.substr(0,i);
}

/*//执行正则验证
String.prototype.test = function(pattern,flag)
{
	if (!flag) flag = 'g';
	var reg = new RegExp(pattern,flag) ;
	return reg.test(this);
}

//返回元素在数组中的索引
Array.prototype.findChild = function(v)
{
	for (var i=0; i<this.length; i++)
	{
		if (this[i] === v) return i;
	}
	return -1;
}*/

//检查在数组内是否存在某值
Array.prototype.haveChild = function(v)
{
	for (var i=0; i<=this.length; i++)
	{
		if (this[i] === v) return true;
	}
	return false;
}

//返回指定格式的当前系统时间
function formatDateTime(format, datetime)
{
	var date = datetime ? datetime : new Date();
	var y = date.getFullYear();
	var m = date.getMonth()+1;
	var d = date.getDate();
	var h = date.getHours();
	var i = date.getMinutes();
	var s = date.getSeconds();
	if (format.indexOf('yy') != -1) format = format.replace('yy',y.toString().substr(y.toString().length-2));
	if (format.indexOf('y') != -1) format = format.replace('y',y);
	if (format.indexOf('mm') != -1) format = format.replace('mm',('0'+m).substr(m.toString().length-1));
	if (format.indexOf('m') != -1) format = format.replace('m',m);
	if (format.indexOf('dd') != -1) format = format.replace('dd',('0'+d).substr(d.toString().length-1));
	if (format.indexOf('d') != -1) format = format.replace('d',d);
	if (format.indexOf('h') != -1) format = format.replace('hh',('0'+h).substr(h.toString().length-1));
	if (format.indexOf('h') != -1) format = format.replace('h',h);
	if (format.indexOf('ii') != -1) format = format.replace('ii',('0'+i).substr(i.toString().length-1));
	if (format.indexOf('i') != -1) format = format.replace('i',i);
	if (format.indexOf('ss') != -1) format = format.replace('ss',('0'+s).substr(s.toString().length-1));
	if (format.indexOf('s') != -1) format = format.replace('s',s);
	return format;
}

/*//返回URL参数序列
function getQueryString(filter)
{
	var indexQ = location.href.indexOf('?');
	var strUrl = indexQ > 0 ? location.href.substr(indexQ+1) : '';
	if (strUrl.length > 0 && filter)
	{
		var pattern = new RegExp(filter+'(=[^&]*){0,1}[&]{0,1}', 'ig')
		strUrl = strUrl.replace(pattern, '').replace(/&$/ig, '');
	}
	return strUrl;
}*/

//返回URL参数值
function getQuery(query)
{
	var indexQ = location.href.indexOf('?');
	var strUrl = indexQ > 0 ? location.href.substr(indexQ+1) : '';
	if (strUrl.length > 0 && query)
	{
		var pattern = new RegExp(query+'(=[^&]*){0,1}[&]{0,1}', 'ig')
		strUrl = strUrl.match(pattern)[0].replace(pattern, '$1').substr(1);
	}
	else {strUrl = '';}
	return strUrl;
}

//重新加载页面
function redirect(url)
{
	window.location.href = url ? url : window.location.href;
}

//数据对象排序
function objectSort(o, q)
{
	var _q = q.split(',');
	var _o = {};
	for ( var i = 0; i < _q.length; i++ ) {
		o[_q[i]].sNum = i+1;
		_o[_q[i]] = o[_q[i]];
	}
	_o.length = o.length;
	return _o;
}

//数据对象过滤
function objectFilter(o, q)
{
	var _q = q.split(',');

	var _o = {};
	for (var s in o)
	{
		if (s == 'length' || _q.haveChild(s)) continue;
		_o[s] = o[s];
	}
	_o.length -= _q.length;
	return _o;
}

//显示loading信息
function loading(o)
{
	if (typeof(o) != 'object' && typeof(o) != 'string') return;
	if (typeof(o) == 'string') o = {text:o, option:'open', timer:0, mask:false};
	
	//创建蒙板层
	if (o.mask)
	{
		if (!$('#maskmodal').get(0))
		{
			$('body').prepend('<div id="maskmodal">&nbsp;</div>');
		}
		$('#maskmodal').css('display', 'block');
	}
	
	//创建信息层
	var layer = $('#loading');
	if (!layer.get(0))
	{
		$('body').prepend('<div id="loading">'+o.text+'</div>');
		layer = $('#loading');
	}
	else
	{
		layer.html(o.text);
	}
	
	//执行动作
	switch (o.option)
	{
		case 'open':
		default:
			layer.fadeIn(300);
			if (o.timer)
			{
				window.setTimeout(function(){$('#loading').fadeOut(300);$('#maskmodal').css('display','none');}, o.timer);
			}
			break;
		case 'close':
			window.setTimeout(function(){$('#loading').fadeOut(300);$('#maskmodal').css('display','none');}, 500);
			break;
	}
}

//异步POST请求
function post(url, data, callback)
{
	$.ajax
	({
		type       : 'post',
		url        : url,
		cache      : false,
		dataType   : 'text',
		data       : data,
		success    : function(data, textStatus)
		{
			switch (typeof(callback))
			{
			case 'function':
				callback(data, textStatus);
				break;
			case 'string':
				eval(callback);
				break;
			default: break;
			}
		},
		error      : function(XMLHttpRequest, textStatus, errorThrown)
		{
			if (DEBUG) alert(XMLHttpRequest.responseText);
		}
		
	});
}

//异步GET请求
function get(url, callback)
{
	$.ajax
	({
		type       : 'get',
		url        : url,
		cache      : false,
		dataType   : 'text',
		success    : function(data, textStatus)
		{
			switch (typeof(callback))
			{
			case 'function':
				callback(data, textStatus);
				break;
			case 'string':
				eval(callback);
				break;
			default: break;
			}
		},
		error      : function(XMLHttpRequest, textStatus, errorThrown)
		{
			if (DEBUG) alert(XMLHttpRequest.responseText);
		}
	});
}

//前端多国语言引擎 BY Alan
var Lang = {V:'3.0', T:{}, G:{}, S:''};
Lang.Apply = function(C,P,R)
{
	if (Lang.S == '' || Lang.S == 'zhcn')
	{
		Lang.S = 'zh-cn';
	}
	
	//动态加载语言文件
	$.getScript((R?R:'../scripts/language/')+Lang.S+'.js', function()
	{
		//封装层给页面直接调用字段用
		Lang.G = Lang.T[Lang.S];
		
		//遍历搜索到的要翻译的所有元素
		var items = P ? $('#'+P+' [lang]') : $('[lang]');
		items.each(function()
		{
			var _O = $(this), _L = _O.attr('lang');
			
			//处理版本号字段
			if (_L == 'version')
			{
				_O.html(Lang.V);
			}
			//处理其它字段
			else if (Lang.G[_L])
			{
				switch(_O.get(0).tagName)
				{
				case 'TEXTAREA':
				case 'INPUT':
					_O.val(Lang.G[_L]);
					break;
				case 'TITLE':
					document.title = Lang.G[_L] + pageTitle;//' - SMARTHOME SYSTEM';
					break;
				default:
					_O.html(Lang.G[_L]);
					break;
				}
			}
		});
		
		$('#container').fadeIn(300, C);
		loading({option:'close'});
	});
};

//前端表单验证插件 BY Alan
(function($){$.fn.validate = function()
{
	var inputs = this.find(':input:[validate]');
	
	for (var i=0; i<inputs.length; i++)
	{
		var input = $(inputs.get(i));
		if ($(input).attr('disabled') == 'disabled') continue;
		
		var text = input.val();
		var vali  = input.attr('validate');
		var regA = new RegExp('^bytes{([0-9]+?-[0-9]+?)}$');
		var regB = new RegExp(vali);
		
		var pass = true;
		
		if (regA.test(vali))
		{
			var arr = vali.replace(/^bytes{([0-9]+?-[0-9]+?)}$/, '$1').split('-');
			
			if (text.bytes() < parseInt(arr[0]) || text.bytes() > parseInt(arr[1]))
			{
				pass = false;
			}
		}
		else if (!regB.test(text))
		{
			pass = false;
		}
		
		if (pass)
		{
			input.removeClass('validate');
			input.nextAll('span:first').removeClass('validate');
		}
		else
		{
			input.addClass('validate');
			input.nextAll('span:first').addClass('validate');
			input.focus();
			
			return false;
		}
	}
	
	return true;
	
}})(jQuery);
