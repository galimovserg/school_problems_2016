program paint;
var mas:array[0..101,0..101] of byte;
    n,max,count:integer;
    i,j:integer;
    s:string;
   
   procedure sergey(i,j:integer);
      begin
    if mas[i,j]= 1 then begin
     inc(n);
     mas[i,j]:=0;
     sergey(i,j+1);
     sergey(i,j-1);
     sergey(i+1,j);
     sergey(i-1,j);
    
      end;
    end;
begin
count:=0;
readln(n);
for i:=1 to n do begin
readln(s);
for j:=1 to n do begin

if s[j]='1' then mas[i,j]:=1 else mas[i,j]:=0;
end;

end;
for i:=1 to n do begin
for j:=1 to n do begin
if mas[i,j]=1 then begin inc(count); n:=0; sergey(i,j); if n>max then max:=n;  end;

end;

end;
writeln('count=',count);
writeln('max=',max);

end.