{ ����� ������������ � ������� ���� ������������ �����, ��������� ��� ����
  ������ ��� �������������� �������� - �������� � ���������, ������ ��������
  ������������ ������. ����� ������ ����� ������� � ���������� ��������,
  � �� ��������� 10. ��������� ������ ����� �������� ������. ������, ������,
  STL, ����� ����������� ������� (��� ���������) ����� ������������ ������. }

program N2;

{$APPTYPE CONSOLE}

uses SysUtils, DateUtils;

var a,b: extended;
    e: byte;
    f: text;
    t1,t2: TDateTime;

{ �������� �������� ������� ������: 0.1, 0.01, 0.001 � �.�.;
  x - ������� �������: ����, ��������, x=3, �� ��������� 0.001}
function part(x: byte): extended;
var s0,s1: extended;
    i,j: byte;
begin
  s0:=1E-10;
  s1:=s0;
  for i:=1 to 10-x do
    begin
      for j:=1 to 9 do s1:=s1+s0;
      s0:=s1;
    end;
  part:=s0;
end;

{ ������� ����� ����� �� ������� ����� x �� ����� y.
  ���� ������ ���������� ������� part. ������� �������� �� ����� � ��������
  ����� y, 2y, ..., 10y. ���� ����������, �� �������� ������ 10y, 20y, ...,
  100y. ���� ����� ����������, �������� ������ 100y, 200y, ..., 1000y. �������
  ���������, ���� �� ������� ������������� ���������. ����� �������, �����
  ������������ ������ ���������� � ��� �������� (� ���������� n ����������
  ����������� �������� ����� ������). ��������, ���� x=1000 � y=3,
  �� ������� ������� sp=900, ssp=300 � n=300. ����� ����� x ��������� �� sp,
  � �� ������ ����� 100. ����� ������� ��������� �����, �������� sp=90, ssp=30
  � n=330. ����� ��������� ������� �, �������, ������� sp=9, ssp=3, n=333. }
procedure int_xy(x,y: extended; var n: extended; var xx: extended);
var i: byte;
    s0,s1,sp,ss0,ss1,ssp: extended;
begin
  n:=0;
  while x-y+1E-10>0 do // ����� 1E-10 ��������� ������ �������� ���  �����������
    BEGIN
      s0:=y;
      s1:=s0;
      ss0:=1;
      ss1:=ss0;
      while x-s0>0 do
        begin
          sp:=s0;
          ssp:=ss0;
          for i:=1 to 9 do begin
                             s1:=s1+s0;
                             ss1:=ss1+ss0;
                             if x-s1<0 then break;
                           end;
          s0:=s1;
          ss0:=ss1;
        end;
      n:=n+ssp;
      x:=x-sp;
    END;
  xx:=x;
end;

{ ����� ����� x �� ����� y � ������� z ������ ����� �������}
function division(x,y: extended; z: byte): extended;
var s,n: extended;
    k,i,j: byte;
    f: boolean;
begin
  f:=false;           // ��������� ���� ����������
  if ((x<0) and (y>0)) or ((x>0) and (y<0)) then f:=true;
  if (x<0) then x:=-x;
  if (y<0) then y:=-y;
  n:=0; k:=0;
  int_xy(x,y,n,x); // ������� ����� �����
                   // ����� ����� ����� ����� � �����:
                   // while x-y>0 do begin n:=n+1; x:=x-y; end;
                   // ������ ����� ��� ������� ��������� � ����� �����

  if x<>0 then       // ������� ������� �����
    begin
      while k<z do   // ���� �� ������ ����������� ����� ������ (��������)
      BEGIN
        j:=0; s:=x;
        // "��������" ���������� ����� ������� ����� �� 10, � ����� �������
        // �������� ��������� ������ ������� ����� ����������
        for i:=1 to 9 do x:=x+s;
        // ������� ��������� ������
        while x-y>0 do begin j:=j+1; x:=x-y; end;
        k:=k+1;
        s:=part(k);              // ������� �������, ��������, 0.00001
        for i:=1 to j do n:=n+s; // ��� ������: ���� j=4, �� ������� 0.00004
      END;
    end;
  if f=true then n:=-n;
  division:=n;
end;

begin
  t1:=Now;
  assign(f,'in.txt');
  reset(f);
  read(f,a,b,e);
  close(f);
  assign(f,'out.txt');
  rewrite(f);
  writeln(f,division(a,division(1,b,e),e));
  write(f,division(a,b,e));
  close(f);

  t2:=Now;
  writeln('Time ',MilliSecondsBetween(t2,t1)/1000:5:3,' s.');
  write('Program is complete');
  readln;
end.
