/**
 * airways pay ajax 통신 
 * prototype
 * class 형태로 구현
 */
class PaymenntAjaxModule{
    constructor() {
        IMP.init("imp45240462");
    }
    // 구매 요청
    requestPayment(sellData, callback) {
        //
        IMP.request_pay({
            pg: "html5_inicis.INIpayTest", //pg 코드
            pay_method: "card",
            merchant_uid: sellData.sellId,   // 주문번호
            name: sellData.sellName, // 결제 상품
            amount: sellData.amount, // 숫자 타입
            buyer_email: sellData.buyerEmail, //구매자 이메일
            buyer_name: sellData.buyerName, // 구매자 이름
        }, function (rsp) { // callback
            if (callback) {
                callback(rsp);
            }
        });
        //
    }// requestPayment end

    // 구매 완료 후 로직
    paymentSuccess(payData, callback, error) {
        $.ajax({
            type : 'post',
            url : '/travelapp/airways/pay/success', // url 여기 바꿔야함
            data : JSON.stringify(payData),
            contentType: 'application/json; charset=utf-8',
            dataType : 'json',
            success : function (data, status, xhr) {
                if (callback) {
                    callback(data); // callback
                }
            },
            error : function (xhr, status, err) {
                if (error) {
                    error(err)
                }
            }
        });// ajax end
    }// paymentSuccess end

};// PaymenntAjaxModule end
