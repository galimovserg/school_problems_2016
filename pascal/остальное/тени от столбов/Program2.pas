program theni;
var i,n,count,x,y:integer;
max:real;
begin
readln(n);
for i:=1 to n do begin
readln(x,y);
if x+y/2>=max then begin max:=x+y/2; count:=i; end;

end;
writeln(count,' ',max);
end.