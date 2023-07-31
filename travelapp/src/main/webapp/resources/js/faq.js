/**
 * 
 */

 var faqCategoryClsr=( function(){

 function getCmtList(pagingParams,callback,error){

     var bno = pagingParams.bno;
     var page = pagingParams.page ||1;

     console.log("getCmtList()가 전달받은 bno: " +bno);
     console.log("getCmtList()가 전달받은 page: " +page);
     console.log("getCmtList()함수의 ajax 처리 시작! ");

     $.ajax({ 
                 type:'get',
                 url:"/travelapp/boards/faq/pages/" + bno + "/" + page,
                 dataType:'json',
                 success:function(faqCategoryPagingCreator,status){
                     if(callback){
                         callback(faqCategoryPagingCreator);
                     }
                },

                 error:function(status,er){
                     if(error){
                         error(er);
                     }
                 }
             }); //ajax_END
         }//getCmtList_END
         return{
     getCmtList:getCmtList
 };

 })();//즉시 실행 함수



