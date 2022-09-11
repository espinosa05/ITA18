/*
 * Copyright (c) 2022 Francisco Fischer <francisco-fischer@gmx.de>
 * */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

/* eigener Header */
#include <callingconvetion.h>

int main(int argc, char **argc, char **envp)
{
    uint32_t stack_variable_a;      /* Uninitialisiert */
    uint32_t stack_variable_b = 43; /* Initialisiert */
    uint32_t ergebnis;

    stack_varaible_a = 23;

    ergebnis = stack_parameter_addition( stack_variable_a, stack_variable_b);    
    
    return EXIT_SUCCESS;
}
