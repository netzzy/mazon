#cd /D "%APPDATA%\Mozilla\Firefox\Profiles"
#cd *.default
#set ffile=%cd%
#echo user_pref("network.proxy.socks", "%1");>>"%ffile%\prefs.js"
#echo user_pref("network.proxy.socks_port", %2);>>"%ffile%\prefs.js"
#echo user_pref("network.proxy.type", 1);>>"%ffile%\prefs.js"
#set ffile=
cd %windir%
"c:\Program Files (x86)\Mozilla Firefox\firefox.exe"
pause