#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Singleinstance FORCE

^f::
{
  IfWinActive, Minecraft
  {
      WinGet, mcInstances, List, Minecraft
      Loop %mcInstances% {
          mcInstanceID := mcInstances%A_Index%

          ; WinActivate, ahk_id %mcInstanceID%

          While(True) {
            If (!WinActive("Minecraft")) {
              Break
            }
            MouseGetPos, X, Y
            X := X - Mod(X, 4) + 48
            Y := Y - Mod(Y + 1, 4) + 40
            ; Tooltip, ., %X%, %Y%
            Try {
              ImageSearch, OutX, OutY, X, Y, X + 500, Y + 200, *2 *TransBlack ToFind.bmp
            } Catch e {
              msgbox % e.What
            }
            If (ErrorLevel == 0) {
              ; SoundPlay, *32
              Break
            } Else If (ErrorLevel == 2) {
              Break
            ; } Else If (ErrorLevel == 1) {
            ;   SoundPlay, *64
            ;   Break
            }
            SendInput, c
            Sleep, 50
          }
            ; SendInput, c

          ; MC UI Pixel Quantisation
          ; X - Mod(X, 4)
          ; Y - Mod(Y + 1, 4)

          ; ToolTip, ., % X - Mod(X, 4) + 10, % Y - Mod(Y + 1, 4) + 10
          ; Sleep, 50
          ; ToolTip, ., % X2, % Y2
          ; ToolTip, % Format("{}`n{}`n{}`n{}`n`n{}`n{}`n{}`n{}", X, Y, Width, Height, X1, Y1, X2, Y2), 500, 500

          ; 50F6FC
          ; PixelSearch, OutputVarX, OutputVarY, %X1%, %Y1%, %X2%, %Y2%, FF0000, 1, Fast
          ; 51F9FF
          ; If (ErrorLevel == 1) {
          ;     ; SoundPlay, % Sounds.Disconnected, wait
          ;     ControlClick,, ahk_id %mcInstanceID%,, Right
          ;     ; Random, rand, 50, 150
          ;     Sleep, %rand%
          ;     ControlClick,, ahk_id %mcInstanceID%,, Right
          ;     FishDetected := True
          ; } Else If (ErrorLevel == 2) {
          ;     SoundPlay, Sounds.Asterisk, wait
          ; }
      }
  }
}