section .data
    prompt         db "Ingresa un numero para verificar: ", 0
    len_prompt     equ $-prompt
    msg_es_primo   db "El numero es primo.", 10, 0
    len_es_primo   equ $-msg_es_primo
    msg_no_es_primo db "El numero no es primo.", 10, 0
    len_no_es_primo equ $-msg_no_es_primo

section .text
    global _start

    ; Declaramos las funciones que usaremos de los otros archivos
    extern es_primo
    extern scan_int

_start:
    ; 1. Mostrar el mensaje de bienvenida
    mov  eax, 4
    mov  ebx, 1
    mov  ecx, prompt
    mov  edx, len_prompt
    int  0x80

    ; 2. Leer el número del usuario (usando la función de io.asm)
    call scan_int

    ; 3. Llamar a la función para verificar si es primo (de primo.asm)
    call es_primo

    ; 4. Comparar el resultado y mostrar el mensaje
    cmp  eax, 1
    je   imprimir_es_primo

imprimir_no_es_primo:
    mov  eax, 4
    mov  ebx, 1
    mov  ecx, msg_no_es_primo
    mov  edx, len_no_es_primo
    int  0x80
    jmp  salir

imprimir_es_primo:
    mov  eax, 4
    mov  ebx, 1
    mov  ecx, msg_es_primo
    mov  edx, len_es_primo
    int  0x80

salir:
    ; 5. Terminar el programa
    mov  eax, 1
    xor  ebx, ebx
    int  0x80