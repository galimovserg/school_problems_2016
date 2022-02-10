const N=1000;
var pointx,pointy:array[1..N] of integer;//���������� �����
m:integer;//���������� �����
i,t,f:integer;//�������
current,currentstart:integer;//������� ������� ����� � ���������
len,cs,lenmax,csmax,dx,dy:real;
p:real;
begin
readln(m);//��������� ���������� �����
readln(pointx[1],pointy[1]);//������ �����
current:=1;//������� �� ��������� ����� ������
for i:=2 to m do begin//���� ����� ����� �������� m-1
readln(pointx[i],pointy[i]);
if pointy[i]<pointy[current] then current:=i else//����� ������
if pointy[i]=pointy[current] then if pointx[i]<pointx[current] then current:=i;//�� ����� �����
end;
currentstart:=current;//�������� ��������� ��� ���������

p:=0;
f:=0;
dx:=-1;
dy:=0;
csmax:=-2;
repeat 
f:=1;
 
 for i:=1 to m do begin
  len:=sqrt(sqr(pointy[i]-pointy[current])+sqr(pointx[i]-pointx[current]));
 
  if len>0.00001 then begin
  cs:=(dx*(pointx[i]-pointx[current])+dy*(pointy[i]-pointy[current]))/len;
 if cs>=csmax then begin
 csmax:=cs;
 lenmax:=len;
 t:=i;
 end;
 end;
 end;
 
 if csmax>-2 then
 p:=p+lenmax;
 dx:=(pointx[t]-pointx[current]);
 dy:=(pointy[t]-pointy[current]);
 current:=t;

 
until current=currentstart;
writeln(p:0:1);
end.