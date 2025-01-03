/*
    Hidden message found in s1, s2, and s3

    Summary:
    Using the ASCII table, manipulate the variables
    and converted into a string.
    NOTE: there is no print system so I create one

*/

    .global _start

_start:
    ldr r1, =s3
    bl sum
    bl convert
    bl print

    ldr r1, =s2
    bl sum
    bl convert
    bl print

    ldr r1, =s1
    bl sum
    bl convert
    bl print


    b end

               @Entering the SUM
sum:
   mov r2,#0
   ldrb r3, [r1]
loop:
   
   cmp r3,#0      @Is it the end of string?
   beq done

   cmp r3,#','    @Did we hit something else other then a number?
   beq next
   
   cmp r3,#' '    @Is there nothing but space?
   beq next

   sub r3,r3,#48  @Subtract the ascii value to get number

   add r2,r2,r3   @Save and add up all the value inside the list
   add r1,r1,#1   @continue to next index
   ldrb r3,[r1]
   b loop

done:
   bx lr          
next:
  add r1,r1,#1      @skip this roadblock ascii value
  ldrb r3, [r1]
  b loop


              @Entering the CONVERT
convert:
mov r6, #48

if:
   cmp r2,#10
   blt one

   mov r4,#1         @The iteration
   sub r2,r2,#10     @The total value subtracted by 10

for:

   cmp r2,#10        @compare if we have reached the end of the loop
   blt com

   add r4,r4,#1      @Adds iteration
   sub r2,r2,#10     @Keep subtracting until we get a single value

   b for
one:
   mov r4,#0
   add r4,r6,r4
   add r2,r6,r2
   strb r4,[r1,#1]
   strb r2,[r1,#2]
   b finish
com:                 @turn it back to string and store it into string array

  add r4,r6,r4   
  add r2,r6,r2   

  strb r4,[r1,#1]
  strb r2,[r1,#2]

finish:
     bx lr

              @Entering the PRINT
print:
   mov r0,#1
   mov r2,#1
   mov r7,#4 
   swi 0

   mov r0,#2
   ldr r6,=out
   mov r2,#4
   mov r7,#4
   swi 0

bx lr

end:
    mov r7, #1
    swi 0


    .data
s1:
    .asciz "1, 2, 3, 4, 5"

s2:
    .asciz "9, 0, 0,  6,0, 8,  7"

s3:
    .asciz "2, 4"


out:     @ should replace A and Z with digits to print
    .asciz "AZ\n"

