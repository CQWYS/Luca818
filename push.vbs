Set objShell = CreateObject("WScript.Shell")
objShell.Run "cmd /k cd /d C:\Users\10076\Desktop\portfolio2 && echo Starting push to GitHub... && git push -u origin main && echo Push complete! && pause", 1, False
