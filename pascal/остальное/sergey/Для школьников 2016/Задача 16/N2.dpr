{ Найти произведение и частное двух вещественных чисел, используя при этом
  только два арифметических действия - сложение и вычитание, другие действия
  использовать нельзя. Число знаков после запятой в результате задается,
  и не превышает 10. Результат должен иметь числовой формат. Строки, списки,
  STL, любые стандартные функции (или процедуры) языка использовать нельзя. }

program N2;

{$APPTYPE CONSOLE}

uses SysUtils, DateUtils;

var a,b: extended;
    e: byte;
    f: text;
    t1,t2: TDateTime;

{ Получает заданный дробный разряд: 0.1, 0.01, 0.001 и т.д.;
  x - порядок разряда: если, например, x=3, то результат 0.001}
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

{ Находит целую часть от деления числа x на число y.
  Идея работы аналогична функции part. Сначала пытаемся от числа х отнимать
  числа y, 2y, ..., 10y. Если отнимается, то пытаемся отнять 10y, 20y, ...,
  100y. Если опять отнимается, пытаемся отнять 100y, 200y, ..., 1000y. Процесс
  повторяем, пока не получим отрицательный результат. Таким образом, узнаём
  максимальный разряд результата и его значение (в переменную n записываем
  параллельно значения целых частей). Например, если x=1000 и y=3,
  то сначала получим sp=900, ssp=300 и n=300. После этого x уменьшаем на sp,
  и он станет равен 100. Затем процесс повторяем снова, получаем sp=90, ssp=30
  и n=330. Снова повторяем процесс и, наконец, находим sp=9, ssp=3, n=333. }
procedure int_xy(x,y: extended; var n: extended; var xx: extended);
var i: byte;
    s0,s1,sp,ss0,ss1,ssp: extended;
begin
  n:=0;
  while x-y+1E-10>0 do // здесь 1E-10 учитывает потерю точности при  вычислениях
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

{ Делит число x на число y с выводом z знаков после запятой}
function division(x,y: extended; z: byte): extended;
var s,n: extended;
    k,i,j: byte;
    f: boolean;
begin
  f:=false;           // учитывает знак результата
  if ((x<0) and (y>0)) or ((x>0) and (y<0)) then f:=true;
  if (x<0) then x:=-x;
  if (y<0) then y:=-y;
  n:=0; k:=0;
  int_xy(x,y,n,x); // находим целую часть
                   // целую часть можно найти и проще:
                   // while x-y>0 do begin n:=n+1; x:=x-y; end;
                   // однако такой код гораздо медленнее и менее точен

  if x<>0 then       // находим дробную часть
    begin
      while k<z do   // пока не вывели необходимое число знаков (разрядов)
      BEGIN
        j:=0; s:=x;
        // "умножаем" оставшуюся часть первого числа на 10, и таким образом
        // получаем очередной разряд дробной части результата
        for i:=1 to 9 do x:=x+s;
        // находим очередной разряд
        while x-y>0 do begin j:=j+1; x:=x-y; end;
        k:=k+1;
        s:=part(k);              // порядок разряда, например, 0.00001
        for i:=1 to j do n:=n+s; // сам разряд: если j=4, то получим 0.00004
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
