#include <iostream>
#include <conio.h>
#include <stdio.h>
#include <cstring>
#include <string>
#include <fstream>

using namespace std;

char a[1000],b[1000],c[100000];

void sum(char a1[],char b1[]) //сложение двух чисел
{ int n1,n2,n,i,p,x,y,z;
  n1=strlen(a1);
  n2=strlen(b1);
  n=n2-n1;
  if (n>0)
    { a1[n2]='\0';
      for(i=n2-1; i>=n1; i--) a1[i]=a1[i-n];
      for(i=0; i<n; i++) a[i]='0'; }
  if (n<0)
    { n*=-1;
      b1[n1]='\0';
      for(i=n1-1; i>=n2; i--) b1[i]=b1[i-n];
      for(i=0; i<n; i++) b1[i]='0'; }
  n=strlen(a1);
  p=0;
  for(i=n-1; i>=0; i--)
    { x=(int)a1[i]-48;
      y=(int)b1[i]-48;
      z=x+y+p;
      c[i+1]=(char)z%10+48;
      p=(int)z/10; }
  c[n+1]='\0';
  c[0]=(char)p+48;
  if (c[0]=='0') //если первая цифра результата 0 - исключаем ее
    { for(i=0; i<n; i++) c[i]=c[i+1];
      c[i]='\0'; }
}

void mult(char a1[],char b1[]) //произведение двух чисел
{ int n1,n2,n3,i,j,p,x,y,z,k;
  char c1[100000],c2[100000];
  n1=strlen(a1);
  n2=strlen(b1);
  //получаем первое слагаемое как произведение первого числа на последнюю цифру второго
  p=0;
  j=n2-1;
  for(i=n1-1; i>=0; i--)
    { x=(int)a1[i]-48;
      y=(int)b1[j]-48;
      z=x*y+p;
      c1[i+1]=(char)z%10+48;
      p=(int)z/10; }
  c1[n1+1]='\0';
  c1[0]=(char)p+48;
  if (c1[0]=='0') //если первая цифра результата 0 - исключаем ее
    { for(i=0; i<n1; i++) c1[i]=c1[i+1];
      c1[i]='\0'; }
  n3=strlen(c1);
  for(i=0; i<n3; i++) c[i]=c1[i];
  c[n3]='\0';
  //получаем следующие слагаемые как произведение первого числа на соответствующие
  //цифры второго, при этом выполняем сложение получившихся слагаемых
  k=1;
  for(j=n2-2; j>=0; j--)
    { p=0;
      for(i=n1-1; i>=0; i--)
        { x=(int)a1[i]-48;
          y=(int)b1[j]-48;
          z=x*y+p;
          c2[i+1]=(char)z%10+48;
          p=(int)z/10; }
      c2[0]=(char)p+48;
      for(i=1; i<=k; i++) c2[n1+i]='0';
      c2[n1+k+1]='\0';
      if (c2[0]=='0') //если первая цифра результата 0 - исключаем ее
        { for(i=0; i<n1+k; i++) c2[i]=c2[i+1];
          c2[i]='\0'; }
      n3=strlen(c1);
      if (n3<strlen(c2)) //длина первого слагаемого меньше - добавляем 0 первой цифрой
        { for(i=n3-1; i>=0; i--) c1[i+1]=c1[i];
          c1[0]='0';
          c1[n3+1]='\0';}
      //может, однако, потребоваться добавление еще одного нуля:    
      n3=strlen(c1);
      if (n3<strlen(c2)) //длина первого слагаемого меньше - добавляем 0 первой цифрой
        { for(i=n3-1; i>=0; i--) c1[i+1]=c1[i];
          c1[0]='0';
          c1[n3+1]='\0';}
      sum(c1,c2); //суммируем
      //результат суммирования будет первым слагаемым в дальнейших операциях
      n3=strlen(c);
      for(i=0; i<n3; i++) c1[i]=c[i];
      c1[n3]='\0'; k++;
    }  
}


int main()
{ FILE *FIN = fopen("input.TXT", "r");
  fscanf(FIN, "%s\n\n%s", a, b); 
  fclose(FIN);
  //cout<<"a: "; gets(a);
  //cout<<"b: "; gets(b);
  mult(a,b);
  ofstream FOUT;
  FOUT.open("output.txt"); 
  FOUT<<c;
  FOUT.close();
  return 0; }
