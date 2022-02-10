program e1;
var i,n:integer;
x,y:array[1..50001] of real;
s,xx,yy:real;
begin
readln(n);
readln(x[1],y[1]);
readln(x[2],y[2]);
s:=0;
for i:=3 to n do begin
readln(x[i],y[i]);
s:=s+((x[i-1]-x[1])*(y[i]-y[1])-(x[i]-x[1])*(y[i-1]-y[1]));
end;
writeln(abs(s)/2);
end.