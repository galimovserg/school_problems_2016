program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  eps=10e-16;
type
  mst = record //���-������ ��� �������� ����������
    vip: array[0..100] of Extended;//������������
    len: int64;//����� ����������
  end;

var
  a, b: mst;
  x: extended;
  lili,j,i:integer;
  bimm1,bimm2:array[0..1001] of extended;
  lenbimm1,lenbimm2:integer;
{____________________________________________________}
function sign(x:extended):extended;
begin
 if x<0 then sign:=-1 else
 if x>0 then sign:=1 else
 sign:=0;
end;
  {������� ����������}
procedure deltemas(var ms: mst);
var
  i: integer;
begin
  for i := 0 to ms.len do ms.vip[i] := 0;
  ms.len := 0;
end;
  {����� �����������}
procedure summa(m1, m2: mst; var mas: mst);
var
  i: integer;
begin
  deltemas(mas);
  if m1.len > m2.len then mas.len := m1.len else mas.len := m2.len;
  for i := 0 to mas.len do
  begin
    mas.vip[i] := m1.vip[i] + m2.vip[i];
  end;
end;
  {������������ �����������}
procedure prozv(m1, m2: mst; var mas: mst);
var
  i, j: integer;
begin
  deltemas(mas);
  for i := 0 to m1.len do
    for j := 0 to m2.len do
    begin
      mas.vip[i + j] := mas.vip[i + j] + m1.vip[i] * m2.vip[j];
    end;
  mas.len := m1.len + m2.len;
end;
  {����� ����������}
procedure writemcl(var mas: mst);
var
  i, beginv: integer;
label 3;
begin
  beginv := 0;
  for i := mas.len downto 0 do
    if mas.vip[i] <> 0 then begin
      if mas.vip[i] < 0 then begin write('-');beginv := 1; end else begin if beginv > 0 then write('+') else beginv := 1; end;
      if (Abs(mas.vip[i]) = 1) and (i > 0) then else write(Abs(mas.vip[i]):2:3);
      if i > 1 then write('x^', i) else if i = 1 then write('x');
    end;
  for i := 0 to mas.len do if mas.vip[i] <> 0 then goto 3;
  write('0');
  3: writeln('');
end;
  {������ ����������}
procedure readmcl(var mas: mst);
var
  i: integer;
  stepen, c, znak, plusst, drob: int64;
  chislo, drch: extended;
  s: string;
label 1;
begin
  drob := 0;
  deltemas(mas);//������� ���������
  Readln(s);//��������� ������
  if (Length(s) = 1) and (s[1] = '0') then begin goto 1 end;//������� ���� 0
  chislo := 0;//�����������
  drch := 0.1;
  c := 1;//��������� �����������
  znak := 1;//���� ������������
  plusst := 0;//���� ������� (�������� ��������� 12x^2 ���� plusst=0 � 12x plusst=1)
  stepen := 0;//�������
  for i := 1 to Length(s) do //�������� ��� �������
    if s[i] = ' ' then else//���� ������ �� �������� ����
    if s[i] = 'x' then begin//���� x �� �������� ��������� �� ���������� �������
      c := 2;//��������� �������
      plusst := 1;//������� ����� 1
      if chislo = 0 then chislo := 1;//���� ����� ��� �� ������ ����=1
    end else
    if s[i] = '^' then begin//������� ����
      plusst := 0;//�������� ��
    end else
    if (s[i] = '+') or (s[i] = '-') then begin//���� ���� ��������
      drch := 0.1;
      drob := 0;
      stepen := stepen + plusst;
      mas.vip[stepen] := mas.vip[stepen] + znak * chislo;// ���������� � ����������
      if s[i] = '+' then znak := 1 else znak := -1;
      if mas.len < stepen then mas.len := stepen;//���������� ����� ����������(����������)
      stepen := 0;//�������� ���������
      chislo := 0;
      plusst := 0;
      c := 1;//��������� �����������
    end else
    begin//�����
      if c = 1 then begin//���� ��������� �����
        if s[i] = '.' then begin drob := 1; end else if drob = 0 then
          chislo := chislo * 10 + Ord(s[i]) - Ord('0') else begin
          chislo := chislo + drch * (Ord(s[i]) - Ord('0'));
          drch := drch * 0.1;
        end;
      end else begin//���� ��������� �������
        stepen := stepen * 10 + Ord(s[i]) - Ord('0');
      end;
    end;
  stepen := stepen + plusst;//���������� ��������� ��������� ����
  mas.vip[stepen] := mas.vip[stepen] + znak * chislo;
  if mas.len < stepen then mas.len := stepen;
  1:
end;
  {������������ �������� ���������� � �������� �������� ���������� x}
function fmcl(var mas: mst; x: extended): extended;
var
  res, itog: extended;
  i: integer;
begin
  res := 1;itog := 0;
  for i := 0 to mas.len do
  begin
    if Abs(itog)<1e200 then begin
     itog := itog + res * mas.vip[i];
      res := res * x;
    end;
  end;
  fmcl := itog;
end;

function binmcl(var mas:mst;a,b:extended;var len:integer):extended;
var q,z:extended;
begin

  if sign(fmcl(mas,a))*sign(fmcl(mas,b))<=0 then begin
   q:=sign(fmcl(mas,a));
   z:=a;
  while abs(a-b)>=eps do begin
    z:=(a+b)/2;
   // writeln(a,' and ',fmcl(mas,z),' and ',b);
    if fmcl(mas,z)*q>=0 then a:=z else  b:=z;
  end;

  len:=1;
  binmcl:=z;

  end else begin len:=0; binmcl:=0 end;
end;
  {������������� ����� ����������}
procedure lenmcl(var mas: mst);
var
  i: integer;
begin
  for i := 100 downto 0 do
  begin
    if abs(mas.vip[i] )>= eps then begin
      mas.len := i;
      break;
    end;
  end;
end;
  {���������� � mas2 ����������� ���������� mas1}
procedure pmcl(mas1:mst; var mas2: mst;n:integer);
var
  i,j: integer;
begin
  deltemas(mas2);
  if n=0 then mas2:=mas1;
 for j:=1 to n do begin
 deltemas(mas2);
   for i := 0 to mas1.len - 1 do
    begin
      mas2.vip[i] := mas1.vip[i + 1] * (i + 1);
    end;
  lenmcl(mas2);
  mas1:=mas2;
 end;

end;

{____________________________________________________}
begin
  readmcl(a);//��������� ��������� 1
  {for i:=1 to 5 do begin
    readmcl(b);
    prozv(a,b,a);
    writemcl(a);
   end; }

  for j:=a.len-1 downto 0 do begin
   deltemas(b);
   pmcl(a,b,j);
   writemcl(b);
   lenmcl(b);
   lenbimm2:=0;
   bimm1[0]:=-10e20;
   bimm1[lenbimm1+1]:=10e20;
     for i:=1 to lenbimm1+1 do begin
       writeln('--see interval: ',bimm1[i-1],' ',bimm1[i]);
      x:=binmcl(b,bimm1[i-1],bimm1[i],lili);
        writeln('---foward  l= ',lili);
      writeln('---foward x= ',x,' f(x)= ',fmcl(b,x));
       if Abs(fmcl(b,x))<0.000000001 then
      if (lili>0)or(Abs(fmcl(b,x))<0.000000001) then begin
       lenbimm2:=lenbimm2+1;
       bimm2[lenbimm2]:=x;
      end;

     end;
       Readln;
     bimm1:=bimm2;
     lenbimm1:=lenbimm2;
      writeln('-------------------------------');
       bimm1[0]:=-10e20;
      for i:=1 to lenbimm1 do
       if abs(bimm1[i-1]-bimm1[i])>eps then
           writeln(bimm1[i]:0:6);
     writeln('-------------------------------');
  end;
   {  writeln('-------------------------------');
      for i:=1 to lenbimm1 do
       writeln(bimm1[i]:0:5);
     writeln('-------------------------------');   }
   Readln;

end.
