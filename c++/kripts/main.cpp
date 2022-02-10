#include <iostream>
#include <windows.h>
using namespace std;
//string mass[50000000];
int id[100000000];
DWORD WINAPI t1(LPVOID t){

}
int main()
{
    CreateThread(NULL,0,t1,0, NULL, NULL);
    for(int i=0;i<100000000;i++){
        id[i]=i;
        //mass[i]="hello";
    }





    cout << "Hello world!" << endl;
    int counts;
    cin>>counts;



    return 0;
}
