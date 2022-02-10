program smei;
var m,n,i,t,z,q:longint;
begin
readln(m,n);
q:=1;
for i:=1 to m do begin
for t:=1 to n do begin
z:=z+q;
write(z:3,' ');
end;
writeln();
z:=z+n+q;
q:=-q;
end;
end.