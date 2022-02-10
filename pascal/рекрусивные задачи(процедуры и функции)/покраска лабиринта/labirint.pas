program ballser;
var i,j,n,r,n1,n2:INTEGER;
mass:array[0..1001,0..1001] of byte;
s:string;
procedure sergey(x,y:integer);
begin
mass[x,y]:=3;
if mass[x+1,y]=0 then begin  n:=n+1;end;
if mass[x-1,y]=0 then begin n:=n+1;end ; 
if mass[x,y+1]=0 then begin  n:=n+1;end;
if mass[x,y-1]=0 then begin  n:=n+1;end;

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
if s[i]='.' then mass[j,i]:=1 else if s[i]='#' then mass[j,i]:=0
end;
end;
n:=0;
sergey(1,1);
if mass[r,r]=3 then begin
if n>2 then
writeln((n-4)*9); 
end else begin 
sergey(r,r);
if n>2 then
writeln((n-4)*9);
end;
end.