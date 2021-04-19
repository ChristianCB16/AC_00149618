        org     100h


        section .text

;       Primera parte de la guía 2 de laboratorio. 

        mov     byte [200h], "C"  ; Christian
        mov     byte [201h], "A"  ; Alexander
        mov     byte [202h], "C"  ; Contreras
        mov     byte [203h], "B"  ; Bolaños


;       Segunda parte de la guía 2 de laboratorio. 

        
        mov     [200h], AL ; Direccionamiento directo o absoluto.
      
 
        mov     BL, [201h] ; Direccionamiento Indirecto por registro. 
        mov     CL, BL   

 
        mov     BX, [200h] ; Direccionamiento Indirecto Base + Indice
        mov     SI, [002h]
        mov     DL, [BX + SI]

 
        mov     DI, [BX + 003h] ; Direccionamineto Relativo por registro.

        int     20h         