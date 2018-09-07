#include <iostream>
#include <cmath>

using namespace std;

int gp(int** p);

int main() {
    int *mat[20];
    for (int i = 0; i < 20; ++i) {
        mat[i] = new int[20];
        for (int j = 0; j < 20; ++j) {
            cin >> mat[i][j];
        }
    }
    cout << gp(mat) << endl;
    return 0;
}

int gp(int** p){
    int MAX = 0;
    int aux = 0;
    for (int i = 0; i < 20; ++i) {
        for (int j = 0; j < 20 - 4; ++j) {
            aux = p[i][j] * p[i][j + 1] * p[i][j + 2] * p[i][j + 3];
            if(aux > MAX){
                MAX = aux;
            }
        }
    }
    for (int i = 0; i < 20 - 4; ++i) {
        for (int j = 0; j < 20; ++j) {
            aux = p[i][j] * p[i + 1][j] * p[i + 2][j] * p[i + 3][j];
            if(aux > MAX){
                MAX = aux;
            }
        }
    }
    for (int i = 0; i < 20 - 4; ++i) {
        for (int j = 0; j < 20 - 4; ++j) {
            aux = p[i][j] * p[i + 1][j + 1] * p[i + 2][j + 2] * p[i + 3][j + 3];
            if(aux > MAX){
                MAX = aux;
            }
        }
    }
    for (int i = 3; i < 20; ++i) {
        for (int j = 0; j < 20 - 4; ++j) {
            aux = p[i][j] * p[i - 1][j + 1] * p[i - 2][j + 2] * p[i - 3][j + 3];
            if(aux > MAX){
                MAX = aux;
            }
        }
    }
    return MAX;
}
