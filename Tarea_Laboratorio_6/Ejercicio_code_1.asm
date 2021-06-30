; Christian Contreras 00149618

        org     100h

        section .data

        string  DB      'Christian Alexander Contreras Bolanos'
        msg1	DB	'Ingresa la contrasena: ', '$'
        frase 	times 	20  	db	' '
        msg2 	DB 	'BIENVENIDO SIUU', '$'
        msg3    DB      'La contrasena is incorrecta', '$'
        msg4    DB      'Arqui01'
         
        section .text
        
        mov     DX, msg1
        call    MostrarFrase
        mov     byte[300h], frase
        call    LeerCadena

ComprobandoContra:
        xor     DI, DI
LOOP:
        cmp     DI, 7d
        je      MensajeBienvenido
        mov     BL, [msg4 + DI]
        cmp     BL, byte[300h + DI]
        je      ContraigualCadena
        jmp     FailContra
        jmp     LOOP

MensajeBienvenido:
        mov     DX, msg2
        call    MostrarFrase
        jmp     exit

ContraigualCadena:
        inc     DI
        jmp     LOOP

FailContra:
        mov     DX, msg3
        call    MostrarFrase
        jmp     Exit

MostrarFrase:
        mov     AH, 09
        int     21h
        ret

EsperarTecla:
        mov     AH, 01h         
        int     21h
        ret

LeerCadena:
        xor     SI, SI          ; SI = 0   
while:  
        call    EsperarTecla    ; retorna un caracter en AL
        cmp     AL, 0x0D        ; comparar AL con caracter EnterKey
        je      exit            ; si AL == EnterKey, saltar a exit
        mov     [300h+SI], AL   ; guardar caracter en memoria
        inc     SI              ; SI++
        jmp     while           ; saltar a while
exit:
	mov 	byte [300h+SI], "$"	; agregar $ al final de la cadena
        ret
Exit:
        int     20h
EscribirCadena:
	mov 	AH, 09h
	mov 	DX, 300h	; dirección inicial de nuestra cadena
	int 	21h
	ret