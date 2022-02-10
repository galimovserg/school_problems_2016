type point=record
 x:longint;
 y:longint;
end;
var a:array[1..102] of point;
n,i,i1,i2,i3,maxs,vers:longint;
begin

readln(n);

for i:=1 to n do begin
 readln(a[i].x,a[i].y);
end;
for i1:=1 to n do 
 for i2:=1 to n do
  for i3:=1 to n do begin
    vers:=abs((a[i2].x-a[i1].x)*(a[i3].y-a[i1].y)-(a[i3].x-a[i1].x)*(a[i2].y-a[i1].y));
    if vers>maxs then maxs:=vers
  
  end;
writeln(maxs/2);
end.