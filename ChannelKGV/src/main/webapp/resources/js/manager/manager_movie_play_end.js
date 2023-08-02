$(document).ready(function () {
    const delBtn = $('.deleteEvent');
    delBtn.on('click', (e) => {
        e.preventDefault();
        alert('삭제기능은 비활성화 하였습니다');
    })
});