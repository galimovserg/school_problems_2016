uses crt;
var s: string;
    i,n: integer;
    s_0,s_1: string;
    ch: char;
    f1,f2: text;

function BinaryToChar(s: string):char;
var i,j,k: byte;
begin
  i:=1;
  k:=0;
  For j:=7 DownTo 0 do
    begin
      k:=k+StrToInt(s[i]) shl j;
      i:=i+1;
    end;
  BinaryTochar:=chr(k);
end;

function x_is_y(x: char; y: string): boolean;  // проверяет, есть ли символ x в строке y
var i,j: byte;
    k: boolean;
begin
  k:=false;
  j:=length(y);
  for i:=1 to j do
    if x = y[i] then k:=true;
  x_is_y:=k;
end;

function replace(x: char): char;  // меняет русские буквы на английские
begin
  case x of
  'а': replace:='a';
  'о': replace:='o';
  'у': replace:='y';
  'е': replace:='e';
  'с': replace:='c';
  'р': replace:='p';
  'х': replace:='x';
  else replace:=x;
  end;
end;

begin
  clrscr;
  assign(f1,'input.txt');          // текст скрытого сообщения
  assign(f2,'output.txt');         // скрытое сообщение
  reset(f1);
  rewrite(f2);
  readln(f1,s_0); readln(f1,s_1);  // считываем признаки символов для нулей и единиц
  for i:=1 to length(s_0) do s_0[i]:=replace(s_0[i]);
  for i:=1 to length(s_1) do s_1[i]:=replace(s_1[i]);
  
  s:='';
  while not eof(f1) do
    begin
      read(f1,ch);
      if x_is_y(ch,s_0)=true then s:=s+'0'; 
      if x_is_y(ch,s_1)=true then s:=s+'1';
      if length(s)=8 then
        begin
         ch:=BinaryToChar(s);
         write(f2,ch);
         s:='';
        end;
   end;
  close(f1);
  close(f2);
  write('File created');
  readln;
end.