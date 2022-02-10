const l=8;
      max=1001;
var a:array[1..l] of integer;
n,i,p,minn,minp,m:integer;
function min(a,b:integer):integer;
begin
  if a>b then  a:=b;
      min:=a;
end;
procedure sdvig();
var i:integer;
begin
  for i:=1 to l-1 do a[i]:=a[i+1];
end;

begin
readln(n); p:=max*max;
minp:=max; minn:=max;
for i:=1 to l do 
 readln(a[i]);
for i:=l+1 to n do begin
 readln(m);
 if a[1]mod 2=0 then
   minp:=min(a[1],minp) else
   minn:=min(a[1],minn);
 if m mod 2=0 then
   p:=min(p,min(minp,minn)*m) else
   p:=min(p,minp*m);
 sdvig();
 a[l]:=m;
end;
if p<max*max then writeln(p) else writeln(-1);
end.