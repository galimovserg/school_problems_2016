program balls;

var
  mass: array[1..15, 1..15] of integer;
  r: array[1..15, 1..15] of integer;
  fin, fout: text;
  a: string;
  i, t, n, h, u, d, maxr, maxr2: integer;

label 1;

begin

  assign(fin, 'balls2.in');
  assign(fout, 'balls2.out');
  reset(fin);
  rewrite(fout);
  readln(fin, n);
  
  for i := 2 to n + 1 do 
  begin
    readln(fin, a);
    for t := 2 to n + 1 do 
    begin
      case a[t - 1] of 
        'r': mass[i, t] := 1;
        'g': mass[i, t] := 2;
        'b': mass[i, t] := 3;
        'y': mass[i, t] := 4;
        'v': mass[i, t] := 5;
      end;
    end;
  end;
  
  for d := 1 to 5 do 
  begin
    for i := 2 to n + 1 do
    begin
      for t := 2 to n + 1 do 
      begin
        if mass[i, t] = d then
          r[i, t] := 1;
      end;
    end;
    
    repeat
      
      i := 1;
      t := 1;
      
      for i := 2 to n + 1 do
      begin
        for t := 2 to n + 1 do
        begin
          if r[i, t] = 1 then
          begin
            goto 1;
          end;
        end;
      end;
      
      1:
      
      if (r[i, t] = 1) then
      begin
        r[i, t] := 2;
        
        for u := 1 to n * n do
        begin
          for i := 2 to n + 1 do 
          begin
            for t := 2 to n + 1 do 
            begin
              if r[i, t] = 1 then begin
                if (r[i, t + 1] = 2) or (r[i, t - 1] = 2) or (r[i + 1, t] = 2) or (r[i - 1, t] = 2) then 
                begin
                  r[i, t] := 2;
                end;
              end;
            end;
          end; 
        end;
      end;
      
      h := 0;
      
      for i := 2 to n + 1 do
      begin
        for t := 2 to n + 1 do 
        begin
          if r[i, t] = 1 then
          begin
            h := h + 1;
          end else
          if r[i, t] = 2 then
          begin
            maxr := maxr + 1;
            r[i, t] := 0;
          end;
        end;
      end;
      if maxr > maxr2 then begin
        maxr2 := maxr;
      end;
      maxr := 0;
    until h = 0;
    case d of 
      1: writeln(fout, 'r: ', maxr2 * (maxr2 - 1));
      2: writeln(fout, 'g: ', maxr2 * (maxr2 - 1));
      3: writeln(fout, 'b: ', maxr2 * (maxr2 - 1));
      4: writeln(fout, 'y: ', maxr2 * (maxr2 - 1));
      5: writeln(fout, 'v: ', maxr2 * (maxr2 - 1));
    end;
    maxr2 := 0;
  end;
  close(fin);
  close(fout);
   
end.