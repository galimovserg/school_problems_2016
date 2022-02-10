program N1;
{$APPTYPE CONSOLE}

uses
  SysUtils,
  DateUtils;

var i,n,s,max: longint;
    a,j,k,nn,c: integer;
    ss: string;
    f: text;
    t1,t2: TDateTime;
begin
  t1:=Now;
  assign(f,'in.txt');
  reset(f);
  read(f,max);
  close(f);
  assign(f,'out.txt');
  rewrite(f);

  for i:=10 to max do
  begin
    s:=0;
    str(i,ss);
    nn:=length(ss);
    for j:=1 to nn do
    begin
      val(ss[j],a,c);
      n:=1;
      for k:=1 to j do n:=n*a;
      s:=s+n;
    end;
    if s=i then writeln(f,i);
  end;

  close(f);
  t2:=Now;
  writeln('Time ',MilliSecondsBetween(t2,t1)/1000:5:3,' s.');
  write('Program is complete');
  readln;
end.
