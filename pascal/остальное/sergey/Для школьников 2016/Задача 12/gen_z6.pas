uses crt;
var i,j,k,n,m: longint;
    x,y,max: longint;
    f: text;

begin
  clrscr;
  write('n= '); readln(n);
  write('m= '); readln(m);
  write('max= '); readln(max);
  if max<n*m then max:=n*m;

  randomize;
  assign(f,'input.txt');
  rewrite(f);
  writeln(f,n);
  writeln(f,m);
  y:=trunc(max/(n*m));
  k:=1;
  for i:=1 to n do
    begin
      for j:=1 to m do
      begin
        x:=random(y)+k;
        if j<>m then write(f,x,' ') else write(f,x);
        k:=k+y;
      end;
      if (i<>n) or (j<>m) then writeln(f,'');
    end;

  close(f);
  write('Работа программы завершена');
  readln;
end.
