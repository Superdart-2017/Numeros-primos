#include <stdio.h>
#include <stdbool.h>
#include <math.h>  

/*
*@brief función que determina si un número es primo o no
*@param num es el número a determinar si es primo 
*@return true si es primo, false si no lo es
*/

bool es_primo(int num) {
    
    if (num <= 1) {
        return false;
    }

    if (num == 2) {
        return true;
    }
    
    if (num % 2 == 0) {
        return false;
    }
    
    int limite = sqrt(num);
    for (int i = 3; i <= limite; i = i + 2) {
        
        if (num % i == 0) {
            return false;
        }
    }
    
    return true;
}


int main(){
    printf("Hola que hace");
    int num = 29;
    es_primo(29);
    if(es_primo(29)){
        printf("\nEl número %d es primo\n", num);
    } else {
        printf("\nEl número %d no es primo\n", num);
    }
    return 0;
}