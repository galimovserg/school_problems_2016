//пример программы которая использует "байтовое сжатие"
//например: сколько различных чисел встречаются в массиве?
//данн массив с положительными числами не превышающие 8 млрд, конец ввода -1.
//колличество элементов не превышает 1 млрд
const n=1000000001;
var mas2:array[0..n] of byte;//основной массив
    mad:array[0..255,0..7] of boolean;//таблица перевода 1(для чтения)
    mad2:array[0..255,0..7] of byte;//таблица перевода 2(для записи)
  
    zdiv,zmod:int64;
    
    i,mn,count:int64;

procedure deltes();
 var i,j,m:int64;
     step:array[0..7] of byte;//степени 2-ки
 begin
{//По мере надобности
 for i:=1 to n do 
   mas2[i]:=0;}  
 for i:=0 to 255 do 
  for j:=0 to 7 do   mad[i,j]:=false;
 //расчитываем степени сразу чтобы не расчитывать их 1 млрд раз
 step[0]:=1;
 for j:=1 to 7 do
   step[j]:=step[j-1]*2;
 for i:=0 to 255 do begin
  for j:=0 to 7 do begin
  if i+step[j]<256 then
    mad2[i,j]:=i+step[j];
  end;
 end;
 //также сразу построим таблицу перевода числа в двоичном формате
 for i:=0 to 255 do begin
   m:=i;
   for j:=0 to 7 do begin
    if m mod 2=1 then
    mad[i,j]:=true;
    m:=m div 2;
   end;
 end; 
end;

//чтение элемента из массива
function reads():boolean;
 begin
  reads:=mad[mas2[zdiv],zmod];
 end;

//запись элемента в массив
procedure writes();
 begin
   mas2[zdiv]:=mad2[mas2[zdiv],zmod];
 end;
begin
  deltes;//подготовим массивы 
  writeln('ok');
  count:=0;
  read(mn);
  while not(mn=-1) do begin
  //если числа еще небыло то увеличиваем счетчик count и отмечаем что элемент есть
   zmod:=(mn and 7); zdiv:=mn -zmod;
   if reads()=false then begin 
   inc(count);
   writes(); end;
   read(mn);
  end;
 
  writeln(count);
end.