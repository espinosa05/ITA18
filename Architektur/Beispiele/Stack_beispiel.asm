; /* C Programm */
; int main() {
;   int a, b;
;   a = 33;
;   b = 22;
;   return STACK_FUNCTION_PARAMETER_ADD(a, b); 
;}
;

%DEFINE SYS_EXIT        1
%DEFINE EXIT_SUCCESS    0

; FUNKTIONS HEADER
GLOBAL _START



_START:

    CALL MAIN

    MOV     EBX, EAX        ; Return Code
    MOV     EAX, SYS_EXIT   ; Kernel Funktion   
    INT     0x80            ; Linux Kernel Aufruf


MAIN:

    PUSH    EBP             
    MOV     EBP, ESP        ; Neuer stack frame
    SUB     ESP, 8          ; 8 Bytes reservieren


    MOV     DWORD [EBP - 4], 33 ; die ersten 4 bytes mit 32 beschreiben
    MOV     DWORD [EBP - 8], 22 ; die zweiten 4 bytes mit 22 beschreiben

    ; Parameter übergabe (CDECL-Konvention)
    ; Equivalenter C-code:
    ; STACK_FUNCTION_PARAMETER_ADD(a, b);
    
    PUSH    DWORD [EBP - 4] 
    PUSH    DWORD [EBP - 8] 
    CALL    STACK_FUNCTION_PARAMETER_ADD

    POP     EBP
    RET

STACK_FUNCTION_PARAMETER_ADD:
    PUSH    EBP
    MOV     ESP, EBP

    MOV     EDI, [EBP - 4]
    MOV     ESI, [EBP - 8]

    ADD     EDI, ESI
    MOV     EAX, EDI

    POP     EBP
    RET
