org     100h


    section .text
    ; Carnet 00149518 
    ; sumatoria = 29 (1D) promedio = 3.625 (A3)  
    mov     byte [200h], 0
    mov     byte [210h], 0
    mov     byte [220h], 1
    mov     byte [230h], 4
    mov     byte [240h], 9
    mov     byte [250h], 6
    mov     byte [260h], 1
    mov     byte [270h], 8

    XOR SI, SI 
    XOR DI, DI 
    XOR AX, AX 
    MOV AX, 0d 
    MOV BX, 0d 
    MOV CX, 8d 
    call iteracion_sumatoria
    call promedio

iteracion_sumatoria:
    ADD BX, [200h+10d]
    LOOP iteracion_sumatoria 
    ret

promedio:
    MOV AX, BX
    MOV CX, 8d
    DIV CX;
    MOV [20Ah], AL
    ret
   
    int     20h    