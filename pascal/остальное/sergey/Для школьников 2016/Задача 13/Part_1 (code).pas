uses crt;
var s: array[1..10000] of char;
    i,j,k,n,a: integer;
    st,s_0,s_1: string;
    ch: char;
    flag: boolean;  // ����������, ����� ������, ����������� �� ��������� � ����
    f1,f2: text;

function CharToBinary(x: char): string;
var vrem: string;
    A,B: Byte;
begin
  vrem:='';
  A:=ord(x);
  while A>1 do begin
                 B:=A mod 2;
                 A:=A div 2;
                 if B=1 then Vrem:='1'+Vrem else Vrem:='0'+Vrem;
               end;
  if A=1 then Vrem:='1'+Vrem;
  while Length(Vrem)<8 do Vrem:='0'+Vrem;
  CharToBinary:=Vrem;
end;

function x_is_y(x: char; y: string): boolean;  // ���������, ���� �� ������ x � ������ y
var i,j: byte;
    k: boolean;
begin
  k:=false;
  j:=length(y);
  for i:=1 to j do
    if x = y[i] then k:=true;
  x_is_y:=k;
end;

function replace(x: char): char;  // ������ ������� ����� �� ����������
begin
  case x of
  '�': replace:='a';
  '�': replace:='o';
  '�': replace:='y';
  '�': replace:='e';
  '�': replace:='c';
  '�': replace:='p';
  '�': replace:='x';
  else replace:=x;
  end;
end;

begin
  clrscr;
  randomize;
  write('The likelihood of missing symbol: '); // ����������� �������� ������� (0% - 100%)
  readln(a);
  assign(f1,'message.txt');        // ����� �������� ���������
  reset(f1);
  readln(f1,s_0); readln(f1,s_1);  // ��������� �������� �������� ��� ����� � ������
  i:=1;
  while not eof(f1) do
    begin
      read(f1,s[i]);
      i:=i+1;
    end;
  close(f1);
  n:=i-1;
  
  assign(f1,'text.txt');      // �����, � ������� ����� ������� ���������
  assign(f2,'input.txt');     // ����� �� ������� ���������� 
  reset(f1);
  rewrite(f2);
  writeln(f2,s_0);
  writeln(f2,s_1);

  for j:=1 to n do  // �������� ������� ��������� � �����
    BEGIN
      st:=CharToBinary(s[j]);
      k:=1;
      flag:=false;
      while (k<=8) and (not eof(f1)) do
        begin
          read(f1,ch);
          if ( ((st[k]='0') and (x_is_y(ch,s_0)=true)) or
               ((st[k]='1') and (x_is_y(ch,s_1)=true)) ) and
             (random(100)+1>=a) then   // ����������, ����� �������� �� ��� ������
            begin                      // ����� � ���������� ����������
              ch:=replace(ch);
              k:=k+1;
            end;
          write(f2,ch);
          flag:=true;
        end;
    END;
  
  while not eof(f1) do  // ���������� ��������� ������� �����
    begin
      read(f1,ch);
      write(f2,ch);
    end;
  
  if flag=false then
    begin
      close(f2);
      rewrite(f2);
      write(f2,'������ ���������� ���������');
    end;
  
  close(f1);
  close(f2);
  write('File created');
  readln;
end.