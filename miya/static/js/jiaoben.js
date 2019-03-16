$(function () {
    $('img').each(function () {
        var imgpath = $(this).attr('src')
        // console.log(imgpath)
        imgpath = "{% static '" + imgpath + "' %}"
        $(this).attr('src',imgpath)
    })
    console.log($('body').html())
})