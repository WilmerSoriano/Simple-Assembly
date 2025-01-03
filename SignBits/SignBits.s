/*
    Using bits to manipulate
    the variable found in the function.

    Summary:
    The following program check if the value is
    sign(negative or positive), check both values found in
    small and half (8 bit and 16 bit), and give the added
    result.
*/

    .global _start

_start:
    mov r0,#0
    ldr r1, len    
    ldr r2,=small      
    ldr r3,=half   
    mov r4,#0        @our counter & index for byte
    mov r8,#0        @hword worth 2bytes

loop: 
   cmp r4,r1      
   beq end

   ldrb r5,[r2,r4]   @stores the index value for both  
   ldrh r6,[r3,r8]

   add r7,r5,r6      @Adds both of those values
   tst r7,#1         @checks the MSB, if its negative skip it
   beq adding

   cmp r7,r0         @compares the new added value
   bgt max           @to old added value

   b adding

max:                 @if new value is bigger
   mov r0,r7         @save it on r0 

adding:
   add r4,r4,#1  
   add r8,r8,#2
   b loop


end:
    mov r7, #1
    swi 0

len:             @ literal, not a variable
    .word 5      @ use with something like
                 @   ldr r1, len

    .data

small:
    .byte  -3, 18,  5, -21, -7
half:
    .hword -9, -6, 14,  33, 30
