@echo off
rem "rem"是注释，"@echo off"是不显示命令提示符"C:\Users\admin>"
echo;欢迎使用打印机安装程序
echo;按任意键开始安装，或按右上角 X 退出安装
pause>nul
rem ">nul"使命令输出不显示
echo;创建打印机 TCP/IP 端口： IP_172.16.10.251
cscript %~dp0\m126drivers\prnport.vbs -a -r IP_172.16.10.251 -h 172.16.10.251 -o raw
rem "%~dp0"是脚本所在目录,这里有个坑，官方例子里没有 -o raw 这个参数，但是没有这个参数会报参数无效
rem "prnport.vbs"实际目录是 C:\Windows\System32\Printing_Admin_Scripts\zh-CN ，此处复制到驱动目录
echo;删除同名打印机
rundll32 printui.dll,PrintUIEntry /dl /n "HP LaserJet Pro MFP M126nw" /q
rem 此处删除同名打印机，否则会出现打印机副本
echo;创建打印机： HP LaserJet Pro MFP M126nw
rundll32 printui.dll,PrintUIEntry /if /b "HP LaserJet Pro MFP M126nw" /f %~dp0\m126drivers\hpcm125126.inf /r "IP_172.16.10.251" /m "HP LaserJet Pro MFP M125-M126 PCLmS" /z
rem 此处注意 /m 后面的参数为 inf 文件里面的设备名称，/b 后面的为自定义打印机名称，此处也可以使用 vbs 脚本安装，脚本目录同上
echo;打印机安装完成
echo;按任意键退出...
pause>nul
