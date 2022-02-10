program ed;
var n:real;
f:text;
begin
assignfile(f,'circles2.in');
reset(f);
readln(f,n);
closefile(f);
assignfile(f,'circles2.out');
rewrite(f);
writeln(f,n*(n-1)+2:1:0);
closefile(f);
end.