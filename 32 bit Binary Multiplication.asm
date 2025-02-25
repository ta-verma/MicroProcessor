.model small
	.386
	.data

	DATA1 dd 00000000H
	DATA2 dd 00000000H
	PROD1 dd ?
	PROD2 dd ?

	msg db 10,13,"Enter the first no.:: $"
	msg1 db 10,13,"Enter the second no.:: $"
	msg2 db 10,13,"The product(in hexadecimal) is :: $"

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

	MOV DATA2,EBX
	MOV EBX,0
	MOV EDX,0
	MOV EAX,0
	MOV EAX,DATA1
	MOV EBX,DATA2

	MUL EBX
	MOV PROD1,EDX
	MOV PROD2,EAX
	MOV AH,09
	MOV DX,OFFSET msg2
	INT 21H
	MOV EBX,PROD1
	MOV CX,8

	AGAIN2: ROL EBX,4
	MOV DL,BL
	AND DL,0FH ; to o/p the result
	CMP DL,9
	JBE L1
	ADD DL,37H
	MOV AH,02
	INT 21H
	JMP L2

	L1: ADD DL,30H
	MOV AH,02
	INT 21H

	L2: LOOP AGAIN2
	MOV EBX,PROD2
	MOV CX,8
	AGAIN3: ROL EBX,4
	MOV DL,BL
	AND DL,0FH ; to o/p the result
	CMP DL,9
	JBE L3
	ADD DL,37H
	MOV AH,02
	INT 21H
	JMP L4

	L3: ADD DL,30H
	MOV AH,02
	INT 21H
	L4: LOOP AGAIN3

	MOV AH,4CH
	INT 21H
	END