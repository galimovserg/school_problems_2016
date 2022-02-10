unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   ExtCtrls, Math, Menus, Buttons, Dialogs,Unit2, StdCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;


type
  TForm1 = class(TForm)
    pb1: TPaintBox;
    mm1: TMainMenu;
    menu1: TMenuItem;
    load1: TMenuItem;
    run1: TMenuItem;
    run2: TMenuItem;
    dlgSave1: TSaveDialog;
    dlgOpen1: TOpenDialog;
    tmr1: TTimer;
    lbl1: TLabel;
    tmr2: TTimer;
    mmo1: TMemo;
    idhtp1: TIdHTTP;
    exit1: TMenuItem;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure pb1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pb1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormPaint(Sender: TObject);
    procedure load1Click(Sender: TObject);
    procedure run2Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure exit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  TMyThread = class(TThread)
    private
    { Private declarations }
    ii:Integer;
    x,y:Double;
    mm:TIdHTTP;
    s:WideString;
   // str:TMemo;
  protected
    procedure Execute; override;
    procedure UpdateCaption;
  end;



   const
  arm=5;
  game=6;//игра
  Rplayer=20;
  aml=3;
  NotVector=0;
  PlayerMain=1;
  type  player=record
               Radius,VectorX,VectorY,Step,x,y,inx,iny:Real;
               VectorIn,vvect:Integer;
               masx:array[1..50] of Real;
               masy:array[1..50] of Real;
               lenmas:Integer;
               Visible:Boolean;
               end;
  var
  Form1: TForm1;
  MyThread: TMyThread;


  i,j,iend:Integer;
  Play: integer;
  players:array of player;

  SizeRect,N,CountPolygon,SizeEllipse:integer;
  x0,y0:Real;
  vectorx,vectory,aa:Real;
  playerx,playery:Integer;
  x1,y1:real;
  buf:TBitmap;
  f:Text;
implementation

{$R *.dfm}//проверка отрезков на пересечение

 procedure TMyThread.UpdateCaption;
  var stp:string;
  ll:Integer;
begin
  try
    if iend<100 then  begin
      ll:=1;
    while not (s[ll]='_') do
      ll:=ll+1;
      players[1].x:= StrToFloat(Copy(s,1,ll-1));
      players[1].y:=StrToFloat(Copy(s,ll+1,Length(s)));
    end;
    ii:=iend;
  except
   exit;
  end;
end;

procedure TMyThread.Execute;

begin

  while ii<100 do
   begin
     try
     s:=Form1.idhtp1.Get('http://sergalru.esy.es/server2.php?s='+ FloatToStr(playerx+vectorx+x0)+'_'+ FloatToStr(playery+vectory+y0));
     s:=Form1.idhtp1.Get('http://sergalru.esy.es/cursorpos.in');
     Synchronize(UpdateCaption);
      if ii=100 then break;
      sleep(50);
     except
      exit;
     end;
   end;
end;
procedure drawinbitmap();
    var i,j,cx:Integer;
   tpp:tp;
begin

  buf.Canvas.Brush.Color:=clWhite;
  buf.Canvas.Rectangle(0,0,buf.Width,buf.Height);
  for i:=1 to sizeellipse do begin
    buf.Canvas.Brush.Color:=mascircle[i].colr;
    buf.Canvas.Ellipse(TRUNC(mascircle[i].x1-x0),TRUNC(mascircle[i].y1-y0),TRUNC(mascircle[i].x2-x0),TRUNC(mascircle[i].y2-y0));

  end;
  for i:=1 to SizeRect do begin
    buf.Canvas.Brush.Color:=masrect[i].colr;
    buf.Canvas.Rectangle((masrect[i].x1-trunc(x0)),((masrect[i].y1-trunc(y0))) ,((masrect[i].x2-trunc(x0))),((masrect[i].y2-trunc(y0))));

  end;
  for i:=1 to CountPolygon do
  if (MinMax[i].x2>=trunc(x0))and(MinMax[i].y2>=trunc(y0))  then{if maspolygcn[i]>=2 then} begin
    SetLength(tpp,maspolygcn[i]+1);
    for j:=0 to maspolygcn[i] do begin
      tpp[j].X:=maspolygpn[i][j].x-trunc(x0);
      tpp[j].y:=maspolygpn[i][j].y-trunc(y0);
    end;
    buf.Canvas.Brush.Color:= maspolugcr[i];
    buf.Canvas.Polygon(tpp);
  end;

  for i:=1 to n do begin

    buf.Canvas.Brush.Color:=points[i].colr;
    buf.Canvas.Ellipse((points[i].x1-4-trunc(x0)),(points[i].y1-4-trunc(y0)),points[i].x1+4-trunc(x0),(points[i].y1+4-trunc(y0)));
  end;
   if play=game then begin
   buf.Canvas.Ellipse(playerx-rplayer,playery-rplayer,playerx+rplayer,playery+rplayer);
   buf.Canvas.MoveTo(trunc(playerx+vectorx*rplayer/aml),Trunc(playery+vectory*rplayer/aml));
    buf.Canvas.LineTo(playerx,playery);
    for i:=0 to Length(players)-1 do begin
      buf.Canvas.Ellipse(Trunc(players[i].x-x0-players[i].Radius),Trunc(players[i].y-y0-players[i].Radius),Trunc(players[i].x-x0+players[i].Radius),Trunc(players[i].y-y0+players[i].Radius));
    end;
    end;
end;
function swazi(x1,y1,x2,y2:real):Boolean;
var k,m:LongInt;
label 1;
begin
  swazi:=false;
   for k:=1 to SizeRect do begin
      if  (   LineOfIntersection(x1,y1,x2,y2,masrect[k].x1,masrect[k].y2,masrect[k].x1,masrect[k].y1) or
              LineOfIntersection(x1,y1,x2,y2,masrect[k].x2,masrect[k].y2,masrect[k].x2,masrect[k].y1) or
              LineOfIntersection(x1,y1,x2,y2,masrect[k].x1,masrect[k].y2,masrect[k].x2,masrect[k].y2) or
              LineOfIntersection(x1,y1,x2,y2,masrect[k].x1,masrect[k].y1,masrect[k].x2,masrect[k].y1)
              ) then
       goto 1;

    end;
    for k:=1 to CountPolygon do begin
      for m:=1 to maspolygcn[k] do begin
          if LineOfIntersection(x1,y1,x2,y2,
          maspolygpn[k][m].x,maspolygpn[k][m].Y,maspolygpn[k][m-1].x,maspolygpn[k][m-1].Y) then goto 1;

      end;
       if maspolygcn[k]>1 then
          if LineOfIntersection(x1,y1,x2,y2,
          maspolygpn[k][0].x,maspolygpn[k][0].Y,maspolygpn[k][m-1].x,maspolygpn[k][m-1].Y) then goto 1;

    end;
     swazi:=true;
    1:
end;
procedure opred();
var i,j:Integer;
begin
 for i:=1 to n do begin
  for j:=1 to n do begin
    if swazi(points[i].x1,points[i].y1,points[j].x1,points[j].y1) then begin
      buf.Canvas.MoveTo(points[i].x1-trunc(x0),points[i].y1-trunc(y0));
      buf.Canvas.LineTo(points[j].x1-trunc(x0),points[j].y1-trunc(y0));
    end;
  end;

 end;
end;
procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

if Key=37 then begin //лево
   aa:=aa-3.14;

end;

if Key=39 then begin // вправо
   aa:=aa+3.14;

end;
   vectorx:=aml*cos(aa*pi/180);
   vectory:=aml*sin(aa*pi/180);

end;
procedure TForm1.FormCreate(Sender: TObject);
begin
  n:=0;
  CountPolygon:=0;
  play:=0 ;
   SetLength(players,2);
   players[0].VectorIn:=PlayerMain;
   players[0].x:=playerx+x0-50;
   players[0].y:=playery+y0-50;
   players[0].Radius:=20;
   players[1].VectorIn:=PlayerMain;
   players[1].x:=playerx+x0-50;
   players[1].y:=playery+y0-50;
   players[1].Radius:=10;
   players[1].Step:=1.6;
   players[0].vvect:=0;
   players[1].vvect:=0;
  pb1.Width:=Form1.Width-50;
  pb1.Height:=Form1.Height-100;
  buf:=TBitmap.Create;
  buf.Width:=pb1.Width;
  buf.Height:=pb1.Height;

  x1:=0;
  y1:=0;
end;

procedure TForm1.FormResize(Sender: TObject);
begin

  pb1.Width:=Form1.Width-50;
  pb1.Height:=Form1.Height-100;
  x0:=x0+playerx-pb1.Width div 2;
  y0:=y0+playery-pb1.Height div 2;
   playerx:=pb1.Width div 2;
   playery:=pb1.Height div 2;
  pb1.Canvas.Draw(0,0,buf);
end;




procedure TForm1.pb1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);

begin
  x1:=x;
  y1:=y;
end;

 procedure TForm1.pb1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);

begin
  if Play=game then begin
    if sqr(pb1.Width/2-x)+sqr(pb1.Height/2-y)>rplayer*rplayer then begin
    vectorx:=aml*(x-pb1.Width/2)/sqrt(sqr(pb1.Width/2-x)+sqr(pb1.Height/2-y));
    vectory:=aml*(y-pb1.Height/2)/sqrt(sqr(pb1.Width/2-x)+sqr(pb1.Height/2-y));
    end else
    begin
      vectory:=0;
      vectorx:=0;
    end;
  end;

end;


procedure TForm1.FormPaint(Sender: TObject);
begin
 pb1.Width:=Form1.Width-50;
 pb1.Height:=Form1.Height-100;
 buf.Width:=pb1.Width;
 buf.Height:=pb1.Height;
 drawinbitmap;

 pb1.Canvas.Draw(0,0,buf);

end;

procedure TForm1.load1Click(Sender: TObject);
var i,j:Integer;
begin
 if dlgOpen1.Execute then begin
     AssignFile(f,dlgOpen1.FileName);
     Reset(f);
     readln(f,x0);
     readln(f,y0);
     readln(f,SizeRect);
     for i:=1 to SizeRect do begin
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
       readln(f,CountPolygon);
     for i:=1 to CountPolygon do begin
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
     for i:=1 to CountPolygon do begin
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
end;

procedure TForm1.run2Click(Sender: TObject);

begin
  DoubleBuffered:=True;
  tmr1.Enabled:=True;
  play:=game;
  vectorx:=1;
  vectory:=0;
  playerx:=pb1.Width div 2;
  playery:=pb1.Height div 2;
  players[0].x:=playerx+x0-50;
   players[0].y:=playery+y0-50;
   players[i].Step:=1.2;
  MyThread:=TMyThread.Create(false);
  MyThread.Priority:=tpNormal;
  MyThread.FreeOnTerminate:=true;
end;
 function colider(x1,y1,rplayer:Real):Boolean;
  label 1;
  begin
    colider:=True;
      for i:=countpolygon downto 1 do begin
       if  (MinMax[i].x1<=x1+2*rplayer) and (MinMax[i].x2>=x1-2*rplayer)and
           (MinMax[i].y1<=y1+2*rplayer) and (MinMax[i].y2>=y1-2*rplayer) then
       if CircleInPolygon(x1,y1,maspolygpn[i],rplayer) then begin
          goto 1;

       end;

      end;
      for i:=SizeRect downto 1 do begin
          if CircleInRectangle(masrect[i].x1,masrect[i].y1,masrect[i].x2,masrect[i].y2,x1,y1,rplayer) then
           goto 1;
     end;
     for i:=sizeellipse downto 1 do begin
       if CircleInEllipse(mascircle[i].x1,mascircle[i].y1,mascircle[i].x2,mascircle[i].y2,x1,y1,rplayer) then goto 1;
    end;
    colider:=False;
     1:
  end;
procedure TForm1.tmr1Timer(Sender: TObject);
  var mx,my:real;
      ii:integer;
begin

 if not colider(playerx+vectorx+x0,playery+vectory+y0,Rplayer) then begin
    x0:=x0+vectorx;
    y0:=y0+vectory;
 end;
 lbl1.Caption:='';
 for ii:=0 to Length(players)-1 do if ii<>1 then begin

   if (players[ii].VectorIn=playermain) then
    if swazi(x0+playerx,y0+playery,players[ii].x,players[ii].y) then begin
      players[ii].vectorx:=players[ii].Step*(x0+playerx-players[ii].x)/sqrt(sqr(players[ii].x-(x0+playerx))+sqr(players[ii].y-(y0+playery)));
      players[ii].vectory:=players[ii].Step*(y0+playery-players[ii].y)/sqrt(sqr(players[ii].x-(x0+playerx))+sqr(players[ii].y-(y0+playery)));

      if not colider(players[ii].x+players[ii].vectorx,players[ii].y+players[ii].vectory,players[ii].Radius) then begin
        lbl1.Caption:='sos';
        players[ii].x:=players[ii].x+players[ii].vectorx;
        players[ii].y:=players[ii].y+players[ii].vectory;
        players[ii].inx:=x0+playerx;
        players[ii].iny:=y0+playery;
        players[ii].vvect:=1;

      end;

    end else begin
      if players[ii].vvect=1 then begin
        if not colider(players[ii].x+players[ii].vectorx,players[ii].y+players[ii].vectory,players[ii].Radius)and(players[ii].VectorIn=playermain) then begin

         players[ii].x:=players[ii].x+players[ii].vectorx;
         players[ii].y:=players[ii].y+players[ii].vectory;
         if (abs(players[ii].x-players[ii].inx)<=1)and(abs(players[ii].y-players[ii].iny)<=1)  then begin
             players[ii].inx:=Random(200)-100+players[ii].x;
             players[ii].iny:=Random(200)-100+players[ii].y;
             players[ii].vectorx:=players[ii].Step*(players[ii].inx-players[ii].x)/sqrt(sqr(players[ii].x-players[ii].inx)+sqr(players[ii].y-players[ii].iny)+0.0001);
             players[ii].vectory:=players[ii].Step*(players[ii].iny-players[ii].y)/sqrt(sqr(players[ii].x-players[ii].inx)+sqr(players[ii].y-players[ii].iny)+0.0001);
         end;
        end else begin
             players[ii].inx:=Random(200)-100+players[ii].x;
             players[ii].iny:=Random(200)-100+players[ii].y;
             players[ii].vectorx:=players[ii].Step*(players[ii].inx-players[ii].x)/sqrt(sqr(players[ii].x-players[ii].inx)+sqr(players[ii].y-players[ii].iny)+0.0001);
             players[ii].vectory:=players[ii].Step*(players[ii].iny-players[ii].y)/sqrt(sqr(players[ii].x-players[ii].inx)+sqr(players[ii].y-players[ii].iny)+0.0001);


        end;
      end;

    end;

 end;

  drawinbitmap;
  pb1.Canvas.Draw(0,0,buf);
end;

procedure TForm1.exit1Click(Sender: TObject);
begin
 iend:=100;
 Sleep(1000);
 halt;
end;

end.
