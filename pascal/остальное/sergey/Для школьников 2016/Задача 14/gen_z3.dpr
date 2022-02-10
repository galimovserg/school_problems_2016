program gen_z3;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  DateUtils;

var n1,n2: integer;
    a,max: byte;
    i,n: longint;
    f: text;
    t1,t2: TDateTime;

begin
  write('Width = '); readln(n1);
  write('Heigth = '); readln(n2);
  write('MAX (from 0 to 255): '); readln(max);
  t1:=Now;
  randomize;
  assign(f,'input.txt');
  rewrite(f);
  writeln(f,n1); writeln(f,n2);

  n:=3*n1*n2;
  for i:=1 to n do
    begin
      a:=random(max+1);
      write(f,a,' ');
    end;
  close(f);

  t2:=Now;
  writeln('Time ',MilliSecondsBetween(t2,t1)/1000:5:3,' s.');
  write('Program is complete');
  readln;
end.

