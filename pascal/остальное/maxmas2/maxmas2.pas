program e1;
var n,x,y,i,t:longint;
begin
readln(n);
read(x);
for t:=2 to n do begin
read(y);
if y>x then i:=i+1;
x:=y;
end;
writeln(i);
end.