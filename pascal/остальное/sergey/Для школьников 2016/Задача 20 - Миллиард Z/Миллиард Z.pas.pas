Uses Crt;
Type Struct = Record
       x,y: Longint;
       ch: Char;
     End;

Var a: array[1..1000] of Struct;
    b: array[1..2001] of Struct;
    d: array[1..2000] of Longint;
    flag: array[1..1000] of Boolean;
    i,j,h,m,n: Integer;
    k: Longint;
    f1,f2: Text;

begin
  ClrScr;
  assign(f1,'In.txt');
  assign(f2,'Out.txt');
  reset(f1);
  rewrite(f2);
  readln(f1,n);
  for i:=1 to n do
    Readln(f1,a[i].ch,a[i].x,a[i].y);
  close(f1);

  {Заполняем временный массив d координатами концов отрезков}
  i:=1;
  For j:=1 to n do
    begin
      d[i]:=a[j].x;
      d[i+1]:=a[j].y;
      i:=i+2;
    end;

  {Сортируем временный массив d по возрастанию}
  for i:=1 to 2*n do
    for j:=1 to 2*n do
      if d[i]<d[j] then begin
                          k:=d[i]; d[i]:=d[j]; d[j]:=k;
                        end;

  {Формируем базовый массив b размером 2N+1, путем разбиения
   на интервалы согласно координатам в отсортированном массиве d}
  b[1].ch:='Z';
  b[1].x:=1;
  b[1].y:=d[1];
  for i:=2 to 2*n do
    begin
      b[i].ch:='Z';
      b[i].x:=d[i-1];
      b[i].y:=d[i];
    end;
  b[i+1].ch:='Z';
  b[i+1].x:=d[i];
  b[i+1].y:=2000000000;

  {----- Выводим промежуточные значения -----}
  writeln('--- Отсортированный массив интервалов:'+#13);
  for i:=1 to 2*n do
    write(d[i],'  ');
  writeln;
  writeln;
  writeln('--- Базовые интервалы (массив b):'+#13);
  for i:=1 to 2*n+1 do
    writeln(b[i].ch,'  ',b[i].x,'  ',b[i].y);
  writeln;
  {------------------------------------------}

  {Заполняем массив b отрезками из массива a, т.е. заполняем
   интервалы массива b согласно размерам отрезков массива a}
  j:=1;
  for i:=1 to n do
    begin
      while a[i].x<>b[j].x do j:=j+1; {... пока не нашли очередной интервал}
      {как нашли - заполняем, пока не достигнем конца отрезка массива a}
      while b[j].y<=a[i].y do begin
                               b[j].ch:=a[i].ch;
                               j:=j+1;
                             end;
      j:=1;
    end;

  {----- Выводим промежуточные значения -----}
  writeln;
  writeln;
  writeln('--- Конечные интервалы (массив b):'+#13);
  for i:=1 to 2*n+1 do
    writeln(b[i].ch,'  ',b[i].x,'  ',b[i].y);
  writeln;
  {------------------------------------------}

  {Ищем оставшиеся буквенные интервалы}
  j:=0;
  for i:=1 to 2*n+1 do
    begin
      m:=0;
      for k:=1 to n do
        if (b[i].ch=a[k].ch) and (flag[k]=false) and (b[i].ch<>'Z') then
          begin
            m:=m+1;
            for h:=1 to n do {исключаем одинаковые буквы}
              if a[h].ch=a[k].ch then flag[k]:=true;
          end;
      if m<>0 then j:=j+1;
    end;

  {Проверяем, не осталось ли интервала с буквой Z}
  m:=0;
  for i:=1 to 2*n+1 do
    if b[i].ch='Z' then begin
                          m:=m+1;
                          break;
                        end;
  if m<>0 then j:=j+1;

  write(f2,j);
  write('->: ',j);
  readln;

  close(f2);
end.
