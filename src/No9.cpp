#include <iostream>
#include <cmath>
using namespace std;

int main() {
    double m = 0;
    double n = 0;
    double a = 0;
    double b = 0;
    double c = 0;
    while(abs(a)-trunc(abs(a)) != 0 || a<=0 || b<=0 || c<=0){
        m++;
        n = (1000 - 2*m*m)/(2*m);
        a = (m*m) - (n*n);
        b = 2*m*n;
        c = (m*m) + (n*n);
    }
    cout << m << endl;
    cout << a << " " << b << " " << c << " " << (int)(a*b*c) << endl;
    return 0;
}