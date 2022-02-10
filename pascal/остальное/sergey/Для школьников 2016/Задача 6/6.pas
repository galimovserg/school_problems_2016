Type Mas=array [byte] of byte;
Var N,i,L: byte;
    a: Mas;
    f: Text;
procedure Next(var a: Mas; var L: byte);
var i,j:byte;
    s:word;
begin
  i:=L-1;
  s:=a[L];
  while (i>1) and (a[i-1]<=a[i]) do
    begin s:=s+a[i];
          i:=i-1;
    end;
  a[i]:=a[i]+1;
  L:=i+s-1;
  for j:=i+1 to L do a[j]:=1;
end;
Begin
  assign(f,'in.txt');
  reset(f);
  read(f,N);
  close(f);
  
  assign(f,'out.txt');
  rewrite(f);
  
  L:=N;
  for i:=1 to L do a[i]:=1;
  writeln;
  repeat
    for i:=1 to L-1 do write(f,a[i],' + ');
    write(f,a[L]);
    writeln(f,' ');
    Next(a,L);
  until L=1;
  writeln(f,a[L]);
  close(f);
end.