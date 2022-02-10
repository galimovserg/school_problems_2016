uses system.IO;
var
   i, j, t, st, dlen, len, lnmask, c, pos: integer;
  mask, s: string;
  pofmask: array[0..1000] of string;
 
label 1, 2, 3;
begin
  readln(s);
  readln(mask);//вводим маску
  dlen := 0;//длина маски
  //разбиваем маску по частям
  c := 1;//способ проверки
  len := 0; //количество частей
  
  if mask[1] = '*' then c := 0 else begin pofmask[len] := mask[1]; inc(dlen); end;
  for i := 2 to length(mask) do 
  begin
    if (mask[i] = '*') then begin if (not (mask[i - 1] = '*')) then inc(len)end else
    begin pofmask[len] := pofmask[len] + mask[i]; inc(dlen); end;
  end;
  lnmask := length(mask);
  

    if length(s) < dlen then begin writeln('NO');goto 1; end;{если длина маски больше то это имя не подходит}
    t := 0;
    {если начало маски не со * то первая часть должна притсутствовать с самого начала}
    if c = 1 then begin
    
      for t := 1 to length(pofmask[0]) do 
      begin
        if pofmask[0][t] = '?' then  else begin if s[t] = pofmask[0][t] then else begin writeln('NO'); goto 1; end; end;
      end;
      
      if len=0 then if length(s)=length(pofmask[0]) then  else begin writeln('NO'); goto 1; end;
    end; 
    for j := c to len do 
    begin//перебираем все части маски поочереди
      for pos := t to length(s) - length(pofmask[j]) do 
      begin//перебор позиций
        for st := 1 to length(pofmask[j]) do 
        begin
          if pofmask[j][st] = '?' then else if s[pos + st] = pofmask[j][st] then else begin  goto 2;end;
        end;
        t := pos + st; 
        goto 3;       
        2:
      end;
      writeln('NO');
      goto 1;
      3: 
    end;
    if (mask[lnmask] = '*') then
    begin writeln('YES'); end else 
    begin
      for st := 1 to length(pofmask[len]) do 
      begin
        if pofmask[len][st] = '?' then else if s[length(s) - length(pofmask[len]) + st] = pofmask[len][st] then else begin writeln('NO'); goto 1 end;
      end;
      writeln('YES');
    end;
    1: 
  
  
end.