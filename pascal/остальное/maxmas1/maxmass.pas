program e1;
var a:array[1..36] of integer;
n,b,i:integer;
label 1;
begin
b:=-maxint-1;
read(n);
if n=0 then goto 1;
for i:=1 to n do begin
read(a[i]);
if (a[i]>b) or (a[i]=b) then
b:=a[i];
end;
write(b);
1:
end.