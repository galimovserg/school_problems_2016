var s1,s2:array[1..10000] of char;
len1,len2,i,j:longint;
label 1,2;
begin
len1:=0;
while not(eoln) do begin
inc(len1);
read(s1[len1])
end;
readln();
len2:=0;
while not(eoln) do begin
inc(len2);
read(s2[len2])
end;
readln();
if len1<=len2 then begin
 
 for i:=1 to len2-len1+1 do begin
  for j:=1 to len1 do begin
   if s1[j]<>s2[i+j-1] then begin  goto 1 end;
  end;
  writeln('yes');
  halt();
  1:
 end;
 writeln('no');
end else writeln('no');

end.