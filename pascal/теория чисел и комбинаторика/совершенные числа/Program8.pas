var m,n,i,s,sq,t:longint;
c:byte;

begin
readln(m,n);
c:=0;
for i:=m to n do begin
sq:=trunc(sqrt(i));
if not(sq*sq=i) then
s:=1 else s:=1-sq;

for t:=2 to sq do begin
if i mod t=0 then 
s:=s+i div t +t;
end;
if s=i then begin
writeln(i);
c:=1;
end;
end;
if c=0 then write('Absent');
end.