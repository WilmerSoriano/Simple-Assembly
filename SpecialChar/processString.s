/*
   Summary:
   This Assembly code job is to count any special
   character found in a string. 
*/
   .global countChar
   .global sumDigits

countChar:
   @r0= the string
   @r1= the char
   mov r3,#0

count: 
   ldrb r2,[r0]     @load the first char

   cmp r2, #0       @is it null?
   beq end

   add r3,r3,#1     @no, add to counter
   add r0,r0,#1     @add to register

 b count

end:                 @ends the program 
   mov r0,r3         @only r0 returns
   bx lr



sumDigits:
   @r0= the string
   ldrb r2,[r0]
   mov r3,#0

check:
   cmp r2,#0         @is it null? 
   beq done
   
   cmp r2,#47        @is the ASCII val less than?
   ble next

   cmp r2,#58        @is the ASCII val greater than?
   bge next
  
   sub r2,r2,#48     @if all false, this must be a number
   add r3,r3,r2      @add this value to our increment

   add r0,r0,#1     
   ldrb r2,[r0]

   b check

next:               @the ASCII val is not a digit
   add r0,r0,#1
   ldrb r2,[r0]
   b check          @go to the next index
 
done:
   mov r0,r3
   bx lr