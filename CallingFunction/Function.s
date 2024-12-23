/*
  Writing an assembly function to count last streak of
  of the given character.
*/

   .global shiftLeftBy2 
   .global countMatch

/* 
  Given the following: 
  r0 = arrayOfnum
  r1 = length_of_r0 
  r2 = randNum1
  r3 = randNum2
  Which are the passing parameters and
  By default r0 and up are reserve for parameters. 
*/

shiftLeftBy2:
   mov r4,#4            
   mul r1,r1,r4   @first find the total bit value   

   add r4,r4,#4   @making r4 a constant (8)
                  @for copying the third variable
   mov r6,r4      @counter skips the first two value

   b check

 loop:     
   ldr r8,[r0,r4] @load third variable
   str r8,[r0]    @store into first index
  
   add r0,r0,#4   
   add r6,r6,#4

 check:            @check counter with total bit
   cmp r6,r1 
 bne loop

 newValue:        @addes two new value to array
   str r2,[r0]
   add r0,r0,#4
   str r3,[r0]
bx lr

/*r0,=left , r1,=right */
countMatch:
   mov r4,#0
   ldrb r2,[r0]   @load the characters 
   ldrb r3,[r1]
   b next

 match:
   cmp r2,r3         @if the same char,add
   addeq r4,r4,#1

   cmp r2,r3         @if not go to end
   bne end
   
   add r0,r0,#1      @assuming it did not branch
   add r1,r1,#1      @get next char and load them

   ldrb r2,[r0]
   ldrb r3,[r1]

 next:              @compare to null if not..
   cmp r2,#0
 bne match

end:             @return r0
   mov r0,r4
bx lr   
