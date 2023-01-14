<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebarAsset.jsp"%>
<br>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/jquery-ui-timepicker-addon.min.js"></script>  
<link rel="stylesheet" type="text/css" media="screen" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>

  <div class="main-content">
  <div class="container-fluid">
  <!-- <section class="content"> -->
		<div class="box-body2 table-responsive">
			<%-- 	${cateList }+@ --%>
			<div class="box">
				<!-- 날짜 -->
				<div class="Header_root__23iUa">
					<div class="Header_heading__kV24Z" style="font-weight: bold;">12월
						2022</div>
					<div class="Header_toolbar__20N2Q">
						<div class="Header_profile__2hIBf tooltip tooltip--dark">
							<i class="fa fa-user"></i><span class="tooltip__title">로그인</span>
						</div>
						<div class="Header_bars__2n8jJ tooltip tooltip tooltip--dark">
							<i class="fa fa-ellipsis-v"></i>
						</div>
					</div>
					<!-- 날짜 -->
				</div>	
			</div>
		</div>
		
	<!-- 여기까지 위쪽  -->	
		
      <div class="row">
      	 <div class="col-md-8">
        	<table id="list"></table>
			<div id="pager"></div>	
				
			<table id="jqGrid"></table>
			<div id="gridpager"></div>
			 <span><a href="#" onclick="javascript:save();">저장</a></span>
			<span><a href="#" onclick="javascript:gridFunc.addRow();">행 추가</a></span>
			<!-- <span><a href="#" onclick="javascript:gridFunc.clearGrid();">초기화</a></span> -->
			<span><a href="#" onclick="javascript:delRow();">삭제</a></span>
         </div>
         
         <div class="col-md-4">
			<div class="box box-primary2">
			<div class="box-header with-border">
			
			<form role="form" action="/asset/insGrid" method="post">
			<div class="box-body2">
				<h3 class="box-title"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">수입·지출 등록</font></font></h3>
<!-- 			<div class="abbtn-name" > -->
<!-- 			수입<div class="switchbtn" align="right"> -->
<!-- 			  <input type="checkbox" id="switch" value=2> -->
<!-- 			  <label for="switch" class="switch_label"> -->
<!-- 			    <span class="onf_btn"></span> -->
<!-- 			  </label> -->
<!-- 			</div>지출 -->
<!-- 			</div> -->
			<div class="row" style="padding: 20px;">
				<label for="ab_inout">지출</label>
				<input type="checkbox" id="ab_inout" name="ab_inout" value="1" onclick="clickCheck(this)" checked>
				<label for="ab_inout2">수입</label>
				<input type="checkbox" id="ab_inout2" name="ab_inout" value="2" onclick="clickCheck(this)">
			
<!-- 			<input type="radio" name="r1" class="minimal" value="1" style="position: absolute; opacity: 0;">지출 -->
<!-- 			<input type="radio" name="r1" class="minimal" value="2" style="position: absolute; opacity: 0;">수 -->
			
			<div id="calendar"></div>
			</div>
			</div>
<!-- 			.text-right { -->
<!--   text-align: right !important; -->
<!-- } -->
			
			<div class="form-group">
			<label for="exampleInputPassword1"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">날짜</font></font></label>
			<input type='text' class='form-control datetimepicker' name='ab_date'>
			</div>
			
			<div class="form-group">
			<label for="exampleInputEmail1"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">내용</font></font></label>
			<input type="text" class="form-control" id="exampleInputEmail1" name="ab_content">
			</div>
			
			<div class="form-group">
			<label for="exampleInputEmail1"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">금액</font></font></label>
			<input type="text" class="form-control" id="exampleInputEmail1" name="ab_amount">
			</div>
			
			<div class="form-group">
			<label for="exampleInputEmail1"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">거래수단</font></font></label>
					<select name="ab_method" id="input-address" class="form-control form-control-alternative" >
			              <option value="0" selected>선택</option>
			              <option value="1">카드</option>
						  <option value="2">계좌</option>
						  <option value="3">현금</option>
					</select>
			</div>
			
			<div class="pl-lg-4">
			
			<!-- 지출 카테고리 -->
			<div class="form-group">
			              <div class="form-group focused">
			                <label class="form-control-label" for="input-username" >지출 카테고리</label>
			                <select name="b_ctno_out" id="input-address" class="form-control2 form-control-alternative" >
			                   <option>--선택--</option>
			                   <option value="1">식비</option>
							   <option value="2">의복/미용</option>
			  				   <option value="3">문화/여가</option>
			  				   <option value="4">생활</option>
							   <option value="5">주거/통신</option>
			  				   <option value="6">건강/운동</option>
			  				   <option value="7">교육/육아</option>
			  				   <option value="8">교통/차량</option>
			  				   <option value="9">경조사/회비</option>
			  				   <option value="10">금융</option>
			  				   <option value="11">저축/보험</option>
			  				   <option value="12">자산이동</option>
			                </select>
			              </div>
			</div>
			
			<!-- 수입 카테고리 -->
						<div class="form-group">
			              <div class="form-group focused">
			                <label class="form-control-label" for="input-username" >수입 카테고리</label>
			                <select name="b_ctno_in" id="input-address" class="form-control2 form-control-alternative" >
			                   <option>--선택--</option>
			                   <option value="72">주수입</option>
							   <option value="73">부수입</option>
			  				   <option value="74">자산이동</option>
			                </select>
			              </div>
			</div>
			
			<!-- 하위 카테고리 -->
			<div class="form-group">
			                      <div class="form-group">
			                        <label class="form-control-label" for="input-email">상세 카테고리</label>
			                         <select name="ctno" id="input-address" class="form-control2 form-control-alternative" >
			                           <option>--선택--</option>
			                        </select>
			                      </div>
			</div>
			</div>
			
			<div class="form-group">
			<label for="exampleInputEmail1"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">메모</font></font></label>
			<input type="text" class="form-control" id="exampleInputEmail1" name="ab_memo">
			</div>
			
			
			</div>
			
			<div class="box-footer">
			<button type="submit" class="btn btn-primary"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">저장하기</font></font></button>
			</form>
			</div>
			</div>
			</div>
         </div>
<!-- <input type="BUTTON" id="btnC" value="Edit Selected" /> -->
<!-- <input type="BUTTON" id="btnD" value="Edit Selected" /> -->
<%-- ${jsonAbook} --%>
<%-- obj: ${j_abookList }+@@ --%>
<%-- ${map } --%>
<!-- $( "#datepicker1" ).datepicker( "getDate" ); -->



<script type="text/javascript">
$(function() {
	$(".datetimepicker").datetimepicker({ 
		dateFormat:'yy-mm-dd',
		autoclose: true,
		todayHighlight: true
	});
});
function grid_Datepicker(text, obj){
    $("#jqGrid").jqGrid("saveCell", rowid, iCol); // cell 저장
}
</script>




<!-- jQuary+grid -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" /> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/jquery-ui-timepicker-addon.min.css" />
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/jquery-ui-timepicker-addon.min.js"></script>

 <script>
 
$("#jqGrid").jqGrid({
    url : '/asset/reqGrid',
    datatype : "json",
	mtype: 'get',
	jsonReader: {
				repeatitems:false,
// 				id:'id', // 키 컬럼 명
				root:'rows', // 그리드에 로드 할 Json 형태의 데이터
				page:'page', // 현재 페이지
				total:'total', // 총 페이지 Count
				records:'records' // 총 Row Count
				},
    height: 500, 
    width: 1000,
    colNames : ['num','분류','날짜','내용','금액','거래수단','ctno','카테고리','소분류','메모'], 
    colModel:[
        {name : 'abno', index : 'abno',width : 0, align : 'left',hidden:true,key:true},    	
        {name:"ab_inout",index:"ab_inout",width:30,align:'center',edittype: "select", formatter: "select",editoptions:{value:"1:지출;2:수입;3:이체;"},editable:true,
//                 dataEvents: [{
//                     type : 'change',
//                     fn : function(e) {
//                     }] 
//                 }
	        hidden:false,editable:true},
        {name:'ab_date', index:'ab_date', width:90, align:'center',editable:true, formatoptions:{newformat: 'Y-M-d h:i'}, 
	        	editoptions:{size:20, dataInit:function(el){ 
                     $(el).datetimepicker({dateFormat:'yy-mm-dd', onClose :grid_Datepicker}); 
                     
               }, 
               defaultValue: function(){ 
                 var currentTime = new Date(); 
                 var month = parseInt(currentTime.getMonth() + 1); 
                 month = month <= 9 ? "0"+month : month; 
                 var day = currentTime.getDate(); 
                 day = day <= 9 ? "0"+day : day; 
                 var year = currentTime.getFullYear(); 
                 return year+"-"+month + "-"+day; 
               }
           }},
        {name : 'ab_content',index : 'ab_content',width : 100, align : 'center',hidden:false,editable:true},
        {name : 'ab_amount',index : 'ab_amount',width : 50, align: 'center', resizable : true,align : 'right',editrules:{number:true},hidden:false,editable:true},
        {name:"ab_method",index:"ab_method",width:30,align:'center',edittype: "select", formatter: "select",editoptions:{value:"1:카드;2:현금;3:계좌;"},hidden:false,editable:true},
	    {name : 'ctno', index : 'ctno',width : 0, align : 'center',hidden:true}, 
		{name: "ct_top", label: 'ct_top', width: 90, align: "center",/* formatter: "select", */ 
				editable: true, edittype: "select", 
				editoptions:{  dataUrl: '/asset/cateSelect',
				buildSelect:function (data){
				 			let key = JSON.parse(data)
							var rtSlt = '<select id="ct_top">';
							for ( var idx = 0 ; idx < key.length ; idx ++) {
							rtSlt +='<option value="'+key[idx].ctno+'">'+key[idx].ct_top+'</option>';
							}
							rtSlt +='</select>';
							return rtSlt;
		      	 dataEvents:[{ type:'change', fn: function(e){ }// dataevem    
							}] 
				}	// edit
		}}, //name
		//            	data = $.parseJSON({"rows":JSON.stringify(data)});
		// 				console.log(data[0]);	  
		
		// 	        	  var ctno = new Array(); 
		// 	        	  var ct_top = new Array();
		
		// 	        	  for(var i=0; i<data.length; i++){
		// 	        	  	var d = data[i];
		// 	        	  	ctno.push(d.ctno);
		// 	        	  	ct_top.push(d.ct_top);
		// 	        	  console.log(d.ct_top);
		// 	        	 }
			        	  
		// 	 				let jsonData = JSON.parse(data)
		// 	 				let key1 = Object.keys(data);
		// 	 				let key2 = Object.values(jsonData);
		// 	        	  console.log(key1);
		// 	          	console.log(O)
		// 	            if(typeof(data)=='String') {
		// 	            	data = $.parseJSON({"rows":JSON.stringify(data)});
		// 					var selrt = '<select name="cateSelect">';
		// 				let jsonData = JSON.parse(data)
		// 				let key1 = Object.keys(jsonData);
		// 				let key2 = Object.values(jsonData);
		
		// 	            console.log(JSON.parse(data)[0]);       
		// 	            console.log(JSON.parse(data)[0].);       
		// 						for ( var i = 0 ; i < 85 ; i ++) {
		// 				 			let key = JSON.parse(data)
		// 								selrt +='<option value="'+key[i].ctno+'">'+key[i].ct_top+'</option>';
		// // 								console.log(data.[i]);
		// 							console.log(JSON.parse(data)[1]);
		// 							}
		// 								selrt +='</select>';
		
		// 						return selrt;
// 	    {name : 'ct_top',index : 'ct_top',width : 70, alian: "center", hidden:false,editable:true},           
		{name:"ct_bottom",index:"ct_bottom",width:50,align:'center', editable: true, edittype: "select", /* formatter: "select", */
	
			    	editoptions:{
			    		dataUrl: '/asset/catebottom',
						buildSelect:function (data){
							console.log(data);							
				 			let key = JSON.parse(data)
							console.log(key);							
						    var rowid = $( "#jqGrid" ).getGridParam( "selrow" );   
						    var rowdata = jQuery("#jqGrid").getRowData(rowid);  
						     var ct_top= rowdata['ct_top'];
						     var rtslt = ""; 
// 						    console.log(ct_top);
						    
					       test = {"ct_top":ct_top};
								$.ajax({
									url : "/asset/catebottom",
//	 					 			traditional: true ,
									contentType:"application/json",
									data : test,
									success:function(val){
										
										rtSlt = '<select id="ct_bottom">';
										for ( var idx = 0 ; idx < val.length ; idx ++) {
										rtSlt +='<option value="'+val[idx].ctno+'">'+val[idx].ct_bottom+'</option>';
										}
										rtSlt +='</select>';
										
										alert("입력 성공!");
									console.log(val);							
									},error:function(err){
									      console.log(err);
									}
								})
						return rtSlt;
						}, // build
			            dataEvents: [
	                          { type: 'change',
	                              fn: function (e) {
	                                  slcd = this.value.substr(0, this.value.indexOf(' '));
	                                  $.get('@Url.Action("GetSelect", "Set")' + '?slcd=' + slcd, function (data) {
	                                      var res = $(data).html();
	                                      var selectedCol = lastsel2 + "_ITEM_CD";
	                                      $("select#0_ITEM_CD").html(res);
	                                  });
	                              }
	                          }
	                       ] //dataeve
					}	// edit
			},    	
	
        {name : 'ab_memo',index : 'ab_memo', align: "center", width : 50, align : 'center',hidden:false,editable:true}
      ],
//      gridComplete: function(){
//    	    var ids = $("#jqGrid").jqGrid('ab_memo');
//    	    for(var i=0;i < ids.length;i++){
//    	        var cl = ids[i];
//    	        chgPw = "<input style='height:22px;width:50px;' type='button' value='RESET' onclick=\"F\"  />"; 
//    	        $("#jqGrid").jqGrid('setRowData',ids[i],{pwReset:chgPw});
//    	    } 
//    	},
//       onCellSelect : function(rowid, iCell, content){
//     	  alert(""+content);
//     	 } ,
    
    autowidth: true,
// 	shrinkToFit: true, 
    loadtext: "조회 중..",
    caption: "　",
    multiselect : true, // 그리드 왼쪽부분에 셀렉트 박스가 생겨 다중선택이 가능해진다
    emptyrecode : "작성된 내역이 없습니다!", // 뿌려줄 데이터가 없을 경우 보여줄 문자열 지정
    pager:"#gridpager",
// 	scroll:true,
    rowNum:20,
    rownumbers : true, 
    
    cellEdit: true,
    cellsubmit:'clientArray',
//     cellurl:'/asset/updateGrid',
    
    /* 수정 후 cell 다시 editable flase 로 변경 */
    afterEditCell : function(rowid, cellname, value, iRow, iCol){
        $("#"+rowid+"_"+cellname).blur(function(){ //input focus out시 변경된 데이터 저장 
        	$("#jqGrid").jqGrid("editCell", 0, 0, false);
       	    $("#jqGrid").jqGrid("saveCell", iRow, iCol);
        });
//         $('#jqGrid').trigger('reloadGrid');
//         $(this).setColProp(cellname, {editable : false}); //수정 후 cell 다시 editable flase 로 변경
    },   
	    beforeSubmitCell : function(rowid, cellname, value) {   // submit 전
	        return {"id":rowid, "cellName":cellname, "cellValue":value}
	    },
	
	   afterSubmitCell : function(res) {    // 변경 후
	       var aResult = $.parseJSON(res.responseText);
	       var userMsg = "";
	
	       if((aResult.msg == "success")) {
	           userMsg = "데이터가 변경되었습니다.";
	       }
	       return [(aResult.msg == "success") ? true : false, userMsg];
	   }
    //rownumbers:true,
    //viewrecords:true,
    //pgbuttons:true,
    //pginput:true,
    //shrinkToFit:true,
    //sortable: false,
    //loadComplete:function(data){},
    //scroll:true,
    //loadonce:false,
    //hidegrid:true
    // =================================================
    }); //jqgrid default
    
//     $(window).on('resize.jqGrid', function () {
//         jQuery("#jqGrid").jqGrid( 'setGridWidth', $(".main-panel").width() - 100 );
//     },
    
   
 	// 리로딩 처리
    function reload() {
    jQuery("#jqGrid").trigger('reloadGrid');
    
	$('#jqGrid').jqGrid('setGridParam', { 'datatype' : 'json' });
	
    }//setGridParam 
	 
	// 저장하고 컨트롤러로 보내는 코드 
	function save(){
		alert("");
		var data =  $("#jqGrid").getRowData();
		data = JSON.stringify(data);
		
		$.ajax({
			url : "/asset/saveGrid",
			data : data,
			traditional: true ,
			contentType:"application/json",
			type : 'POST',
			dataType:'JSON',
//             postData : {"rows" : JSON.stringify(data)},
			success:function(data){
			alert("입력 성공!");
			}
			})
	jQuery("#jqGrid").trigger('reloadGrid');	
	}
	// update
	
	// col edit 가능하게 일괄 처리하기 
	function setColData(param){
    const gridColData = ["abno", "ab_inout", "ab_date", "ab_content", "ab_amount", "ctno", "ct_top", "ct_bottom", "ab_memo"];
    for(var idx in gridColData){
        $("#jqGrid").setColProp(gridColData[idx], {editable : param});
    }
}
	var gridFunc = {
	        addRow : function() {
	        	  const options = {
	        		        modal : true,
	        		        width : 400,
	        		        url : '/asset/saveRows',
	        		        mtype : 'get',
	        		        addCaption : "MENUMAST 추가",
	        		        closeAfterAdd : true,
	        		        recreateForm : true, //대화상자가 활성화될 때 마다 form이 다시 생성된다 
	        		        reloadAfterSubmit:true //서버 ajax후 그리드 데이터 다시 로드 
	        		    }
	            var totCnt = $("#jqGrid").getGridParam("records");
	            var addData = {"abno":"", "ab_inout": "", "ab_date": "", "ab_content" : "", 
				 "ab_amount" : "", "ctno":"", "ct_top" : "", "ct_bottom" : "", "ab_memo" : ""};
	            
	            $("#jqGrid").addRowData(totCnt+1, addData);
	            $("#jqGrid").setColProp("name", {editable: true}); // 수정 필요함 
	        
	        }
			
	}
	
	function delRow(){
		alert("삭제 시작");
		var data =  $("#jqGrid").jqGrid('getGridParam', 'selarrrow');
//	 	var data =  ["4","5"];  리스트 형태 데이터를 그대로 넘겨주면 됩니다!
			console.log(data);
			
		$.ajax({
			url : "/asset/delGrid",
			type:"post",    //반드시 post 방식
			data : {test:data},
			success:function(val){
				alert("입력 성공!");
			},error:function(err){
				  alert("err");
			      console.log(err);
			}
		});
		alert("삭제 끝");
				
	}
	
	
	// col edit 가능하게 일괄 처리하기 
	function setColData(param){
    const gridColData = ["abno", "ab_inout", "ab_date", "ab_content", "ab_amount", "ctno", "ct_top", "ct_bottom", "ab_memo"];
    for(var idx in gridColData){
        $("#jqGrid").setColProp(gridColData[idx], {editable : param});
    }
}
	///////////////////////////////////////아직 안 쓰는 코드 
    function search() {
    	
        alert("저장");
        var jsonObj = {};
        
        alert(JSON.stringify(jsonObj));
        
        $("#jqGrid").setGridParam({
            datatype : "json",
            postData : {"param" : JSON.stringify(jsonObj)},
            loadComplete : function(data) {
                
            },
            
            gridComplete : function() {
                
            }
        }).trigger("reloadGrid");
    }
    
    function replacer(key, value) {
    	  if (typeof value === "string") {
    	    return undefined;
    	  }
    	  return value;
    	}
    	var foo = {foundation: "Mozilla", model: "box", week: 45, transport: "car", month: 7};
    	var jsonString = JSON.stringify(foo, replacer);
    
    
    
    $('#jqGrid').getRowData();
    
	 //nav
	 jQuery("#list1").jqGrid('navGrid','#gridpager',{
		 //nav 설정						
		edit : true,
		add : true,
		del : true,
		search : false,
	}
	,{						
		url : '/jq/jqUpdate.do',
		afterComplete:function(data) {
		   jqGridFunc.tableReload(data, '수정');
		},
		recreateForm: true,
		closeAfterEdit: true,
		errorTextFormat: function (data) {
		   return 'Error: ' + data.resultMsg;
		},
	   },
		 {
			url : '/jq/jqInsert.do',
			beforeShowForm: function ($form) {
			   $form.find(".FormElement[disabled]").prop("disabled", false); 
			},
			afterComplete:function(data) {
			   jqGridFunc.tableReload(data, '저장');
			},
			closeAfterAdd: true,
		 },
		 {
			url : '/jq/jqDelete.do',
			afterComplete:function(data) {
			   jqGridFunc.tableReload(data, '삭제');
			},
			delData : {
			   csrId : function(){
				  var selId = $('#jqGrid').jqGrid('getGridParam', 'selrow');
				  var csrId = $('#jqGrid').jqGrid('getCell', selId, 'csrId');
				  return csrId.replace(/-9/,'');
			   }
			}
		 }
	 );//jqgrid nav 
</script>	 


<!-- 지출 카테고리  -->
<script type="text/javascript">
$(function(){
    $('select[name="b_ctno_out"] ').on('change', function()  {
        var arrType = getAgreeType();
        var optionType = $(this).parents('.pl-lg-4').find($('select[name="ctno"]'));
        optionType.empty();
        if($(this).val() == '1'){ 
            for(prop in arrType['1']){
                optionType.append('<option value='+prop+' >'+arrType['1'][prop]+'</option>');
            }
        }else if($(this).val() == '2'){                            
            for(prop in arrType['2']){
                optionType.append('<option value='+prop+' >'+arrType['2'][prop]+'</option>');
            }                  
        }else if($(this).val() == '3'){                            
            for(prop in arrType['3']){
                optionType.append('<option value='+prop+' >'+arrType['3'][prop]+'</option>');
            }                  
        }else if($(this).val() == '4'){                            
            for(prop in arrType['4']){
                optionType.append('<option value='+prop+' >'+arrType['4'][prop]+'</option>');
            }     
        }else if($(this).val() == '5'){                            
            for(prop in arrType['5']){
                optionType.append('<option value='+prop+' >'+arrType['5'][prop]+'</option>');
            }  
        }else if($(this).val() == '6'){                            
            for(prop in arrType['6']){
                optionType.append('<option value='+prop+' >'+arrType['6'][prop]+'</option>');
            }  
        }else if($(this).val() == '7'){                            
            for(prop in arrType['7']){
                optionType.append('<option value='+prop+' >'+arrType['7'][prop]+'</option>');
            }  
        }else if($(this).val() == '8'){                            
            for(prop in arrType['8']){
                optionType.append('<option value='+prop+' >'+arrType['8'][prop]+'</option>');
            }  
        }else if($(this).val() == '9'){                            
            for(prop in arrType['9']){
                optionType.append('<option value='+prop+' >'+arrType['9'][prop]+'</option>');
            }  
        }else if($(this).val() == '10'){                            
            for(prop in arrType['10']){
                optionType.append('<option value='+prop+' >'+arrType['10'][prop]+'</option>');
            }  
        }else if($(this).val() == '11'){                            
            for(prop in arrType['11']){
                optionType.append('<option value='+prop+' >'+arrType['11'][prop]+'</option>');
            } 
        }else if($(this).val() == '12'){                            
            for(prop in arrType['12']){
                optionType.append('<option value='+prop+' >'+arrType['12'][prop]+'</option>');
            } 
        }
    });
});
</script>


<script type="text/javascript">
function getAgreeType() {    
    var obj = {
        "1" : {
            '13' : '식사',
            '14' : '간식',
            '15' : '외식',
            '16' : '카페',            
            '17' : '술/유흥',            
            '18' : '기타',                   
        },
        "2" : {
            '19' : '의류',
            '20' : '패션잡화',
            '21' : '헤어',
            '22' : '뷰티',
            '23' : '기타',
        },
        "3" : {
            '24' : '여행/숙박',
            '25' : '공연/전시',
            '26' : '도서/영화',
            '27' : '취미',
            '28' : '선물',
            '29' : '기타',
        },
        "4" : {
            '30' : '가전/가구',
            '31' : '주방/욕실',
            '32' : '잡화/소모',
            '33' : '반려동물',
            '34' : '기타',
        },
        "5" : {
            '35' : '관리비',
            '36' : '공과금',
            '37' : '통신',
            '38' : '월세',
            '39' : '기타',
        },
        "6" : {
            '40' : '운동',
            '41' : '운동용품',
            '42' : '병원',
            '43' : '약국',
            '44' : '기타',
        },
        "7" : {
            '45' : '등록금',
            '46' : '학원',
            '47' : '교재',
            '48' : '육아용품',
            '49' : '기타',
        },
        "8" : {
            '50' : '대중교통',
            '51' : '택시',
            '52' : '주유소',
            '53' : '장비/부품',
            '54' : '기타',
        },
        "9" : {
            '55' : '경조사',
            '56' : '회비',
            '57' : '용돈',
            '58' : '헌금',
            '59' : '기부',
            '60' : '기타',
        },
        "10" : {
            '61' : '세금',
            '62' : '은행',
            '63' : '이자',
            '64' : '투자',
            '65' : '기타',
        },
        "11" : {
            '66' : '예/적금',
            '67' : '보험',
            '68' : '기타',
        },
        "12" : {
            '69' : '출금',
            '70' : '이체',
            '71' : '카드대금',
            '72' : '기타',
        }
    }
    return obj;
}
</script>



<!-- 수입 카테고리 -->
<script type="text/javascript">
$(function(){
    $('select[name="b_ctno_in"] ').on('change', function()  {
        var arrType = getintype();
        var optionType = $(this).parents('.pl-lg-4').find($('select[name="ctno"]'));
        optionType.empty();
        if($(this).val() == '72'){ 
            for(prop in arrType['72']){
                optionType.append('<option value='+prop+' >'+arrType['72'][prop]+'</option>');
            }
        }else if($(this).val() == '73'){                            
            for(prop in arrType['73']){
                optionType.append('<option value='+prop+' >'+arrType['73'][prop]+'</option>');
            }                  
        }else if($(this).val() == '74'){                            
            for(prop in arrType['74']){
                optionType.append('<option value='+prop+' >'+arrType['74'][prop]+'</option>');
            }                  
        }
    });
});
</script>


<script type="text/javascript">
function getintype() {    
    var obj = {
        "72" : {
            '75' : '급여',
            '76' : '상여',
            '77' : '사업소득',
            '78' : '기타',            
        },
        "73" : {
            '79' : '이자',
            '80' : '배당금',
            '81' : '용돈',
            '82' : '기타',
        },
        "74" : {
            '83' : '입금',
            '84' : '이체',
            '85' : '기타',
        },
 
    }
    return obj;
}
</script>
	
	
	
<style>

.col-md-4 {
    width: 31.333333%;
}

.form-control2 {
    display: block;
    width: 45%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
    box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
    -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}

.box-body2 {
    border-top-left-radius: 0;
    border-top-right-radius: 0;
    border-bottom-right-radius: 3px;
    border-bottom-left-radius: 3px;
    padding: 4px;
    display: flex;
    align-content: center;
    justify-content: flex-start;
    align-items: flex-start;
    justify-content: space-between;
/*     	overflow-x: hidden;	 */
}
.abbtn-name{
display: inline-flex;
}
 .switchbtn { 
    min-height: 100%;
    position: relative;
    overflow: hidden !important;
   align-items: flex-end;
 } 
#switch {
  position: absolute;
  /* hidden */
  appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
}
.switch_label {
/*   position: relative; */
  cursor: pointer;
  display: inline-block;
  width: 58px;
  height: 28px;
  background: #fff;
  border: 2px solid #FFDB83;
  border-radius: 20px;
  transition: 0.2s;
}
.switch_label:hover {
  background: #efefef;
}
.onf_btn {
  position: absolute;
  top: 4px;
  left: 3px;
  display: inline-block;
  width: 20px;
  height: 20px;
  border-radius: 20px;
  background: #FFDB83;
  transition: 0.2s;
}
/* checking style */
#switch:checked+.switch_label {
  background: #66BB7A;
  border: 2px solid #66BB7A;
}
#switch:checked+.switch_label:hover {
  background: #66BB7A;
}
/* move */
#switch:checked+.switch_label .onf_btn {
  left: 34px;
  background: #fff;
  box-shadow: 1px 2px 3px #00000020;
}
.box.box-primary2 {
    border-top-color: #666;
    margin: 0px 5px 0px 5px;
#th-bg {
	background-color: #FDEDBF;
	font-style: inherit;
}
th {
	font-weight: 700;
}
.Header_root__23iUa {
	padding: 0;
	margin-bottom: 10px;
}
.Header_root__23iUa {
	padding: 16px 0;
	display: flex;
	justify-content: space-between;
}
.Header_heading__kV24Z {
	font-weight: 700;
	font-size: 35px;
	line-height: 32px;
	text-transform: capitalize;
	display: flex;
	align-items: center;
}
.btn-group-xs>.btn, .btn-xs {
    padding: 1px 5px;
    font-size: 12px;
    line-height: 1.5;
    border-radius: 3px;
}
  .ui-jqgrid .ui-jqgrid-htable{
        	overflow: hidden; 
        	position:relative; 
        	height:17px;
        	font-family:inherit,'NanumGothicB','나눔고딕', "돋움", dotum;
        	font-size:15px;
        }
        .ui-jqgrid-btable, .ui-pg-table  {
        	font-family:inherit,'NanumGothicB','나눔고딕', "돋움", dotum;
        	font-size:13px;
        }
        
/*     .rowColumn { */
/* 	border-radius: 5px; */
/* 	margin: 5px; */
/* }     */
</style>


<!-- </section> -->
</div>
</div>


</div>
<%@ include file="../include/footer.jsp"%>

    <!-- Bootstrap 3.3.2 JS -->
    <script src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='${pageContext.request.contextPath }/resources/plugins/fastclick/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="${pageContext.request.contextPath }/resources/dist/js/app.min.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="${pageContext.request.contextPath }/resources/dist/js/demo.js" type="text/javascript"></script>
  </body>
</html>
