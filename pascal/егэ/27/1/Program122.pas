var a:array[1..5] of integer;
   sum,n,i,maxsum:integer;
procedure sdvig();
   var i:integer;
begin
    for i:=1 to 4 do
      a[i]:=a[i+1];
end;
begin
readln(n);
sum:=0;
for i:=1 to 5 do begin
  readln(a[i]);
  sum:=sum+a[i];
end;
maxsum:=sum;
for i:=6 to n do begin
  sum:=sum-a[1];
  sdvig();
  readln(a[5]);
  sum:=sum+a[5];
 if sum>maxsum then maxsum:=sum;
end;
writeln(maxsum);
end.