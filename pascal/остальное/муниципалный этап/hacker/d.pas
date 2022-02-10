program d;
var mass:array of integer;
n,count,i:integer;
f:text;
begin
assignfile(f,'hacker.in');
reset(f);
readln(f,n);
setlength(mass,n+2);
for i:=2 to n do read(f,mass[i]);
count:=1;
readln(f,i);
closefile(f);
assignfile(f,'hacker.out');
rewrite(f);
while not(i=1) do begin
inc(count);
i:=mass[i];
end;
writeln(f,count);
closefile(f);


end.