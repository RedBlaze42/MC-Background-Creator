#include <ScreenCapture.au3>

$result=MsgBox(1+64,"MC-Background","Very important:"&@crlf&"You need to have the cheatcodes enables"&@CRLF&"Set the FOV to 90 if you are on the ground or 81 if you are flying in creative mode"&@CRLF&"Set minecraft in windowed mode"&@CRLF&"Disable the interface by pressing F1"&@CRLF&"Leave your game on the pause screen")
$name=InputBox("MC-Background","Type the name of the background you want to create")
If @error=1 OR $name="" Then Exit
If $result=2 Then Exit
$basepath=@AppDataDir&"\.minecraft\resourcepacks\"&$name&"\"
$screenpath=$basepath&"assets\minecraft\textures\gui\title\background\"

$result=DirCreate($screenpath)
FileWrite($basepath&"pack.mcmeta", '{"pack": {"pack_format": 5,"description": "MC-Background RedBlaze#0645"}}')
MsgBox(0,"MC-Background","After clicking OK you will have 5 seconds to click your minecraft window but leave it on pause screen and stop moving your mouse")
Sleep(5000)
$handle = WinGetTitle("[active]")
$pos=WinGetPos($handle)
WinMove($handle, "", 50, 50, 528,551)
Sleep(100)
Send("{ESC}")
take_screen($screenpath&"panorama_0.png",0,0)
take_screen($screenpath&"panorama_1.png",90,0)
take_screen($screenpath&"panorama_2.png",180,0)
take_screen($screenpath&"panorama_3.png",270,0)
take_screen($screenpath&"panorama_4.png",0,-90)
take_screen($screenpath&"panorama_5.png",0,90)
Send("{ESC}")
Func take_screen($dest,$pan,$tilt)
   Send("t")
   Sleep(50)
   Send("/tp @p ~  ~  ~  "&$pan&" "&$tilt&"{enter}")
   Sleep(700)
   _ScreenCapture_CaptureWnd($dest, $handle, 1, 31, 512,512+30)
EndFunc
WinMove($handle, "", $pos[0], $pos[1], $pos[2],$pos[3])
MsgBox(0,"MC-Background","Done !"&@CRLF&"The background named "&$name&" is in your ressourcepack menu")
