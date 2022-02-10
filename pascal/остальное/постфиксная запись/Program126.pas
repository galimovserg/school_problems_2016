Type MyType=record
       chislo:int64;
     end;
Var mas:array[-10..100000] of MyType;
    len:integer;
    b,c:MyType;
    s,s_:char;
    f:text;
procedure readst(var a:MyType);
 begin
  a.chislo:=mas[len].chislo;
 end;
procedure writest(a:MyType);
 begin

   inc(len);

   mas[len]:=a;
 end;
procedure deltest();
 begin
 if len>0 then begin
   dec(len);

  end;
 end;
begin
assignfile(f,'input.txt');
reset(f);//setlength(mas,1000);
 while not(eoln()) do begin
  read(s);
//  if len>=1000 then setlength(mas,len+5);
  case s of
  '*':begin readst(b); deltest(); readst(c); deltest(); b.chislo:=b.chislo*c.chislo; writest(b);end;
  '+':begin readst(b); deltest();readst(c);deltest(); b.chislo:=b.chislo+c.chislo; writest(b); end;
  '-':begin readst(b); deltest();readst(c);deltest(); b.chislo:=-b.chislo+c.chislo; writest(b); end;
  ' ':begin  end else
  begin
   if (ord(s)-ord('0')>=0) and (ord(s)-ord('0')<10) then begin
    if (ord(s_)-ord('0')>=0) and (ord(s_)-ord('0')<10) then begin
     readst(b);
     deltest();
     b.chislo:=b.chislo*10+(ord(s)-ord('0'));
     writest(b);
    end else begin
     b.chislo:=(ord(s)-ord('0'));
     writest(b);
    end;
   end;
  end;
  end;
  s_:=s;
 end;
 readst(b);
 close(f);
 writeln(b.chislo);
end.
