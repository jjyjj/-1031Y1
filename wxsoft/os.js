$(document).ready(f_Init);
function f_Init() {
    var url = "../it.aspx?CMD=GETCNT";
    $.post(url, null, function (data) {
        if (data == "") return;
        var str = data.split("#");
        if (str.length > 0) {
            try {
                $("#m_todaynum").html(str[1]);
                $("#m_allnum").html(str[0]);
            }
            catch (e) { }            
        }
    });
}