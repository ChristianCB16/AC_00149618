; Christian Contreras 00149618

        org     100h

        section .datas
        string  DB 'Christian Alexander Contreras Bolanos'

        section .text
 
        MOV SI, 0d
        MOV DI, 0d
        MOV DH, 10
        MOV DL, 20
        MOV BL, 1d
        MOV byte [200h],9d
        MOV byte [201h],18d
        MOV byte[202h],27d
        MOV byte[203h],34d 

        call text_mode
PRINCIPAL_LOOP:
        call move_cursor 
        MOV CL, [string+SI] 
        call write_character
        INC SI 
        INC DL
        CMP BL,[200h+DI]
        je jump_row
        INC BL
        JMP PRINCIPAL_LOOP

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
        jmp PRINCIPAL_LOOP

wait_key:
        MOV AH, 00h
        INT 16h
exit:
        int 20h