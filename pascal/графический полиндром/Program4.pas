    const w=600;
          h=200;
   var mas:array[1..h,1..w] of boolean;
       wt:array[1..w] of boolean;//есть ли в этом столбце 1
       i,j,x,y,dx,dy:integer;
       r,g,b:integer;
       t1,t2,i1,coordt1,coordt2,coordt3,coordt4:integer;
             coordi1,coordi2,coordi3,coordi4:integer;
             f:text;
             c1,c2:integer;
    label 1,2,3,4,5,6;

   begin
   assign(f,'xxx.txt');
   reset(f);
   for i:=1 to w do wt[i]:=false;
   
      for i:=1 to h do begin
          for j:=1 to w do begin
           read(f,r,g,b);
           if (r=255) and (g=255) and (b=255) then begin
              mas[i,j]:=false;
           end else begin
              mas[i,j]:=true;
              wt[j]:=true;
           end;
           
          end;
      end;
      t1:=1;
      t2:=w;
      {будем выделять крайние области и сравнивать их между собой
      если они равны ищим следущие крайние иначе выводим 'no'
      }
    while t1<t2 do
     begin

        i1:=1;
      while  not(wt[t1]) do inc(t1);
        coordt1:=t1;

      while wt[t1] do inc(t1);
        coordt2:=t1-1;
      for i1:=1 to h do begin
        for i:=coordt1 to coordt2 do
        if mas[i1,i] then  goto 2;
      end;
      2:
       coordi1:=i1;
       
        for i1:=h downto 1 do begin
        for i:=coordt1 to coordt2 do
        if mas[i1,i] then  goto 3;
      end;
      3:
       coordi2:=i1;
         i1:=1;
      while  not(wt[t2]) do dec(t2);
        coordt4:=t2;
      while wt[t2] do dec(t2);
        coordt3:=t2+1;

          for i1:=1 to h do begin
        for i:=coordt3 to coordt4 do
        if mas[i1,i] then  goto 4;
      end;
      4:
       coordi3:=i1;

        for i1:=h downto 1 do begin
         for i:=coordt3 to coordt4 do
          if mas[i1,i] then  goto 5;
        end;
      5:
       coordi4:=i1;
       {
       если размеры выделенных областей совпадают тогда выводим 'no' иначе
       проверяем на равенство
       }
          if (coordt2-coordt1=coordt4-coordt3)and(coordi2-coordi1=coordi4-coordi3) then begin 
             dy:=coordt3-coordt1;
             dx:=coordi3-coordi1;
             for x:=coordt1 to coordt2 do begin
                 for y:=coordi1 to coordi2 do begin
                   if mas[y,x]=mas[y+dx,x+dy] then begin


                   end else begin writeln('No'); goto 1;  end;
                 end;
             end;
          
          
          end else begin
           writeln('No');
            goto 1;
          end;
 {       writeln(' coordt1= ',coordt1,' coordi1= ',coordi1,' coordt2= ',coordt2,' coordi2= ',coordi2);
        writeln(' coordt3= ',coordt3,' coordi3= ',coordi3,' coordt4= ',coordt4,' coordi4= ',coordi4);
      }
     end;

     writeln('yes');
     
      1:
      
      close(f);
      readln();
   end.