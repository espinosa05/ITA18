; /* C Programm */
; int main() {
;   int a, b;
;   a = 33;
;   b = 22;
;   return stack_function_parameter_add(a, b); 
;}
;

%DEFINE SYS_EXIT        1
%DEFINE EXIT_SUCCESS    0

; FUNKTIONS HEADER
GLOBAL _start
_start:

    CALL    main

    MOV     EBX, EAX        ; Return Code
    MOV     EAX, SYS_EXIT   ; Kernel Funktion   
    INT     0x80            ; Linux Kernel Aufruf


main:

    PUSH    EBP             
    MOV     EBP, ESP        ; Neuer stack frame
    SUB     ESP, 8          ; 8 Bytes reservieren


    MOV     DWORD [EBP - 4], 33 ; die ersten 4 bytes mit 32 beschreiben
    MOV     DWORD [EBP - 8], 22 ; die zweiten 4 bytes mit 22 beschreiben

    ; Parameter übergabe (CDECL-Konvention)
    ; Equivalenter C-code:
    ; stack_function_parameter_add(a, b);
    
    PUSH    DWORD [EBP - 4] 
    PUSH    DWORD [EBP - 8] 
    CALL    stack_function_parameter_add

    POP     EBP
    RET
 
; funktions header
GLOBAL stack_function_parameter_add
stack_function_parameter_add:
    PUSH    EBP
    MOV     ESP, EBP

    MOV     EDI, DWORD [EBP - 4]
    MOV     ESI, DWORD [EBP - 8]

    ADD     EDI, ESI
    MOV     EAX, EDI

    POP     EBP
    RET
