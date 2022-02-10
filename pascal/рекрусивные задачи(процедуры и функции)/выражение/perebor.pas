program perebor;
var x:array[1..24] of longint;
    c:array[2..24] of char;
s:longint;
f,i,n1:byte;
procedure p(n:byte;sum:longint);
begin

 if (n>1) then begin
   c[n]:='+';
   p(n-1,sum+x[n]);
   c[n]:='-';
   p(n-1,sum-x[n]);
 end else begin
if s=sum then begin
write(x[1]);
for var i:=2 to n1 do begin
write(c[i],x[i]);
end;writeln('=',s); halt;
end; 
end;

end;
begin
readln(n1,s);
f:=0;
for i:=1 to n1 do read(x[i]);
p(n1,x[1]);
writeln('No solution');
end.