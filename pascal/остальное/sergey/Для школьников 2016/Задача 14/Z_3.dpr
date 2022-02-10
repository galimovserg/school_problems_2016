program Z_3;

{$APPTYPE CONSOLE}

uses
  SysUtils,DateUtils;

var i,j,l,nx,ny,nz: byte;
    a: array[0..255,0..255,0..255] of longint;
    R,G,B: byte;
    n1,n2: integer;
    k,m,max: longint;
    t1,t2: TDateTime;
    f: text;

begin
  t1:=Now;

  for i:=0 to 255 do         // обнуляем массив a
    for j:=0 to 255 do
      for l:=0 to 255 do a[i,j,l]:=0;

  assign(f,'input.txt');
  reset(f);
  read(f,n1); read(f,n2);  // считываем размер "изображения"

  m:=n1*n2;
  k:=1;
  while k<=m do      // считываем значения "цветов" точек и сразу
    begin                  // подсчитываем их количество
      read(f,R);
      read(f,G);
      read(f,B);
      a[R,G,B]:=a[R,G,B]+1;
      k:=k+1;
    end;
  close(f);

  max:=0;
  nx:=0; ny:=0; nz:=0;

  for i:=0 to 255 do         // определяем "цвет" точек, которых в "изображении" больше
    for j:=0 to 255 do       // всего - для этого ищем максимальное значение в массиве a
      for l:=0 to 255 do
        if a[i,j,l]>max then      // нашли новый максимум
          begin                   
            max:=a[i,j,l];
            nx:=i; ny:=j; nz:=l;  // запоминаем "цвет" точки
          end;

  assign(f,'output.txt');
  rewrite(f);
  writeln(f,max);         // выводим максимальное количество точек одинакового цвета
  for i:=0 to 255 do      // ищем точки, цвет которых больше всего встречается,
    for j:=0 to 255 do    // т.к. может быть несколько цветов, встречающихся max раз
      for l:=0 to 255 do
        if a[i,j,l]=max then writeln(f,i,' ',j,' ',l);
  close(f);

  t2:=Now;
  writeln('Time ',MilliSecondsBetween(t2,t1)/1000:5:3,' s.');
  write('Program is complete');
  readln;
end.
