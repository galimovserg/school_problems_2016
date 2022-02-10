program countmax;
var b,n,i,count,max:integer;
begin
readln(n);
for i:=1 to n do begin
read(b);
if b>max then begin
count:=1;
max:=b;
end else if b=max then count:=count+1;
end;
writeln();
writeln(count);
end.