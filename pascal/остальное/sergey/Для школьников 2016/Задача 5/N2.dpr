program N2;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  DateUtils;

var i,m,s,max: longint;
    k,j: integer;
    a: array[1..10,1..10] of longint;
    ss: string;
    f: text;
    t1,t2: TDateTime;

function stepen(x,y: byte): longint;
var i: byte; z: longint;
begin
  z:=1;
  for i:=1 to y do z:=z*x;
  stepen:=z;
end;

begin
  t1:=Now;
  assign(f,'in.txt');
  reset(f);
  read(f,max);
  close(f);
  assign(f,'out.txt');
  rewrite(f);

  for i:=0 to 9 do
  for j:=1 to 10 do a[i+1,j]:=stepen(i,j);

  for i:=10 to max do
  BEGIN
    if i mod 10 <> 0 then
    begin
      m:=i;
      s:=0;
      str(i,ss);
      k:=length(ss);
      while m<>0 do
      begin
        j:=m mod 10;
        m:=m div 10;
        s:=s+a[j+1,k];
        k:=k-1;
        if s>i then m:=0;
      end;
      if s=i then writeln(f,i);
    end;
  END;

  close(f);
  t2:=Now;
  writeln('Time ',MilliSecondsBetween(t2,t1)/1000:5:3,' s.');
  write('Program is complete');
  readln;
end.
