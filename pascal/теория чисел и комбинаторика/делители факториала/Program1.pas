var y,a,b,dx,x,q:real;
function f(x:real):real;
begin
f:=-x*x*x+100-x*x+x;
end;
begin
readln(a,b,dx);
if (f(a)<=0) and (f(b)>=0) then q:=1 else 
if (f(a)>=0) and (f(b)<=0) then q:=-1 else writeln('решений нет');
 
while abs(a-b)>=dx do begin
x:=(a+b)/2;
if q*f(x)>0 then begin
b:=x;
end else begin 
a:=x;

end;

end;
writeln(x);
writeln(f(x):0:10);
end.