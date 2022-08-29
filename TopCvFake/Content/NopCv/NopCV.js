
$(function () {
    $(".nutnopcv").click(function (e) {
        $("ul.tabs .tab-cv").addClass("active");
    });


    // form dangnhap dangky 
    $(".tab-nopcv").click(function (e) {
        $('#formnopcv').removeClass("fade");
        $('#formnopcv').modal("show");
    });
    $(".close").click(function (e) {
        $('.modal').addClass("fade");
        $("ul.tabs .tab-cv").removeClass("active");
    });
});