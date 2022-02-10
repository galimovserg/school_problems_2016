const   nm=100;
       
type graf=record
       p:array[1..nm,1..nm] of integer;//вес
       v:array[1..nm] of boolean;//были здесь или нет
       ps:array[1..nm] of longint;//расстояние до текущей вершины
       size,sw:integer;      
       end;
       
var             
    my:graf;//это граф в табличной форме
    i,j,pbegin,pend,mins,s,x,y,z:integer;
    f:text; 
procedure deik(point:integer);
var i:integer;
begin
if (s<=mins) and(my.ps[point]>s) then begin
   my.ps[point]:=s;
   my.v[point]:=true;
 if not (point=pend) then  begin
  for i:=1 to my.size do begin
      if (my.p[point,i]>0)and( not my.v[i]) then begin
         s:=s+my.p[point,i];
         deik(i);
         my.v[i]:=false;
        s:=s-my.p[point,i];
      end;                          
  end;
  end
  else begin  begin mins:=s; end; end;
 end;
end; 
   
begin
for i:=1 to my.size do my.v[i]:=false;
mins:=100000000;

{assign(f,'inputr.txt');
reset(f);
readln(f,my.size);
readln(f,my.sw);
for i:=1 to my.sw do begin
readln(f,x,y,z);
my.p[x,y]:=z;
end;
readln(f,pbegin,pend);
close(f);}


assign(f,'input.txt');
reset(f);

read(f,my.size);
readln(f,pbegin,pend);
for i:=1 to my.size do begin
  for j:=1 to my.size do begin 
    read(f,my.p[i,j]);
  end;
readln(f);
end;

close(f);
assign(f,'output.txt');
rewrite(f);
for i:=1 to my.size do begin
my.ps[i]:=100000000;
end;
  s:=0;
  deik(pbegin);
if mins<100000000 then
  writeln(f,mins) else writeln(f,-1);
close(f);
end.