<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<h3>수정</h3>
<br>
<h5>시퀀스 : '${lostPetDto.lostSeq}' </h5>

아이디 : <input type="text" id="_id" value='${lostPetDto.lostId}' placeholder="아이디" /><br>
연락처 : <input type="text" id="_phone" value='${lostPetDto.lostPhone}' placeholder="-을 포함한 연락처 기재"/><br>
날짜 : <input type="text" id="_date" value='${lostPetDto.lostDate}' placeholder="목격/실종 날짜"/><br>
장소 :  <input type="text" id="_location" value='${lostPetDto.lostLocation}' placeholder="목격/실종 장소"/></br>
동물 :
<select name="type" id="_type"  >
		<option value="0">동물 선택</option>
		<option value="1">강아지</option>
		<option value="2">고양이</option>
		<option value="3">기타</option>
</select>
<br>
상태 :
<select name="status" id="_status">
		<option value="0">상태 선택</option>
		<option value="1">실종</option>
		<option value="2">목격</option>
		<option value="3">기타</option>
		<option value="4">구조 완료</option>
</select>
<br>
성별 :
<select name="gender" id="_gender">
		<option value="0">성별 선택</option>
		<option value="1">암컷</option>
		<option value="2">수컷</option>
		<option value="3">모름</option>
</select>
<br>
상세 :
<textarea id="_detail" name="detail" placeholder="동물의 안전한 귀가를 위한 보다 상세한 정보를 기재해주세요." rows="4" cols="50">
${lostPetDto.lostPhone}
</textarea>
<br>

<a id="_lostPetUpdate" title="글쓰기">		
	<img src="/images/bwrite.png" alt="글쓰기" />
</a>

<script type="text/javascript">

$(document).ready(function(){	
	let type ='${lostPetDto.lostType}';
	let sel = document.querySelector('#_type');
	for(i=0; i < sel.length; i++){
		if(sel.options[i].value == type){
			sel.options[i].selected =true;
		}	
	}
});

$(document).ready(function(){	
	let status ='${lostPetDto.lostStatus}';
	let sel = document.querySelector('#_status');
	for(i=0; i < sel.length; i++){
		if(sel.options[i].value == status){
			sel.options[i].selected =true;
		}	
	}
		
});

$(document).ready(function(){	
	let gender ='${lostPetDto.lostGender}';
	let sel = document.querySelector('#_gender');
	for(i=0; i < sel.length; i++){
		if(sel.options[i].value == gender){
			sel.options[i].selected =true;
		}	
	}
});

$("#_lostPetUpdate").click(function() {
	
	let sendData = {lostId:$('#_id').val(), lostPhone:$('#_phone').val(),
						lostDate:$('#_date').val(), lostType:$('#_type').val(),
						lostStatus:$('#_status').val(), lostGender:$('#_gender').val(),
						lostDetail:$('#_detail').val(),
						lostLocation:$('#_location').val(), lostSeq:'${lostPetDto.lostSeq}'
						};
	
	//console.log(sendData);	
	
	$.ajax({
		url:"/lostPet/lostPetUpdateAf",
		type:"post",
		data:sendData,
		success:function(data){
			//alert("success");

			if(data==='ok'){
				alert("수정이 완료됐습니다.");
				location.href='/lostPet/lostPet';
			}
			else{
				alert("글을 작성하지못했습니다.");
			}
	
		},
		error:function(){
			alert("error");
		}

	});
	//$("#_lostPetInfo").attr("action":"lostPetWriteAf").submit();	
});

</script>

