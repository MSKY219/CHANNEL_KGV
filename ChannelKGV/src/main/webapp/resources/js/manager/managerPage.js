$(document).ready(function () {

    // 일일 접속자 수
    const dailyEnter = document.getElementById('dailyEnter');

    const today = new Date();
    const lastWeek = addDays(today, -6);
    const labels = getDateRange(today, lastWeek);

    // console.log("today : " + formatDate(today));
    // console.log("lastWeek : " + formatDate(lastWeek));
    // console.log("labels : " + labels);


    $.ajax({
        url: "/movie/manager/getDailyEnter",
        data: {
            "today": formatDate(addDays(today, 1)),
            "lastWeek": formatDate(lastWeek)
        },
        type: "POST",
        success: function (result) {
            // console.log("가져온 result : ", result);
            const dateResult = [];
            for (let i = 0; i < labels.length; i++) {
                const label = labels[i];
                const targetDate = result.find(date => date.deDateStr == label)
                if (targetDate) {
                    dateResult.push(targetDate.deCount)
                } else {
                    dateResult.push(0)
                }

            }
            new Chart(dailyEnter, {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: [{
                        label: '일일 접속자 수',
                        data: dateResult,
                        borderWidth: 2,
                        backgroundColor: 'rgba(203,206,145,.5)', // 배경색
                        borderColor: '#CBCE91', // 선색
                        fill: true,
                        lineTension: 0.4, //선 곡선모양 0이면 직선
                        pointStyle: 'circle', //포인터 스타일 변경
                        pointBorderWidth: 2, //포인터 보더사이즈
                        pointRadius: 4, //포인터 반경 범위 
                        pointBorderColor: '#D3687F',//포인터 보더 색상
                        pointBackgroundColor: '#D3687F' // 포인터 내부 색상
                    }],
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    },
                    legend: { // 범례 사용 안 함
                        display: true,
                    },
                    responsive: true, // 반응형으로 크기를 잡아줌.
                    maintainAspectRatio: false
                }
            });
        }
    });

    // 일일 관람객 수 / 예매 수
    const dailyWatch = document.getElementById('dailyWatch');

    $.ajax({
        url: "/movie/manager/dailyWatch",
        data: {
            "today": formatDate(addDays(today, 1)),
            "lastWeek": formatDate(lastWeek)
        },
        type: "POST",
        success: function (result) {
            // console.log("가져온 result : ", result);

            const dateResult = [];
            for (let i = 0; i < labels.length; i++) {
                const label = labels[i];
                const targetDate = result.find(date => date.deDateStr == label)
                if (targetDate) {
                    dateResult.push(targetDate.deCount)
                } else {
                    dateResult.push(0)
                }

            }
            new Chart(dailyWatch, {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: [{
                        label: '일일 예매',
                        data: dateResult,
                        borderWidth: 2,
                        backgroundColor: 'rgba(43,137,224,.5)', // 배경색
                        borderColor: '#2b89e0', // 선색
                        fill: true,
                        lineTension: 0.4, //선 곡선모양 0이면 직선
                        pointStyle: 'circle', //포인터 스타일 변경
                        pointBorderWidth: 2, //포인터 보더사이즈
                        pointRadius: 4, //포인터 반경 범위 
                        pointBorderColor: '#D3687F',//포인터 보더 색상
                        pointBackgroundColor: '#D3687F' // 포인터 내부 색상
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    },
                    legend: { // 범례 사용 안 함
                        display: true,
                    },
                    responsive: true,
                    maintainAspectRatio: false
                }
            });
        }
    })
});

// 날짜 추가 기능
function addDays(date, days) {
    const commonDates = new Date(date.getFullYear(), date.getMonth(), date.getDate() + days)

    return commonDates
}


// 날짜 범위
function getDateRange(date1, date2) {

    // 배열 생성
    let rangeArr = [];

    // for문 // date1이 date2 와 같을 때 까지 반복

    while (date1.getTime() > date2.getTime()) {

        const formattedDate = formatDate(date2);

        rangeArr.push(formattedDate);

        date2 = addDays(date2, 1);

    }

    return rangeArr;

}


function formatDate(date) {

    const formattedDate = date.getFullYear() + "-" + ('0' + ((date.getMonth() + 1))).slice(-2) + "-" + ('0' + ((date.getDate()))).slice(-2);

    return formattedDate;
}