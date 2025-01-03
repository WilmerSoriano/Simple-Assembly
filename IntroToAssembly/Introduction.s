/*
   This code provides a simplified view of ARM assembly. 
   For those new to lower-level programming, it serves as 
   a good introduction to the fundamental concepts of ARM 
   instructions, such as arithmetic operations, 
   bit manipulation, and system calls.

   It is recommended to know how Bytes and bit work in 
   binary, and hexadecimal form.
*/

.global _start    @Declares _start as a global symbol, often used as the entry point in ARM assembly programs.

_start:

   mov R1,#13     @These move immediate values into registers.
   mov R2,#0b110  @R1 gets 13 (decimal), and R2 gets 6 (binary 0b110).

   sub R3, R1, R2 @Subtracts R2 (6) from R1 (13) and stores the result (7) in R3.

   mov R4,#0x14   @Loads 20 (0x14 in hexadecimal) into R4
   mul R4, R3, R4 @Multiply 140=7x20

   LSR R0, R4, #2 @Bit shift by 2 because 140/4 = 35
       
_exit:            @Exit system call
    mov r7, #1    @r7 = 1 indicates the exit syscall.
    swi 0         @Prepares and executes a software interrupt (swi) to terminate the program.
