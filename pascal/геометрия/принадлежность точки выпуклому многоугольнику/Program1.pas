program e1;
var i,n:integer;
x,y:array[1..101] of real;
s,s1,xx,yy:real;
begin
readln(n);
readln(x[1],y[1]);
readln(x[2],y[2]);
s:=0;s1:=0;
for i:=3 to n do begin
readln(x[i],y[i]);
s:=s+abs((x[i-1]-x[1])*(y[i]-y[1])-(x[i]-x[1])*(y[i-1]-y[1]));
end;
readln(xx,yy);
for i:=2 to n do begin
s1:=s1+abs((x[i-1]-xx)*(y[i]-yy)-(x[i]-xx)*(y[i-1]-yy));
end;
s1:=s1+abs((x[1]-xx)*(y[n]-yy)-(x[n]-xx)*(y[1]-yy));
if abs(abs(s1)-abs(s))<=1e-10 then writeln('YES') else writeln('NO');
end.