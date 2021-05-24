; Hacer un programa utilizando una o más subrutinas donde, 
; con la ayuda de un arreglo de elementos numéricos con 
; tamaño de 1 byte, se separe los números pares e impares.

        org     100h

        section .text

        mov     BP, arrByte     ; BP punta a arrByrte
        xor     SI, SI          ; SI = 0
        xor     AX, AX
        call    StoreArr
        int     20h

        section .data

arrByte db      01,02,03,04,05,06,07,08,09,10 ; Arreglo de 10 numeros

; FUNCIONES 

StoreArr:
while:
        mov CL, 2d              ; Muevo a Cl el divisor 
        mov BL, 0d              ; Necesario inicializar Bl en 0 para comparar
        mov AL, [BP+SI]         ; Paso el numero que este en esa posicion a Al
        div CL                  ; Se divide AL entre CL
        cmp AH, BL              ; Compara el residuo con 0
        jz nPares               ; Salta a la funcion nPares si la comparacion es cierta o igual a 0
        ja nImpares             ; Salta a la funcion nImpares si la comparacion no es cierto o la comparacion no es igual a 0 
finish:    
        ret 
nPares:
        mov     BX, 300h        ; BX = espacio donde guardaremos los impares/pares
        mov     AL, [BP+SI]     ; Al = puntero a arreglo + SI      
        cmp     AL, 10d
        mov     [BX+SI], AL     
        inc     SI  
        je      finish                       
        jmp     StoreArr        
nImpares: 
        mov     BX, 320h       
        mov     AL, [BP+SI]     
        mov     [BX+SI], AL     
        inc     SI              
        jmp     StoreArr        
