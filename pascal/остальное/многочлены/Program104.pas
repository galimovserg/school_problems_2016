program mnogochlen;
{программа преднозначена для работы с мнгочленами.}
{Galimov Sergey 11B}
const 
  eps=10e-10;
type
  mst = record //тип-запись для хранения многочлена
    vip: array[0..1000] of double;//коэффициенты
    len: int64;//длина многочлена 
  end;

var
  a, b: mst;
  x: double;
  lili,j,i:integer;
  bimm1,bimm2:array[0..1001] of double;
  lenbimm1,lenbimm2:integer;
{____________________________________________________}
function sign(x:double):double;
begin
 if x<0 then sign:=-1 else
 if x>0 then sign:=1 else
 sign:=0;
end;
  {очистка многочлена}
procedure deltemas(var ms: mst);
var
  i: int64;
begin
  for i := 0 to ms.len do ms.vip[i] := 0;
  ms.len := 0;
end;
  {сумма многочленов}
procedure summa(m1, m2: mst; var mas: mst);
var
  i: int64;
begin
  deltemas(mas);
  if m1.len > m2.len then mas.len := m1.len else mas.len := m2.len;
  for i := 0 to mas.len do 
  begin
    mas.vip[i] := m1.vip[i] + m2.vip[i];
  end;
end;
  {произведение многочленов}
procedure prozv(m1, m2: mst; var mas: mst);
var
  i, j: int64;
begin
  deltemas(mas);
  for i := 0 to m1.len do
    for j := 0 to m2.len do 
    begin
      mas.vip[i + j] := mas.vip[i + j] + m1.vip[i] * m2.vip[j]; 
    end;
  mas.len := m1.len + m2.len;
end;
  {вывод многочлена} 
procedure writemcl(var mas: mst);
var
  i, beginv: int64;
label 3;
begin
  beginv := 0;
  for i := mas.len downto 0 do 
    if mas.vip[i] <> 0 then begin
      if mas.vip[i] < 0 then begin write('-');beginv := 1; end else begin if beginv > 0 then write('+') else beginv := 1; end;
      if (Abs(mas.vip[i]) = 1) and (i > 0) then else write(Abs(mas.vip[i]));
      if i > 1 then write('x^', i) else if i = 1 then write('x');
    end;
  for i := 0 to mas.len do if mas.vip[i] <> 0 then goto 3;
  write(0);
  3: writeln;
end;
  {чтение многочлена} 
procedure readmcl(var mas: mst);
var
  i: int64;
  stepen, c, znak, plusst, drob: int64;
  chislo, drch: double;
  s: string;
label 1;
begin
  drob := 0; 
  deltemas(mas);//обнулим многочлен
  Readln(s);//считываем строку
  if (Length(s) = 1) and (s[1] = '0') then begin goto 1 end;//выходим если 0
  chislo := 0;//коэффициент
  drch := 0.1;
  c := 1;//считываем коэффициент
  znak := 1;//знак коэффициента
  plusst := 0;//флаг степени (например выражение 12x^2 даст plusst=0 а 12x plusst=1)
  stepen := 0;//степень
  for i := 1 to Length(s) do //проходим все символы
    if s[i] = ' ' then else//если пробел то проходим мимо
    if s[i] = 'x' then begin//если x то изменяем параметры на считывание степени
      c := 2;//считываем степень
      plusst := 1;//степень равна 1
      if chislo = 0 then chislo := 1;//если числа нет то просто коэф=1
    end else 
    if s[i] = '^' then begin//степень есть
      plusst := 0;//обнуляем ее
    end else
    if (s[i] = '+') or (s[i] = '-') then begin//если знак операции
      drch := 0.1;
      drob := 0;
      stepen := stepen + plusst;
      mas.vip[stepen] := mas.vip[stepen] + znak * chislo;// прибавляем к многочлену
      if s[i] = '+' then znak := 1 else znak := -1; 
      if mas.len < stepen then mas.len := stepen;//определяем длину результата(многочлена)
      stepen := 0;//обнуляем параметры
      chislo := 0;
      plusst := 0;
      c := 1;//считываем коэффициент
    end else
    begin//иначе 
      if c = 1 then begin//если считываем число
        if s[i] = '.' then begin drob := 1; end else if drob = 0 then
          chislo := chislo * 10 + Ord(s[i]) - Ord('0') else begin
          chislo := chislo + drch * (Ord(s[i]) - Ord('0'));
          drch := drch * 0.1;
        end;
      end else begin//если считываем степень
        stepen := stepen * 10 + Ord(s[i]) - Ord('0');
      end;
    end;
  stepen := stepen + plusst;//незабываем прибавить последний член
  mas.vip[stepen] := mas.vip[stepen] + znak * chislo; 
  if mas.len < stepen then mas.len := stepen;
  1: 
end;
  {просчитываем значение многочлена в заданном значении переменной x}
function fmcl(var mas: mst; x: double): double;
var
  res, itog: double;
  i: integer;
begin
 if abs(x)<=1e10 then begin
  res := 1;itog := 0;
  for i := 0 to mas.len do 
  begin
 
    itog := itog + res * mas.vip[i];
    res := res * x;
  end;
  fmcl := itog; 
 end else begin
   if x<0 then fmcl:=fmcl(mas,1e10) else
               fmcl:=fmcl(mas,-1e10);
 end;
end;
  
function binmcl(var mas:mst;a,b:double;var len:integer):double;
var q,z:double;
begin
  
  if sign(fmcl(mas,a))*sign(fmcl(mas,b))<=0 then begin
     q:=sign(fmcl(mas,a));
  while abs(a-b)>=eps do begin
    z:=(a+b)/2;
    writeln('двоичный поиск ',z);
    if fmcl(mas,z)*q<=0 then a:=z else b:=z;
  end; 
  len:=1;
  binmcl:=z;
  end else len:=0;
end;
  {пересчитывает длину многочлена}
procedure lenmcl(var mas: mst);
var
  i: integer;
begin
  for i := 1000 downto 0 do 
  begin
    if abs(mas.vip[i] )> eps then begin
      mas.len := i;
      break;
    end;
  end;
end;
  {записываем в mas2 производную многочлена mas1}
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
  readmcl(a);//считываем многочлен 1
 
  for j:=a.len-1 downto 0 do begin
   deltemas(b);
   pmcl(a,b,j);
                                write('производная № ',j,' равна : ');
                                writemcl(b);
   lenmcl(b);
   lenbimm2:=0;
   bimm1[0]:=-10e10;
   bimm1[lenbimm1+1]:=10e10;
     for i:=1 to lenbimm1+1 do begin
      writeln('--рассматриваю интервал ',bimm1[i-1],' ',bimm1[i]);
      x:=binmcl(b,bimm1[i-1],bimm1[i],lili);
      writeln('---возвращаемое значение l= ',lili);
      writeln('---возвращаемое значение x= ',x,' f(x)= ',fmcl(b,x));
      if abs(x)<eps then x:=0;
      if lili>0 then begin
       lenbimm2:=lenbimm2+1;
       bimm2[lenbimm2]:=x;
      end;
      
     end;
        bimm1:=bimm2;
        lenbimm1:=lenbimm2;
      writeln('--к-о-р-н-и--м-н-о-г-о-ч-л-е-н-а');
      writeln('количество ',lenbimm1);
      for i:=1 to lenbimm1 do
       writeln(bimm1[i]);
     writeln('-------------------------------'); 
  end;
     writeln('--к-о-р-н-и--м-н-о-г-о-ч-л-е-н-а');
      for i:=1 to lenbimm1 do
       writeln(bimm1[i]);
     writeln('-------------------------------');
end.