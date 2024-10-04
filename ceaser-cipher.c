/*
 * =====================================================================================
 *
 *       Filename:  ceaser-cipher.c
 *
 *    Description:  I am writing code for the ceaser cipher in C to prep for other ciphers 
 *
 *        Version:  1.0
 *        Created:  10/04/24 11:37:40
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Asimanye Dudumayo (VIMpirate), 
 *   Organization:  https://adudumayo.github.io/ 
 *
 * =====================================================================================
 */
#include <stdlib.h>
#include <stdio.h>

void cipher(int rotNum) {
    printf("Your rot number is %d\n", rotNum);
}

int main() {
    int rotNumber = 12;
    printf("Enter the rot number: ");
    //scanf("%d", &rotNumber);
    cipher(rotNumber);

    int messageSize = 10;
    char *message = (char *)malloc(messageSize * sizeof(char));

    if (message == NULL) {
        printf("malloc problem");
        return 1;
    }
    
    printf("Enter your message below: \n");
    int c;
    int idx = 0;

    while ((c = getchar()) != '\n' && c != EOF) {
        if (idx == messageSize -1) {
            messageSize *= 2;
            message = (char *)realloc(message, messageSize * sizeof(char));
            
            if (message == NULL) {
                printf("realloc problem");
                free(message);
                return 1;
            }
        }
        message[idx++] = (char)c;
    }
    message[idx] = '\0';

    for (int i = 0; i < idx; i++) {
        printf("%c", message[i]);
    }
    
    free(message);

    return 0;

}
