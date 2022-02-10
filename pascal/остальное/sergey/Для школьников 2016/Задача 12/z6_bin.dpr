// Используем бинарное представление числа. Будем использовать 8 разрядов для записи
// 1 в те позиции, которые соответствуют значению элемента массива. Соответственно,
// потребуется в 8 раз меньше памяти, чем при использовании файла произвольного доступа
// с типом byte. Поэтому нам потребуется массив не более чем из TRUNC(1000 000 000 / 8)
// = 125 000 000 элементов типа byte - это займет около 120 Мб памяти.

program z_6_bin;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var i,j,n,k,min,pos,elem,a1,a2: longint;
    s: string[8];
    f: text;
    a: array[1..125000000] of byte;

function DecimalToBinary(A: Byte): string; // переводит число в двоичный формат
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
  while Length(Vrem)<8 do Vrem:='0'+Vrem; // Дополняем строку Vrem до 8 символов (1 байт)
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
  for i:=1 to 125000000 do a[i]:=0; // начальные значения элементов
  assign(f,'input.txt');
  reset(f);

  n:=0;
  read(f,i); read(f,i);  // пропускаем размерность массива
  while not eof(f) do    // формируем массив a
    begin
      read(f,i);
      if i>n then n:=i;  //запоминаем максимальный элемент входного массива
      elem:= i div 8;    // ищем номер элемента массива a, который нужно изменять
      if i>elem*8 then   // в этом случае нужен следующий элемент
        begin
          inc(elem);
          pos:= i mod 8; // позиция цифры находится как остаток
        end else pos:=8; // если кратно 8, то позиция изменяемой цифры - 8-я.

      // Пример. Пусть i = 34 (нужно записать единицу в позицию 34).
      // Тогда elem:= i div 2 даст 4. Но 34 > 4*8, поэтому берем elem = 5.
      // В этом элементе единицу надо поставить в позицию i mod 8, т.е. в позицию 2.
      // Т.о., если пятый элемент был 00000000, то он станет 0100000.

      s:=DecimalToBinary(a[elem]);
      s[pos]:='1';
      a[elem]:=BinaryToDecimal(s);
    end;
  close(f);

  k:=n div 8;  // вычисляем, сколько элементов в массиве <а> реально использовано
  if n>k*8 then inc(k);

  // ищем первый элемент, отличный от нуля - в нем хранится информация о первом
  // элементе входного массива
  n:=1;
  while a[n]=0 do inc(n);
  // ищем в его двоичной записи первую единицу - она определеяет значение первого элемента
  // входного массива
  s:=DecimalToBinary(a[n]);
  i:=1;
  while s[i]<>'1' do inc(i);
  a1:=(n-1)*8+i; // первый элемент входного массива

  min:=2000000000;
  for i:=n to k do   // ищем минимальное расстояние
    if a[i]<>0 then  // рассматриваем только ненулевые элементы
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

  // ищем ближайшие элементы
  s:=DecimalToBinary(a[n]);
  i:=1;
  while s[i]<>'1' do inc(i);
  a1:=(n-1)*8+i; // первый элемент входного массива

  assign(f,'output.txt');
  rewrite(f);
  for i:=n to k do   // ищем минимальное расстояние
    if a[i]<>0 then  // рассматриваем только ненулевые элементы
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
