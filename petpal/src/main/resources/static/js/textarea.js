$(function(){
            $('[name=boardContent]').summernote({
        placeholder: '',
        tabsize: 4, // 탭키를 누르면 띄어쓰기 몇 번 할지
        height: 250, // 최초 표시될 높이(px)
        toolbar: [ // 메뉴 설정
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture']]
        ],
        callbacks: {
         onImageUpload:function(files){
            // console.log(files);
            if(files.length != 1) return;
            
//            console.log("비동기 파일 업로드 시작");
            // [1] FormData ]2\ processData [3] contentType
            var fd = new FormData();
            fd.append("attach", files[0]);
            
            $.ajax({
               url:"/rest/attachment/upload",
               method:"post",
               data:fd,
               processData:false,
               contentType:false,
               success:function(response){
                  //console.log(response);
                  
                  //서버로 전송할 이미지 번호 정보 생성
				  var input = $("<input>").attr("type", "hidden")
				  								.attr("name", "attachmentNo")
				  								.val(response.attachmentNo);
				 $("form").prepend(input);
				 
				//에디터에 추가할 이미지 생성 			
                  var imgNode = $("<img>").attr("src", "/rest/attachment/download/"+response.attachmentNo);
//                  var imgNode = $("<img>").attr("src", "/rest/attachment/download?attachmentNo="+response.);
                  $("[name=boardContent]").summernote("insertNode", imgNode.get(0));
               },
               error:function(){}
               
            });
            
            
         }
      }
      });
        });