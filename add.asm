.model small

.data
    msg1 db "Enter first number: $"
    msg2 db 10, "Enter second number: $"
    msg3 db 10, "Result = $"
    temp dw ?
.code
    .startup
        lea dx, msg1
        mov ah, 09h
        int 21h
        
        mov cx, 4
        mov bx, 0
        
        input1: 
            shl bx, 4
            mov ah, 01h
            int 21h
            sub al, 30h
            cmp al, 9h
            jbe input11
            sub al, 07h
            input11:
                mov ah, 0h
                add bx, ax
        loop input1

        mov temp, bx
        mov bx, 0
        mov cx, 4

        lea dx, msg2
        mov ah, 09h
        int 21h

        input2:
            shl bx, 4
            mov ah, 01h
            int 21h
            sub al, 30h
            cmp al, 9h
            jbe input21
            sub al, 07h
            input21:
                mov ah, 0h
                add bx, ax
        loop input2

        add bx, temp 
        
        lea dx, msg3
        mov ah, 09h
        int 21h

        jnc print2
        mov dl, 31h
        mov ah, 02h
        int 21h
        
        print2:
            mov cx, 4
            print: 
                rol bx, 4
                mov dl, bl
                and dl, 0fh
                add dl, 30h
                cmp dl, 39h
                jbe print1
                add dl, 07h
                print1:
                    mov ah, 02h
                    int 21h
            loop print
    .exit
end