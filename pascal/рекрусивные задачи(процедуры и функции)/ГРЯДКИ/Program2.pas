program ballser;
var i,j,n,ri,rj:INTEGER;
mass:array[,] of byte;
s:string;
procedure sergey(x,y:integer);
begin
mass[x,y]:=0;
if mass[x+1,y]=1 then sergey(x+1,y);
if mass[x-1,y]=1 then sergey(x-1,y);
if mass[x,y+1]=1 then sergey(x,y+1);
if mass[x,y-1]=1 then sergey(x,y-1);
end;
begin
n:=0;
readln(rj,ri);
setlength(mass,rj+4,ri+4);
for j:=1 to rj do begin
readln(s);
for i:=1 to ri do begin
if s[i]='#' then mass[j+1,i+1]:=1 else mass[j+1,i+1]:=0
end;
end;

for j:=0 to rj do begin
for i:=0 to ri do begin
if mass[j+1,i+1]=1 then begin 
                          sergey(j+1,i+1);
                          n:=n+1; end;
end;
end;

writeln(n);
end.