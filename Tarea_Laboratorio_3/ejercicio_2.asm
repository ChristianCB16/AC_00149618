org     100h


    section .text
        
        mov     ch, 00
        mov     cl, [0200h]
        mov     ah, 00
        mov     al, 01
        cmp     cl, 00
        jz salto1
condic  mul ecx
        loop condic
salto1  mov [20Bh], eax 


    int     20h         