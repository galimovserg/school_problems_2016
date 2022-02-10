#include <iostream>
#include <fstream>
using namespace std;
int main()
{ ifstream F;
  long i=0, n;
  long *a= new long [n];
  F.open("IN.txt",ios::in);
  if (F) { F>>n;
             while (!F.eof()) F>>a[i++]; } else cout<<"Файл не найден!"<<endl;
  F.close();
  for(i=0; i<n; i++) a[a[i]%(n+1)-1]+=(n+1);  // собственно, само решение
  ofstream f;
  f.open("OUT.txt"); 
  for(i=0; i<n; i++)  if ((int)a[i]/(n+1) == 1) f<<(i+1)<<" ";
  f.close();
  delete[]a; return 0; }