const free=-1;//�������� ��������� ������
      wall=-2;//�������� ����������
      way=-3;//� ������� �������� ����
var
p:array[0..50,0..50] of integer;//����
c:char;//������ ���������� ��� ����� ������
n,//������ ����
i1,i2,count,//��������
x1,x2:integer;//���������� 
f:boolean;//���������� �����
begin

//������ ������
readln(n);
//����� �� ���� ������ �� ������� ���� ��������� �����������
for i1:=0 to n+1 do begin
 for i2:=0 to n+1 do begin
   p[i1,i2]:=wall;
 end;
end;
//������� ����� � p
for i1:=1 to n do begin
 for i2:=1 to n do begin
 read(c);//���� ������������
 if c='.' then p[i1,i2]:=free else //���� . �� ������ ���������
 if c='@' then p[i1,i2]:=0 else //���� @ �� ��� ��������� ���������
 if c='O' then p[i1,i2]:=wall //���� O �� ������ ����������� �� ���� �������� wall
 else begin p[i1,i2]:=free;x1:=i1;x2:=i2  end;// �������� ������ ������ � �������� ���������� �������� ���������� ����� ������ ����� free
 end;
 readln();
end;

//���� free � �������� count �� ������ ������ ����������� count+1 )
count:=0;//������ �� ������
 repeat
 f:=false;
 for i1:=1 to n do
 for i2:=1 to n do begin
  if (p[i1,i2]=free)and((p[i1-1,i2]=count)or(p[i1+1,i2]=count)or(p[i1,i2+1]=count)or(p[i1,i2-1]=count)) then begin
  f:=true;
  p[i1,i2]:=count+1;
  end;
  
 end;
 inc(count);//����������� count �� 1
 
 

 until f=false;//���� ������ �� ��������� �� ���������
 
if p[x1,x2]=free then begin writeln('N'); halt; end else writeln('Y');//���� ��������� ������ �������� ���������, �� ������� N � ��������� ������

i1:=x1;
i2:=x2;
while not(p[i1,i2]=0) do begin
  count:=p[i1,i2];
  p[i1,i2]:=way;
  if p[i1-1,i2]=count-1 then i1:=i1-1 else
  if p[i1+1,i2]=count-1 then i1:=i1+1 else
  if p[i1,i2-1]=count-1 then i2:=i2-1 else
  if p[i1,i2+1]=count-1 then i2:=i2+1;
 
 
  
end;

//�������� ���������� :)���� ������
writeln(x1,' ',x2);
for var il1:=1 to n do begin
for var il2:=1 to n do 
if p[il1,il2]=way then write('+') else
if p[il1,il2]=wall then write('#') else 
if p[il1,il2]=0 then write('@') else write('.');

writeln;
end;

end.