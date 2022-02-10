program N3_Gen;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var a,n,i: longint;
    f: text;

begin
  randomize;
  assign(f,'in.txt');
  rewrite(f);
  write('n= '); readln(n);
  i:=0;
  while i<n do
    begin
      a:=random(900000)+100000;
      write(f,a,' ');
      i:=i+1;
    end;
  a:=random(900000)+100000;
  write(f,a);
  close(f);
end.
 