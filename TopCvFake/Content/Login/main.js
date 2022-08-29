$(function () {
$(".nutdangnhap").click(function (e) {
    $("ul.tabs .tab-dangnhap").addClass("active");
});
$(".nutdangky").click(function (e) {
    $("ul.tabs .tab-dangky").addClass("active");
});

$("ul.tabs .tab-dangnhap").click(function (e) {
    $("ul.tabs .tab-dangnhap").addClass("active");
    $("ul.tabs .tab-dangky").removeClass("active");
});

$("ul.tabs .tab-dangky").click(function (e) {
    $("ul.tabs .tab-dangky").addClass("active");
    $("ul.tabs .tab-dangnhap").removeClass("active");
});

// form dangnhap dangky 
$(".tab-dangky").click(function (e) {
    $('#formdangnhap').removeClass("fade");
    $('#formdangky').removeClass("fade");
    $('#formdangnhap').modal("hide");
    $('#formdangky').modal("show");
});
$(".tab-dangnhap").click(function (e) {
    $('#formdangnhap').removeClass("fade");
    $('#formdangky').removeClass("fade");
    $('#formdangky').modal("hide");
    $('#formdangnhap').modal("show");
});
$(".close").click(function (e) {
    $('.modal').addClass("fade");
    $("ul.tabs .tab-dangnhap").removeClass("active");
    $("ul.tabs .tab-dangky").removeClass("active");
});

// thumb-img
$(".thumb-img.thumb1").addClass('vienvang');
$('.thumb-img').click(function (e) {
    $('.product-image').attr('src', this.src);
});

$('.thumb-img').click(function (e) {
    $('.thumb-img:not(:hover)').removeClass('vienvang');
    $(this).addClass('vienvang');
});
    $("#form-signup").validate({
        rules: {
            name: {
                required: true,
            },
            phone: {
                required: true,
                minlength: 8
            },
            password: {
                required: true,
                minlength: 6
            },
            confirm_password: {
                required: true,
                minlength: 6,
                equalTo: "#inputPassword"
            },
            email: {
                required: true,
                email: true
            }
        },
        messages: {
            name: {
                required: "Vui lòng nhập họ và tên",
            },
            phone: {
                required: "Vui lòng nhập số điện thoại",
                minlength: "Số máy quý khách vừa nhập là số không có thực"
            },
            password: {
                required: 'Vui lòng nhập mật khẩu',
                minlength: 'Vui lòng nhập ít nhất 6 kí tự'
            },
            confirm_password: {
                required: 'Vui lòng nhập lại mật khẩu',
                minlength: 'Vui lòng nhập ít nhất 6 kí tự',
                equalTo: 'Mật khẩu không trùng'
            },
            email: {
                required: "Vui lòng nhập email",
                minlength: "Email không hợp lệ",
                email: "Vui lòng nhập email",
            }
        }
    });

$("#form-signin").validate({
    rules: {
        password: {
            required: true,
            minlength: 6
        },
        email: {
            required: true,
            email: true
        }
    },
    messages: {
        password: {
            required: 'Vui lòng nhập mật khẩu',
            minlength: 'Vui lòng nhập ít nhất 6 kí tự'
        },
        email: {
            required: "Vui lòng nhập email",
            minlength: "Email không hợp lệ",
            email: "Vui lòng nhập email",
        }
    }
});

    //rotate chevron
    $('#step1contentid').on('show.bs.collapse', function () {
        $(this).prev().addClass("active");
    })
    $('#step1contentid').on('hide.bs.collapse', function () {
        $(this).prev().removeClass("active");
    })
    $('#step2contentid').on('show.bs.collapse', function () {
        $(this).prev().addClass("active");
    })
    $('#step2contentid').on('hide.bs.collapse', function () {
        $(this).prev().removeClass("active");
    })
    $('#step3contentid').on('show.bs.collapse', function () {
        $(this).prev().addClass("active");
    })
    $('#step3contentid').on('hide.bs.collapse', function () {
        $(this).prev().removeClass("active");
    })

$('.items .row').isotope({
    itemSelector: '.item',
})

$('.tag a').click(function (e) {
    var tacgia = $(this).data('tacgia');

    if (tacgia == 'all') {
        $('.items .row').isotope({ filter: '*' })
    } else {
        $('.items .row').isotope({ filter: tacgia });
    }
    return false;
});

$('.thay-doi-mk').hide();
$("#changepass").click(function (e) {
    $('.thay-doi-mk').toggle(200);
});
});


