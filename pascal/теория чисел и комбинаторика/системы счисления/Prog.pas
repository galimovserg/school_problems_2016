var i,j,d:int64;
    ss:string;
function al(s:string;b:int64):int64;
var a:int64;
    i:integer;
begin

 for i:=1 to  length(s) do begin
   if ord(s[i])-ord('0')<10 then
   a:=a*b+ord(s[i])-ord('0') else
   a:=a*b+ord(s[i])-ord('A')+10; 
 end;
   al:=a;
end;

function sl(a,b:int64):string;
 var s:string;
begin
while a>0 do begin
 if a mod b<10 then
 s:=chr(ord('0')+a mod b)+s else
 s:=chr(ord('A')+a mod b-10)+s;
 a:=a div b;
end;
sl:=s;
end;
begin
readln(i,j);
readln(ss);
d:=al(ss,i);
writeln(sl(d,j))


end.
