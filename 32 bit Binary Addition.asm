.model small
	.386
	.data

	DATA1 dd 00000000H
	msg db 10,13,"Enter the first no.:: $"
	msg1 db 10,13,"Enter the second no.:: $"
	msg2 db 10,13,"The Resultant sum is :: $"

	.code
	.startup
	MOV AH,09
	MOV DX,OFFSET msg
	INT 21H
	MOV EBX,0
	MOV CX,8

	AGAIN: MOV AH,01 ;1ST NO. ENTERED
	INT 21H
	CMP AL,'A'
	JGE L5
	SUB AL,30H
	JMP L6
	L5: SUB AL,37H
	L6: SHL EBX,4
	ADD BL,AL

	LOOP AGAIN
	MOV DATA1,EBX
	MOV AH,09
	MOV DX,OFFSET msg1
	INT 21H
	MOV EBX,0
	MOV CX,8

	AGAIN1:MOV AH,01 ;2nd NO. ENTERED
	INT 21H
	CMP AL,'A'
	JGE L7
	SUB AL,30H
	JMP L8
	L7: SUB AL,37H
	L8: SHL EBX,4
	ADD BL,AL

	LOOP AGAIN1
	ADD EBX,DATA1 ;ADDITION
	MOV AH,09
	MOV DX,OFFSET msg2
	INT 21H
	MOV CX,8

	AGAIN2: ROL EBX,4
	MOV DL,BL
	AND DL,0FH
	CMP DL,09
	JG L1 ; to o/p given no.

	ADD DL,30H
	JMP PRINT
	L1: ADD DL,37H
	PRINT: MOV AH,02
	INT 21H
	LOOP AGAIN2

	END