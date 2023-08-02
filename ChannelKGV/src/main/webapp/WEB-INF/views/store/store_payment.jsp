<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <%@ page session="false" %>


                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta charset="UTF-8">
                        <meta http-equiv="X-UA-Compatible" content="IE=edge">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <title>전체영화</title>

                        <link rel="stylesheet" href="${contextPath}/resources/css/common/outline.css">
                        <link rel="stylesheet" href="${contextPath}/resources/css/store/store_payment.css">
                        <script src="https://kit.fontawesome.com/dc6e43e0ad.js" crossorigin="anonymous"></script>

                        <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
                            crossorigin="anonymous"></script>
                        <!-- <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script> -->
                        <!-- iamport.payment.js -->
                        <script type="text/javascript"
                            src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
                    </head>

                    <body>
                        <div id="wrap">

                            <!-- header -->
                            <jsp:include page="/WEB-INF/views/common/header.jsp" />


                            <main>


                                <div id="wrapper">








                                    <div>
                                        <div class="pay_wrapper">
                                            <div>
                                                <h4>상품정보</h4>
                                                <input type="hidden" id="userEmail" value="${loginUser.userEmail}">
                                                <input type="hidden" id="userName" value="${loginUser.userName}">
                                                <input type="hidden" id="storeNo" value="${storeDetail.storeNo}">
                                                <input type="hidden" id="userNo" value="${loginUser.userNo}">
                                            </div>

                                            <div>
                                                <div>

                                                    <img src="${storeDetail.storeImage}">


                                                </div>

                                                <div>
                                                    <div>
                                                        <div class="tit">

                                                            <h4><span id="storeName">${storeDetail.storeName}</span>
                                                            </h4>


                                                        </div>

                                                        <div class="quantity">
                                                            <h4>수량</h4>
                                                            <h4>
                                                                <span id="totalCount">${totalCount}</span>
                                                                <p>


                                                                </p>
                                                            </h4>
                                                            <h4>개</h4>
                                                        </div>

                                                    </div>
                                                    <div></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div>
                                            <div>
                                                <h4>결제수단</h4>
                                            </div>
                                            <div>
                                                <div>
                                                    <button type="button" class="pay_btn_box "><span><img
                                                                src="${contextPath}/resources/images/storeimg/payment_simple_kakao.png"
                                                                alt="카카오페이"></span><span>카카오페이</span></button>

                                                </div>
                                                <div></div>
                                            </div>
                                        </div>
                                        <div>
                                            <div>
                                                <h4>결제하기</h4>
                                            </div>
                                            <div class="payment">

                                                <div>
                                                    <div>
                                                        <div><input type="checkbox" id="chkTerm"><label
                                                                for="chkTerm">결제대행서비스 약관 동의</label>
                                                        </div>
                                                        <div>
                                                            <div>
                                                                <ul class="chk_List">
                                                                    <li>
                                                                        <div>
                                                                            <input type="checkbox" id="chkTerm01">
                                                                            <label for="chkTerm01">전자금융거래
                                                                                이용약관 동의</label>
                                                                        </div>
                                                                        <button class="modalClick"
                                                                            data-term="txtTerm01">약관보기</button>
                                                                    </li>
                                                                    <li>
                                                                        <div>
                                                                            <input type="checkbox" id="chkTerm02"><label
                                                                                for="chkTerm02">고유식별정보
                                                                                수집 및 이용안내</label>
                                                                        </div>
                                                                        <button class="modalClick"
                                                                            data-term="txtTerm02">약관보기</button>
                                                                    </li>
                                                                    <li>
                                                                        <div>
                                                                            <input type="checkbox" id="chkTerm03">
                                                                            <label for="chkTerm03">개인정보 수집
                                                                                및 이용동의</label>
                                                                        </div>
                                                                        <button class="modalClick"
                                                                            data-term="txtTerm03">약관보기</button>
                                                                    </li>
                                                                    <li>
                                                                        <div>
                                                                            <input type="checkbox" id="chkTerm04"><label
                                                                                for="chkTerm04">개인정보
                                                                                제3자 제공/위탁동의</label>
                                                                        </div>
                                                                        <button class="modalClick"
                                                                            data-term="txtTerm04">약관보기</button>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div>
                                                    <div>
                                                        <h4>상품금액</h4><span class="price" id="price"></span>
                                                        <fmt:formatNumber value="${totalPrice}" pattern="#,###" />
                                                        </span><em>원</em>
                                                    </div>

                                                    <div>
                                                        결제금액<span id="totalPrice">
                                                            <fmt:formatNumber value="${totalPrice}" pattern="#,###" />
                                                        </span><em>원</em>
                                                    </div>
                                                    <div>
                                                        <button class="pay_Submit">결제하기</button>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>



                                    </div>



                                </div>

                                <div class="modal areaModal">
                                    <div class="box_1">
                                        <div>
                                            <span>결제대행서비스 약관</span>
                                            <div>
                                                <i class="fa-solid fa-square-xmark exitBtn"></i>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="box_2">
                                        <!-- 타이틀 -->
                                        <div class="tab-list">
                                            <ul>

                                                <li><a href="#none" class="storeTab " data-term="txtTerm01">전자금융거래<br>
                                                        이용약관</a>
                                                </li>

                                                <li><a href="#none" class="storeTab" data-term="txtTerm02">고유식별정보 <br>및
                                                        이용안내</a>
                                                </li>

                                                <li><a href="#none" class="storeTab" data-term="txtTerm03">개인정보의 <br>수집
                                                        및
                                                        이용동의</a>
                                                </li>

                                                <li><a href="#none" class="storeTab" data-term="txtTerm04">개인정보 <br>제공 및
                                                        위탁
                                                        동의</a>
                                                </li>



                                            </ul>
                                        </div>

                                        <!-- 중간 -->
                                        <div>
                                            <div class="terms-content">
                                                <div class="txtarea_box" id="txtTerm01">
                                                    <h4 class="title">전자금융거래 이용약관</h4>
                                                    <h5 class="sub_tit">제1조 (목적)</h5>
                                                    <p class="txt">이 약관은 전자지급결제대행 서비스를 제공하는 주식회사 코밴 (이하 '회사'라 합니다)와 이용자
                                                        사이의 전자금융거래에 관한 기본적인 사항을 정함으로써 전자금융거래의 안정성과 신뢰성을 확보함에 그 목적이 있습니다.
                                                    </p>
                                                    <h5 class="sub_tit">제2조 (용어의 정의)</h5>
                                                    <p class="txt">이 약관에서 정하는 용어의 정의는 다음과 같습니다.</p>
                                                    <ol class="list">
                                                        <li>1. '전자지급결제대행 서비스'라 함은 전자적 방법으로 재화의 구입 또는 용역의 이용에 있어서 지급결제정보를
                                                            송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 서비스를 말합니다 .</li>
                                                        <li>2. '이용자'라 함은 이 약관에 동의하고 회사가 제공하는 전자지급결제대행 서비스를 이용하는 자를 말합니다.
                                                        </li>
                                                        <li>3. '접근매체'라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을
                                                            확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를
                                                            포함한다), '전자서명법'상의 인증서, 금융기관 또는 전자금융업자에 등록된 이용자번호, 이용자의 생체정보,
                                                            이상의 수단이나 정보를 사용하는데 필요한 비밀번호등 전자금융거래법 제2조 제10호에서 정하고 있는 것을
                                                            말합니다.</li>
                                                        <li>4. '거래지시'라 함은 이용자가 전자금융거래계약에 따라 금융기관 또는 전자금융업자에게 전자금융거래의 처리를
                                                            지시하는 것을 말합니다.</li>
                                                        <li>5. '오류'라 함은 이용자의 고의 또는 과실 없이 전자금융거래가 전자금융거래계약 또는 이용자의 거래지시에
                                                            따라 이행되지 아니한 경우를 말합니다.</li>
                                                    </ol>
                                                    <h5 class="sub_tit">제3조 (약관의 명시 및 변경)</h5>
                                                    <ol class="list">
                                                        <li>1. 회사는 이용자가 전자지급결제대행 서비스를 이용하기 전에 이 약관을 게시하고 이용자가 이 약관의 중요한
                                                            내용을 확인할 수 있도록 합니다.</li>
                                                        <li>2. 회사는 이용자의 요청이 있는 경우 전자문서의 전송방식에 의하여 본 약관의 사본을 이용자에게 교부합니다.
                                                        </li>
                                                        <li>3. 회사가 약관을 변경하는 때에는 그 시행일 1월 전에 변경되는 약관을 지급결제정보 입력화면 및 회사의
                                                            홈페이지에 게시함으로써 이용자에게 공지합니다.</li>
                                                    </ol>
                                                    <h5 class="sub_tit">제4조 (전자지급결제대행서비스의 종류)</h5>
                                                    <p class="txt">회사가 제공하는 전자지급결제대행서비스는 지급결제수단에 따라 다음과 같이 구별됩니다.</p>
                                                    <ol class="list">
                                                        <li>1. 신용카드결제대행서비스: 이용자가 결제대금의 지급을 위하여 제공한 지급결제수단이 신용카드인 경우로서,
                                                            회사가 전자결제시스템을 통하여 신용카드 지불정보를 송,수신하고 결제대금의 정산을 대행하거나 매개하는 서비스를
                                                            말합니다.</li>
                                                        <li>2. 계좌이체대행서비스: 이용자가 결제대금을 회사의 전자결제시스템을 통하여 금융기관에 등록한 자신의 계좌에서
                                                            출금하여 원하는 계좌로 이체할 수 있는 실시간 송금 서비스를 말합니다.</li>
                                                        <li>3. 가상계좌서비스: 이용자가 결제대금을 현금으로 결제하고자 경우 회사의 전자결제시스템을 통하여 자동으로
                                                            이용자만의 고유한 일회용 계좌의 발급을 통하여 결제대금의 지급이 이루어지는 서비스를 말합니다.</li>
                                                        <li>4. 기타: 회사가 제공하는 서비스로서 지급결제수단의 종류에 따라 '휴대폰 결제대행서비스',
                                                            'ARS결제대행서비스', '상품권결제대행서비스', '교통카드결제대행서비스' 등이 있습니다.</li>
                                                    </ol>
                                                    <h5 class="sub_tit">제5조 (접근매체의 관리 등)</h5>
                                                    <ol class="list">
                                                        <li>1. 회사는 전자지급결제대행 서비스 제공 시 접근매체를 선정하여 이용자의 신원, 권한 및 거래지시의 내용
                                                            등을 확인할 수 있습니다.</li>
                                                        <li>2. 이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수
                                                            없습니다.</li>
                                                        <li>3. 이용자는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근매체의 도용이나
                                                            위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.</li>
                                                        <li>4. 회사는 이용자로부터 접근매체의 분실이나 도난 등의 통지를 받은 때에는 그 때부터 제3자가 그 접근매체를
                                                            사용함으로 인하여 이용자에게 발생한 손해를 배상할 책임이 있습니다.</li>
                                                    </ol>
                                                    <h5 class="sub_tit">제6조 (거래내용의 확인)</h5>
                                                    <ol class="list">
                                                        <li>1. 회사는 이용자와 미리 약정한 전자적 방법을 통하여 이용자의 거래내용(이용자의 '오류정정 요구사실 및
                                                            처리결과에 관한 사항'을 포함합니다)을 확인할 수 있도록 하며, 이용자의 요청이 있는 경우에는 요청을 받은
                                                            날로부터 2주 이내에 모사전송 등의 방법으로 거래내용에 관한 서면을 교부합니다.</li>
                                                        <li>2. 회사가 이용자에게 제공하는 거래내용 중 거래계좌의 명칭 또는 번호, 거래의 종류 및 금액, 거래상대방을
                                                            나타내는 정보, 거래일자, 전자적 장치의 종류 및 전자적 장치를 식별할 수 있는 정보와 해당 전자금융거래와
                                                            관련한 전자적 장치의 접속기록은 5년간, 건당 거래금액이 1만원 이하인 소액 전자금융거래에 관한 기록,
                                                            전자지급수단 이용 시 거래승인에 관한 기록, 이용자의 오류정정 요구사실 및 처리결과에 관한 사항은 1년간의
                                                            기간을 대상으로 합니다.</li>
                                                        <li>3. 이용자가 제1항에서 정한 서면교부를 요청하고자 할 경우 다음의 주소 및 전화번호로 요청할 수 있습니다.
                                                            <ul>
                                                                <li>- 주소: 서울시 강남구 도곡동 946-16 야구회관 2,3층</li>
                                                                <li>- 이메일 주소: webmaster@kovan.com</li>
                                                                <li>- 전화번호: 02-3462-6400</li>
                                                            </ul>
                                                        </li>
                                                    </ol>
                                                    <h5 class="sub_tit">제7조 (오류의 정정 등)</h5>
                                                    <ol class="list">
                                                        <li>1. 이용자는 전자지급결제대행 서비스를 이용함에 있어 오류가 있음을 안 때에는 회사에 대하여 그 정정을
                                                            요구할 수 있습니다.</li>
                                                        <li>2. 회사는 전항의 규정에 따른 오류의 정정요구를 받은 때에는 이를 즉시 조사하여 처리한 후 정정요구를 받은
                                                            날부터 2주 이내에 그 결과를 이용자에게 알려 드립니다.</li>
                                                    </ol>
                                                    <h5 class="sub_tit">제8조 (회사의 책임)</h5>
                                                    <ol class="list">
                                                        <li>1. 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 있습니다.
                                                            다만, 이용자가 제5조 제2항에 위반하거나 제3자가 권한 없이 이용자의 접근매체를 이용하여 전자금융거래를 할
                                                            수 있음을 알았거나 알 수 있었음에도 불구하고 이용자가 자신의 접근매체를 누설 또는 노출하거나 방치한
                                                            경우에는 그러하지 아니합니다.</li>
                                                        <li>2. 회사는 계약체결 또는 거래지시의 전자적 전송이나 처리과정에서 발생한 사고로 인하여 이용자에게 손해가
                                                            발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만, 본 조 제1항 단서에 해당하거나
                                                            법인('중소기업기본법' 제2조 제2항에 의한 소기업을 제외한다)인 이용자에게 손해가 발생한 경우로서 회사가
                                                            사고를 방지하기 위하여 보안절차를 수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한 주의의무를
                                                            다한 경우에는 그러하지 아니합니다.</li>
                                                        <li>3. 회사는 컴퓨터 등 정보통신설비의 보수점검,교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는
                                                            전자지급결제대행 서비스의 제공을 일시적으로 중단할 수 있습니다.</li>
                                                        <li>4. 회사는 전항의 사유로 전자지급결제대행 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자가 입은 손해에
                                                            대하여 배상합니다.</li>
                                                    </ol>
                                                    <h5 class="sub_tit">제9조 (전자지급결제대행 서비스 이용 기록의 생성 및 보존)</h5>
                                                    <ol class="list">
                                                        <li>1. 회사는 이용자가 전자지급결제대행 서비스 이용거래의 내용을 추적, 검색하거나 그 내용에 오류가 발생한
                                                            경우에 이를 확인하거나 정정할 수 있는 기록을 생성하여 보존합니다.</li>
                                                        <li>2. 전항의 규정에 따라 회사가 보존하여야 하는 기록의 종류 및 보존방법은 제5조 제2항에서 정한 바에
                                                            따릅니다.</li>
                                                    </ol>
                                                    <h5 class="sub_tit">제10조 (거래지시의 철회 및 철회의 제한)</h5>
                                                    <ol class="list">
                                                        <li>1. 이용자는 전자지급거래에 관한 거래지시의 경우 지급의 효력이 발생하기 전까지 거래지시를 철회할 수
                                                            있습니다.</li>
                                                        <li>2. 전항의 지급효력이라 함은 거래지시 된 금액 정보에 대하여 수취인의 계좌가 개설되어 있는 금융기관의 계좌
                                                            원장에 입금기록이 끝날 때 또는 금융기관의 전자적 장치에 입력이 끝날 때를 말합니다.</li>
                                                        <li>3. 전자상거래 등에서의 소비자보호에 관한 법률 등 관련 법령에서 정한 바에 따라 재화의 구입 또는 용역의
                                                            이용 거래에서의 청약의 철회 등을 한 경우에만 전자지급거래지시의 철회가 가능합니다.</li>
                                                    </ol>
                                                    <h5 class="sub_tit">제11조 (전자금융거래정보의 제공금지)</h5>
                                                    <p class="txt">회사는 전자지급결제대행 서비스를 제공함에 있어서 취득한 이용자의 인적사항, 이용자의 계좌,
                                                        접근매체 및 전자금융거래의 내용과 실적에 관한 정보 또는 자료를 이용자의 동의를 얻지 아니하고 제3자에게
                                                        제공,누설하거나 업무상 목적 외에 사용하지 아니합니다.</p>
                                                    <h5 class="sub_tit">제12조 (분쟁처리 및 분쟁조정)</h5>
                                                    <ol class="list">
                                                        <li>1. 이용자는 다음의 분쟁처리 책임자 및 담당자에 대하여 전자지급결제대행 서비스 이용과 관련한 의견 및
                                                            불만의 제기, 손해배상의 청구 등의 분쟁처리를 요구할 수 있습니다.<ul>
                                                                <li>- 담당자: 신현웅</li>
                                                                <li>- 이메일주소 : hwsin@kovan.com</li>
                                                            </ul>
                                                        </li>
                                                        <li>2. 이용자가 회사에 대하여 분쟁처리를 신청한 경우에는 회사는 15일 이내에 이에 대한 조사 또는 처리
                                                            결과를 이용자에게 안내합니다.</li>
                                                        <li>3. 이용자는 '금융감독기구의 설치 등에 관한 법률' 제51조의 규정에 따른 금융감독원의 금융분쟁조정위원회나
                                                            '소비자보호법' 제31조 제1항의 규정에 따른 소비자보호원에 회사의 전자지급결제대행 서비스의 이용과 관련한
                                                            분쟁조정을 신청할 수 있습니다.</li>
                                                    </ol>
                                                    <h5 class="sub_tit">제13조 (회사의 안정성 확보 의무)</h5>
                                                    <p class="txt">회사는 전자금융거래의 안전성과 신뢰성을 확보할 수 있도록 전자금융거래의 종류별로 전자적 전송이나
                                                        처리를 위한 인력, 시설, 전자적 장치 등의 정보기술부문 및 전자금융업무에 관하여 금융감독위원회가 정하는 기준을
                                                        준수합니다.</p>
                                                    <h5 class="sub_tit">제14조 (약관외 준칙 및 관할)</h5>
                                                    <ol class="list">
                                                        <li>1. 이 약관에서 정하지 아니한 사항에 대하여는 전자금융거래법, 전자상거래 등에서의 소비자 보호에 관한
                                                            법률, 통신판매에 관한 법률, 여신전문금융업법 등 소비자보호 관련 법령에서 정한 바에 따릅니다.</li>
                                                        <li>2. 회사와 이용자간에 발생한 분쟁에 관한 관할은 민사소송법에서 정한 바에 따릅니다.</li>
                                                    </ol>
                                                </div>
                                                <div class="txtarea_box2" id="txtTerm02">
                                                    <h4 class="title">고유식별정보 수집 및 이용 동의</h4>
                                                    <p class="txt">본 약관은 주식회사 주식회사 코밴 또는 주식회사 케이에스넷 (이하 "회사"라 함)가 제공하는
                                                        전자지급결제대행서비스 이용자가 이용함에 있어 주민등록번호 수집 및 이용에 대한 기본적인 사항을 정함에 그 목적이
                                                        있습니다.</p>
                                                    <h5 class="sub_tit">1. 회사는 이용자의 주민등록번호를 수집, 이용하는 목적은 다음과 같습니다.</h5>
                                                    <ol class="list">
                                                        <li>ⓐ 이용자가 전자상거래를 이용하여 구매한 재화 및 용역의 대금 결제 시</li>
                                                        <li>ⓑ 이용자가 결제한 거래의 취소 및 환불 시</li>
                                                        <li>ⓒ 이용자가 결제한 거래의 청구, 수납 및 거래내역의 요청 확인 시</li>
                                                        <li>ⓓ 이용자가 수납한 거래 대금의 정산 시</li>
                                                        <li>ⓔ 서비스 제공 과정 중 본인 식별, 인증, 실명확인 및 회원에 대한 각종 안내/고지</li>
                                                        <li>ⓕ 서비스 제공 및 관련 업무처리에 필요한 동의 또는 철회 등 의사확인</li>
                                                    </ol>
                                                    <h5 class="sub_tit">2. 회사는 이용자로부터 수집한 주민등록번호는 아래 해당하는 경우에 제3자에게 제공하며
                                                        해당 사유 이외의 경우는 일체 외부에 제공하지 않습니다.</h5>
                                                    <ol class="list">
                                                        <li>ⓐ 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우
                                                        </li>
                                                        <li>ⓑ 이용자가 사전에 동의한 경우<ul>
                                                                <li>1) 계좌이체 :
                                                                    은행(기업/국민/외환/수협/농협중앙회/단위농협/우리/SC제일/한국씨티/대구/부산/광주/제주/전북/경남/새마을금고/신협/우체국/하나/신한/산림조합/산업),
                                                                    증권(동양/현대/미래에셋/한국투자/우리투자/하이/HMC/SK/대신/하나대투/신한금융/동부/유진/메리츠/신영/삼성/한화),
                                                                    금융결제원</li>
                                                                <li>2) 휴대폰 : 이동통신사(SKT, KT, LGU+), 다날, 모빌리언스</li>
                                                            </ul>
                                                        </li>
                                                    </ol>
                                                    <h5 class="sub_tit">3. 이용자로부터 제공받는 주민등록번호의 이용목적 및 보유,이용기간은 다음과 같습니다.
                                                    </h5>
                                                    <ol class="list">
                                                        <li>ⓐ 주민등록번호를 제공받는 자의 이용 목적 : 본인 인증, 거래승인</li>
                                                        <li>ⓑ 주민등록번호를 제공받는 자의 보유 및 이용 기간 :<ul>
                                                                <li>- 건당 거래금액이 1만원 이하의 경우 1년</li>
                                                                <li>- 건당 거래금액이 1만원 초과의 경우 5년</li>
                                                            </ul>
                                                        </li>
                                                    </ol>
                                                    <h5 class="sub_tit">4. 이용자의 주민등록번호는 원칙적으로 수집 및 이용목적이 달성되면 지체 없이 파기
                                                        합니다.</h5>
                                                    <p class="txt">단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존 합니다.</p>
                                                    <ol class="list">
                                                        <li>ⓐ 관련법령 : 상법, 전자상거래 등에서의 소비자보호에 관한 법률, 전자금융거래법 등 관련법령의 규정에
                                                            의하여 보존할 필요가 있는 경우 회사는 관련법령에서 정한 일정한 기간 동안 정보를 보관합니다. </li>
                                                        <li>ⓑ 상기 법령에 의한 보존기간은 아래와 같습니다.<dl>
                                                                <dt>1) 계약 또는 청약철회 등에 관한 기록</dt>
                                                                <dd>- 보존기간 : 5년</dd>
                                                                <dd>- 보존근거 : 전자상거래 등에서의 소비자보호에 관한 법률</dd>
                                                            </dl>
                                                            <dl>
                                                                <dt>2) 대금결제 및 재화 등의 공급에 관한 기록</dt>
                                                                <dd>- 보존기간 : 5년</dd>
                                                                <dd>- 보존근거 : 전자상거래 등에서의 소비자보호에 관한 법률</dd>
                                                                <dd>단, 건당 거래 금액이 1만원 이하의 경우에는 1년</dd>
                                                            </dl>
                                                            <dl>
                                                                <dt>3) 소비자의 불만 또는 분쟁처리에 관한 기록</dt>
                                                                <dd>- 보존기간 : 3년</dd>
                                                                <dd>- 보존근거 : 전자상거래 등에서의 소비자보호에 관한 법률</dd>
                                                            </dl>
                                                            <dl>
                                                                <dt>4) 신용정보의 수집/처리 및 이용 등에 관한 기록</dt>
                                                                <dd>- 보존기간 : 3년</dd>
                                                                <dd>- 보존근거 : 신용정보의 이용 및 보호에 관한 법률</dd>
                                                            </dl>
                                                            <dl>
                                                                <dt>5) 본인확인에 관한 기록</dt>
                                                                <dd>- 보존기간 : 6개월</dd>
                                                                <dd>- 보존근거 : 정보통신 이용촉진 및 정보보호 등에 관한 법률</dd>
                                                            </dl>
                                                            <dl>
                                                                <dt>6) 방문에 관한 기록</dt>
                                                                <dd>- 보존기간 : 3개월</dd>
                                                                <dd>- 보존근거 : 통신비밀보호법</dd>
                                                            </dl>
                                                        </li>
                                                    </ol>
                                                    <h5 class="sub_tit">5. 이용자는 회사의 주민등록번호 수집 및 이용 동의를 거부할 수 있습니다.</h5>
                                                    <p class="txt">단, 동의를 거부 하는 경우 서비스 결제가 정상적으로 완료 될 수 없음을 알려 드립니다.</p>
                                                </div>
                                                <div class="txtarea_box3" id="txtTerm03">
                                                    <h4 class="title">개인정보의 수집 및 이용 동의</h4>
                                                    <p class="txt">본 약관은 주식회사 코밴(이하 '회사' 라 함)가 제공하는 전자지급결제대행서비스 이용자가
                                                        이용함에 있어 개인정보 수집 및 이용에 대한 기본적인 사항을 정함에 그 목적이 있습니다.</p>
                                                    <h5 class="sub_tit">1. 회사는 이용자의 개인정보를 수집, 이용하는 목적은 다음과 같습니다.</h5>
                                                    <ol class="list">
                                                        <li>ⓐ 이용자가 전자상거래를 이용하여 구매한 재화 및 용역의 대금 결제 시</li>
                                                        <li>ⓑ 이용자가 결제한 거래의 취소 및 환불 시</li>
                                                        <li>ⓒ 이용자가 결제한 거래의 청구, 수납 및 거래내역의 요청 확인 시</li>
                                                        <li>ⓓ 이용자가 수납한 거래 대금의 정산 시</li>
                                                        <li>ⓔ 서비스 제공 과정 중 본인 식별, 인증, 실명확인 및 회원에 대한 각종 안내/고지</li>
                                                        <li>ⓕ 서비스 제공 및 관련 업무처리에 필요한 동의 또는 철회 등 의사확인</li>
                                                        <li>ⓖ 기타 회사가 제공하는 이벤트 등 광고성 정보 전달, 통계학적 특성에 따른 서비스 제공 및 광고 게재,
                                                            실제 마케팅 활동</li>
                                                    </ol>
                                                    <h5 class="sub_tit">2. 회사가 수집하는 이용자의 개인정보의 항목은 다음과 같습니다.</h5>
                                                    <ol class="list">
                                                        <li>ⓐ 신용카드 : 카드번호(3rd-마스킹), 승인시간, 승인번호, 승인금액 등</li>
                                                        <li>ⓑ 계좌이체 : 계좌번호,비밀번호,주민등록번호(외국인등록번호), 행명, 보안카드 또는 OTP 등</li>
                                                        <li>ⓒ 가상계좌 : 입금자명, 입금은행 등</li>
                                                        <li>ⓓ 휴대폰 : 휴대폰번호, 이동통신사정보, 주민등록번호(외국인등록번호) 등</li>
                                                    </ol>
                                                    <h5 class="sub_tit">3. 회사가 수집한 이용자 개인정보의 보유, 이용 기간은 다음과 같습니다.</h5>
                                                    <ol class="list">
                                                        <li>ⓐ 보존항목 : 서비스 상담 수집 항목(회사명, 고객명, 전화번호, E-mail, 상담내용 등)</li>
                                                        <li>ⓑ 보존이유 : 분쟁이 발생 할 경우 소명자료 활용</li>
                                                        <li>ⓒ 보존기간 : 상담 완료 후 6개월</li>
                                                    </ol>
                                                    <h5 class="sub_tit">4. 이용자의 개인정보는 원칙적으로 수집 및 이용목적이 달성되면 지체 없이 파기
                                                        합니다.</h5>
                                                    <p class="txt">단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존 합니다.</p>
                                                    <ol class="list">
                                                        <li>ⓐ 관련법령 :상법, 전자상거래 등에서의 소비자보호에 관한 법률, 전자금융거래법 등 관련법령의 규정에 의하여
                                                            보존할 필요가 있는 경우 회사는 관련법령에서 정한 일정한 기간 동안 정보를 보관합니다.</li>
                                                        <li>ⓑ 상기 법령에 의한 보존기간은 다음과 같습니다.<dl>
                                                                <dt>1) 계약 또는 청약철회 등에 관한 기록</dt>
                                                                <dd>- 보존기간 : 5년</dd>
                                                                <dd>- 보존근거 : 전자상거래 등에서의 소비자보호에 관한 법률</dd>
                                                            </dl>
                                                            <dl>
                                                                <dt>2) 대금결제 및 재화 등의 공급에 관한 기록</dt>
                                                                <dd>- 보존기간 : 5년</dd>
                                                                <dd>- 보존근거 : 전자상거래 등에서의 소비자보호에 관한 법률</dd>
                                                                <dd>단, 건당 거래 금액이 1만원 이하의 경우에는 1년</dd>
                                                            </dl>
                                                            <dl>
                                                                <dt>3) 소비자의 불만 또는 분쟁처리에 관한 기록</dt>
                                                                <dd>- 보존기간 : 3년</dd>
                                                                <dd>- 보존근거 : 전자상거래 등에서의 소비자보호에 관한 법률</dd>
                                                            </dl>
                                                            <dl>
                                                                <dt>4) 신용정보의 수집/처리 및 이용 등에 관한 기록</dt>
                                                                <dd>- 보존기간 : 3년</dd>
                                                                <dd>- 보존근거 : 신용정보의 이용 및 보호에 관한 법률</dd>
                                                            </dl>
                                                            <dl>
                                                                <dt>5) 본인확인에 관한 기록</dt>
                                                                <dd>- 보존기간 : 6개월</dd>
                                                                <dd>- 보존근거 : 정보통신 이용촉진 및 정보보호 등에 관한 법률</dd>
                                                            </dl>
                                                            <dl>
                                                                <dt>6) 방문에 관한 기록</dt>
                                                                <dd>- 보존기간 : 3개월</dd>
                                                                <dd>- 보존근거 : 통신비밀보호법</dd>
                                                            </dl>
                                                        </li>
                                                    </ol>
                                                    <h5 class="sub_tit">5. 이용자는 회사의 주민등록번호 수집 및 이용 동의를 거부할 수 있습니다.</h5>
                                                    <p class="txt">단, 동의를 거부 하는 경우 서비스 결제가 정상적으로 완료 될 수 없음을 알려 드립니다.</p>
                                                </div>
                                                <div class="txtarea_box4" id="txtTerm04">
                                                    <h4 class="title">개인정보 제공 및 위탁 동의</h4>
                                                    <p class="txt">본 약관은 주식회사 코밴(이하 '회사' 라 함)가 제공하는 전자지급결제대행서비스 이용자가
                                                        이용함에 있어 개인정보 수집 및 이용에 대한 기본적인 사항을 정함에 그 목적이 있습니다.</p>
                                                    <h5 class="sub_tit">1. 회사는 이용자의 개인정보를 수집, 이용하는 목적은 다음과 같습니다.</h5>
                                                    <ol class="list">
                                                        <li>ⓐ 이용자가 전자상거래를 이용하여 구매한 재화 및 용역의 대금 결제 시</li>
                                                        <li>ⓑ 이용자가 결제한 거래의 취소 및 환불 시</li>
                                                        <li>ⓒ 이용자가 결제한 거래의 청구, 수납 및 거래내역의 요청 확인 시</li>
                                                        <li>ⓓ 이용자가 수납한 거래 대금의 정산 시</li>
                                                        <li>ⓔ 서비스 제공 과정 중 본인 식별, 인증, 실명확인 및 회원에 대한 각종 안내/고지</li>
                                                        <li>ⓕ 서비스 제공 및 관련 업무처리에 필요한 동의 또는 철회 등 의사확인</li>
                                                        <li>ⓖ 기타 회사가 제공하는 이벤트 등 광고성 정보 전달, 통계학적 특성에 따른 서비스 제공 및 광고 게재,
                                                            실제 마케팅 활동</li>
                                                    </ol>
                                                    <h5 class="sub_tit">2. 회사가 수집하는 이용자의 개인정보의 항목은 다음과 같습니다.</h5>
                                                    <ol class="list">
                                                        <li>ⓐ 신용카드 : 카드번호(3rd-마스킹), 승인시간, 승인번호, 승인금액 등</li>
                                                        <li>ⓑ 계좌이체 : 계좌번호,비밀번호,주민등록번호(외국인등록번호), 행명, 보안카드 또는 OTP 등</li>
                                                        <li>ⓑ 계좌이체 : 계좌번호,비밀번호,주민등록번호(외국인등록번호), 행명, 보안카드 또는 OTP 등</li>
                                                        <li>ⓒ 가상계좌 : 입금자명, 입금은행 등</li>
                                                        <li>ⓓ 휴대폰 : 휴대폰번호, 이동통신사정보, 주민등록번호(외국인등록번호) 등</li>
                                                    </ol>
                                                    <h5 class="sub_tit">3. 회사가 수집한 이용자 개인정보의 보유, 이용 기간은 다음과 같습니다.</h5>
                                                    <ol class="list">
                                                        <li>ⓐ 보존항목 : 서비스 상담 수집 항목(회사명, 고객명, 전화번호, E-mail, 상담내용 등)</li>
                                                        <li>ⓑ 보존이유 : 분쟁이 발생 할 경우 소명자료 활용</li>
                                                        <li>ⓒ 보존기간 : 상담 완료 후 6개월</li>
                                                    </ol>
                                                    <h5 class="sub_tit">4. 이용자의 개인정보는 원칙적으로 수집 및 이용목적이 달성되면 지체 없이 파기
                                                        합니다.</h5>
                                                    <p class="txt">단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존 합니다.</p>
                                                    <ol class="list">
                                                        <li>ⓐ 관련법령 : 상법, 전자상거래 등에서의 소비자보호에 관한 법률, 전자금융거래법 등 관련법령의 규정에
                                                            의하여 보존할 필요가 있는 경우 회사는 관련법령에서 정한 일정한 기간 동안 정보를 보관합니다.</li>
                                                        <li>ⓑ 상기 법령에 의한 보존기간은 다음과 같습니다.<dl>
                                                                <dt>1) 계약 또는 청약철회 등에 관한 기록</dt>
                                                                <dd>- 보존기간 : 5년</dd>
                                                                <dd>- 보존근거 : 전자상거래 등에서의 소비자보호에 관한 법률</dd>
                                                            </dl>
                                                            <dl>
                                                                <dt>2) 대금결제 및 재화 등의 공급에 관한 기록</dt>
                                                                <dd>- 보존기간 : 5년</dd>
                                                                <dd>- 보존근거 : 전자상거래 등에서의 소비자보호에 관한 법률</dd>
                                                                <dd>단, 건당 거래 금액이 1만원 이하의 경우에는 1년</dd>
                                                            </dl>
                                                            <dl>
                                                                <dt>3) 소비자의 불만 또는 분쟁처리에 관한 기록</dt>
                                                                <dd>- 보존기간 : 3년</dd>
                                                                <dd>- 보존근거 : 전자상거래 등에서의 소비자보호에 관한 법률</dd>
                                                            </dl>
                                                            <dl>
                                                                <dt>4) 신용정보의 수집/처리 및 이용 등에 관한 기록</dt>
                                                                <dd>- 보존기간 : 3년</dd>
                                                                <dd>- 보존근거 : 신용정보의 이용 및 보호에 관한 법률</dd>
                                                            </dl>
                                                            <dl>
                                                                <dt>5) 본인확인에 관한 기록</dt>
                                                                <dd>- 보존기간 : 6개월</dd>
                                                                <dd>- 보존근거 : 정보통신 이용촉진 및 정보보호 등에 관한 법률</dd>
                                                            </dl>
                                                            <dl>
                                                                <dt>6) 방문에 관한 기록</dt>
                                                                <dd>- 보존기간 : 3개월</dd>
                                                                <dd>- 보존근거 : 통신비밀보호법</dd>
                                                            </dl>
                                                        </li>
                                                    </ol>
                                                    <h5 class="sub_tit">5. 이용자는 회사의 주민등록번호 수집 및 이용 동의를 거부할 수 있습니다.</h5>
                                                    <p class="txt">단, 동의를 거부 하는 경우 서비스 결제가 정상적으로 완료 될 수 없음을 알려 드립니다.</p>
                                                </div>
                                            </div>

                                        </div>


                                        <!-- 버튼 -->
                                        <div class="box_btn">
                                            <div>
                                                <button class="exitBtn">확인</button>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </main>
                        </div>



                        <!-- footer -->
                        <jsp:include page="/WEB-INF/views/common/footer.jsp" />



                        <script src="${contextPath}/resources/js/store/store_payment.js"></script>
                        <script src="${contextPath}/resources/js/manager/apikey.js"></script>
                    </body>

                    </html>