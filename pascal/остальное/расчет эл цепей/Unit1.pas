unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Menus, ExtCtrls,Math, jpeg;

type
  TForm1 = class(TForm)
    lbl4: TLabel;
    stat1: TStatusBar;
    mm1: TMainMenu;
    menu1: TMenuItem;
    delete1: TMenuItem;
    exit1: TMenuItem;
    dlgOpen1: TOpenDialog;
    dlgSave1: TSaveDialog;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    pnl4: TPanel;
    tbc1: TTabControl;
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl5: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    btn2: TButton;
    edt3: TEdit;
    btn3: TButton;
    btn1: TButton;
    edt4: TEdit;
    btn5: TButton;
    btn11: TButton;
    pnl2: TPanel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    btn6: TButton;
    btn7: TButton;
    btn8: TButton;
    btn9: TButton;
    edt5: TEdit;
    edt6: TEdit;
    btn10: TButton;
    edt7: TEdit;
    edt8: TEdit;
    pnl3: TPanel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    edt9: TEdit;
    edt10: TEdit;
    edt11: TEdit;
    edt12: TEdit;
    btn12: TButton;
    edt13: TEdit;
    mmo: TMemo;
    pnl5: TPanel;
    mmo1: TMemo;
    btn4: TButton;
    pnl6: TPanel;
    edt14: TEdit;
    edt15: TEdit;
    edt16: TEdit;
    edt17: TEdit;
    edt18: TEdit;
    btn13: TButton;
    edt19: TEdit;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    N8: TMenuItem;
    N9: TMenuItem;
    btn14: TButton;
    N10: TMenuItem;
    pnl7: TPanel;
    pnl8: TPanel;
    btn15: TButton;
    edt20: TEdit;
    edt21: TEdit;
    lbl21: TLabel;
    btn16: TButton;
    edt22: TEdit;
    edt23: TEdit;
    lbl22: TLabel;
    edt24: TEdit;
    edt25: TEdit;
    lbl23: TLabel;
    edt26: TEdit;
    lbl24: TLabel;
    pb2: TImage;
    tmr1: TTimer;
    lbl25: TLabel;
    lbl26: TLabel;
    lbl27: TLabel;
    lbl28: TLabel;
    pb1: TPaintBox;
    procedure FormClick(Sender: TObject);
    procedure exit1Click(Sender: TObject);
    procedure delete1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure tbc1Change(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormPaint(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure btn13Click(Sender: TObject);
    procedure btn12Click(Sender: TObject);
    procedure btn14Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure btn15Click(Sender: TObject);
    procedure btn16Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure N9Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
   nb1,ne1, nb2,ne2,i,HG,nb:Integer;
    xs1,xs2,dx,dy,ymaximum,yminimum,y:Real;
    ms:array[0..500] of Real;
  Form1: TForm1;
  n,nbgn:Integer;
  cl1,cl2,cl3:TColor;
  ste1,ste2,ste3:Integer;
  mas,mas2:array[1..250,1..250] of real;
  masx,masy,mascount,masdeik:array[1..250] of Integer;
  miny,minx,maxy,maxx:Integer;
   pusts:array[1..250] of Byte;
   f:text;
   x1,y1,psr:Integer;
   ive,ftr:Integer;
   lensoed:Integer;
   soed:array[1..3,1..250] of Integer;//1 и 2 начало и конец, 3 тип присоединения
   rsoed1,rsoed2:Real;
   play:Byte;//1-простая цепь ,2-бесконечная цепь    и тд
   bt:TBitmap;
implementation

uses About, Unit2, Unit3;

{$R *.dfm}
  procedure drawsspsr();
    begin
     with Form1 do begin

       lbl25.Caption:=FloatToStr(ymaximum);
       lbl26.Caption:=FloatToStr(yminimum);
       lbl27.Caption:=FloatToStr(xs1);
       lbl28.Caption:=FloatToStr(xs2);
       pb1.Canvas.Brush.Color:=clWhite;
       pb1.Canvas.Rectangle(-1,-1,pb1.width+10,pb1.Height+10);

       pb1.Canvas.Pen.Color:=clBlack;
       pb1.Canvas.Pen.Width:=2;
       edt26.Text:=FloatToStr(dy);
    if dy>1e-10 then
    for i:=0 to hg-1 do begin
       pb1.Canvas.MoveTo(i,pb1.Height-trunc(pb1.Height*(ms[i]- yminimum)/dy));
       pb1.Canvas.LineTo(i+1,pb1.Height-trunc(pb1.Height*(ms[i+1]- yminimum)/dy));
    end;
    lbl25.Visible:=False;
    lbl25.Visible:=True;
    lbl26.Visible:=False;
    lbl26.Visible:=True;
    lbl25.Caption:=FloatToStr(ymaximum);
    lbl26.Caption:=FloatToStr(yminimum);
    lbl27.Caption:=FloatToStr(xs1);
    lbl28.Caption:=FloatToStr(xs2);
    end; end;
  procedure deik(n1:integer);
  var i:Integer;
  begin
   masdeik[n1]:=1;
   for i:=1 to n do begin
     if mas[n1,i]>-9 then begin
        if masdeik[i]=0 then deik(i);
     end;
   end;

  end;
  procedure deltes(k1,k2:Integer);
  begin
    mas[k1,k2]:=-10;
    mas[k2,k1]:=-10;
  end;

  procedure oks2(g1,g2,g3,g4:Integer);
     var fw,i,j,count:Integer;

   begin
     fw:=1;
     while fw=1 do begin
      fw:=0;
      for i:=1 to n do if not(i=g3)and not(i=g4) then begin
        if not(i=g1)and not(i=g2)   then begin
            count:=0;
        for j:=1 to n do  begin
          if not(mas[i,j]=-10)  then begin
            inc(count);
            mascount[count]:=j;
          end;
        end;
        if count=2 then begin
         if not((mascount[1]=g3)and (mascount[2]=g4))and not((mascount[2]=g3)and (mascount[1]=g4))
         then begin
         fw:=1;
         if (mas[mascount[1],mascount[2]]=-10) then begin
            mas[mascount[1],mascount[2]]:=mas[mascount[1],i]+mas[mascount[2],i];
             mas[mascount[2],mascount[1]]:=mas[mascount[1],i]+mas[mascount[2],i];
         end else begin if mas[mascount[1],i]+mas[mascount[2],i]+mas[mascount[1],mascount[2]]>0  then begin

            mas[mascount[1],mascount[2]]:=(mas[mascount[1],i]+mas[mascount[2],i])*mas[mascount[1],mascount[2]]/((mas[mascount[1],i]+mas[mascount[2],i])+mas[mascount[1],mascount[2]]);
            mas[mascount[2],mascount[1]]:=mas[mascount[1],mascount[2]];
               end else begin
                  mas[mascount[2],mascount[1]]:=0;
                  mas[mascount[1],mascount[2]]:=0;
               end;
         end;
           mas[mascount[1],i]:=-10;
           mas[mascount[2],i]:=-10;
           mas[i,mascount[1]]:=-10;
           mas[i,mascount[2]]:=-10;
        end;
        end else if count=1 then begin
          fw:=1;
           mas[mascount[1],i]:=-10;
           mas[i,mascount[1]]:=-10;
        end;
        end;
      end;

     end;
   end;


  procedure oks(g1,g2:integer);
     var fw,n1,n2,count,i,j,jk,m,stp:Integer;
     masd:array[1..3] of Integer;
     r1,r2,r3:Real;
     lenmasd:Integer;
    label 1;
  begin
    n1:=g1; n2:=g2; stp:=1;
     1:
      fw:=1;
   while fw=1 do begin //убираем последовательные и параллельные соединения
      fw:=0;
      for i:=1 to n do begin
        if not(i=n1)and not(i=n2)  then begin
            count:=0;
        for j:=1 to n do begin
          if not(mas[i,j]=-10)  then begin
            inc(count);
            mascount[count]:=j;
          end;
        end;
        if count=2 then begin
         fw:=1;
         if mas[mascount[1],mascount[2]]=-10 then begin
            mas[mascount[1],mascount[2]]:=mas[mascount[1],i]+mas[mascount[2],i];
             mas[mascount[2],mascount[1]]:=mas[mascount[1],i]+mas[mascount[2],i];
         end else begin if mas[mascount[1],i]+mas[mascount[2],i]+mas[mascount[1],mascount[2]]>0  then begin

            mas[mascount[1],mascount[2]]:=(mas[mascount[1],i]+mas[mascount[2],i])*mas[mascount[1],mascount[2]]/((mas[mascount[1],i]+mas[mascount[2],i])+mas[mascount[1],mascount[2]]);
            mas[mascount[2],mascount[1]]:=mas[mascount[1],mascount[2]];
               end else begin
                  mas[mascount[2],mascount[1]]:=0;
                  mas[mascount[1],mascount[2]]:=0;
               end;
         end;
           mas[mascount[1],i]:=-10;
           mas[mascount[2],i]:=-10;
           mas[i,mascount[1]]:=-10;
           mas[i,mascount[2]]:=-10;
        end else if count=1 then begin
          fw:=1;
           mas[mascount[1],i]:=-10;
           mas[i,mascount[1]]:=-10;
        end;
        end;
      end;
   end;
   count:=0;//считаем оставшиеся узлы
   for i:=1 to n do
    for j:=1 to n do
       if mas[i,j]>-9 then inc(count);

     if (count<=2) then begin  //если всего осталось  2 узла
        rsoed1:=mas[n1,n2] ;
     end else begin
       m:=n;
       if stp=1 then begin //ищем треугольники
      for i:=1 to m do begin
        for j:=1 to m do begin
             if mas[i,j]>-9 then begin
            for jk:=1 to m do begin
              if (mas[i,jk]>-9)and(mas[j,jk]>-9) then begin
                 inc(n);
                 if (mas[i,j]+mas[i,jk]+mas[j,jk])>0 then begin
                 mas[i,n]:=mas[i,j]*mas[i,jk]/(mas[i,j]+mas[i,jk]+mas[j,jk]);
                 mas[n,i]:=mas[i,n];
                 mas[j,n]:=mas[i,j]*mas[j,jk]/(mas[i,j]+mas[i,jk]+mas[j,jk]);
                 mas[n,j]:=mas[j,n];
                 mas[jk,n]:=mas[jk,j]*mas[i,jk]/(mas[i,j]+mas[i,jk]+mas[j,jk]);
                 mas[n,jk]:=mas[jk,n];
                 end else begin
                     mas[n,i]:=0;
                     mas[i,n]:=0;
                     mas[n,j]:=0;
                     mas[j,n]:=0;
                     mas[n,jk]:=0;
                     mas[jk,n]:=0;
                 end;
                 deltes(i,jk);
                 deltes(i,j);
                 deltes(j,jk);
                 masx[n]:=(masx[j]+masx[i]+masx[jk]) div 3;
                 masy[n]:=(masy[j]+masy[i]+masy[jk]) div 3;
                 goto 1;
              end;
            end;
          end;
        end;
       end;
        stp:=2;
        goto 1;
      end else if stp=2 then   //ищем звездочки
      begin
        for i:=1 to m do begin
        lenmasd:=0;
        if not(i=n1)and not(i=n2) then begin
        for j:=1 to m do begin
             if mas[i,j]>-9 then begin
              Inc(lenmasd);
              if lenmasd<=3 then
              masd[lenmasd]:=j;
          end;
        end;
        if lenmasd=3 then begin
               if mas[masd[1],masd[2]]>-9 then begin

                  if mas[masd[3],i]>0 then begin
                  r1:=mas[masd[1],i]+mas[masd[2],i]+mas[masd[1],i]*mas[masd[2],i]/mas[masd[3],i];
                  mas[masd[1],masd[2]]:=r1*mas[masd[1],masd[2]]/(r1+mas[masd[1],masd[2]]);
                  mas[masd[2],masd[1]]:=mas[masd[1],masd[2]];
                  end;
               end else
                  if mas[masd[3],i]>0 then begin
                  r1:=mas[masd[1],i]+mas[masd[2],i]+mas[masd[1],i]*mas[masd[2],i]/mas[masd[3],i];
                  mas[masd[1],masd[2]]:=r1;
                  mas[masd[2],masd[1]]:=mas[masd[1],masd[2]];
                  end;


               if mas[masd[1],masd[3]]>-9 then begin

                  if mas[masd[2],i]>0 then begin
                  r1:=mas[masd[1],i]+mas[masd[3],i]+mas[masd[1],i]*mas[masd[3],i]/mas[masd[2],i];
                  mas[masd[1],masd[3]]:=r1*mas[masd[1],masd[3]]/(r1+mas[masd[1],masd[3]]);
                  mas[masd[3],masd[1]]:=mas[masd[1],masd[3]];
                  end;
                end else
                  if mas[masd[2],i]>0 then begin
                  r1:=mas[masd[1],i]+mas[masd[3],i]+mas[masd[1],i]*mas[masd[3],i]/mas[masd[2],i];
                  mas[masd[1],masd[3]]:=r1;
                  mas[masd[3],masd[1]]:=mas[masd[1],masd[3]];
                  end;

                 if mas[masd[2],masd[3]]>-9 then begin

                  if mas[masd[1],i]>0 then begin
                   r1:=mas[masd[2],i]+mas[masd[3],i]+mas[masd[2],i]*mas[masd[3],i]/mas[masd[1],i];
                   mas[masd[2],masd[3]]:=r1*mas[masd[2],masd[3]]/(r1+mas[masd[2],masd[3]]);
                   mas[masd[3],masd[2]]:=mas[masd[2],masd[3]];
                  end;
                 end else begin

                   if mas[masd[1],i]>0 then begin
                    r1:=mas[masd[2],i]+mas[masd[3],i]+mas[masd[2],i]*mas[masd[3],i]/mas[masd[1],i];
                    mas[masd[2],masd[3]]:=r1;
                    mas[masd[3],masd[2]]:=mas[masd[2],masd[3]];
                   end
                 end;
                  deltes(i,masd[1]);
                  deltes(i,masd[2]);
                  deltes(i,masd[3]);
                 goto 1;
              end;
        end;
      end;
        stp:=1; goto 1;
     end;
   end;
  end;

 procedure drawss(xbm,ybm,xem,yem:integer);
   var i,j,x0,y0:Integer;
   tgr,tgs:Real;
 begin
   with Form1 do begin
      bt.Canvas.Pen.Color:=cl1;
      bt.Canvas.Brush.Color:=cl1;

      bt.Canvas.Rectangle(xbm,ybm,xem,yem);
      bt.Canvas.Pen.Color:=cl2;
  for i:=1 to n do  begin

    for j:=i to n do  begin

      if mas[i,j]>=0  then begin
         //mmo1.Lines.Add(IntToStr(i)+'-'+inttostr(j)+'=='+floattostr(mas[i,j]));
        bt.Canvas.MoveTo(masx[i],masy[i]);
        bt.Canvas.LineTo(masx[j],masy[j]);
        bt.Canvas.Font.Color:=RGB(250,1,2);

        bt.Canvas.Pen.Width:=10;
        bt.Canvas.Pen.Color:=RGB(0,0,0);
        if  mas[i,j]>0 then   begin
         x0:= (masx[i]+masx[j])div 2 ;
         y0:=  (masy[j]+masy[i])div 2 ;

        if masx[i]-masx[j]<>0 then begin
          tgr:=((masy[i]-masy[j])/(masx[i]-masx[j]));
           tgs:=12/sqrt(1+tgr*tgr);
          bt.Canvas.MoveTo(Trunc(x0-tgs),Trunc(y0-tgr*tgs));
          bt.Canvas.LineTo(Trunc(x0+tgs),Trunc(y0+tgr*tgs));
              //Canvas.Brush.Style := bsClear;
              if tgr=0 then
        bt.Canvas.TextOut(x0-10,y0-20,FloatToStr(Trunc(mas[i,j]*100)/100)+'ом') else
        bt.Canvas.TextOut(x0+10,y0-10,FloatToStr(Trunc(mas[i,j]*100)/100)+'ом') ;
       // Canvas.Brush.Style := bsSolid;
        end  else begin
           bt.Canvas.MoveTo(x0,y0-12);
           bt.Canvas.LineTo(x0,y0+12);
            //Canvas.Brush.Style := bsClear;
        bt.Canvas.TextOut(x0+10,y0-10,FloatToStr(Trunc(mas[i,j]*100)/100)+'ом');
       // Canvas.Brush.Style := bsSolid;
        end;

       end;
       bt.Canvas.Pen.Width:=ste2;
        bt.Canvas.Pen.Color:=cl2;
      end;
    end;
    bt.Canvas.Font.Color:=RGB(0,0,0);

   bt.Canvas.Ellipse(masx[i]-4,masy[i]-4,masx[i]+4,masy[i]+4);
  // Canvas.Brush.Style := bsClear;
  //Canvas.Brush.Style := bsSolid;
   bt.Canvas.TextOut(masx[i],masy[i]-23,inttostr(i));
   //
  end;
    if play=2 then begin
     for i:=1 to lensoed do begin
        if soed[3,i]>0 then begin
         bt.Canvas.Pen.Color:=cl3 ;
         bt.Canvas.MoveTo(0,0);
         bt.Canvas.LineTo(0,0);
         bt.Canvas.MoveTo(masx[soed[1,i]],masy[soed[1,i]]);
         bt.Canvas.LineTo(masx[soed[2,i]],masy[soed[2,i]]);
         bt.Canvas.Pen.Color:=cl2 ;
        end;
     end;

    end;
       Canvas.Draw(0,0,bt);

   end;

  end;
procedure TForm1.FormClick(Sender: TObject);
var m:TPoint;
i,minx,miny,maxx,maxy:Integer;
begin

   GetCursorPos(m);
   m:=Form1.ScreenToClient(m);
   if ftr=1 then begin
   ftr:=0;
   masx[ive]:=m.X;
   masy[ive]:=m.Y;
    for i:=1 to n do begin
      if mas[ive,i]>-9 then begin
        if Abs(masx[i]-masx[ive])<20 then begin
         masx[ive]:=masx[i];
        end else
         if Abs(masy[i]-masy[ive])<20 then begin
         masy[ive]:=masy[i];
        end;
      end;
    end;
     minx:=masx[ive]; miny:=masy[ive];
     maxx:=masx[ive]; maxy:=masy[ive];
     for i:=1 to n do begin
        if mas[ive,i]>-1 then begin
         if masx[i]>maxx then maxx:=masx[i];
         if masy[i]>maxy then maxy:=masy[i];
         if masx[i]<minx then minx:=masx[i];
         if masy[i]<miny then miny:=masy[i];
        end;
     end;
     drawss(minx,miny,maxx,maxy);

   end else begin

   for i:=1 to n do
    if Sqrt(sqr(masx[i]-m.X)+sqr(masy[i]-m.Y))<=20 then begin
      ive:=i; ftr:=1;
           Break;

    end;

    if ftr=0 then begin
      inc(n);
      masx[n]:=m.X; masy[n]:=m.Y;
     Canvas.Font.Color:=RGB(0,0,0);
     Canvas.Ellipse(masx[n]-4,masy[n]-4,masx[n]+4,masy[n]+4);
     Canvas.TextOut(m.x,m.Y-23,inttostr(n));

     stat1.SimpleText:='всего '+ inttostr(n);
   end;

end;
end;
procedure TForm1.exit1Click(Sender: TObject);
begin
Close;
end;

procedure TForm1.delete1Click(Sender: TObject);
var i,j:Integer;
begin
  lensoed:=0;
Canvas.Rectangle(-10,-10,9000,9000);
 for i:=1 to n do
    for j:=1 to n do
       mas[i,j]:=-10;
n:=0; stat1.SimpleText:='';
end;

procedure TForm1.btn2Click(Sender: TObject);
var n1,n2:Integer;
    r:Real;
begin
  Canvas.Font.Color:=RGB(250,2,2);
   n1:=StrToInt(edt1.text);
   n2:=StrToInt(edt2.text);
   r:=StrToFloat(edt3.Text);
   Canvas.Pen.Color:=cl2 ;
   Canvas.MoveTo(0,0);
   Canvas.LineTo(0,0);


   Canvas.MoveTo(masx[n2],masy[n2]);
   Canvas.LineTo(masx[n1],masy[n1]);
   if mas[n1,n2]=-10 then begin
   mas[n1,n2]:=r;
   mas[n2,n1]:=r;
   Canvas.TextOut((masx[n1]+masx[n2])div 2,(masy[n1]+masy[n2])div 2-20,FloatToStr(Trunc(r*100)/100)+'ом_');
   end else if mas[n1,n2]>0 then begin
    r:=r*mas[n1,n2]/(r+mas[n1,n2]) ;
    Canvas.TextOut((masx[n1]+masx[n2])div 2,(masy[n1]+masy[n2])div 2-20,FloatToStr(Trunc(r*100)/100)+'ом_');
    mas[n1,n2]:=r;
    mas[n2,n1]:=r;
    end else
   Canvas.TextOut((masx[n1]+masx[n2])div 2,(masy[n1]+masy[n2])div 2-20,FloatToStr(0)+'ом_');

   end;

procedure TForm1.FormCreate(Sender: TObject);
   var i,j:Integer;
begin
  bt:=TBitmap.Create;
  bt.Width:=Form1.Width;
  bt.Height:=Form1.Height;
  psr:=0;
  Form1.DoubleBuffered:=True;
  if not FileExists(ExtractFileDir(Application.ExeName)+'\seting.inc')  then begin
    AssignFile(f,ExtractFileDir(Application.ExeName)+'\seting.inc');
    Rewrite(f);
    cl1:=RGB(254,254,254);cl2:=RGB(0,0,254);cl3:=RGB(0,254,0);
    ste1:=10; ste2:=2; ste3:=1;
    Writeln(f,cl1);  Writeln(f,cl2);  Writeln(f,cl3);
    Writeln(f,ste1); Writeln(f,ste2); Writeln(f,ste3);
      CloseFile(f);
  end else begin
    AssignFile(f,ExtractFileDir(Application.ExeName)+'\seting.inc');
    reset(f);
    readln(f,cl1);  readln(f,cl2);  readln(f,cl3);
    readln(f,ste1); readln(f,ste2); readln(f,ste3);
     CloseFile(f);

  end;
  pnl4.Top:=Form1.ClientHeight- pnl4.Height-30;
  pnl5.Top:=Form1.ClientHeight-pnl5.Height-30;
  pnl8.Height:=pnl4.Top+1;
  play:=1;
  bt.Canvas.Font.Size:=ste1;
  bt.Canvas.Pen.Color:=cl2;
  bt.Canvas.Pen.Width:=ste2;
for i:=1 to 200 do
  for j:=1 to 200 do begin
   mas[i,j]:=-10;
   mas2[i,j]:=-10;
   end;
   Form1.Canvas.Draw(0,0,bt);

end;

procedure TForm1.btn3Click(Sender: TObject);
var n1,n2,fw,count,i,j,jk,m,i5,i6,fst,fst2,typer,kl,stp:Integer;
     masd:array[1..3] of Integer;
     r1,r2,r3:Real;
     lenmasd:Integer;
    label 1,2;
begin
  mmo1.Lines.Clear;
  mmo1.Lines.Add('сводка действий');
  stp:=1;
  nbgn:=n;
  mas2:=mas;
  for i:=1 to n do begin
   masdeik[i]:=0;
  end;

  typer:=0;
  kl:=0;
  n1:=StrToInt(edt1.Text);
  n2:=StrToInt(edt2.Text);
    deik(n1);
  if masdeik[n2]=1 then begin
  1:
    fw:=1;
   while fw=1 do begin //убираем последовательные и параллельные соединения
      fw:=0;
      for i:=1 to n do if masdeik[i]=1 then begin
        if not(i=n1)and not(i=n2) then begin
        count:=0;
        for j:=1 to n do begin
          if not(mas[i,j]=-10)  then begin

            inc(count);
            mascount[count]:=j;

          end;

        end;
        if count=2 then begin

         fw:=1;
         if mas[mascount[1],mascount[2]]=-10 then begin
             mas[mascount[1],mascount[2]]:=mas[mascount[1],i]+mas[mascount[2],i];
             mas[mascount[2],mascount[1]]:=mas[mascount[1],i]+mas[mascount[2],i];
             mmo1.Lines.Add('------------------------------------------------------------');
             mmo1.Lines.Add('соединение '+ IntToStr(mascount[1])+' - '+inttostr(i)+' - '+ IntToStr(mascount[2])+' последовательное');
          kl:=0;   mmo1.Lines.Add('    заменено на '+ IntToStr(mascount[1])+'-'+IntToStr(mascount[2]));
         end else begin if mas[mascount[1],i]+mas[mascount[2],i]+mas[mascount[1],mascount[2]]>0  then begin
                  kl:=0;
                  mas[mascount[1],mascount[2]]:=(mas[mascount[1],i]+mas[mascount[2],i])*mas[mascount[1],mascount[2]]/((mas[mascount[1],i]+mas[mascount[2],i])+mas[mascount[1],mascount[2]]);
                  mas[mascount[2],mascount[1]]:=mas[mascount[1],mascount[2]];
               end else begin
                  mas[mascount[2],mascount[1]]:=0;
                  mas[mascount[1],mascount[2]]:=0;
               end;
               mmo1.Lines.Add('------------------------------------------------------------');
               mmo1.Lines.Add('соединение '+ IntToStr(mascount[1])+' - '+inttostr(i)+' - '+ IntToStr(mascount[2])+' последовательное');
               mmo1.Lines.Add('    и паралельна к '+ IntToStr(mascount[1])+'-'+IntToStr(mascount[2]));
               mmo1.Lines.Add('    заменено на '+ IntToStr(mascount[1])+'-'+IntToStr(mascount[2]));
         end;

           mas[mascount[1],i]:=-10;
           mas[mascount[2],i]:=-10;
           mas[i,mascount[1]]:=-10;
           mas[i,mascount[2]]:=-10;
           drawss(-10,-10,Form1.Width,Form1.Height);
           sleep(StrToInt(edt4.Text));
        end else if count=1 then begin
          fw:=1;
            kl:=0;
           mas[mascount[1],i]:=-10;
           mas[i,mascount[1]]:=-10;
           mmo1.Lines.Add('------------------------------------------------------------');
           mmo1.Lines.Add('связь '+ IntToStr(mascount[1])+' - '+ IntToStr(i)+' лишняя');
           mmo1.Lines.Add('   связь '+ IntToStr(mascount[1])+' - '+ IntToStr(i)+' удалена');
           drawss(-10,-10,Form1.Width,Form1.Height);
           sleep(StrToInt(edt4.Text));
        end;
        end;
      end;
   end;

   drawss(-10,-10,Form1.Width,Form1.Height);
   count:=0;
   for i:=1 to n do if masdeik[i]=1 then begin  //считаем оставшиеся узлы
    for j:=1 to n do   begin
       if mas[i,j]>-9 then inc(count);
    end;

   end;

     if (count<=2) then begin  //если всего осталось  2 узла
        Form1.edt3.Text:=FloatToStr(mas[n1,n2]) ;
     end else begin
       m:=n;
       if stp=1 then begin //ищем треугольники
      for i:=1 to m do if masdeik[i]=1 then begin
        for j:=1 to m do if masdeik[j]=1 then begin
             if mas[i,j]>-9 then begin

            for jk:=1 to m do begin
              if (mas[i,jk]>-9)and(mas[j,jk]>-9) then begin

                  inc(n);
                   i5:=n;

                 masdeik[i5]:=1;
                 mmo1.Lines.Add('------------------------------------------------------------');
                 mmo1.Lines.Add('связь '+ IntToStr(i)+' - '+ IntToStr(j)+' - '+IntToStr(jk) +' - '+IntToStr(i)+' треугольник');
                 mmo1.Lines.Add('   связь '+ IntToStr(i)+' - '+ IntToStr(j)+' - '+IntToStr(jk)+' - '+IntToStr(i) +' заменена на');
                 mmo1.Lines.Add('   связь '+ IntToStr(i)+' - '+ IntToStr(i5) +' , '+ IntToStr(j)+' - '+ IntToStr(i5)+' , '+ IntToStr(jk)+' - '+ IntToStr(i5) +' звезду');
                 if (mas[i,j]+mas[i,jk]+mas[j,jk])>0 then begin
                 mas[i,i5]:=mas[i,j]*mas[i,jk]/(mas[i,j]+mas[i,jk]+mas[j,jk]);
                 mas[i5,i]:=mas[i,i5];
                 mas[j,i5]:=mas[i,j]*mas[j,jk]/(mas[i,j]+mas[i,jk]+mas[j,jk]);
                 mas[i5,j]:=mas[j,i5];
                 mas[jk,i5]:=mas[jk,j]*mas[i,jk]/(mas[i,j]+mas[i,jk]+mas[j,jk]);
                 mas[i5,jk]:=mas[jk,i5];
                 end else begin
                     mas[i5,i]:=0;
                     mas[i,i5]:=0;
                     mas[i5,j]:=0;
                     mas[j,i5]:=0;
                     mas[i5,jk]:=0;
                     mas[jk,i5]:=0;
                 end;
                 deltes(i,jk);
                 deltes(i,j);
                 deltes(j,jk);
                 masx[i5]:=(masx[j]+masx[i]+masx[jk]) div 3;
                 masy[i5]:=(masy[j]+masy[i]+masy[jk]) div 3;
                 drawss(-10,-10,Form1.Width,Form1.Height);
                 sleep(StrToInt(edt4.Text));
                inc(kl);
                 goto 1;
              end;

            end;
          end;
        end;
       end;
        stp:=2;
        inc(kl);
        goto 1;
      end else if stp=2 then   //ищем звездочки
      begin
        for i:=1 to m do if masdeik[i]=1 then begin
        lenmasd:=0;
        if not(i=n1)and not(i=n2) then begin
         for j:=1 to m do  begin
             if mas[i,j]>-9 then begin
              Inc(lenmasd);
              if lenmasd<=3 then
              masd[lenmasd]:=j;
          end;

         end;
        if lenmasd=3 then begin


               if mas[masd[1],masd[2]]>-9 then begin

                  if mas[masd[3],i]>0 then begin
                  r1:=mas[masd[1],i]+mas[masd[2],i]+mas[masd[1],i]*mas[masd[2],i]/mas[masd[3],i];
                  mas[masd[1],masd[2]]:=r1*mas[masd[1],masd[2]]/(r1+mas[masd[1],masd[2]]);
                  mas[masd[2],masd[1]]:=mas[masd[1],masd[2]];
                  end;
               end else begin

                  if mas[masd[3],i]>0 then begin
                  r1:=mas[masd[1],i]+mas[masd[2],i]+mas[masd[1],i]*mas[masd[2],i]/mas[masd[3],i];
                  mas[masd[1],masd[2]]:=r1;
                  mas[masd[2],masd[1]]:=mas[masd[1],masd[2]];
                  end;
               end;

               if mas[masd[1],masd[3]]>-9 then begin

                  if mas[masd[2],i]>0 then begin
                  r1:=mas[masd[1],i]+mas[masd[3],i]+mas[masd[1],i]*mas[masd[3],i]/mas[masd[2],i];
                  mas[masd[1],masd[3]]:=r1*mas[masd[1],masd[3]]/(r1+mas[masd[1],masd[3]]);
                  mas[masd[3],masd[1]]:=mas[masd[1],masd[3]];
                  end;
                end else begin

                  if mas[masd[2],i]>0 then begin
                  r1:=mas[masd[1],i]+mas[masd[3],i]+mas[masd[1],i]*mas[masd[3],i]/mas[masd[2],i];
                  mas[masd[1],masd[3]]:=r1;
                  mas[masd[3],masd[1]]:=mas[masd[1],masd[3]];
                  end
                end;

                 if mas[masd[2],masd[3]]>-9 then begin

                  if mas[masd[1],i]>0 then begin
                   r1:=mas[masd[2],i]+mas[masd[3],i]+mas[masd[2],i]*mas[masd[3],i]/mas[masd[1],i];
                   mas[masd[2],masd[3]]:=r1*mas[masd[2],masd[3]]/(r1+mas[masd[2],masd[3]]);
                   mas[masd[3],masd[2]]:=mas[masd[2],masd[3]];
                  end;
                 end else begin

                   if mas[masd[1],i]>0 then begin
                    r1:=mas[masd[2],i]+mas[masd[3],i]+mas[masd[2],i]*mas[masd[3],i]/mas[masd[1],i];
                    mas[masd[2],masd[3]]:=r1;
                    mas[masd[3],masd[2]]:=mas[masd[2],masd[3]];
                   end
                 end;
                  deltes(i,masd[1]);
                   deltes(i,masd[2]);
                    deltes(i,masd[3]);
                      mmo1.Lines.Add('------------------------------------------------------------');
                         mmo1.Lines.Add('связь '+ IntToStr(masd[1])+' - '+ IntToStr(i) +' , '+ IntToStr(masd[2])+' - '+ IntToStr(i)+' , '+ IntToStr(masd[3])+' - '+ IntToStr(i) +' звезда');
                      mmo1.Lines.Add('   связь '+ IntToStr(masd[1])+' - '+ IntToStr(i) +' , '+ IntToStr(masd[2])+' - '+ IntToStr(i)+' , '+ IntToStr(masd[3])+' - '+ IntToStr(i) +' заменена на');
                    mmo1.Lines.Add('   связь '+ IntToStr(masd[1])+' - '+ IntToStr(masd[2])+' - '+IntToStr(masd[3]) +' - '+IntToStr(masd[1])+' треугольник');
                  drawss(-10,-10,Form1.Width,Form1.Height);
                  sleep(StrToInt(edt4.Text));

                 goto 1;
              end;
        end;
      end;

        stp:=1;
                 goto 1;

     end;
   end;
  end else

  begin
    Form1.edt3.Text:='нет соединения';

  end;

  end;
procedure TForm1.FormResize(Sender: TObject);
begin
  pnl4.Top:=Form1.ClientHeight- pnl4.Height-30;
  pnl5.Top:=Form1.ClientHeight-pnl5.Height-30;
  pnl8.Height:=pnl4.Top+1;
  bt.Width:=Form1.Width;
  bt.Height:=Form1.Height;
  if psr=1 then drawsspsr;
  stat1.Show;
end;

procedure TForm1.btn1Click(Sender: TObject);
var n1,n2:Integer;
begin
  n1:=StrToInt(edt1.Text);
  n2:=StrToInt(edt2.Text) ;
  deltes(n1,n2);
  drawss(-10,-10,Form1.Width,Form1.Height);
end;

procedure TForm1.N2Click(Sender: TObject);
var
i,j:Integer;
begin
  lensoed:=0;
  if dlgOpen1.Execute then begin
     for i:=1 to 100 do begin
      for j:=1 to 100 do begin
        deltes(i,j);
      end;

     end;
     AssignFile(f,dlgOpen1.FileName);
     Reset(f);
     Readln(f,n);
     for i:=1 to n do begin
      for j:=1 to n do begin
        read(f,mas[i,j]);
          mas[j,i]:=mas[i,j];
      end;
       Readln(f);
     end;
     for i:=1 to n do begin
       Readln(f,masx[i],masy[i]);
     end;
     CloseFile(f);
     drawss(-10,-10,Form1.Width,Form1.Height);
  end;

end;

procedure TForm1.N1Click(Sender: TObject);
var
i,j:Integer;
begin
 if dlgSave1.Execute then begin
     AssignFile(f,dlgSave1.FileName);
     Rewrite(f);
     writeln(f,n);
     for i:=1 to n do begin
      for j:=1 to n do begin
        write(f,mas[i,j],' ');

      end;
       writeln(f);
     end;
     for i:=1 to n do begin
       writeln(f,masx[i],' ',masy[i]);
     end;
     CloseFile(f);
  end;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
 AboutBox.ShowModal;
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
 pnl5.Visible:=True;
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
 pnl5.Visible:=False;
 drawss(-10,-10,Form1.Width,Form1.Height);
end;

procedure TForm1.tbc1Change(Sender: TObject);
begin
    pnl1.Visible:=False;
    pnl2.Visible:=False;
    pnl3.Visible:=False;
    pnl6.Visible:=False;
    pnl7.Visible:=False;
  if tbc1.TabIndex=0 then begin
    pnl1.Visible:=True;
    play:=1;
  end else if tbc1.TabIndex=1 then begin
    pnl2.Visible:=True;
    play:=2;
  end else if tbc1.TabIndex=2 then begin
    pnl3.Visible:=True;
    play:=3;
  end else if tbc1.TabIndex=3 then begin
   pnl6.Visible:=True;

  end else if tbc1.TabIndex=4 then begin
    pnl7.Visible:=True;
    play:=2;
  end;
  drawss(-10,-10,Form1.Width,Form1.Height);
end;

procedure TForm1.btn7Click(Sender: TObject);
var n1,n2:Integer;
begin
  n1:= strtoint(edt5.Text);
  n2:=strtoint(edt6.text);
  inc(lensoed);
  soed[1,lensoed]:=n1;
  soed[2,lensoed]:=n2;
  soed[3,lensoed]:=1;
  drawss(-10,-10,Form1.Width,Form1.Height);
end;

procedure TForm1.btn8Click(Sender: TObject);
var n1,n2:Integer;
begin
  n1:= strtoint(edt5.Text);
  n2:=strtoint(edt6.text);
  inc(lensoed);
  soed[1,lensoed]:=n1;
  soed[2,lensoed]:=n2;
  soed[3,lensoed]:=2;
  drawss(-10,-10,Form1.Width,Form1.Height);
end;

procedure TForm1.btn9Click(Sender: TObject);
var n1,n2,i,ks:Integer;
begin
  n1:= strtoint(edt5.Text);
  n2:=strtoint(edt6.text);
  for i:=1 to lensoed do begin
    if ((n1=soed[1,i]) and (n2=soed[2,i]))or((n1=soed[2,i]) and (n2=soed[1,i])) then begin
     soed[1,i]:=0;
     soed[2,i]:=0 ;
     soed[3,i]:=0;
    end;

  end;
  ks:=0;
  for i:=1 to lensoed do begin
    if soed[3,i]>0 then begin
       inc(ks);
       soed[1,ks]:=soed[1,i];
       soed[2,ks]:=soed[2,i];
       soed[3,ks]:=soed[3,i];
    end;

  end;
  lensoed:=ks;
  drawss(-10,-10,Form1.Width,Form1.Height);
end;

procedure TForm1.btn6Click(Sender: TObject);
var i:Integer;
begin
  mmo1.Lines.Clear;
  for i:=1 to lensoed do begin
   if soed[3,i]=1 then begin
    mmo1.Lines.Add('подключено последовательно в '+ IntToStr(soed[1,i])+' - '+inttostr(soed[2,i]));
    end else begin
    mmo1.Lines.Add('подключено параллельно к '+ IntToStr(soed[1,i])+' - '+inttostr(soed[2,i]));
   end;
  end;
  pnl5.Visible:=True;
end;

procedure TForm1.btn10Click(Sender: TObject);
var t1,t2,i4,mt,mnb:Integer;
begin
  for i4:=1 to n do begin
    masdeik[i4]:=0;
  end;
  mnb:=1;
  mt:=n;
  mas2:=mas;
  t1:= StrToInt(edt5.Text);
  t2:= StrToInt(edt6.text);
  deik(t1);
  if masdeik[t2]=1 then begin
  oks(t1,t2);
  n:=mt;
  repeat
   inc(mnb);
   rsoed2:=rsoed1;
   mas:=mas2;
   for i4:=1 to lensoed do begin
     if soed[3,i4]=1 then begin
         if mas[soed[1,i4],soed[2,i4]]>-10 then begin
            mas[soed[1,i4],soed[2,i4]]:=mas[soed[1,i4],soed[2,i4]]+rsoed1;
            mas[soed[2,i4],soed[1,i4]]:=mas[soed[1,i4],soed[2,i4]];
         end else begin
           mas[soed[1,i4],soed[2,i4]]:=rsoed1;
           mas[soed[2,i4],soed[1,i4]]:=mas[soed[1,i4],soed[2,i4]];
         end;
     end else begin
         if (mas[soed[1,i4],soed[2,i4]]>-10)and(mas[soed[1,i4],soed[2,i4]]+rsoed1>0) then begin
            mas[soed[1,i4],soed[2,i4]]:=mas[soed[1,i4],soed[2,i4]]*rsoed1/(mas[soed[1,i4],soed[2,i4]]+rsoed1);
            mas[soed[2,i4],soed[1,i4]]:=mas[soed[1,i4],soed[2,i4]];
         end else begin
           mas[soed[1,i4],soed[2,i4]]:=rsoed1;
           mas[soed[2,i4],soed[1,i4]]:=mas[soed[1,i4],soed[2,i4]];
         end;

     end;

   end;
    oks(t1,t2);
    n:=mt;
  until (abs(rsoed1-rsoed2)<=1e-25)or(rsoed1>2*rsoed2);
  mas:=mas2;
  if rsoed1<=rsoed2 then
  if rsoed1>1e-24 then
  edt7.Text:= FloatToStr(rsoed1) else edt7.Text:= FloatToStr(0)  else
  edt7.Text:= 'бесконечность';
  edt8.Text:=IntToStr(mnb) ;
  end else begin
    edt7.Text:= 'нет соединения';
  end;
end;

procedure TForm1.btn11Click(Sender: TObject);
begin
 mas:=mas2; n:=nbgn; drawss(-10,-10,Form1.Width,Form1.Height);
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var m:TPoint;
    i:Integer;
begin

   if ftr=1 then begin
    GetCursorPos(m);
    m:=Form1.ScreenToClient(m);
    masx[ive]:=m.X;
    masy[ive]:=m.Y;

   for i:=1 to n do begin
      if mas[ive,i]>-9 then begin
        if Abs(masx[i]-masx[ive])<20 then begin
         masx[ive]:=masx[i];
        end else
         if Abs(masy[i]-masy[ive])<20 then begin
         masy[ive]:=masy[i];
        end;

      end;
    end;
    if (Abs(masx[ive]-x1)>=1)or(Abs(masy[ive]-y1)>=1) then begin
     { Form1.Canvas.Pen.Color:=cl1;
      Form1.Canvas.Brush.Color:=cl1;
     Form1.Canvas.Rectangle(minx-20,miny-20,maxx+25,maxy+25);   }
     drawss(minx-25,miny-25,maxx+31,maxy+31);
     minx:=masx[ive]; miny:=masy[ive];
     maxx:=masx[ive]; maxy:=masy[ive];
     for i:=1 to n do begin
        if mas[ive,i]>-1 then begin
         if masx[i]>maxx then maxx:=masx[i];
         if masy[i]>maxy then maxy:=masy[i];
         if masx[i]<minx then minx:=masx[i];
         if masy[i]<miny then miny:=masy[i];
        end;
     end;

     end;
    x1:=masx[ive];
    y1:=masy[ive];
   Form1.Canvas.Brush.Color:=RGB(250,0,0);
    Canvas.Ellipse(masx[ive]-4,masy[ive]-4,masx[ive]+4,masy[ive]+4);
    Form1.Canvas.Brush.Color:=cl1;
   end;
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
  drawss(-10,-10,Form1.Width,Form1.Height);
  pnl4.Top:=Form1.ClientHeight- pnl4.Height-30;
  pnl5.Top:=Form1.ClientHeight-pnl5.Height-30;
  if psr=1 then  begin drawsspsr; tmr1.Enabled:=True; end;
   stat1.Show;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
Form2.visible:=True;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  Form2.Visible:=True;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
 form3.visible:=True;
end;

procedure TForm1.btn13Click(Sender: TObject);
 var t1,t2,t3,t4,nb,i,count,z:Integer;
  ri,rs,left,right:Extended;
  label 1;
begin  //решение обратной задачи
  nb:=n;
  t1:=StrToInt(edt15.Text); t2:=StrToInt(edt16.Text);
  ri:=StrToFloat(edt14.Text);
  t3:=StrToInt(edt17.Text); t4:=StrToInt(edt18.Text);
   mas2:=mas; left:=0; right:=1e20;
   mas[t3,t4]:=left;
   mas[t4,t3]:=mas[t3,t4];
   oks(t1,t2);
    if ri>=mas[t1,t2] then begin
      mas:=mas2;n:=nb;
      mas[t3,t4]:=right;
      mas[t4,t3]:=mas[t3,t4];
      oks(t1,t2);
      if ri<=mas[t1,t2] then begin
           mas:=mas2;n:=nb;
           while (abs(left-right)>=1e-13) do begin
               mas[t3,t4]:=(left+right)/2;
               mas[t4,t3]:=mas[t3,t4];
               oks(t1,t2);
               if mas[t1,t2]>ri then
                  right:=(left+right)/2
               else
                  left:=(left+right)/2;
               mas:=mas2;
               n:=nb;
           end;
             if left>=1e19 then
                edt19.Text:='резистор не нужен'
             else
                edt19.Text:=FloatToStr(left);
      end else
           edt19.Text:='решений нет';

    end else
      edt19.Text:='решений нет';
   mas:=mas2; n:=nb;
   drawss(0,0,1000,1000);

  end;


procedure TForm1.btn12Click(Sender: TObject);
    var n1,n2,n3,n4,left,right,t,z,count,nb:Integer;
        u,i,r,r12:real;
    label 1;
begin
   nb:=n;
   n1:=StrToInt(edt9.Text);
   n2:=StrToInt(edt10.Text);
   n3:=StrToInt(edt12.Text);
   n4:=StrToInt(edt13.Text);
   u:=StrToFloat(edt11.Text);
   mas2:=mas;
    oks(n1,n2);
    r:=mas[n1,n2];
    i:=u/r;
    mmo.Lines.Clear;
    mmo.Lines.Add('общее сопротивление цепи равно: '+floattostr(r)+' ом') ;
    mmo.Lines.Add('сила тока равна: '+floattostr(i)+' А');
    mas:=mas2;
    r12:=mas[n3,n4];
   deltes(n3,n4);
    oks2(n1,n2,n3,n4);

    left:=n1;
    right:=n2;
   while  not(((Left=n3) and (right=n4))or((Left=n4) and (right=n3))or (Left=right))   do begin
     if mas[Left,right]>0 then begin
        i:=i-u/mas[Left,right];
        deltes(Left,right);
     end else if mas[Left,right]=0 then
     begin mmo.Lines.Add('напряжения нет'); goto 1 end else begin
      count:=0;
      for t:=1 to n do
        if mas[Left,t]>-9 then begin inc(count); z:=t;  end;
      if (count=1) then begin
         u:=u-mas[Left,z]*i;
         deltes(Left,z);
         left:=z;
      end;
      count:=0;
      for t:=1 to n do
        if mas[right,t]>-9 then begin inc(count); z:=t;  end;
      if (count=1) then begin
         u:=u-mas[right,z]*i;
         deltes(right,z);
         right:=z;
      end;
      end;

   end;
    mmo.Lines.Add('напряжение равно: '+floattostr(u)+' В');
    if r12>0 then mmo.Lines.Add('сила тока равна: '+floattostr(u/r12)+' A') else
       if r12=0 then  mmo.Lines.Add('сила тока равна: '+floattostr(i)+' A') else  mmo.Lines.Add('тока нет');
    mas:=mas2; n:=nb;
    drawss(-10,-10,Form1.Width,Form1.Height);
   1:
end;

procedure TForm1.btn14Click(Sender: TObject);
begin
pnl4.Visible:=False;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
pnl4.Visible:=True;
end;

procedure TForm1.btn15Click(Sender: TObject);
begin
  psr:=0;
pnl8.Visible:=False;
drawss(0,0,1000,1000);
end;

procedure TForm1.btn16Click(Sender: TObject);

begin
  psr:=1;
  pnl8.Visible:=True; nb:=n;
  nb1:=StrToInt(edt24.Text); ne1:=StrToInt(edt25.Text);
  nb2:=StrToInt(edt22.Text); ne2:=StrToInt(edt23.Text);
  xs1:=StrToFloat(edt20.Text); xs2:=StrToFloat(edt21.Text);
  hg:=pb2.Width; dx:=Abs(xs2-xs1);mas2:=mas;
  ymaximum:=0; yminimum:=1e100;
  for i:=0 to hg do begin
    mas[nb1,ne1]:=(xs1+i*dx/hg);
    mas[ne1,nb1]:= mas[nb1,ne1];
    oks(nb2,ne2);
    ms[i]:=mas[nb2,ne2];
    if ms[i]>=ymaximum then ymaximum:=ms[i];
    if ms[i]<=yminimum then yminimum:=ms[i];
    mas:=mas2; n:=nb;
  end;

    dy:=Abs(ymaximum-yminimum);

    drawsspsr;
    tmr1.Enabled:=True;
end;

procedure TForm1.tmr1Timer(Sender: TObject);
begin

if psr=1 then begin drawsspsr;  tmr1.Enabled:=false;  end;

end;

procedure TForm1.N9Click(Sender: TObject);
var cod:Byte;
   s:string;
begin
  s:=ExtractFilePath(ParamStr(0))+'/Project4.exe' ;
 cod:=WinExec(PAnsiChar(s), SW_Restore);
case cod of
0: ShowMessage('Не хватает ресурсов');
2: ShowMessage('Файл не найден');
3: ShowMessage('Путь не найден');
end;

end;

end.



