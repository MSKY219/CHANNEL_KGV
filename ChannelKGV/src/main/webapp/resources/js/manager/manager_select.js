$(document).ready(function () {

    // 관리자 페이지에 진입하기 전에 실헹
    $(document).ready(function () {

        // 현재 URL을 가지고 오기.
        const url = $(location).attr('href');

        // nav 안에 있는 모든 a 태그 가져오기.
        const navLinks = $('.nav_Slide a');


        // 반복문을 돌려서 모든 a태그 선택
        // 아래 for문은 navLinks 안의 모든 link(= a태그)를 선택 
        for (const link of navLinks) {

            // .attr()을 사용해서, a태그 안의 주소를 가지고온다.
            const linkHref = $(link).attr('href');

            // indexOf()는 값이 있을 경우, 해당 인덱스의 번호(값)을 반환하지만 없을 경우 -1을 반환한다.
            // 즉, 아래의 isLinkActive는 true일 경우를 의미한다.
            const isLinkActive = url.indexOf(linkHref) > -1;

            // console.log(linkHref, isLinkActive);

            // 조건문을 통해서 추가할 값을 정해준다.
            if (isLinkActive) {
                $(link).parent('.slide_Down_items').siblings('.slide_Wrapper').addClass('active')
                $(link).parent('.slide_Down_items').css({ display: 'block' })
                $(link).children('li').addClass('selected_Title');
            }
        }

    });

});