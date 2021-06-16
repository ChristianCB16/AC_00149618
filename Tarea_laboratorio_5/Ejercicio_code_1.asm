; Christian Contreras 00149618

        org     100h

        section .text

        ;Limpiando Registros
        xor AX, AX
        xor SI, SI
        xor BX, BX
        xor CX, CX
        xor DX, DX
        xor DI, DI

        ;inicializando 
        MOV SI, 0d
        MOV DI, 0d
        MOV BL, 1d

        MOV DH, 10
        MOV DL, 20

        ; Tamano de los Nombres
        MOV byte [200h],9d
        MOV byte [201h],18d

        ; Tamano de los apellidos
        MOV byte[202h],27d
        MOV byte[203h],34d 


        call text_mode

; FUNCIONES 

LOOP:
        call move_cursor 
        MOV CL, [cadena+SI] 
        call write_character
        INC SI 
        INC DL
        CMP BL,[200h+DI]
        je jump_row
        INC BL
        JMP LOOP

text_mode: 
        MOV AH, 0h 
        MOV AL, 03h 
        INT 10h
        RET
        
move_cursor:
        MOV AH, 02h 
        MOV BH, 0h 
        INT 10h
        RET

write_character:
        MOV AH, 0Ah 
        MOV AL, CL 
        MOV BH, 0h 
        MOV CX, 1h 
        INT 10h
        RET
    
jump_row:
        CMP BL, 34d
        je  wait_key
        INC DH
        INC SI
        INC DI
        INC BL
        MOV DL,20
        jmp LOOP

wait_key:
        MOV AH, 00h
        INT 16h

exit:
        int 20h

section .data

cadena  DB 'Christian Alexander Contreras Bolanos'
