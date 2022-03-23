.386
.MODEL FLAT, STDCALL
include includes\windows.inc
extrn WriteConsoleA:PROC
extrn ExitProcess:PROC
extrn GetStdHandle:PROC
includelib includes\import32.lib

.DATA
	HelloMessage DB 'Hello, world!',0Dh,0Ah,'$'
	ns DD ?
	
.CODE
	START:
		MOV ECX, 4
		ADD ECX, 2
		LEA ECX, HelloMessage
		call GetStdHandle,-11
		call WriteConsoleA,eax,offset HelloMessage,15,ns,0
		CALL ExitProcess, 0
	END START