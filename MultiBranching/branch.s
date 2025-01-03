/*
   The assembly code contains 2 branches.
   Using global, and bx lr which end the branch
   allowing it to return to the C program. The assembly 
   can determine when it is being callled.
*/

   .global countLastStreak
   .global shiftRightBy5

/*r0 = address*/
countLastStreak:
   mov r1,#0       @counts all X's
   ldrb r2,[r0]
   b return

check:
   add r1,r1,#1    @assumes must be x

   cmp r2,#'X'     @compare char to X
   beq next
   
   mov r1,#0       @if not X reset

next:
   add r0,r0,#1    @move to next char
   ldrb r2,[r0]

return:
   cmp r2, #0      @checks for null
   bne check
   mov r0,r1

bx lr




/*r0= string input,  r1=100 space out*/ 
shiftRightBy5:
   ldrb r2,[r0]
   ldrb r4,[r1]
   mov r5,#0      @ array index

addSpace:
   mov r4,#32     @add space to empty output
   strb r4,[r1]

   add r1,r1,#1   @next index and
   add r5,r5,#1   @count the num of space

   cmp r5,#5      @keeping track of 5 space
   bne addSpace

addChar:
   strb r2,[r1]   @store a char into output

   add r0,r0,#1   @next char 
   add r1,r1,#1   @next free space

   ldrb r2,[r0]   @load next char from input

   cmp r2,#0      @have we hit a null?
   bne addChar 

 bx lr
