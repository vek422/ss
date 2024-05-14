
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

// Function prototypes
int expr();
int term();
int factor();

char *input;
char lookahead;

// Function to advance to the next character in the input string
void next() {
    lookahead = *input++;
}

// Function to check if the lookahead character matches the expected character
void match(char expected) {
    if (lookahead == expected) {
        next();
    } else {
        fprintf(stderr, "Syntax Error: Unexpected character '%c'\n", lookahead);
        exit(1);
    }
}

// Recursive descent parser for the expression grammar
int expr() {
    int result = term();
    while (lookahead == '+' || lookahead == '-') {
        if (lookahead == '+') {
            match('+');
            result += term();
        } else if (lookahead == '-') {
            match('-');
            result -= term();
        }
    }
    return result;
}

// Recursive descent parser for the term grammar
int term() {
    int result = factor();
    while (lookahead == '*' || lookahead == '/') {
        if (lookahead == '*') {
            match('*');
            result *= factor();
        } else if (lookahead == '/') {
            match('/');
            int divisor = factor();
            if (divisor != 0) {
                result /= divisor;
            } else {
                fprintf(stderr, "Syntax Error: Division by zero\n");
                exit(1);
            }
        }
    }
    return result;
}

// Recursive descent parser for the factor grammar
int factor() {
    int result;
    if (isdigit(lookahead)) {
        result = lookahead - '0';
        match(lookahead);
    } else if (lookahead == '(') {
        match('(');
        result = expr();
        match(')');
    } else {
        fprintf(stderr, "Syntax Error: Unexpected character '%c'\n", lookahead);
        exit(1);
    }
    return result;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s \"expression\"\n", argv[0]);
        return 1;
    }

    // Initialize input pointer and lookahead character
    input = argv[1];
    next();

    // Parse the expression and print the result
    int result = expr();
    printf("Result: %d\n", result);

    // Check if there are extra characters in the input
    if (lookahead != '\0') {
        fprintf(stderr, "Syntax Error: Extra characters after end of expression\n");
        return 1;
    }

    return 0;
}
