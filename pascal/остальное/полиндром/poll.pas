var s:string;
n,i,f:integer;
begin
readln(s);
n:=length(s);
f:=0;
for i:=1 to n div 2+1 do begin
if s[i]=s[n-i+1] then else f:=1;

end;
if f=1 then write('no') else write('yes');
end.