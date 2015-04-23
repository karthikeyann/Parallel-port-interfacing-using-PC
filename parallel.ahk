no:=0
Status = 0 0 0 0 0 0 0 0
Gui, Add, Text,x0 y0, _______________________________________________________________
Gui, Add, Text,x10 y7, "Check the port pins to enable(instant action)"
Gui, Add, Checkbox, x0 y30 vpin[0] ghi, pin0
Gui, Add, Checkbox, x50 y30 vpin[1] ghi, pin1
Gui, Add, Checkbox, x100 y30 vpin[2] ghi, pin2
Gui, Add, Checkbox, x150 y30 vpin[3] ghi, pin3
Gui, Add, Checkbox, x200 y30 vpin[4] ghi, pin4
Gui, Add, Checkbox, x250 y30 vpin[5] ghi, pin5
Gui, Add, Checkbox, x300 y30 vpin[6] ghi, pin6
Gui, Add, Checkbox, x350 y30 vpin[7] ghi, pin7
Gui, Add, Button,   gGuiClose, Quit
Gui, Add, Text,x0 y80, _______________________________________________________________
Gui, Add, Text,x10 y87, "Check the port pins to enable(Press Apply for Action)"
Gui, Add, Checkbox, x0 y120 vp[0], pin0
Gui, Add, Checkbox, x50 y120 vp[1], pin1
Gui, Add, Checkbox, x100 y120 vp[2], pin2
Gui, Add, Checkbox, x150 y120 vp[3], pin3
Gui, Add, Checkbox, x200 y120 vp[4], pin4
Gui, Add, Checkbox, x250 y120 vp[5], pin5
Gui, Add, Checkbox, x300 y120 vp[6], pin6
Gui, Add, Checkbox, x350 y120 vp[7], pin7
Gui, Add, Button,   gApply, Apply
Gui, Add, Text,x0 y163, _______________________________________________________________
Gui, Add, Text,x10 y170, "Enter no. to be sent to parallel port"
Gui, Add, Edit,x50 y200 Number vno2
Gui, Add, Text,x200 y200 cBlue gWeb, pins       0 1 2 3 4 5 6 7
Gui, Add, Text,x200 y213, status    %Status%
Gui, Add, Button,x350 y200   gSend, Send
Gui, Show,, Parallel port(25 pin) interfacing

return

hi:
Gui, Submit, Nohide
no := (1*pin[0]) + (2*pin[1]) + (4*pin[2]) + (8*pin[3]) + (16*pin[4]) + (32*pin[5]) + (64*pin[6]) + (128*pin[7])
Status = %pin[0]% %pin[1]% %pin[2]% %pin[3]% %pin[4]% %pin[5]% %pin[6]% %pin[7]%
DllCall("inpout32.dll\Out32", "Short", 0x378, "Short", %no%)
Gosub, update1
GuiControl, Text,Static8, status    %Status%
Guicontrol,,no2,%no%
return
Apply:
Gui, Submit, Nohide
no := (1*p[0]) + (2*p[1]) + (4*p[2]) + (8*p[3]) + (16*p[4]) + (32*p[5]) + (64*p[6]) + (128*p[7])
Status = %p[0]% %p[1]% %p[2]% %p[3]% %p[4]% %p[5]% %p[6]% %p[7]%
DllCall("inpout32.dll\Out32", "Short", 0x378, "Short", %no%)
Gosub, update2
GuiControl, Text,Static8, status    %Status%
Guicontrol,,no2,%no%
return

Send:
Gui, Submit, Nohide
no := mod(no2,256)
DllCall("inpout32.dll\Out32", "Short", 0x378, "Short", %no%)
n02:=no
pin[7] := floor(no2/128)
no2:=mod(no2,128)
pin[6] := floor(no2/64)
no2:=mod(no2,64)
pin[5] := floor(no2/32)
no2:=mod(no2,32)
pin[4] := floor(no2/16)
no2:=mod(no2,16)
pin[3] := floor(no2/8)
no2:=mod(no2,8)
pin[2] := floor(no2/4)
no2:=mod(no2,4)
pin[1] := floor(no2/2)
no2:=mod(no2,2)
pin[0] := floor(no2/1)
Status = %pin[0]% %pin[1]% %pin[2]% %pin[3]% %pin[4]% %pin[5]% %pin[6]% %pin[7]%
Gosub, update1
Gui, Submit, Nohide
Gosub, update2
GuiControl,,no2,%no%
GuiControl, Text,Static8, status    %Status%
return
update1:
GuiControl,,p[0],%pin[0]%
GuiControl,,p[1],%pin[1]%
GuiControl,,p[2],%pin[2]%
GuiControl,,p[3],%pin[3]%
GuiControl,,p[4],%pin[4]%
GuiControl,,p[5],%pin[5]%
GuiControl,,p[6],%pin[6]%
GuiControl,,p[7],%pin[7]%
return
update2:
GuiControl,,pin[0],%p[0]%
GuiControl,,pin[1],%p[1]%
GuiControl,,pin[2],%p[2]%
GuiControl,,pin[3],%p[3]%
GuiControl,,pin[4],%p[4]%
GuiControl,,pin[5],%p[5]%
GuiControl,,pin[6],%p[6]%
GuiControl,,pin[7],%p[7]%
return
Web:
Run www.ishis.t35.com
return
GuiClose:
ExitApp