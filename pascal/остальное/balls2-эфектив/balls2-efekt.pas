program bells;
type ase=0..1;
  
var max:array[1..5] of byte;
mass:array[1..5,1..15,1..15] of ase;
n,m,i:integer;
fin, fout: text;

//процедура загрузки данных по массивам
procedure readt();
var i,t:byte;
      a:string;
begin
 
 for i := 2 to n + 1 do
  begin
    readln(fin, a);
    for t := 2 to n + 1 do 
    begin
      case a[t - 1] of 
        'r': mass[1,i, t] := 1;
        'g': mass[2,i, t] := 1;
        'b': mass[3,i, t] := 1;
        'y': mass[4,i, t] := 1;
        'v': mass[5,i, t] := 1;
      end;
    end;
  end;



end;
procedure sergey(f,i,t:byte);
begin
mass[f,i,t]:=0;
m:=m+1;
if mass[f,i+1,t]=1 then sergey(f,i+1,t);
if mass[f,i,t+1]=1 then sergey(f,i,t+1);
if mass[f,i-1,t]=1 then sergey(f,i-1,t);
if mass[f,i,t-1]=1 then sergey(f,i,t-1);
end;

procedure stetk(f:byte);
var i,t:byte;
begin
for i:=2 to n+1 do begin
   for t:=2 to n+1 do begin
   m:=0;
   if mass[f,i,t]=1 then sergey(f,i,t);if m>max[f] then max[f]:=m;
   end;
end;
end;




begin
 
  assign(fin, 'balls2.in');
  assign(fout, 'balls2.out');
  reset(fin);
  rewrite(fout);
  readln(fin, n);
  readt;

  for i:=1 to 5 do begin
  stetk(i);
  end;
   
  writeln(fout,'r: ',max[1]*(max[1]-1));
  writeln(fout,'g: ',max[2]*(max[2]-1));
  writeln(fout,'b: ',max[3]*(max[3]-1));
  writeln(fout,'y: ',max[4]*(max[4]-1));
  writeln(fout,'v: ',max[5]*(max[5]-1));



  close(fin);
  close(fout);

end.