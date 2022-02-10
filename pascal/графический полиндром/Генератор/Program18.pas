var c1,c2,c3,d,e,i,i1,g1,g,l,x,z:integer;
a:array[1..200,1..600]of byte;

f:text;
begin
assign(f,'xxx.txt');
reset(f);
for i:=1 to 200 do begin
for g:=1 to 600 do begin
read(f,c1,c2,c3);
if (c1=255) and (c2=255) and (c3 =255) then a[i,g]:=0 else a[i,g]:=1;
end;end;
close(f);
for i:=1 to 300 do begin
for i1:=600 downto 301 do begin
for g:=1 to 200 do begin
if a[i,g]=1 then begin
L:=1;
while l<>0 do begin
x:=x+1;




for g1:=1 to 200 do begin

 end.