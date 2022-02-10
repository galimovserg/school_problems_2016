var n1,n2:array[1..30001] of byte;
c:char;
len1,len2,d,len:integer;
i:integer;
k:byte;
f:text;
begin
assign(f,'input.txt');
reset(f);
while not eoln(f) do begin
 read(f,c);
 len1:=len1+1;
 n1[len1]:=ord(c)-ord('0');
end;
readln(f);
while not eoln(f) do begin
read(f,c);
len2:=len2+1;
n2[len2]:=ord(c)-ord('0');

end;
close(f);
for i:=1 to len1 div 2 do
  begin
   k:=n1[i];
   d:=len1-i+1;
   n1[i]:=n1[d];
   n1[d]:=k;
end;
for i:=1 to len2 div 2 do
  begin
   k:=n2[i];
   d:=len2-i+1;
   n2[i]:=n2[d];
   n2[d]:=k;
end;
k:=0;
if len1>len2 then len:=len1 else len:=len2;
for i:=1 to len do begin
k:=k+n1[i]+n2[i];
n1[i]:=k mod 10;
k:=k div 10;

end;
if k<>0 then begin
len:=len+1;
n1[len]:=k;
end;
assign(f,'output.txt');
rewrite(f);
for i:=len downto 1 do  write(n1[i]);
close(f);
end.
