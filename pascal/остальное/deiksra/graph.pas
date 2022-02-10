type graf=record
     size:integer;
     matrix:array[,] of integer; 
     max:array of integer;
end;
procedure FreeGraf(var m:graf);
var i,j:integer;
begin
for i:=1 to m.size do begin
 for j:=1 to m.size do begin
  m.matrix[i,j]:=0;
 end;
end;
for i:=1 to m.size do begin
  m.max[i]:=0;
end;
m.size:=0; 
end;
procedure CreateGraf(var m:graf;size:integer);
begin
 FreeGraf(m);
 if (size>0) then begin
   setlength(m.matrix,size+2,size+2);
   setlength(m.max,size+2);
   m.size:=size;
 end;
end;
procedure ReadGrafFC(var m:graf);
var i,j,n:integer;
begin
readln(n);
CreateGraf(m,n);
for i:=1 to n do begin
 for j:=1 to n do begin
  read(m.matrix[i,j]);
 end;
end;
end;
procedure WriteGrafTC(var m:graf);
var i,j:integer;
begin
writeln(m.size);
for i:=1 to m.size do begin
  for j:=1 to m.size do begin
    write(m.matrix[i,j],' ');
  end;
    writeln();
end;
end;
procedure ReadGrafFF(var m:graf;FileName:string);
var f:text;
    i,j,n:integer;
begin

 assign(f,FileName);
 reset(f);
 readln(f,n);
CreateGraf(m,n);
for i:=1 to n do begin
 for j:=1 to n do begin
  read(f,m.matrix[i,j]);
 end;
 readln(f);
end;
 close(f);
end;
function SimGraf(var m:graf):boolean;
var i,j:integer;
    f:boolean;
begin
f:=true;
 for i:=1 to m.size do begin
   for j:=1 to m.size do begin
    if m.matrix[i,j]<>m.matrix[j,i] then begin
     f:=false;
     break;
    end;
   end;
 end;
 SimGraf:=f;
end;

var MyGraf:graf;
begin
ReadGrafFC(MyGraf);
WriteGrafTC(MyGraf);


end.