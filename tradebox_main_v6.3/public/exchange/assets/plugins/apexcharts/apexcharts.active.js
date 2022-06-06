var options = {
    series: [{
        data: [{
            x: new Date(1538778600000),
            y: [0,0, 0,0]
        }]
    }],
    chart: {
        type: 'candlestick',
        height: 485,
        fontFamily: '"Poppins", sans-serif',
        foreColor: '#8e8e8e',
        toolbar: {
            show: false,
        }
    },
    xaxis: {
        type: 'datetime',
        labels: {
            style: {
                fontSize: '11px',
            }
        },
        axisBorder: {
            show: false,
        },
        axisTicks: {
            show: true,
            color: '#797e81',
        },
    },
    yaxis: {
        tooltip: {
            enabled: true,
        },
        labels: {
            style: {
                fontSize: '11px',
            }
        },
        axisBorder: {
            show: true,
            color: 'rgba(255,255,255,0.05)',
        },
        axisTicks: {
            show: true,
            color: '#797e81',
        }
    },
    grid: {
        show: true,
        borderColor: 'rgba(255,255,255,0.05)',
        position: 'back',
        xaxis: {
            lines: {
                show: true
            }
        },
        yaxis: {
            lines: {
                show: true
            }
        },
        padding: {
            top: 0,
            right: 0,
            bottom: 0,
            left: 0
        },
    },
    responsive: [
        {
            breakpoint: 1920,
            options: {
                chart: {
                    redrawOnParentResize: false,
                    height: 450,
                },
            }
        }
    ]
};

var updatechartdata = new ApexCharts(document.querySelector("#chart_div"), options);
updatechartdata.render();

