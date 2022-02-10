program stepsvob;
var mas:array[1..100,1..100] of integer;
    col:array[1..100] of integer;
m,ch,i,j,f:integer;
begin
readln(m);
f:=0;
for i:=1 to m do begin
for j:=1 to m do begin
read(ch);
mas[i,j]:=mas[i,j]+ch;
end;
readln;
end;
readln;
for i:=1 to m do  begin
read(col[i]);
end;
for i:=1 to m do begin
 for j:=1 to m do begin
 if mas[i,j]=1 then begin mas[j,i]:=0;if col[i]<>col[j] then inc(f) end;
 end;
end;
writeln(f);
end.