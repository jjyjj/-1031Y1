function f_exit() {
    if (confirm("是否取消登录系统?")) 
    {
        location.href = "../wd_out.aspx";
    }
}