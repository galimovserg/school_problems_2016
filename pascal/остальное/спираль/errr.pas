program spirel;
var n,i,j,q,c,z:integer;
mass:array[0..101,0..101] of integer;
begin
readln(n);
for i:=0 to n+1 do begin mass[i,0]:=1;mass[i,n+1]:=1;mass[0,i]:=1;mass[n+1,i]:=1; end;
i:=0;
j:=1;
q:=1;
for c:=1 to n*n do begin
z:=0;
case q of
1:begin i:=i+1;mass[i,j]:=c;if mass[i+1,j]>0 then z:=1;  end;
2:begin j:=j+1;mass[i,j]:=c;if mass[i,j+1]>0 then z:=1; end;
3:begin i:=i-1;mass[i,j]:=c; if mass[i-1,j]>0 then z:=1; end;
4:begin j:=j-1;mass[i,j]:=c;if mass[i,j-1]>0 then z:=1; end;
end;
q:=q+z;
if q=5 then q:=1;

end;
for j:=1 to n do begin
for i:=1 to n do begin
write(mass[i,j],' ');
end;
writeln();
end;


end.