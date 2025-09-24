section .text
    global es_primo

es_primo:
    push ebp
    mov  ebp, esp
    mov  edi, eax
    cmp  edi, 1
    jle  .no_es_primo
    cmp  edi, 2
    je   .es_primo
    test edi, 1
    jz   .no_es_primo
    mov  ecx, 3
.loop_inicio:
    mov  eax, ecx
    mul  ecx
    cmp  eax, edi
    jg   .es_primo
    mov  eax, edi
    xor  edx, edx
    div  ecx
    test edx, edx
    jz   .no_es_primo
    add  ecx, 2
    jmp  .loop_inicio
.es_primo:
    mov  eax, 1
    jmp  .fin_funcion
.no_es_primo:
    mov  eax, 0
.fin_funcion:
    mov  esp, ebp
    pop  ebp
    ret