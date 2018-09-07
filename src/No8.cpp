#include <iostream>
#include <regex>

using namespace std;

int64_t subSum(int64_t * p, int n);

int main() {
    int64_t list [1000];
    char aux;
    for (int i = 0; i < 1000; ++i) {
        cin >> aux;
        list[i] = aux - '0';
    }
    cout << subSum(list, 13) << endl;
    return 0;
}

int64_t subSum(int64_t * p, int n){
    int64_t MAX = 1;
    int64_t aux = 1;
    for (int i = 0; i < n; ++i) {
        aux *= *(p + i);
    }
    if(aux > MAX){
        MAX = aux;
    }
    aux = 1;
    for (int i = 1; i < 1000 - n+1; ++i) {
        if(*(p + (i - 1)) < *(p + (i + n - 1))){
            for (int j = i; j < i + n; ++j) {
                aux *= *(p + j);
            }
            if(aux > MAX){
                MAX = aux;
            }
            aux = 1;
        }
    }

    return MAX;
}