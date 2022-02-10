  var mas0,mas1:string;
            mix:string;
            itog:string;
  i,len0,len1:integer;
  ng:array[1..8] of byte;
  ch:char;
  f:text;
    function p(ch:char):char;
     begin
       case ch of
       'à': p:='a';
       'î': p:='o';
       'ê': p:='k';
       'ñ': p:='c';
       'õ': p:='x';
       'ó': p:='y';
       'ð': p:='p';
       'å': p:='e';
     end;
     end;
     function btochr(s:string):char;
      var i,sum:integer;
     begin
        sum:=0;
        for i:=1 to 8 do begin
          if s[i]='1' then  sum:=sum+ng[i];
        end;
        btochr:=chr(sum);
     end;

  begin
  assign(f,'input.txt');
  reset(f);
  ng[1]:=128;ng[2]:=64;ng[3]:=32;ng[4]:=16;ng[5]:=8;ng[6]:=4;ng[7]:=2;ng[8]:=1;
  mix:='';
  itog:='';

   readln(f,mas0);
   len0:=length(mas0);
   for i:=1 to len0 do  begin
    mas0[i]:=p(mas0[i]);
   end;
   readln(f,mas1);
   len1:=length(mas1);
    for i:=1 to len1 do  begin
    mas1[i]:=p(mas1[i]);
   end;
   writeln(mas0);
   writeln(mas1);
    while not eof(f) do begin
       read(f,ch);

       for i:=1 to len0 do  begin
         if ch=mas0[i] then begin
            mix:=mix+'0'; writeln(mix);
            if length(mix)>7 then begin itog:=itog+btochr(mix);mix:='';   end;
         end;
       end;
        for i:=1 to len1 do  begin
         if ch=mas1[i] then begin
            mix:=mix+'1'; writeln(mix);
            if length(mix)>7 then begin itog:=itog+btochr(mix); mix:='';  end;
         end;
       end;
    end;
    close(f);
    assign(f,'output.txt');
    rewrite(f);

    writeln(f,itog);
    close(f);
  end.