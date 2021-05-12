org     100h


    section .text
    ; Carnet 00149518 
    ; sumatoria = 29 (1D) promedio = 3.625 (A3)  
    mov     byte [200h], 0
    mov     byte [201h], 0
    mov     byte [202h], 1
    mov     byte [203h], 4
    mov     byte [204h], 9
    mov     byte [205h], 6
    mov     byte [206h], 1
    mov     byte [207h], 8

    XOR SI, SI 
    XOR DI, DI 
    XOR AX, AX 
    MOV AX, 0d 
    MOV BX, 0d 
    MOV CX, 8d 
    call iteracion_sumatoria
    call promedio

iteracion_sumatoria:
    ADD BX, [200h+SI]
    INC SI 
    LOOP iteracion_sumatoria 
    ret

promedio:
    MOV AX, BX
    MOV CX, 8d
    DIV CX;
    MOV [20Ah], AL
    ret
   
    int     20h    