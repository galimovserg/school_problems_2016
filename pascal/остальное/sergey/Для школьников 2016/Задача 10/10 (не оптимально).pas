uses crt,dos;
var i,j,k,n,s1,s2,s3,ch: longint;
    hh,mm,ss,tt,hhh,mmm,sss,ttt: word;

function SD(x: longint): longint;
var i,j,s: longint;
begin
  j:=x div 2;
  s:=1;
  for i:=2 to j do
   if x mod i = 0 then s:=s+i;
  SD:=s;
end;

begin
  clrscr;
  write('n: '); readln(n);
  GetTime(hh,mm,ss,tt);
  for i:=1 to n-1 do
    begin
      s1:=SD(i);
      j:=i+1;
      while j<=n do
        begin
          if i<>j then s2:=SD(j) else s2:=s1;
          ch:=s1+s2;
          if (ch>i) and (ch>j) then
            begin
              s3:=SD(ch);
              if (s3+s2=i) and (s3+s1=j) and
                 (i<>j) and (i<>ch) and (j<>ch) then
                 begin
                   writeln(i,' (',s1,');  ',j,' (',s2,');  ',ch,' (',s3,')');
                   j:=n;
                 end;
            end;
          j:=j+1;
        end;
    end;
  GetTime(hhh,mmm,sss,ttt);
  writeln('Time: ',((hhh-hh)*360000+(mmm-mm)*6000+(sss-ss)*100+ttt-tt)/100:5:2,' s');
  writeln('The process is completed');
  readln;
end.