{ќѕ“»ћјЋ№Ќџ… по скорости вариант, дл€ лучшей оптимизации
 нужно использовать динамический массив}

uses crt,dos;
var i,j,k,n,s1,s2,s3,ch: longint;
    a: array[1..1000000] of longint;
    hh,mm,ss,tt,hhh,mmm,sss,ttt: word;
    f: Text;

function SD(x: longint): longint;
var i,j,s: longint;
    f: boolean;
begin
  j:=trunc(sqrt(x));
  if j*j=x then f:=true else f:=false; // если полный квадрат - true
  s:=1;
  for i:=2 to j do
    if x mod i = 0 then begin s:=s+i; s:=s+trunc(x/i); end;
  if f=true then s:=s-j; //исключаем двойной учет делител€: например,
                         //если x=100, то j=10 и поэтому 10 войдет как
                         //делитель 100 два раза - как j и как x/j.
  SD:=s;
end;

begin
  clrscr;
  write('n: '); readln(n);
  Assign(f,'c:\1.txt');
  Rewrite(f);
  GetTime(hh,mm,ss,tt);
  for i:=1 to n do a[i]:=SD(i);

  for i:=1 to n-1 do
    begin
      s1:=a[i];
      j:=i+1;
      while j<=n do
        begin
          s2:=a[j];
          ch:=s1+s2;
          if (ch>i) and (ch>j) and (ch<=n) then
            begin
              s3:=a[ch];
              if (s3+s2=i) and (s3+s1=j) and
                 (i<>j) and (i<>ch) and (j<>ch) then
                 begin
                   writeln(f,i,'  ',j,'  ',ch);
                   j:=n;
                 end;
            end;
          j:=j+1;
        end;
    end;
  Close(f);
  GetTime(hhh,mmm,sss,ttt);
  writeln('Time: ',((hhh-hh)*360000+(mmm-mm)*6000+(sss-ss)*100+ttt-tt)/100:5:2,' s');
  writeln('The process is completed');
  readln;
end.