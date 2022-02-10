   var n,m,i,j:integer;
   map:array[1..300,1..300] of boolean;
   ch:char;
   f:text;
    procedure pivo(i,j:integer);
    var
    begin
    
    
    end;
   begin
      readln(n,m);
       for i:=1 to m do begin
           for j:=1 to n do begin
            read(ch);
            if ch='0' then map[i,j]:=false else   map[i,j]:=true;
           end;
       end;
        for i:=1 to m do begin
            for j:=1 to n do begin
                if mas[i,j] then pivo(i,j);
            end;
        end;
      for i:=1 to m do begin
          for j:=1 to n do begin
              if r
          end;
       end;
   
   end.