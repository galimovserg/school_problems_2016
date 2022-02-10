program peregon;
var n,p,i,t,a,b,min:integer;
mass:array[1..1000] of integer;
s:string;
sh:char;
procedure wr();
begin
repeat
read(sh);
until sh=' ';
end;

begin
readln(n,p);
min:=n;
for i:=1 to p do begin
wr;wr;
readln(a,b);
for t:=a to b-1 do begin 
inc(mass[t]);
end;
end;
for i:=1 to n-1 do begin
if mass[i]<=min then min:=mass[i];
end;
for i:=1 to n-1 do begin
if mass[i]=min then
writeln(i,'-',i+1);
end;
end.