program ballser;
var i,j,n,r,x1,y1:INTEGER;
mass:array[1..1000,1..1000] of byte;
s:string;
procedure sergey(x,y:integer);
begin
n:=n+1;
mass[x,y]:=0;
if mass[x+1,y]=1 then sergey(x+1,y);
if mass[x-1,y]=1 then sergey(x-1,y);
if mass[x,y+1]=1 then sergey(x,y+1);
if mass[x,y-1]=1 then sergey(x,y-1);
end;
begin
n:=0;
readln(r);
for j:=1 to r do begin
readln(s);
for i:=1 to r do begin
if s[i]='.' then mass[j+1,i+1]:=1 else mass[j+1,i+1]:=0
end;
end;
readln(x1,y1);
sergey(x1+1,y1+1);
writeln(n);
end.