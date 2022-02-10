program zmeika;
var a:array[1..1000,1..1000] of integer;
m,n,i,t,h,z,g,f:integer;
label 1;
begin
readln(m,n);
if (m*n-1>999) or (m*n-1<0) then goto 1;
g:=1;
z:=0;
for i:=1 to m do begin

for t:=1 to n do begin
z:=z+1*g;
a[i,z]:=f;
f:=f+1;
end;
z:=z+g;

g:=-g;
end;
for i:=1 to m do begin

for t:=1 to n do begin
write(' ',a[i,t]:3);

end;
writeln;
end;
1:
end.