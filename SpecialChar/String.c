/*
    The assembly function counts the number of occurrences 
    of the given characte:
    
    For string 1 (a): Count ':', sum digits.
    For string 2 (b): Count 'X', 'o', sum digits.
    For string 3 (c): Count 's', sum digits.
*/

#include <stdio.h>
#include <inttypes.h>

int32_t countChar(char* s, char c);
int32_t sumDigits(char* s);

void processString(char s[], char c);


int main(void) {
    char  a[] = "Binary representations only use 10 values. :-)";
    char* b   = "Programmer: A machine that turns coffee into code.";
        // from https://betterprogramming.pub/101-funny-programmer-quotes-76c7f335b92d
    char c[]  = "4 score and 7 years ago our 4fathers brought 4th on this continent a new nation.";

    processString(a, ':');
    processString(b, 'X');
    processString(b, 'o');
    processString(c, 's');
}


void processString(char s[], char c) {
    int32_t count;  // value returned by countChar
    int32_t sum;    // value returned by sumDigits

    count = countChar(s, c);
    sum = sumDigits(s);
    printf("%c count = %"PRIu32", digit sum = %2"PRIu32"\n", c, count, sum);
}
