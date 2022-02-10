const free=-1;//значение свободнай клетки
      wall=-2;//значение препятсвия
      way=-3;//и наконец значение пути
var
p:array[0..50,0..50] of integer;//поле
c:char;//символ пригодится при вводе данных
n,//размер поля
i1,i2,count,//счетчики
x1,x2:integer;//координаты 
f:boolean;//определяет конец
begin

//вводим размер
readln(n);
//чтобы не было выхода за границу надо раставить препятствия
for i1:=0 to n+1 do begin
 for i2:=0 to n+1 do begin
   p[i1,i2]:=wall;
 end;
end;
//заносим карту в p
for i1:=1 to n do begin
 for i2:=1 to n do begin
 read(c);//ввод посимвольный
 if c='.' then p[i1,i2]:=free else //если . то клетка свободная
 if c='@' then p[i1,i2]:=0 else //если @ то это начальное положение
 if c='O' then p[i1,i2]:=wall //если O то ставим препятствие то есть значение wall
 else begin p[i1,i2]:=free;x1:=i1;x2:=i2  end;// остается только клетка с конечным положением сохраним координаты пусть клетка будет free
 end;
 readln();
end;

//если free и соседняя count то данная клетка становиться count+1 )
count:=0;//шагаем от нолика
 repeat
 f:=false;
 for i1:=1 to n do
 for i2:=1 to n do begin
  if (p[i1,i2]=free)and((p[i1-1,i2]=count)or(p[i1+1,i2]=count)or(p[i1,i2+1]=count)or(p[i1,i2-1]=count)) then begin
  f:=true;
  p[i1,i2]:=count+1;
  end;
  
 end;
 inc(count);//увеличиваем count на 1
 
 

 until f=false;//если пустых не оказалось то завершаем
 
if p[x1,x2]=free then begin writeln('N'); halt; end else writeln('Y');//если начальная клетка осталась свободной, то выводим N и завершаем работу

i1:=x1;
i2:=x2;
while not(p[i1,i2]=0) do begin
  count:=p[i1,i2];
  p[i1,i2]:=way;
  if p[i1-1,i2]=count-1 then i1:=i1-1 else
  if p[i1+1,i2]=count-1 then i1:=i1+1 else
  if p[i1,i2-1]=count-1 then i2:=i2-1 else
  if p[i1,i2+1]=count-1 then i2:=i2+1;
 
 
  
end;

//временно проверочка :)надо убрать
writeln(x1,' ',x2);
for var il1:=1 to n do begin
for var il2:=1 to n do 
if p[il1,il2]=way then write('+') else
if p[il1,il2]=wall then write('#') else 
if p[il1,il2]=0 then write('@') else write('.');

writeln;
end;

end.