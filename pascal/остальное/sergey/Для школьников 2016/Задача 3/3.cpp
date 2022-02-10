#include <iostream>
#include <fstream>
using namespace std;
int main()
 { long a, b=0;
   ifstream F;
   F.open("IN.txt",ios::in);
   if (F) {
     while (!F.eof())
     { F>>a;
       if (!F.eof()) b=b^a; } } else cout<<"Файл не найден!"<<endl;
   F.close();
   ofstream f;
   f.open("OUT.txt");
   f<<b;
   f.close(); return 0; }
