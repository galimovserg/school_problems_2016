unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls,Math, Menus, Buttons;

type
  TForm1 = class(TForm)
    pb1: TPaintBox;
    dlgColor1: TColorDialog;
    pnl1: TPanel;
    edt1: TEdit;
    ud1: TUpDown;
    mm1: TMainMenu;
    menu1: TMenuItem;
    load1: TMenuItem;
    save1: TMenuItem;
    run1: TMenuItem;
    run2: TMenuItem;
    dlgSave1: TSaveDialog;
    dlgOpen1: TOpenDialog;
    lbl1: TLabel;
    lbl2: TLabel;
    btn1: TBitBtn;
    btn4: TBitBtn;
    btn6: TBitBtn;
    btn8: TBitBtn;
    btn2: TBitBtn;
    btn5: TBitBtn;
    btn3: TBitBtn;
    btn9: TBitBtn;
    pnl2: TPanel;
    btn7: TButton;
    shp1: TShape;
    shp2: TShape;
    btn10: TBitBtn;
    dlgColor2: TColorDialog;
    lbl3: TLabel;
    lbl4: TLabel;
    btn11: TBitBtn;
    btn12: TBitBtn;
    btn13: TBitBtn;
    tmr1: TTimer;
    btn14: TBitBtn;
    lbl5: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pb1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pb1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pb1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormPaint(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure ud1Click(Sender:  TObject; Button: TUDBtnType);
    procedure btn7Click(Sender: TObject);
    procedure save1Click(Sender: TObject);
    procedure load1Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure run2Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure btn14Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type
  tp=array of TPoint;
   sergey=record
      x1:Integer;
      x2:Integer;
      y1:Integer;
      y2:Integer;
      colr:tColor;
     end;
const
  //переменная objct
  rect=1;// рисуем прямоугольник
  point=2; // рисуем точку
  polygon=3; // рисуем полигон
  ellipse=4;
  //переменная play
  draws=1; // рисование
  move=2;  // перемещение
  delete=3; // удаление
  arm=4;  // рука (смещение системы координат)
  fill=5;//заливка
  game=6;//игра

  Rplayer=10;
  var
  Form1: TForm1;
  objct,Play: integer;
  mascircle:array[1..200] of sergey;

  SizePlayer,SizePlRec,SizeEllipse:Integer;
  MasRect:array[1..256] of sergey; //массив прямоугольников
  Points:array[0..256] of sergey;//массив точек
  MasPolygPn:array[1..256] of tp;//массив полигонов координаты точек
  MasPolygCn:array[1..256] of Integer;//массив полигонов /количество точек
  MasPolugCr:array[1..256] of TColor; //массив полигонов/ цвета
  MinMax:array[1..256] of sergey;
  countpolygon,newpolygon:Byte;
  x0,y0,count,n,
  vectorx,vectory,keymove,
  playerx,playery,playfreemove,
  x1,y1:Integer;
  li,dx,dy:integer;
  playfff,playfff2,playrect,playrectscale1,playrectscale2,playpixel,
         playpolygonbody,playpolygon1,playpolygon2,playellipse1,playellipse2:integer;
  buf:TBitmap;
  f:Text;
implementation

{$R *.dfm}
function PointInEllipse(x1,y1,x2,y2,x,y:Real):Boolean;
var xel,yel:Real;
begin
  xel:=(x1+x2)/2;
  yel:=(y1+y2)/2;
  PointInEllipse:=(Sqr(2*(x-xel)/(x2-x1) ) +sqr(2*(y-yel)/(y2-y1))<1)
end;
//проверка отрезков на пересечение
function prsc(x1,y1,x2,y2,xx1,yy1,xx2,yy2:longint):Boolean;
var s1,s2,ss1,ss2:real;
function intrs(var a,b,c,d:longint):Boolean;
var cnn:Integer;
begin
 if a>b then begin cnn:=a; a:=b; b:=cnn; end;
 if c>d then begin cnn:=c; c:=d; d:=cnn; end;
 intrs:=(max(a,c)<=max(b,d));
end;
begin
 s1:=(x2-x1)*(yy1-y1)-(xx1-x1)*(y2-y1);
 s2:=(x2-x1)*(yy2-y1)-(xx2-x1)*(y2-y1);
 ss1:=(xx2-xx1)*(y1-yy1)-(x1-xx1)*(yy2-yy1);
 ss2:=(xx2-xx1)*(y2-yy1)-(x2-xx1)*(yy2-yy1);
 if (sign(s1)*sign(s2)<=0)and(sign(ss1)*sign(ss2)<=0)and(intrs(x1,x2,xx1,xx2))and(intrs(y1,y2,yy1,yy2)) then begin
     prsc:=true;
 end else prsc:=false;
end;
function ptinpg(xx,yy:Integer;mss:tp):Boolean;//точка в полигоне?
 var minx,miny:LongInt;
     j,cnt:integer;
begin
  cnt:=0;
  minx:=MAXLONG;
  miny:=MAXLONG;
  for j:=0 to Length(mss)-1 do begin
      if minx>mss[j].X then minx:=mss[j].X;
      if miny>mss[j].Y then miny:=mss[j].Y;
  end;
  minx:=minx-random(3)-1;
  miny:=miny-random(3)-2;
  for j:=1 to Length(mss)-1 do begin
      if prsc(minx,miny,xx,yy, mss[j].X,mss[j].Y,mss[j-1].x,mss[j-1].y) then
         cnt:=cnt+1;
  end;
   if prsc(minx,miny,xx,yy, mss[0].X,mss[0].Y,mss[j-1].x,mss[j-1].y) then
         cnt:=cnt+1;
   if cnt mod 2<>0 then ptinpg:=True else ptinpg:=False;
end;
procedure drawinbitmap();
var i,j,cx:Integer;
   tpp:tp;
begin

  buf.Canvas.Brush.Color:=clWhite;
  buf.Canvas.Rectangle(0,0,buf.Width,buf.Height);
  for i:=1 to sizeellipse do begin
    buf.Canvas.Brush.Color:=mascircle[i].colr;
    buf.Canvas.Ellipse(((mascircle[i].x1-x0)*form1.ud1.Position) div 100,((mascircle[i].y1-y0)*form1.ud1.Position) div 100,((mascircle[i].x2-x0)*form1.ud1.Position) div 100,((mascircle[i].y2-y0)*form1.ud1.Position) div 100);

  end;
  for i:=1 to count do begin
    buf.Canvas.Brush.Color:=masrect[i].colr;
    buf.Canvas.Rectangle(((masrect[i].x1-x0)*form1.ud1.Position) div 100,((masrect[i].y1-y0)*form1.ud1.Position) div 100,((masrect[i].x2-x0)*form1.ud1.Position) div 100,((masrect[i].y2-y0)*form1.ud1.Position) div 100);

  end;

  for i:=1 to countpolygon do
  {if maspolygcn[i]>=2 then} begin
    SetLength(tpp,maspolygcn[i]+1);
    for j:=0 to maspolygcn[i] do begin
      tpp[j].X:=maspolygpn[i][j].x-x0;
      tpp[j].y:=maspolygpn[i][j].y-y0;
    end;
    buf.Canvas.Brush.Color:= maspolugcr[i];
    buf.Canvas.Polygon(tpp);
  end;

  for i:=1 to n do begin
    buf.Canvas.Brush.Color:=points[i].colr;
    buf.Canvas.Ellipse(((points[i].x1-4-x0)*form1.ud1.Position) div 100,((points[i].y1-4-y0)*form1.ud1.Position) div 100,((points[i].x1+4-x0)*form1.ud1.Position) div 100,((points[i].y1+4-y0)*form1.ud1.Position) div 100);
  end;
   if play=game then begin

   buf.Canvas.Ellipse(playerx-rplayer,playery-rplayer,playerx+rplayer,playery+rplayer);


    end;
end;
procedure opred();
var i,j,k,m:Integer;
label 1;
begin
 for i:=1 to n do begin
  for j:=1 to n do begin
    for k:=1 to count do begin
      if not (prsc(points[i].x1,points[i].y1,points[j].x1,points[j].y1,masrect[k].x1,masrect[k].y2,masrect[k].x1,masrect[k].y1) or
              prsc(points[i].x1,points[i].y1,points[j].x1,points[j].y1,masrect[k].x2,masrect[k].y2,masrect[k].x2,masrect[k].y1) or
              prsc(points[i].x1,points[i].y1,points[j].x1,points[j].y1,masrect[k].x1,masrect[k].y2,masrect[k].x2,masrect[k].y2) or
              prsc(points[i].x1,points[i].y1,points[j].x1,points[j].y1,masrect[k].x1,masrect[k].y1,masrect[k].x2,masrect[k].y1)
              ) then
       begin

       end else goto 1;

    end;
    for k:=1 to countpolygon do begin
      for m:=1 to maspolygcn[k] do begin
          if prsc(points[i].x1,points[i].y1,points[j].x1,points[j].y1,
          maspolygpn[k][m].x,maspolygpn[k][m].Y,maspolygpn[k][m-1].x,maspolygpn[k][m-1].Y) then goto 1;

      end;
       if maspolygcn[k]>1 then
      if prsc(points[i].x1,points[i].y1,points[j].x1,points[j].y1,
     maspolygpn[k][0].x,maspolygpn[k][0].Y,maspolygpn[k][m-1].x,maspolygpn[k][m-1].Y) then goto 1;

    end;
    buf.Canvas.MoveTo(points[i].x1-x0,points[i].y1-y0);
    buf.Canvas.LineTo(points[j].x1-x0,points[j].y1-y0);
     1:
  end;

 end;
end;
procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=112 then begin
       keymove:=(1-keymove) ;
  end else
if Key=37 then begin //лево

   vectorx:=-2;
   vectory:=0;


end;
if Key=38 then begin //вверх
    vectorx:=0;
   vectory:=-2;

end;
if Key=39 then begin // вправо

     vectorx:=2;
     vectory:=0;

end;
if Key=40 then begin // вниз

   vectorx:=0;
   vectory:=2;
end;
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
  n:=0;
  countpolygon:=0;
  newpolygon:=0;
  play:=draws;
  objct:=rect;
  playrect:=0;
  pnl1.Left:=Form1.Width-pnl1.Width;//размер холста
  pb1.Width:=pnl1.Left-10;
  pb1.Height:=Form1.Height-20;
  buf:=TBitmap.Create;
  buf.Width:=pb1.Width;
  buf.Height:=pb1.Height;

  x1:=0;
  y1:=0;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
   pnl1.Left:=Form1.Width-pnl1.Width-50;//размер холста
   pnl2.Top:=Form1.Height-pnl2.Height-100;
  pb1.Height:=pnl2.Top-50;
  pb1.Width:=pnl1.Left-50;

  pb1.Canvas.Draw(0,0,buf);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  pnl1.Left:=Form1.Width-pnl1.Width-40;
  pb1.Height:=Form1.Height-20;
  pb1.Width:=pnl1.Left-10;
  buf.Width:=pb1.Width;
  buf.Height:=pb1.Height;
  pb1.Canvas.Draw(0,0,buf);
end;


procedure TForm1.pb1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var i,j:Integer;
  sinh,cosh:Real;
  label 1,2,4;
begin
  x1:=x*100 div ud1.Position;
  y1:=y*100 div ud1.Position;
  if play=draws then begin
    if objct=Rect then begin

    end  else
    if objct=point then begin
     n:=n+1;
     points[n].colr:=dlgColor1.Color;
     points[n].x1:=x1+x0;
     points[n].y1:=y1+y0;
     pb1.Canvas.Ellipse(x1-4,y1-4,x1+4,y1+4);
     buf.Canvas.Ellipse(x1-4,y1-4,x1+4,y1+4);
     drawinbitmap;
     opred;
     pb1.Canvas.Draw(0,0,buf);
    end else
    if objct=polygon then begin
        keymove:=0;
        countpolygon:=countpolygon+1;
        newpolygon:=1;
        maspolugcr[countpolygon]:=dlgColor1.Color;

        maspolygcn[countpolygon]:=0;
        SetLength(maspolygpn[countpolygon], maspolygcn[countpolygon]+1) ;
        maspolygpn[countpolygon][maspolygcn[countpolygon]].X:=x1+x0;
        maspolygpn[countpolygon][maspolygcn[countpolygon]].Y:=y1+y0;
        drawinbitmap;
        opred;
        pb1.Canvas.Draw(0,0,buf);



    end else if objct=ellipse then begin

    end;

  end else
  if (play=move)or(play=fill) then begin
      if playfff>0 then begin
        playfff2:=0;
         for i:=countpolygon downto 1 do begin
           for li:=0 to maspolygcn[i] do begin
             if (sqr(maspolygpn[i][li].X-x1-x0)+sqr(maspolygpn[i][li].y-y1-y0)<=900) and(sqr(maspolygpn[i][li].X-x1-x0)+sqr(maspolygpn[i][li].y-y1-y0)>0) then begin
               if play=Move then begin
                 playfff2:=1;
                 sinh:=(maspolygpn[i][li].y-y0-y1)/sqrt(Sqr(maspolygpn[i][li].x-x1-x0)+sqr(maspolygpn[i][li].y-y1-y0)) ;
                 cosh:= (maspolygpn[i][li].x-x0-x1)/sqrt(Sqr(maspolygpn[i][li].x-x1-x0)+sqr(maspolygpn[i][li].y-y1-y0));
                 maspolygpn[i][li].x:=Trunc(30*cosh)+x1+x0;
                 maspolygpn[i][li].y:=Trunc(30*sinh)+y1+y0;
               end;
             end;
      end;

      end;    if play=Move then goto 1;
      end;
      playpolygon1:=0;
      playpolygon2:=0;
      for i:=countpolygon downto 1 do begin
       for li:=0 to maspolygcn[i] do begin
          if sqr(maspolygpn[i][li].X-x1-x0)+sqr(maspolygpn[i][li].y-y1-y0)<=70 then begin
           if play=Move then begin;
            playpolygon1:=i;
            playpolygon2:=li;
            goto 1;
           end else begin
              maspolugcr[i]:=dlgColor1.Color;  goto 1;
           end;
          end;
       end;

      end;
      playpixel:=0;
      for i:=1 to n do begin
        if Sqr(points[i].x1-x0-x1)+sqr(points[i].y1-y0-y1)<=100 then begin
          if play=Move then begin;
          playpixel:=i;
          goto 1;
          end else begin
           points[i].colr:=dlgColor1.Color;
           goto 1;
          end;
        end;
      end;
      playpolygonbody:=0;
      for i:=countpolygon downto 1 do begin
       if ptinpg(x1+x0,y1+y0,maspolygpn[i]) then begin
         if play=move then begin
         playpolygonbody:=i;
         goto 1;
         end else begin  maspolugcr[i]:=dlgColor1.Color; goto 1; end;
       end;
      end;


      playrectscale1:=0;
      playrectscale2:=0;
       for i:=count downto 1 do begin

         if play=move then begin
           if sqr(masrect[i].x2-x-x0)+sqr(masrect[i].y2-y-y0)<=70 then begin
             playrectscale1:=i;

              goto 1;

           end;
         end;
      end;
      playrect:=0;
      for i:=count downto 1 do begin
       if (x1<masrect[i].x2-x0)and(x1>masrect[i].x1-x0) then
       if (y1<masrect[i].y2-y0)and(y1>masrect[i].y1-y0) then begin
         if play=move then begin
         playrect:=i;
         goto 1;
         end else begin  masrect[i].colr:=dlgColor1.Color; goto 1;  end;
        end;
      end;
      playellipse1:=0;
      playellipse2:=0;
      for i:=1 to sizeellipse do begin

        if PointInEllipse(mascircle[i].x1,mascircle[i].y1,mascircle[i].x2,mascircle[i].y2,x+x0,y+y0) then begin
          if Play=Move then begin
            playellipse1:=i;
            goto 1;
          end else if Play=fill then begin
            mascircle[i].colr:=dlgColor1.Color;
            goto 1;
          end;
        end;
      end;

      1:
       drawinbitmap;
        opred;
        pb1.Canvas.Draw(0,0,buf);
  end else
  if play=delete then begin


     for i:=1 to n do begin
        if Sqr(points[i].x1-x0-x1)+sqr(points[i].y1-y0-y1)<=64 then begin
           Points[i]:=points[n];
           n:=n-1;
          goto 2;
        end;
     end;
     for i:=1 to countpolygon do begin
       if ptinpg(x1+x0,y1+y0,maspolygpn[i]) then begin
        maspolygcn[i]:=maspolygcn[countpolygon];
        maspolugcr[i]:=maspolugcr[countpolygon];
        maspolygpn[i]:=maspolygpn[countpolygon];
        countpolygon:=countpolygon-1;

        goto 2;
       end;
     end;
     if (x1>0)and(y1>0) then
     for i:=1 to count do begin
       if (x1<masrect[i].x2-x0)and(x1>masrect[i].x1-x0) then
       if (y1<masrect[i].y2-y0)and(y1>masrect[i].y1-y0) then begin
           masrect[i]:=masrect[count];
           count:=count-1;
         goto 2;
       end;

     end;
      playellipse1:=0;
      playellipse2:=0;
      for i:=sizeellipse downto 1 do begin
        if PointInEllipse(mascircle[i].x1,mascircle[i].y1,mascircle[i].x2,mascircle[i].y2,x+x0,y+y0) then  begin
          mascircle[i]:= mascircle[sizeellipse];
          Dec(sizeellipse);
          goto 2;
        end;
      end;
    2:
    drawinbitmap;
    opred;
    form1.pb1.Canvas.Draw(0,0,buf);
  end;
end;

 procedure TForm1.pb1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if play=draws then  begin
 if (objct=ellipse)   and(x1<>0)and(y1<>0) then begin
              Inc(sizeellipse);
     if x>x1 then begin
        mascircle[sizeellipse].x1:=x1+x0 ;
        mascircle[sizeellipse].x2:=x+x0 ;
     end else begin
        mascircle[sizeellipse].x1:=x+x0 ;
        mascircle[sizeellipse].x2:=x1+x0 ;
     end;
      if y>y1 then begin
          mascircle[sizeellipse].y1:=y1+y0 ;
          mascircle[sizeellipse].y2:=y+y0 ;
      end else begin
          mascircle[sizeellipse].y1:=y+y0;
          mascircle[sizeellipse].y2:=y1+y0 ;
      end;
     mascircle[sizeellipse].colr:=dlgColor1.Color;
     drawinbitmap;
     opred;
     form1.pb1.Canvas.Draw(0,0,buf);
     x1:=0;
     y1:=0;
 end else
 if (objct=rect)   and(x1<>0)and(y1<>0) then begin
  Inc(count);
     if x>x1 then begin
       masrect[count].x1:=x1+x0 ;
       masrect[count].x2:=x+x0 ;
     end else begin
       masrect[count].x1:=x+x0 ;
       masrect[count].x2:=x1+x0 ;
     end;
      if y>y1 then begin
         masrect[count].y1:=y1+y0 ;
         masrect[count].y2:=y+y0 ;
      end else begin
         masrect[count].y1:=y+y0;
         masrect[count].y2:=y1+y0 ;
      end;
     masrect[count].colr:=dlgColor1.Color;
     drawinbitmap;
     opred;
     form1.pb1.Canvas.Draw(0,0,buf);
     x1:=0;
     y1:=0;
  end else if newpolygon=1 then begin
     newpolygon:=0;
     drawinbitmap;
     opred;
     form1.pb1.Canvas.Draw(0,0,buf);
     x1:=0;
     y1:=0;
  end;
end else
if play=move then begin
  if playellipse1>0 then begin
     playellipse1:=0;
     x1:=0;
     y1:=0;
  end else
  if playfff2>0 then begin
   playfff2:=0;
  end   else
  if playrectscale1>0 then begin
      playrectscale1:=0;
      drawinbitmap;
      opred;
       pb1.Canvas.Draw(0,0,buf);
     x1:=0;
     y1:=0;
  end else
  if playpolygon1>0 then begin
      playpolygon1:=0;
      playpolygon2:=0;
      x1:=0;
      y1:=0;
  end else
  if playrect>0 then begin
     masrect[playrect].x1:=masrect[playrect].x1+x-x1;
     masrect[playrect].x2:=masrect[playrect].x2+x-x1;
     masrect[playrect].y1:=masrect[playrect].y1+y-y1;
     masrect[playrect].y2:=masrect[playrect].y2+y-y1;
     drawinbitmap;
     opred;
     pb1.Canvas.Draw(0,0,buf);
     x1:=0;
     y1:=0;
     playrect:=0;
  end else
  if playpixel>0 then begin
    points[playpixel].x1:=points[playpixel].x1+x-x1;
    points[playpixel].y1:=points[playpixel].y1+y-y1;
    drawinbitmap;
    opred;
    form1.pb1.Canvas.Draw(0,0,buf);
    x1:=0;
    y1:=0;
    playpixel:=0;
  end else
  if playpolygonbody>0 then begin

    drawinbitmap;
    opred;
    form1.pb1.Canvas.Draw(0,0,buf);
    x1:=0;
    y1:=0;
    playpolygonbody:=0;
  end;
end else
if play=arm then begin
  x1:=0;
  y1:=0;
end;

end;

procedure TForm1.pb1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  var i:Integer;
  sinh,cosh:Real;
   label 1;
begin
  if play=draws then begin
   if objct=ellipse then begin
       if (x1<>0) and (y1<>0) then
      begin
       form1.pb1.Canvas.Draw(0,0,buf);
       Form1.pb1.Canvas.Ellipse(x1,y1,x,y);
      end;
   end  else

   if objct=rect then begin
     if (x1<>0) and (y1<>0) then
      begin
       form1.pb1.Canvas.Draw(0,0,buf);
       Form1.pb1.Canvas.Rectangle(x1,y1,x,y);
      end;
    end else
   if objct=point then begin


   end else if objct=Polygon then begin
     if keymove=0 then begin
       if newpolygon=1 then begin
         if Sqr(x1-x)+sqr(y1-y)>=1 then begin
             maspolygcn[countpolygon]:=maspolygcn[countpolygon]+1;
             SetLength(maspolygpn[countpolygon], maspolygcn[countpolygon]+1) ;
             maspolygpn[countpolygon][maspolygcn[countpolygon]].X:=x1+x0;
             maspolygpn[countpolygon][maspolygcn[countpolygon]].Y:=y1+y0;
             x1:=x;
             y1:=y;
         end else begin
            maspolygpn[countpolygon][maspolygcn[countpolygon]].X:=x+x0;
            maspolygpn[countpolygon][maspolygcn[countpolygon]].Y:=y+y0;

         end;
             drawinbitmap;
             opred;
             pb1.Canvas.Draw(0,0,buf);
       end;
       end else begin

          if newpolygon=1 then begin
           maspolygpn[countpolygon][maspolygcn[countpolygon]].X:=x1+x0;
             maspolygpn[countpolygon][maspolygcn[countpolygon]].Y:=y1+y0;
             drawinbitmap;
             opred;
             pb1.Canvas.Draw(0,0,buf);
             end;
       end;
   end;
 end else
 if play=move then begin
        if playfff2>0 then begin
          if playfff>0 then begin

          x1:=x;
          y1:=y;
         for i:=countpolygon downto 1 do begin
           for li:=0 to maspolygcn[i] do begin
             if (sqr(maspolygpn[i][li].X-x1-x0)+sqr(maspolygpn[i][li].y-y1-y0)<=900) and(sqr(maspolygpn[i][li].X-x1-x0)+sqr(maspolygpn[i][li].y-y1-y0)>0) then begin
               if play=Move then begin
                 sinh:=(maspolygpn[i][li].y-y0-y1)/sqrt(Sqr(maspolygpn[i][li].x-x1-x0)+sqr(maspolygpn[i][li].y-y1-y0)) ;
                 cosh:= (maspolygpn[i][li].x-x0-x1)/sqrt(Sqr(maspolygpn[i][li].x-x1-x0)+sqr(maspolygpn[i][li].y-y1-y0));
                 maspolygpn[i][li].x:=Trunc(30*cosh)+x1+x0;
                 maspolygpn[i][li].y:=Trunc(30*sinh)+y1+y0;
               end;
             end;
      end;

      end;
      drawinbitmap;
        opred;
        form1.pb1.Canvas.Draw(0,0,buf);
      end;
        end;
        for li:=count downto 1 do begin

         if play=move then begin
           if sqr(masrect[li].x2-x-x0)+sqr(masrect[li].y2-y-y0)<=70 then begin
               pb1.Cursor:=crSizeNWSE;
              goto 1;

           end;
         end;
      end;
      if not (pb1.Cursor= crSizeAll) then
       pb1.Cursor:= crSizeAll;
      1:
      if playellipse1>0 then begin
          mascircle[playellipse1].x1:= mascircle[playellipse1].x1+x-x1;
          mascircle[playellipse1].x2:= mascircle[playellipse1].x2+x-x1;
          x1:=x;
         mascircle[playellipse1].y1:= mascircle[playellipse1].y1+y-y1;
         mascircle[playellipse1].y2:= mascircle[playellipse1].y2+y-y1;
          y1:=y;
         drawinbitmap;
         opred;
        form1.pb1.Canvas.Draw(0,0,buf);
      end else
   if playrectscale1>0 then begin
      dx:=x-x1;
      dy:=y-y1;
      if (masrect[playrectscale1].x2+dx>masrect[playrectscale1].x1) and (masrect[playrectscale1].y2+dy>masrect[playrectscale1].y1) then begin
        y1:=y; x1:=x;
        masrect[playrectscale1].x2:=masrect[playrectscale1].x2+dx;
        masrect[playrectscale1].y2:=masrect[playrectscale1].y2+dy;
        drawinbitmap;
        opred;
        form1.pb1.Canvas.Draw(0,0,buf);
      end;
   end else
   if playpolygon1>0 then begin
      dx:=x-x1; x1:=x;
      dy:=y-y1; y1:=y;
      maspolygpn[playpolygon1][playpolygon2].X:=maspolygpn[playpolygon1][playpolygon2].X+dx;
      maspolygpn[playpolygon1][playpolygon2].y:=maspolygpn[playpolygon1][playpolygon2].y+dy;
      drawinbitmap;
      opred;
      form1.pb1.Canvas.Draw(0,0,buf);
   end else
   if playpolygonbody>0 then begin
     dx:=x-x1;
     dy:=y-y1;
    for li:=0 to maspolygcn[playpolygonbody]  do
     begin
      maspolygpn[playpolygonbody][li].X:=maspolygpn[playpolygonbody][li].X+dx;
      maspolygpn[playpolygonbody][li].y:=maspolygpn[playpolygonbody][li].y+dy;
     end;
     x1:=x;
     y1:=y;
     drawinbitmap;
     opred;
     form1.pb1.Canvas.Draw(0,0,buf);
   end else
   if playrect>0 then begin
     masrect[playrect].x1:= masrect[playrect].x1+x-x1;
     masrect[playrect].x2:= masrect[playrect].x2+x-x1;
       x1:=x;
     masrect[playrect].y1:= masrect[playrect].y1+y-y1;
     masrect[playrect].y2:= masrect[playrect].y2+y-y1;
       y1:=y;
     drawinbitmap;
     opred;
     form1.pb1.Canvas.Draw(0,0,buf);
   end else
   if playpixel>0 then begin
     points[playpixel].x1:= points[playpixel].x1+x-x1;
     points[playpixel].y1:=points[playpixel].y1+y-y1;
     x1:=x;
     y1:=y;
     drawinbitmap;
     opred;
     form1.pb1.Canvas.Draw(0,0,buf);
     Form1.pb1.Canvas.Ellipse(points[playpixel].x1-x0-4,points[playpixel].y1-y0-4,points[playpixel].x1-x0+4,points[playpixel].y1-y0+4);
   end;



 end else
 if play=arm then begin
    if (x1>0) and (y1>0) then begin
     x0:=x0-(x-x1);
     x1:=x;
     y0:=y0-(y-y1);
     y1:=y;
     drawinbitmap;
      opred;
     form1.pb1.Canvas.Draw(0,0,buf);
     end;
 end;
end;



procedure TForm1.FormPaint(Sender: TObject);
begin

 buf.Width:=pb1.Width;
 buf.Height:=pb1.Height;
 drawinbitmap;
 opred;
 pb1.Canvas.Draw(0,0,buf);

end;

procedure TForm1.btn1Click(Sender: TObject);
begin

  objct:=rect;
  btn1.Font.Color:=clRed;
  btn4.Font.Color:=clBlack;
  btn6.Font.Color:=clBlack;
  x1:=0;
  y1:=0;
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
pb1.Cursor:= crSizeAll;
  play:=move;
   btn9.Font.Color:=clBlack;
  btn8.Font.Color:=clBlack;
btn2.Font.Color:=clred;
btn5.Font.Color:=clBlack;
btn3.Font.Color:=clBlack;
  x1:=0;
  y1:=0;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
 pb1.Cursor:=crSizeAll;
 play:=arm;
  btn9.Font.Color:=clBlack;
 btn8.Font.Color:=clBlack;
 btn2.Font.Color:=clblack;
 btn5.Font.Color:=clBlack;
 btn3.Font.Color:=clred;
  x1:=0;
  y1:=0;
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
  play:=delete;
   btn9.Font.Color:=clBlack;
   pb1.Cursor:=crHandPoint;
   btn8.Font.Color:=clblack;
   btn2.Font.Color:=clBlack;
   btn5.Font.Color:=clred;
   btn3.Font.Color:=clBlack;
   x1:=0;
   y1:=0;
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
objct:=point;
pb1.Cursor:=crDefault;
btn4.Font.Color:=clRed;
btn1.Font.Color:=clBlack;
btn6.Font.Color:=clBlack;
 x1:=0;
 y1:=0;
end;

procedure TForm1.ud1Click(Sender: TObject; Button: TUDBtnType);
begin
 edt1.Text:=IntToStr(ud1.Position);
 drawinbitmap;
  pb1.Canvas.Draw(0,0,buf);
end;

procedure TForm1.btn7Click(Sender: TObject);
begin
  if dlgColor1.Execute then begin
    shp1.Pen.Color:=dlgColor1.Color;
    shp1.Brush.Color:=dlgColor1.Color;
  end;

end;

procedure TForm1.save1Click(Sender: TObject);
  var i,j:Integer;
begin
 if dlgSave1.Execute then begin
     AssignFile(f,dlgSave1.FileName);
     Rewrite(f);
     Writeln(f,x0);
     Writeln(f,y0);
     Writeln(f,count);
     for i:=1 to count do begin
      Writeln(f,masrect[i].x1);
      Writeln(f,masrect[i].y1);
      Writeln(f,masrect[i].x2);
      Writeln(f,masrect[i].y2);
      Writeln(f,masrect[i].colr);
     end;
     Writeln(f,n);
     for i:=1 to n do begin
      Writeln(f,points[i].x1);
      Writeln(f,points[i].y1);
      Writeln(f,points[i].colr);
     end;
     Writeln(f,SizeEllipse);
     for i:=1 to sizeellipse do begin
       Writeln(f,mascircle[i].x1);
      Writeln(f,mascircle[i].y1);
      Writeln(f,mascircle[i].x2);
      Writeln(f,mascircle[i].y2);
      Writeln(f,mascircle[i].colr);
     end;
     Writeln(f,countpolygon);
     for i:=1 to countpolygon do begin
      Writeln(f,maspolugcr[i]);
      Writeln(f,maspolygcn[i]);

       for j:=0 to maspolygcn[i] do begin
         Writeln(f,maspolygpn[i][j].x,' ',maspolygpn[i][j].y);
       end;
     end;
     CloseFile(f);

 end;
end;

procedure TForm1.load1Click(Sender: TObject);
var i,j:Integer;
begin
 if dlgOpen1.Execute then begin
     AssignFile(f,dlgOpen1.FileName);
     Reset(f);
     readln(f,x0);
     readln(f,y0);
     readln(f,count);
     for i:=1 to count do begin
      readln(f,masrect[i].x1);
      readln(f,masrect[i].y1);
      readln(f,masrect[i].x2);
      readln(f,masrect[i].y2);
      readln(f,masrect[i].colr);
     end;
     readln(f,n);
     for i:=1 to n do begin
      readln(f,points[i].x1);
      readln(f,points[i].y1);
      readln(f,points[i].colr);
     end;
       Readln(f,SizeEllipse);
     for i:=1 to sizeellipse do begin
       Readln(f,mascircle[i].x1);
       Readln(f,mascircle[i].y1);
       Readln(f,mascircle[i].x2);
       Readln(f,mascircle[i].y2);
       Readln(f,mascircle[i].colr);
     end;
     readln(f,countpolygon);
     for i:=1 to countpolygon do begin
     readln(f,maspolugcr[i]);
      readln(f,maspolygcn[i]);
         SetLength(maspolygpn[i],maspolygcn[i]+1);
       for j:=0 to maspolygcn[i] do begin
         readln(f,maspolygpn[i][j].x,maspolygpn[i][j].y);
       end;
     end;
     drawinbitmap;
     opred;
     pb1.Canvas.Draw(0,0,buf);
     CloseFile(f);

 end;
end;

procedure TForm1.btn6Click(Sender: TObject);
begin
  objct:=polygon;
  newpolygon:=0;
  btn1.Font.Color:=clBlack;
  btn4.Font.Color:=clBlack;
  btn6.Font.Color:=clred;
  x1:=0;
  y1:=0;
end;

procedure TForm1.btn8Click(Sender: TObject);
begin
  pb1.Cursor:=crCross;
  play:=draws;
   btn9.Font.Color:=clBlack;
  btn8.Font.Color:=clRed;
  btn2.Font.Color:=clBlack;
  btn5.Font.Color:=clBlack;
  btn3.Font.Color:=clBlack;
 x1:=0;
 y1:=0;
end;

procedure TForm1.btn9Click(Sender: TObject);
begin
  pb1.Cursor:=crHandPoint;
  play:=fill;
  btn8.Font.Color:=clBlack;
  btn2.Font.Color:=clBlack;
  btn5.Font.Color:=clBlack;
  btn3.Font.Color:=clBlack;
  btn9.Font.Color:=clRed;

 x1:=0;
 y1:=0;
end;

procedure TForm1.btn10Click(Sender: TObject);
begin
if dlgColor2.Execute then begin
    shp2.Pen.Color:=dlgColor2.Color;
    shp2.Brush.Color:=dlgColor2.Color;
  end;
end;

procedure TForm1.btn11Click(Sender: TObject);
begin
  if playfff= 0 then begin
  playfff:=1;
  btn11.Font.Color:=clRed;
  end else begin
   playfff:=0;
  btn11.Font.Color:=clBlack;

  end;
end;

procedure TForm1.run2Click(Sender: TObject);
 var i,j:Integer;
begin
  pnl1.Enabled:=False;
  pnl2.Enabled:=False;
  tmr1.Enabled:=True;
  play:=game;
  vectorx:=2;
  vectory:=0;
  playerx:=pb1.Width div 2;
  playery:=pb1.Height div 2;


  for i:=1 to countpolygon do begin
     MinMax[i].x1:=MasPolygPn[i][0].x;
     MinMax[i].y1:=MasPolygPn[i][0].y;
     MinMax[i].x2:=MasPolygPn[i][0].x;
     MinMax[i].y2:=MasPolygPn[i][0].Y;
    for j:=0 to maspolygcn[i] do begin
      if MasPolygPn[i][j].x<=MinMax[i].x1 then MinMax[i].x1:= MasPolygPn[i][j].x;
      if MasPolygPn[i][j].y<=MinMax[i].y1 then MinMax[i].y1:= MasPolygPn[i][j].y;
      if MasPolygPn[i][j].x>=MinMax[i].x2 then MinMax[i].x2:= MasPolygPn[i][j].x;
      if MasPolygPn[i][j].y>=MinMax[i].y2 then MinMax[i].y2:= MasPolygPn[i][j].y;
    end;
  end;
end;

procedure TForm1.tmr1Timer(Sender: TObject);
   var i,j:Integer;
   label 1,2;
begin

     for j:=1 to 1 do begin
       x1:=playerx+vectorx;
       y1:=playery+vectory;
      for i:=countpolygon downto 1 do begin
       if  (MinMax[i].x1<=x1+x0) and (MinMax[i].x2>=x1+x0)and (MinMax[i].y1<=y1+y0) and (MinMax[i].y2>=y1+y0) then
       if ptinpg(x1+x0,y1+y0,maspolygpn[i]) then begin


         goto 1;

       end;

      end;
      for i:=count downto 1 do begin
       if (x1<masrect[i].x2-x0)and(x1>masrect[i].x1-x0) then
       if (y1<masrect[i].y2-y0)and(y1>masrect[i].y1-y0) then begin


         goto 1;
        end;
      end;
     end;
  x0:=x0+vectorx;
  y0:=y0+vectory;

      1:



  drawinbitmap;
  pb1.Canvas.Draw(0,0,buf);
end;

procedure TForm1.btn14Click(Sender: TObject);
begin
objct:=ellipse;
end;

end.
