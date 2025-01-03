/*
   This code assembly  modifies a string by 
   adjusting the ASCII values of its characters
   based on their index. (Check line 62).
   Once all characters are processed, the 
   program prints the modified string and a 
   newline, then exits. (newline must be created) 
*/

    .global _start

_start:

   ldr r1, =string
   mov r3, #0          @ count the number char in string


loop:
   ldrb r4, [r1]       @ load part of r1, a char into r4 and updates
                       
   cmp r4, #0          @ if r4 is not a null, continue to loop
   beq done

   and r5, r3, #1      @ compare Index value to even/odd
   cmp r5, #0
 
   ble even

   sub r4, r4, #5      @ odd, subtract ascii character 
   strb r4, [r1]       @ store part of r4, a char back into r1,a string
   
   b counter 

even:
   add r4, r4, #5      @ even, add ascii character
   strb r4, [r1]       @ save it here

counter:
   add r3, r3, #1      @update counter
   
   add r1, r1, #1      @update to next character
  
   b loop

done:
   mov r0, #1          @ if done, print out string
   ldr r1, =string      
   mov r2, r3          @ use counter to print full string 
   mov r7, #4
   swi 0


   mov r0, #1          @AND print out new line
   ldr r1, =newline
   mov r2, #1
   mov r7, #4
   swi 0             

end:
    mov r7, #1
    swi 0

    .data
         /* indices              */
string:  /* 01234567890123456789 */
    .asciz "Kwjlmfhrdsb%atm%azi3"

newline:
    .asciz "\n"