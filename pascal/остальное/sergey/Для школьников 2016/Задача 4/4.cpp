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
 f<<endl;    //��������� ����� � ����� ��� ������ ���-�� ��������� ����
  for(m=1; m<n; m++)
    { for(i=0; i<=m; i++) a[i]=i;           //�������������� ��������� � ������
      for( ; i>0; )
        { i=m; s=0;
          for(j=1; j<=m; j++) s+=b[a[j]-1]; //������� �����
          if (s==0) { f<<endl<<endl; //����� = 0, - ���������� ������� � ����
                            count++;
                            for(j=1; j<=m; j++) f<<b[a[j]-1]<<"  "; }
          while (a[i]==n-m+i) i--;  //���� ������� ��� ���������� ���������
 //(� ������� �����)
          a[i]++;
          for(j=i+1; j<=m; j++) a[j]=a[j-1]+1; } }    //�������� ������ �����
 //���������
  f.seekg(0);
  f<<count;     //���������� ���������� ���� � ������ �����
  f.close(); return 0; }
