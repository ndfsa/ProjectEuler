#include <iostream>
#include <cmath>

using namespace std;

int divisors(int64_t n);

void tNumbers(int64_t *p, int lim);

int main() {
    int lim = 100000;
    int64_t list[lim];
    tNumbers(list, lim);
    for (int i = 0; i < lim; ++i) {
        if (divisors(list[i]) > 500) {
            cout << "res :" << list[i] << endl;
            cout << "last :" << list[lim - 1] << endl;
            break;
        }
    }
    return 0;
}

int divisors(int64_t n) {
    int cont = 0;
    int64_t largest = 2;
//    cout << "1 ";
    for (int64_t i = 2; i < n / largest; ++i) {
        if (n % i == 0) {
            largest = i;
//            cout << i << " ";
            cont++;
            cont++;
        }
    }
//    cout << n << endl;
    return cont + 2;
}

void tNumbers(int64_t *p, int lim) {
    *p = 0;
    *(p + 1) = 1;
    for (int i = 2; i < lim; ++i) {
        *(p + i) = *(p + i - 1) + i;
    }
}
