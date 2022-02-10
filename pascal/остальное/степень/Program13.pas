program e1;
type addr=0..9;
var mass:array[1..100000] of integer;
i,n,a,lm,p,k,t:integer;
begin
readln(a,n);
if a=1 then writeln(1) else begin
mass[1]:=1;
lm:=1;
for i:=1 to n do begin
p:=0;
for t:=1 to lm do begin
k:=(mass[t]*a +p);
mass[t]:=k mod 10;
p:=k div 10;
end;
if p>0 then begin inc(lm); mass[lm]:=p end;
end;

end;
for i:=lm downto 1 do write(mass[i]);
end.