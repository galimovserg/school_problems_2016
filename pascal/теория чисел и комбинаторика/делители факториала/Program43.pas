program ed3;
var count,i,t,n,z:integer;
    mas:array[1..45] of integer;
begin
readln(n);
for i:=1 to n do begin
 z:=i;t:=2;
 while z>1 do begin
 if z mod t=0 then begin z:=z div t; mas[t]:=mas[t]+1; end else t:=t+1;
 
 end;
 
end;
count:=1;
for i:=1 to n do begin
count:=count*(mas[i]+1);
end;
write(count);
end.