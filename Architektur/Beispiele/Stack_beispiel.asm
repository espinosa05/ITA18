
%DEFINE SYS_EXIT        1
%DEFINE EXIT_SUCCESS    0

; FUNKTIONS HEADER
GLOBAL _START



_START:
    
    CALL MAIN

    MOV     EBX, EAX
    MOV     EAX, SYS_EXIT
    INT     0x80                


MAIN:
    
    PUSH    EBP
    MOV     EBP, ESP
    SUB     ESP, 8              
    

    MOV     DWORD [EBP - 4], 33
    MOV     DWORD [EBP - 8], 22
    
    PUSH    DWORD [EBP - 4]
    PUSH    DWORD [EBP - 8]
    CALL    STACK_FUNCTION_PARAMETER_ADD
   
    POP     EBP
    RET

STACK_FUNCTION_PARAMETER_ADD:
    PUSH    EBP                 
    MOV     EBP, ESP            
    
    MOV     EDI, [EBP - 4]
    MOV     ESI, [EBP - 8]

    ADD     EDI, ESI
    MOV     EAX, EDI
    

    MOV     EAX, [EBP - 4]      

    POP     EBP
    RET     
