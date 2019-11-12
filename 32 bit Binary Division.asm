.model small
	.386
	.data

	DATA1 dd 00000000H
	DATA2 dd 00000000H
	REM dd ?
	QUO dd ?

	msg db 10,13,"Enter the first no.:: $"
	msg1 db 10,13,"Enter the second no.:: $"
	msg2 db 10,13,"The Remainder is :: $"
	msg3 db 10,13,"The Quotient is :: $"

	.code
	.startup
	MOV AH,09
	MOV DX,OFFSET msg
	INT 21H
	MOV EBX,0
	MOV CX,8
