/**
 * pay result str
 * class 형태로 구현
 */
class PayResultStr {
    constructor() {};

    getResSuccessStr() {
        var resSucStr = `
            <div class="card-text text-wrap">
                Boooknow에서 <div class="fw-bold d-inline text-danger">호텔 예약</div>을 <div class="fw-bold d-inline text-danger">성공</div>했습니다. 
            </div>
            <div class="card-text text-wrap">
                호텔 예약 내역을 확인 하시려면 버튼을 눌러서 이동해주세요. 
            </div>
            <div class="card-text text-wrap">
                결제 취소 및 내역 변경은 마이페이지를 확인해주세요 
            </div>`;
        return resSucStr;
    } // getResSuccessStr end

    getResFailStr() {
        var resFailStr = `
        <div class="card-text text-wrap">
            Boooknow에서 <div class="fw-bold d-inline text-danger">호텔 예약</div>을 <div class="fw-bold d-inline text-danger">실패</div>했습니다. 
        </div>
        <div class="card-text text-wrap">
            자동으로 <div class="fw-bold d-inline text-danger">결제</div>가 <div class="fw-bold d-inline text-danger">취소</div> 됩니다. 
        </div>
        <div class="card-text text-wrap">
            자동으로 취소가 안되면 고객센터에 문의 해주세요.
        </div>
        <div class="card-text text-wrap">
            호텔 예약 내역을 확인 하시려면 버튼을 눌러서 이동해주세요. 
        </div>
        <div class="card-text text-wrap">
            결제 취소 및 내역 변경은 마이페이지를 확인해주세요 
        </div>`;
        return resFailStr;
    } // getResFailStr end
}; // PayResultStr end