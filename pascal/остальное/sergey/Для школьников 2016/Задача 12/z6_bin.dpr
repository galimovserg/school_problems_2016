// ���������� �������� ������������� �����. ����� ������������ 8 �������� ��� ������
// 1 � �� �������, ������� ������������� �������� �������� �������. ��������������,
// ����������� � 8 ��� ������ ������, ��� ��� ������������� ����� ������������� �������
// � ����� byte. ������� ��� ����������� ������ �� ����� ��� �� TRUNC(1000 000 000 / 8)
// = 125 000 000 ��������� ���� byte - ��� ������ ����� 120 �� ������.

program z_6_bin;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var i,j,n,k,min,pos,elem,a1,a2: longint;
    s: string[8];
    f: text;
    a: array[1..125000000] of byte;

function DecimalToBinary(A: Byte): string; // ��������� ����� � �������� ������
var vrem: string;
    B: Byte;
begin
  vrem:='';
  while A>1 do begin
                 B:=A mod 2;
                 A:=A div 2;
                 if B=1 then Vrem:='1'+Vrem else Vrem:='0'+Vrem;
               end;
  if A=1 then Vrem:='1'+Vrem;
  while Length(Vrem)<8 do Vrem:='0'+Vrem; // ��������� ������ Vrem �� 8 �������� (1 ����)
  DecimalToBinary:=Vrem;
end;

function BinaryToDecimal(s: string):byte;
var i,j,k: byte;
begin
  i:=1;
  k:=0;
  For j:=7 DownTo 0 do
    begin
      k:=k+StrToInt(s[i]) shl j;
      i:=i+1;
    end;
  BinaryToDecimal:=k;
end;

begin
  for i:=1 to 125000000 do a[i]:=0; // ��������� �������� ���������
  assign(f,'input.txt');
  reset(f);

  n:=0;
  read(f,i); read(f,i);  // ���������� ����������� �������
  while not eof(f) do    //���������� ������ a
    begin
      read(f,i);
      if i>n then n:=i;  //���������� ������������ ������� �������� �������
      elem:= i div 8;    // ���� ����� �������� ������� a, ������� ����� ��������
      if i>elem*8 then   // � ���� ������ ����� ��������� �������
        begin
          inc(elem);
          pos:= i mod 8; // ������� ����� ��������� ��� �������
        end else pos:=8; // ���� ������ 8, �� ������� ���������� ����� - 8-�.

      // ������. ����� i = 34 (����� �������� ������� � ������� 34).
      // ����� elem:= i div 2 ���� 4. �� 34 > 4*8, ������� ����� elem = 5.
      // � ���� �������� ������� ���� ��������� � ������� i mod 8, �.�. � ������� 2.
      // �.�., ���� ����� ������� ��� 00000000, �� �� ������ 0100000.

      s:=DecimalToBinary(a[elem]);
      s[pos]:='1';
      a[elem]:=BinaryToDecimal(s);
    end;
  close(f);

  k:=n div 8;  // ���������, ������� ��������� � ������� <�> ������� ������������
  if n>k*8 then inc(k);

  // ���� ������ �������, �������� �� ���� - � ��� �������� ���������� � ������
  // �������� �������� �������
  n:=1;
  while a[n]=0 do inc(n);
  // ���� � ��� �������� ������ ������ ������� - ��� ����������� �������� ������� ��������
  // �������� �������
  s:=DecimalToBinary(a[n]);
  i:=1;
  while s[i]<>'1' do inc(i);
  a1:=(n-1)*8+i; // ������ ������� �������� �������

  min:=2000000000;
  for i:=n to k do   // ���� ����������� ����������
    if a[i]<>0 then  // ������������� ������ ��������� ��������
    begin
      s:=DecimalToBinary(a[i]);
      for j:=1 to 8 do
        if s[j]='1' then
          begin
            a2:=(i-1)*8+j;
            if (a2>a1) and (a2-a1<min) then min:=a2-a1;
            a1:=a2;
          end;
    end;

  // ���� ��������� ��������
  s:=DecimalToBinary(a[n]);
  i:=1;
  while s[i]<>'1' do inc(i);
  a1:=(n-1)*8+i; // ������ ������� �������� �������

  assign(f,'output.txt');
  rewrite(f);
  for i:=n to k do   // ���� ����������� ����������
    if a[i]<>0 then  // ������������� ������ ��������� ��������
    begin
      s:=DecimalToBinary(a[i]);
      for j:=1 to 8 do
        if s[j]='1' then
          begin
            a2:=(i-1)*8+j;
            if (a2-a1=min) then writeln(f,a1,'  ',a2);
            a1:=a2;
          end;
    end;
  close(f);
  
  write('Program is complete');
  readln;
end.
