; Symbole für den Linker und Präprozessor

%define SYS_EXIT        1
%define EXIT_SUCCESS    0

; Funktions header
global _start



; Programm start
_start:
    
    ; main aufrufen
    call main

    ; Den Kernel um Schließung des Programms
    ; anfragen
    mov     ebx, eax
    mov     eax, SYS_EXIT
    int     0x80                ; Interrupt Vektor 128 von Linux aufrufen


main:
    
    push    epb
    mov     ebp, esp
    sub     esp, 8              ; 8-bytes für Varaible a und b
    

    mov     DWORD [ebp - 4], 33
    mov     DWORD [ebp - 8], 22
    

    push    eax
    push    ebx
    CALL    stack_function_parameter_add
   
    POP     EBP
    RET

stack_function_parameter_add:
    push    ebp                 ; Base Pointer speichern
    mov     ebp, esp            ; Base Pointer updaten
    
    mov     edi, [ebp - 4]
    mov     esi, [ebp - 8]

    add     edi, esi
    mov     eax, edi
    

    mov     eax, [ebp - 4]      ; die libc API gibt Werte über EAX wieder

    pop     ebp
    ret     
