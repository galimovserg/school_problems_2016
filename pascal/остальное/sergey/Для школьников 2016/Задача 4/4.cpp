#include <iostream>
#include <fstream>
using namespace std;
int a[31], b[30], i=0, j, n, m, s, count=0;
ifstream F;
fstream f;
int main()
{ F.open("IN.txt",ios::in);
  f.open("OUT.txt", ios::out);
  if (F) { F>>n;
             while (!F.eof()) F>>b[i++]; } else cout<<"File not found!"<<endl;
  F.close();
 f<<endl;    //оставляем место в файле для записи кол-ва вариантов сумм
  for(m=1; m<n; m++)
    { for(i=0; i<=m; i++) a[i]=i;           //первоначальное сочетание в группе
      for( ; i>0; )
        { i=m; s=0;
          for(j=1; j<=m; j++) s+=b[a[j]-1]; //подсчёт суммы
          if (s==0) { f<<endl<<endl; //сумма = 0, - записываем вариант в файл
                            count++;
                            for(j=1; j<=m; j++) f<<b[a[j]-1]<<"  "; }
          while (a[i]==n-m+i) i--;  //ищем элемент для очередного изменения
 //(в столбце слева)
          a[i]++;
          for(j=i+1; j<=m; j++) a[j]=a[j-1]+1; } }    //изменяем правую часть
 //сочетания
  f.seekg(0);
  f<<count;     //записываем количество сумм в начало файла
  f.close(); return 0; }
