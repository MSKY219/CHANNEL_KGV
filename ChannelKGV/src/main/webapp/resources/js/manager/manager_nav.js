$(document).ready(function () {
    const slide_Wrapper = $('.slide_Content > .slide_Wrapper');

    slide_Wrapper.on('click', (e) => {
        e.preventDefault();

        const slideDownItems = $(e.currentTarget).next('.slide_Down_items');
        const isActive = slideDownItems.is(':visible');

        $('.slide_Down_items').slideUp();
        slide_Wrapper.removeClass('active');

        if (!isActive) {
            slideDownItems.slideDown();
            $(e.currentTarget).addClass('active');
        }
    });

    const top_items = $('.top_Click_area > .top_items');
});