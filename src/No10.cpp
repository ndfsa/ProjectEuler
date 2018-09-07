#include <iostream>
#include <cmath>

using namespace std;

void genSieve(bool *n, int size);

int main() {
    int lim = 1420*1420;
    bool sieve[lim];
    genSieve(sieve, lim);
    int64_t sum = 0;
    for (int64_t i = 0; i <= 2000000; ++i) {
        if(!sieve[i]){
            sum += i;
        }
    }
    cout << sum << endl;
    return 0;
}

void genSieve(bool *n, int size) {
    *n = true;
    *(n + 1) = true;
    for (int i = 2; i <= (int)sqrt(size); ++i) {
        if (!*(n + i)) {
            for (int j = i; j * i <= size; ++j) {
                *(n + (i * j)) = true;
            }
        }
    }
}