program e2;
var mass:array[1..1000] of integer;
p,q,c,i,l:integer;
f:text;
begin
assignfile(f,'frac.in');
reset(f);
readln(f,p,q);
closefile(f);
i:=0;
while not(p mod q=0) do begin
inc(i);
mass[i]:=p div q;
c:=p mod q ;
p:=q;
q:=c;
end;
assignfile(f,'frac.out');
rewrite(f);
writeln(f,i+2);
for l:=1 to i do begin
write(f,mass[l],' ');
end;
write(f,p div q-1,' ',1);
closefile(f);

end.