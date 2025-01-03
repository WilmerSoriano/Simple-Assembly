/*
   This code is demonstrating a loop that calculates the 
   sum of all odd numbers less than 11.
   It introduces fundamental concepts like loops
   and conditional branching.
*/
   .global _start

_start:
   mov r0, #0
   mov r1, #1

 loop:
   cmp r1, #11    @ compare
   bge _exit      @ Branch to exit if 1 greater than or Equal 11

   and r2, r1, #1 @  Bitwise even or odd USING r1 and #1, store in r2

   cmp r2, #1     @ r2 compares with odd(1)
   bge else       @ Branch to else if r2 is greater or eqaul to 1

   add r1,r1,#1   @ it's not odd, keep adding
   b loop         @ branch back to loop

else:
   add r0, r1, r0 @ add all odd numbers here
   add r1,r1,#1   @ and keep adding
   b loop

_exit:
   mov r7, #1
   swi 0