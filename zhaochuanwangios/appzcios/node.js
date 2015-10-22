// JavaScript Document
//-----------货盘的方法开始--------------
var uid="<%=uid%>";
var currPageNum=1;
$(function($){
	$.ajax({
		type:'post',  
		url : 'http://post/mypallpan',  //http://www.zcwjson.com18.cn
		data:{"pagenum":"1","uid":uid},
		jsonp:"jsoncallback",  
		success  : function(data) {
			data=$.trim(data);  
			try{
				var json=$.parseJSON(data);
				var code=json.code;
				if(code=="ok"){
					var searchdata=json.search;
					var son=json.data;
					for(var i=0;i<son.length;i++){
						var currjson=son[i];
						
						var id=currjson.id;
						var gid=currjson.gid;
						var oname=currjson.oname; 
						var sport=currjson.sport;
						var vdate=currjson.vdate;
						var ton=currjson.ton;
						
						var tmp="<tr><td class=\"th1bg\">"+ sport +"</td><td>"+ ton +"</td><td>"+ vdate +"</td><td><a href=\"javascript:;\" onclick='delNode("+ id +",this)'>删除</a></td> </tr>";
						
						$("#listbody").append(tmp);
					}	
				}
			}catch(e){
			}
		},  
		error : function() {
		}  
	});
	
	$("#more").click(function(){
		currPageNum++;
		$.ajax({
			type:'post',  
			url : 'http://post/mypallpan', 
			data:{"pagenum":currPageNum,"uid":uid},
			success  : function(data) {
				data=$.trim(data);  
				try{
					var json=$.parseJSON(data);
					var code=json.code;
					if(code=="ok"){
						var searchdata=json.search;
						var son=json.data;
						for(var i=0;i<son.length;i++){
							var currjson=son[i];
							
							var id=currjson.id;
							var gid=currjson.gid;
							var oname=currjson.oname; 
							var sport=currjson.sport;
							var vdate=currjson.vdate;
							var ton=currjson.ton;
							
							var tmp="<tr><td class=\"th1bg\">"+ sport +"</td><td>"+ ton +"</td><td>"+ vdate +"</td><td><a href=\"javascript:;\" onclick='delNode("+ id +"',this)>删除</a></td> </tr>";
							$("#listbody").append(tmp);
						}	
					}else if(code="over"){
						$("#more").html('没有更多啦');
						$("#more").unbind("click");
					}
				}catch(e){
				}
			},  
			error : function() {
			}  
		});	
	});
})

function delNode(id,dom){
	$.ajax(  
		{  
			type:'post',  
			url : 'http://post/delPallData',
			data:{"id":id,"uid":uid}, 
			success  : function(data) {
				if(data=="1"){
					$(dom).parent().parent().remove();	
				}else{
					alert('删除失败，请稍后重试！');
				}
			},  
			error : function() {
				alert('删除失败，请稍后重试！');
			}  
		}  
	);
}
//-----------货盘的方法结束--------------

//-----------船盘的方法开始--------------
var uid="<%=uid%>";
var currPageNum=1;
$(function(){
	$.ajax({
		type:'post',  
		url : 'http://post/myshippan',
		data:{"pagenum":"1","uid":uid},  
		success  : function(data) {
			data=$.trim(data);  
			try{
				var json=$.parseJSON(data);
				var code=json.code;
				if(code!="0" && code!="over"){
					var son=json.data
				for(var i=0;i<son.length;i++){
					var currjson=son[i];
					
					var id=currjson.id;
					var bid=currjson.bid;
					var oname=currjson.oname; 
					var eport=currjson.eport;
					var ton=currjson.ton;
					var vdate=currjson.vdate;
					
						var tmp="<tr><td class=\"th1bg\" onclick=\"artdialog_form(&#39;c3&#39;,&#39;2030&#39;);\">"+ eport +"</td><td onclick=\"artdialog_form(&#39;c3&#39;,&#39;2030&#39;);\">"+ ton +"</td><td onclick=\"artdialog_form&#39;c3&#39;,&#39;2030&#39;);\">"+ vdate +"</td><td onclick=\"artdialog_form(&#39;c3&#39;,&#39;2030&#39;);\"><a href=\"javascript:;\" onclick='delNode("+ id +",this);'>删除</a></td></tr>";
					
					$("#listbody").append(tmp);
				}
				}else if(code=="over"){
					$("#more").html('没有更多啦');
					$("#more").unbind("click");
				}
				
			}catch(e){
			}
		},  
		error : function() {
		}  
	});
	
	$("#more").click(function(){
		currPageNum++;
		$.ajax({
			type:'post',  
			url : 'http://post/boatinfo', 
			data:{"pagenum":currPageNum,"boatinfo":searchJson},
			jsonp:"jsoncallback",  
			success  : function(data) {
				data=$.trim(data);
				var json=$.parseJSON(data);
				var code=json.code;
				if(code=="over"){
					$("#more").html('没有更多啦');
					$("#more").unbind("click");
				}else if(code!="0" && code != "over"){
					try{
						var son=json.data;
						for(var i=0;i<son.length;i++){
							var currjson=son[i];
							
							var id=currjson.id;
							var bid=currjson.bid;
							var oname=currjson.oname; 
							var eport=currjson.eport;
							var ton=currjson.ton;
							var vdate=currjson.vdate;
							
							var tmp="<tr><td class=\"th1bg\" onclick=\"artdialog_form(&#39;c3&#39;,&#39;2030&#39;);\">"+ eport +"</td><td onclick=\"artdialog_form(&#39;c3&#39;,&#39;2030&#39;);\">"+ ton +"</td><td onclick=\"artdialog_form&#39;c3&#39;,&#39;2030&#39;);\">"+ vdate +"</td><td onclick=\"artdialog_form(&#39;c3&#39;,&#39;2030&#39;);\"><a href=\"javascript:;\" onclick='delNode("+ id +",this);'>删除</a></td></tr>";
							
							$("#listbody").append(tmp);
						}
					}catch(e){
					}
				}
			},  
			error : function() {
			}  
		});	
	});		
});

function delNode(id,dom){
	$.ajax(  
		{  
			type:'post',  
			url : 'http://post/delShipData',
			data:{"id":id,"uid":uid}, 
			success  : function(data) {
				if(data=="1"){
					$(dom).parent().parent().remove();	
				}else{
					alert('删除失败，请稍后重试！');
				}
			},  
			error : function() {
				alert('删除失败，请稍后重试！');
			}  
		}  
	);
}
//-----------货盘的方法结束--------------

//-----------供应的方法开始--------------
var uid="<%=uid%>";
var currPageNum=1;
$(function(){
	$.ajax({
		type:'post',  
		url : 'http://post/mysuplist', 
		data:{"pagenum":currPageNum,"uid":uid},
		success  : function(data) {
			data=$.trim(data);
			if(data=="over"){
				$("#more2").html('没有更多啦');
				$("#more2").unbind("click");
			}else{
				try{
					var json=$.parseJSON(data);
					var son=json.supinfo;
					for(var i=0;i<son.length;i++){
						var currjson=son[i];
						
						var id=currjson.id;
						var title=currjson.sname; 
						var imageurl=currjson.imageurl;
						var pdate=currjson.pdate;;
						
						var tmp="<li><a href=\"javascript:;\" onclick='delNode("+ id +",this)'><div class=\"list-img\"><b><img src=\""+ imageurl +"\"></b></div><div class=\"list-text\"><h1>"+ title +"</h1><h2>"+ pdate +"</h2></div></a></li>";
						
						$("#listbody2").append(tmp);
					}
				}catch(e){
				}
			}
		},  
		error : function() {
		}  
	});
	
	$("#more").click(function(){
		currPageNum++;
		$.ajax({
			type:'post',  
			url : 'http://post/mysuplist', 
			data:{"pagenum":currPageNum,"uid":uid},
			jsonp:"jsoncallback",  
			success  : function(data) {
				data=$.trim(data);
				if(data=="over"){
					$("#more2").html('没有更多啦');
					$("#more2").unbind("click");
				}else{
					try{
						var json=$.parseJSON(data);
						var son=json.supinfo;
						for(var i=0;i<son.length;i++){
							var currjson=son[i];
							
							var id=currjson.id;
							var title=currjson.sname; 
							var imageurl=currjson.imageurl;
							var pdate=currjson.pdate;;
							
							var tmp="<li><a href=\"javascript:;\" onclick='delNode("+ id +",this)'><div class=\"list-img\"><b><img src=\""+ imageurl +"\"></b></div><div class=\"list-text\"><h1>"+ title +"</h1><h2>"+ pdate +"</h2></div></a></li>";
							
							$("#listbody2").append(tmp);
						}
					}catch(e){
					}
				}
			},  
			error : function() {
			}  
		});	
	});		
		
});

function delNode(id,dom){
	$.ajax(  
		{  
			type:'post',  
			url : 'http://post/delPurData',
			data:{"id":id,"uid":uid}, 
			success  : function(data) {
				if(data=="1"){
					$(dom).parent().remove();	
				}else{
					alert('删除失败，请稍后重试！');
				}
			},  
			error : function() {
				alert('删除失败，请稍后重试！');
			}  
		}  
	);
}

//-----------供应的方法结束--------------

//-----------采购的方法开始--------------
var uid="<%=uid%>";
var currPageNum=1;
$(function(){
	$.ajax({
		type:'post',  
		url : 'http://post/mypurlist', 
		data:{"pagenum":currPageNum,"uid":uid},
		success  : function(data) {
			data=$.trim(data);
			if(data=="over"){
				$("#more2").html('没有更多啦');
				$("#more2").unbind("click");
			}else{
				try{
					var json=$.parseJSON(data);
					var son=json.supinfo;
					for(var i=0;i<son.length;i++){
						var currjson=son[i];
						
						var id=currjson.id;
						var title=currjson.sname; 
						var imageurl=currjson.imageurl;
						var pdate=currjson.pdate;;
						
						var tmp="<li><a href=\"javascript:;\" onclick='delNode("+ id +",this)'><div class=\"list-img\"><b><img src=\""+ imageurl +"\"></b></div><div class=\"list-text\"><h1>"+ title +"</h1><h2>"+ pdate +"</h2></div></a></li>";
						
						$("#listbody2").append(tmp);
					}
				}catch(e){
				}
			}
		},  
		error : function() {
		}  
	});
	
	$("#more").click(function(){
		currPageNum++;
		$.ajax({
			type:'post',  
			url : 'http://post/mypurlist', 
			data:{"pagenum":currPageNum,"uid":uid},
			jsonp:"jsoncallback",  
			success  : function(data) {
				data=$.trim(data);
				if(data=="over"){
					$("#more2").html('没有更多啦');
					$("#more2").unbind("click");
				}else{
					try{
						var json=$.parseJSON(data);
						var son=json.supinfo;
						for(var i=0;i<son.length;i++){
							var currjson=son[i];
							
							var id=currjson.id;
							var title=currjson.sname; 
							var imageurl=currjson.imageurl;
							var pdate=currjson.pdate;;
							
							var tmp="<li><a href=\"javascript:;\" onclick='delNode("+ id +",this)'><div class=\"list-img\"><b><img src=\""+ imageurl +"\"></b></div><div class=\"list-text\"><h1>"+ title +"</h1><h2>"+ pdate +"</h2></div></a></li>";
							
							$("#listbody2").append(tmp);
						}
					}catch(e){
					}
				}
			},  
			error : function() {
			}  
		});	
	});		
		
});

function delNode(id,dom){
	$.ajax(  
		{  
			type:'post',  
			url : 'http://post/delPurData',
			data:{"id":id,"uid":uid}, 
			success  : function(data) {
				if(data=="1"){
					$(dom).parent().remove();	
				}else{
					alert('删除失败，请稍后重试！');
				}
			},  
			error : function() {
				alert('删除失败，请稍后重试！');
			}  
		}  
	);
}

//-----------采购的方法结束--------------

//-----------招聘的方法开始--------------
var uid="<%=uid%>";
var currPageNum=1;

$(function($){
	
	$.ajax({
		type:'post',  
		url : 'http://post/myreclist',  //http://www.zcwjson.com18.cn
		data:{"pagenum":"1","uid":uid},
		success  : function(data) {
			data=$.trim(data);  
			try{
				var json=$.parseJSON(data);
				var son=json.rec;
				for(var i=0;i<son.length;i++){
					var currjson=son[i];
					
					var id=currjson.id;
					var title=currjson.title; 
					var pdate=currjson.pdate;
					
					var tmp="<li><img src=\"icon21.png\"><span class=\"group\">"+ pdate +"</span><a onClick=\"clickLog(&#39;from=weizhan_tomegdetail&#39;);\" val=\"20105935305609\" href=\"javascript:;\" onclick='delNode("+ id +",this)'>"+ title +"</a></li>";
					
					$("#listbody").append(tmp);
				}
			}catch(e){
			}
		},  
		error : function() {
		}  
	});
	
	$("#more").click(function(){
		currPageNum++;
		$.ajax({
			type:'post',  
			url : 'http://post/rec', 
			data:{"pagenum":currPageNum,"uid":"<%=uid%>"},
			jsonp:"jsoncallback",  
			success  : function(data) {
				data=$.trim(data);
				if(data=="over"){
					$("#more").html('没有更多啦');
					$("#more").unbind("click");
				}else{
					try{
						var json=$.parseJSON(data);
						var son=json.rec;
						for(var i=0;i<son.length;i++){
							var currjson=son[i];
							
							var id=currjson.id;
							var title=currjson.title; 
							var pdate=currjson.pdate;
							
							var tmp="<li><img src=\"icon21.png\"><span class=\"group\">"+ pdate +"</span><a onClick=\"clickLog(&#39;from=weizhan_tomegdetail&#39;);\" val=\"20105935305609\" href=\"javascript:;\"  onclick='delNode("+ id +",this)'>"+ title +"</a></li>";
							
							$("#listbody").append(tmp);
						}
					}catch(e){
					}
				}
			},  
			error : function() {
			}  
		});	
	});
});

function delNode(id,dom){
	$.ajax(  
		{  
			type:'post',  
			url : 'http://post/delRecData',
			data:{"id":id,"uid":uid}, 
			success  : function(data) {
				if(data=="1"){
					$(dom).parent().remove();	
				}else{
					alert('删除失败，请稍后重试！');
				}
			},  
			error : function() {
				alert('删除失败，请稍后重试！');
			}  
		}  
	);
}

//-----------招聘的方法结束--------------

//-----------求职的方法开始--------------
var uid="<%=uid%>";
var currPageNum=1;

$(function($){
		$.ajax({
			type:'post',  
			url : 'http://post/myjoblist',  //http://www.zcwjson.com18.cn
			data:{"pagenum":"1","uid":uid},
			jsonp:"jsoncallback",  
			success  : function(data) {
				data=$.trim(data);  
				try{
					var son=json.job;
					for(var i=0;i<son.length;i++){
						var currjson=son[i];
						
						var id=currjson.id;
						var title=currjson.title; 
						var pdate=currjson.pdate;
						
						var tmp="<li><img src=\"icon21.png\"><span class=\"group\">"+ pdate +"</span><a onClick=\"clickLog(&#39;from=weizhan_tomegdetail&#39;);\" val=\"20105935305609\" href=\"javascript:;\" onclick='delNode("+ id +",this);'>"+ title +"</a></li>";
						
						$("#listbody").append(tmp);
					}
				}catch(e){
				}
			},  
			error : function() {
			}  
		});
		
		$("#more").click(function(){
			currPageNum++;
			$.ajax({
				type:'post',  
				url : 'http://post/myjoblist', 
				data:{"pagenum":currPageNum,"uid":uid},
				jsonp:"jsoncallback",  
				success  : function(data) {
					data=$.trim(data);
					if(data=="over"){
						$("#more").html('没有更多啦');
						$("#more").unbind("click");
					}else{
						try{
							var json=$.parseJSON(data);
							var son=json.job;
							for(var i=0;i<son.length;i++){
								var currjson=son[i];
								
								var id=currjson.id;
								var title=currjson.title; 
								var pdate=currjson.pdate;
								
								var tmp="<li><img src=\"icon21.png\"><span class=\"group\">"+ pdate +"</span><a onClick=\"clickLog(&#39;from=weizhan_tomegdetail&#39;);\" val=\"20105935305609\" href=\"javascript:;\" onclick='delNode("+ id +",this);' >"+ title +"</a></li>";
								
								$("#listbody").append(tmp);
							}
						}catch(e){
						}
					}
				},  
				error : function() {
				}  
			});	
		});
})

function delNode(id,dom){
	$.ajax(  
		{  
			type:'post',  
			url : 'http://post/delJobData',
			data:{"id":id,"uid":uid}, 
			success  : function(data) {
				if(data=="1"){
					$(dom).parent().remove();	
				}else{
					alert('删除失败，请稍后重试！');
				}
			},  
			error : function() {
				alert('删除失败，请稍后重试！');
			}  
		}  
	);
}

//-----------求职的方法结束--------------

//-----------船舶出售的方法开始-----------
var uid="<%=uid%>";
var currPageNum=1;

$(function($){
	$.ajax({
			type:'post',  
			url : 'http://post/myshipsell',  //http://www.zcwjson.com18.cn
			data:{"pagenum":"1",uid:uid},  
			success  : function(data) {
				data=$.trim(data);  
				try{
					var json=$.parseJSON(data);
					var son=json.saleinfo;
					for(var i=0;i<son.length;i++){
						var currjson=son[i];
						
						var id=currjson.id;
						var title=currjson.title; 
						var imageurl=currjson.imageurl;
						var pdate=currjson.pdate;
						var vdate=currjson.vdate;
						
						var tmp="<li><img src=\"icon20.png\"><span class=\"group\">["+ pdate +"]</span><a onClick=\"clickLog(&#39;from=weizhan_tomegdetail&#39;);\" val=\"20105935305609\" href=\"javascript:;\" onclick='delNode("+ id +",this)'>"+ title +"</a></li>";

						$("#listbody").append(tmp);
						
					}	
				}catch(e){
				}
			},  
			error : function() {
			}  
		});
		
		$("#more").click(function(){
				currPageNum++;
				$.ajax({
					type:'post',  
					url : 'http://post/myshipsell', 
					data:{"pagenum":currPageNum,uid:uid}, 
					success  : function(data) {
						data=$.trim(data);  
						try{
							
							if(data!="over" && data!="0"){
							var json=$.parseJSON(data);
							var son=json.saleinfo;
						for(var i=0;i<son.length;i++){
							var currjson=son[i];
							
							var id=currjson.id;
							var title=currjson.title; 
							var imageurl=currjson.imageurl;
							var pdate=currjson.pdate;
							var vdate=currjson.vdate;
							
							var tmp="<li><img src=\"icon20.png\"><span class=\"group\">["+ pdate +"]</span><a onClick=\"clickLog(&#39;from=weizhan_tomegdetail&#39;);\" val=\"20105935305609\" href=\"javascript:;\" onclick='delNode("+ id +",this)'>"+ title +"</a></li>";
							
							$("#listbody").append(tmp);
						}
							}else if(data="over"){
								$("#more").html('没有更多啦');
								$("#more").unbind("click");
							}
					}catch(e){
							alert(e.message);
					}
				},  
				error : function() {
				}  
			});
		});		
});

function delNode(id,dom){
	$.ajax(  
		{  
			type:'post',  
			url : 'http://post/delShipSell',
			data:{"id":id,"uid":uid}, 
			success  : function(data) {
				if(data=="1"){
					$(dom).parent().remove();	
				}else{
					alert('删除失败，请稍后重试！');
				}
			},  
			error : function() {
				alert('删除失败，请稍后重试！');
			}  
		}  
	);
}


//-----------船舶出售的方法结束--------------

//-----------船舶求购的方法开始--------------
var uid="<%=uid%>";
var currPageNum=1;

$(function($){
			$.ajax({
			type:'post',  
			url : 'http://post/myshipbuy',  //http://www.zcwjson.com18.cn
			data:{"pagenum":"1",uid:uid}, 
			success  : function(data) {
				data=$.trim(data);  
				try{
					var json=$.parseJSON(data);
					var son2=json.buyinfo;
					for(var i=0;i<son2.length;i++){
						var currjson=son2[i];
						
						var id=currjson.id;
						var title=currjson.title; 
						var imageurl=currjson.imageurl;
						var pdate=currjson.pdate;
						var vdate=currjson.vdate;
						
						var tmp="<li><img src=\"icon20.png\"><span class=\"group\">["+ pdate +"]</span><a onClick=\"clickLog(&#39;from=weizhan_tomegdetail&#39;);\" val=\"20105935305609\" href=\"javascript:;\"  onclick='delNode("+ id +",this)'>"+ title +"</a></li>";
						
						$("#listbody").append(tmp);
					}
					
				}catch(e){
				}
			},  
			error : function() {
			}  
		});
		
		
		$("#more").click(function(){
			currPageNum++;
			$.ajax({
				type:'post',  
				url : 'http://post/myshipbuy', 
				data:{"pagenum":currPageNum,uid:uid},
				success  : function(data) {
					data=$.trim(data);  
					try{
						var json=$.parseJSON(data);
						if(json!="over" && json!="0"){
							var son=json.buyinfo;
							for(var i=0;i<son.length;i++){
								var currjson=son[i];
								
							var id=currjson.id;
							var title=currjson.title; 
							var imageurl=currjson.imageurl;
							var pdate=currjson.pdate;
							var vdate=currjson.vdate;
								
								var tmp="<li><img src=\"icon20.png\"><span class=\"group\">["+ pdate +"]</span><a onClick=\"clickLog(&#39;from=weizhan_tomegdetail&#39;);\" val=\"20105935305609\" href=\"javascript:;\" onclick='delNode("+ id +",this)'>"+ title +"</a></li>";
								
								$("#listbody").append(tmp);
							}	
						}else if(json="over"){
							$("#more").html('没有更多啦');
							$("#more").unbind("click");
						}
					}catch(e){
					}
				},  
				error : function() {
				}  
			});	
		});
});

function delNode(id,dom){
	$.ajax(  
		{  
			type:'post',  
			url : 'http://post/delShipBuy',
			data:{"id":id,"uid":uid}, 
			success  : function(data) {
				if(data=="1"){
					$(dom).parent().remove();	
				}else{
					alert('删除失败，请稍后重试！');
				}
			},  
			error : function() {
				alert('删除失败，请稍后重试！');
			}  
		}  
	);
}

//-----------船舶求购的方法结束--------------