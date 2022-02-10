var n1,n2:array[1..2500] of byte;
n3:array[1..5002] of byte;
c:char;
len1,len2,d,len:integer;
i,t:integer;
k:byte;
begin

while not eoln do begin
 read(c);
 len1:=len1+1;
 n1[len1]:=ord(c)-ord('0');
end;
readln;
while not eoln do begin
read(c);
len2:=len2+1;
n2[len2]:=ord(c)-ord('0');

end;
readln;
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
for i:=1 to len1 do begin
for t:=1 to len2 do begin
len:=i+t-1;
k:=n1[i]*n2[t];
while k>0 do begin
k:=k+n3[len];
n3[len]:=k mod 10;
k:=k div 10;
inc(len);
end;

end;
end;
k:=0;
for i:=len downto 1 do if n3[i]>0 then begin len:=i;break;   end;
for i:=len-k downto 1 do write(n3[i]);
end.