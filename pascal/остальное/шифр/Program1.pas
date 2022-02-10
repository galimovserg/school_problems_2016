program passwordeas;
var s:string;
m,i:integer;
begin
readln(s);
for i:=1 to length(s) do begin
m:=i*(ord(s[i])-i+ord(s[1]))+m;
end;
writeln(m*i);



end.