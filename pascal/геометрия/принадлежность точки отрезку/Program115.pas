var x,y,a,b,c,d,l1,l2:real;
begin
readln(x,y,a,b,c,d);
l1:=sqrt(sqr(a-c)+sqr(b-d));
l2:=sqrt(sqr(x-a)+sqr(y-b))+sqrt(sqr(x-c)+sqr(y-d));
if abs(l1-l2)<=0.0000000001 then writeln('YES') else writeln('NO');
end.