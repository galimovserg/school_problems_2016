uses
  system.IO, System,crt;

var
  n, i, j, t, st, dlen, len, lnmask, c, pos, lenitog: integer;
  mask, s: string;
  
  pofmask, itog: array[0..10000] of string;
  files := Directory.GetFiles({E(ParamStr(0))+'/fille/'}'D:\\Delphi7', '*', SearchOption.AllDirectories);

label 1, 2, 3;
begin
  
  mask := Console.ReadLine();
  //readln(mask);//вводим маску
  dlen := 0;//длина маски
  //разбиваем маску по частям
  c := 1;//способ проверки
  len := 0; //количество частей
  lenitog := 0;
  if mask[1] = '*' then c := 0 else begin pofmask[len] := mask[1];inc(dlen); end;
  for i := 2 to length(mask) do 
  begin
    if (mask[i] = '*') then begin if (not (mask[i - 1] = '*')) then inc(len)end else
    begin pofmask[len] := pofmask[len] + mask[i];inc(dlen); end;
  end;
  lnmask := length(mask);
  
  for i := 0 to files.Length - 1 do 
  begin
    s := ExtractFileName(files[i]);{считываем слово} 
    if length(s) < dlen then goto 1;{если длина маски больше то это имя не подходит}
    t := 0;
    {если начало маски не со * то первая часть должна притсутствовать с самого начала}
    if c = 1 then begin
      for t := 1 to length(pofmask[0]) do 
      begin
        if pofmask[0][t] = '?' then else if s[t] = pofmask[0][t] then else goto 1;
      end;
      if len = 0 then if length(s) = length(pofmask[0]) then else goto 1;
    end; 
    for j := c to len do 
    begin//перебираем все части маски поочереди
      for pos := t to length(s) - length(pofmask[j]) do 
      begin//перебор позиций
        for st := 1 to length(pofmask[j]) do 
        begin
          if pofmask[j][st] = '?' then else if s[pos + st] = pofmask[j][st] then else goto 2;
        end;
        t := pos + st; 
        goto 3;
        2: 
      end;
      
      goto 1;
      3: 
    end;
    if (mask[lnmask] = '*') then
    begin inc(lenitog);itog[lenitog] := s; end else 
    begin
      for st := 1 to length(pofmask[len]) do 
      begin
        if pofmask[len][st] = '?' then else if s[length(s) - length(pofmask[len]) + st] = pofmask[len][st] then else goto 1;
      end;
      inc(lenitog);itog[lenitog] := s;
    end;
    1: 
  end;
  
  Console.WriteLine('___________________________________');
  for i := 1 to lenitog do
   Console.WriteLine(itog[i]); //writeln(itog[i]);
  Console.ReadKey;
end.