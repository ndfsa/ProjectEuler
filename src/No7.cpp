#include <iostream>
#include <cmath>

using namespace std;

void genSieve(bool* n, int size) {
    for (int i = 2; i <= (int)round(sqrt(size)); ++i) {
        if(!*(n + i)){
            for (int j = i; j * i <= size; ++j) {
                *(n + (i*j)) = true;
            }
        }
    }
}

int main() {
    const int size = 1100*1100;
    bool sieve[size] = { true, true };
    genSieve(sieve, size);
//    for (int k = 0; k < 1210000; ++k) {
//        if(!crib[k]){
//            cout << k << endl;
//        }
//    }
    int cont = 0;
    for (int i = 2; i < 1210000; ++i) {
        if(!sieve[i]){
            cont++;
            if(cont == 10001){
                cout <<"res (104743)" <<i << endl;
                break;
            }
        }
    }
    return 0;
}