unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, ExtCtrls;

type
  TForm1 = class(TForm)
    mm1: TMainMenu;
    menu1: TMenuItem;
    begin1: TMenuItem;
    exit1: TMenuItem;
    help1: TMenuItem;
    lbl1: TLabel;
    btn1: TButton;
    lbl2: TLabel;
    edt1: TEdit;
    info1: TMenuItem;
    tmr1: TTimer;
    btn2: TButton;
    btn3: TButton;
    pb1: TPaintBox;
    shp1: TShape;
    procedure begin1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure pb1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure exit1Click(Sender: TObject);

  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  Form1: TForm1;
  st1,st2,st3:Integer;//1-прирост  2-были завоевания или нет 3-определяет потерю при нападении
  countplayer,countcountry:Byte;//колличество игроков и стран
  sizemap:Integer;//колличество единиц територий
  pln,//номер текущего игрока
  wx,wy, // смежность
  xh,yh,   //высота и ширина поля
  r,g,b, //для работы с цветами
  xc,yc:Byte; //счетчики  для поля
  map:array[1..3,0..100,0..100] of Integer;//собственно сама карта в 3 номер страны, в первом номер игрока во втором количество армии
  playercolor:array[1..20] of TColor;//цвета игроков
  countrysize:array[1..20] of Integer;//размеры стран
  countryplayer:array[1..20,1..20] of Integer;//сколько точек определенной станы содержит игрок 1 индекс номер игрока 2 индекс номер страны
  countrycolor:array[1..20] of Tcolor;//цвета стран
  playersize:array[1..5,1..20] of Integer;//в 1 колличество точек, во 2 колличесттво регионов, в 3 колличество карт
  play:byte;//определяет действие: если 1 то подкрепление, если 2 то режим нападения, если 3 то перемещение
  coordx1,coordy1,flag1:Byte;//курсор выделения
  coordx2,coordy2,flag2:Byte;//курсор наведения
  f:Text;//файл с картой
  i,zx,paintr:Integer;//вспомогательные переменные(счетчики и т.п)ж
 implementation


{$R *.dfm}
 procedure painter(i,j:integer);
begin
   if map[1,i,j]=pln then begin
    map[1,i,j]:=-1;
    painter(i-1,j);
    painter(i+1,j);
    painter(i,j-1);
    painter(i,j+1);

   end;

end;
procedure paints;
var i,j:Integer;
begin
 paintr:=0;
  painter(coordy1,coordx1);
 if map[1,coordy2,coordx2]=-1 then paintr:=1;
  for i:=1 to xh do begin
    for j:=1 to yh do begin
      if map[1,i,j]=-1 then map[1,i,j]:=pln;
    end;
  end;
end;

procedure zcx(n:integer); //определяет бонусные армии
 var i:Integer;
begin
  zx:=0;
 for i:=1 to countcountry do begin
  if countryplayer[n,i]=countrysize[i] then zx:=zx+(countrysize[i] div 2);

 end;

end;
 procedure draws;
 begin

 Form1.pb1.Canvas.Font.Size:=14;
 Form1.Color:=RGB(50,50,250);
 Form1.pb1.Canvas.Pen.Width:=1;

            for  xc:=1 to xh do begin
                for yc:=1 to yh do begin

                  if map[1,xc,yc]>0 then  begin
                       with Form1.pb1.Canvas do begin
                         Form1.pb1.Canvas.Pen.Color:=countrycolor[map[3,xc,yc]];
                         Brush.Color:=countrycolor[map[3,xc,yc]];
                         Rectangle(yc*40,xc*40,yc*40+40,xc*40+40);
                         Brush.Color:=ColorToRGB(playercolor[map[1,xc,yc]]);
                           Form1.pb1.Canvas.Pen.Color:=RGB(0,0,0);
                         Ellipse(yc*40,xc*40,yc*40+40,xc*40+40);
                         TextOut(yc*40+7,xc*40+5,IntToStr(map[2,xc,yc]));
                       end;
                       end;


                     end;

                end;

                for i:=1 to countplayer do begin
                 with  form1.pb1.Canvas do   begin
                  Brush.Color:=ColorToRGB(playercolor[i]);
                  Rectangle(i*40+40,xh*40+40,i*40+80,xh*40+80);
                  TextOut(i*40+47,xh*40+45,IntToStr(playersize[3,i]));
                 end;
                 end;

                 if flag1=1  then begin
                 with Form1.pb1.Canvas do begin
                  Form1.pb1.Canvas.Pen.Width:=4;
                  Pen.Color:=RGB(250,0,0);
                  Brush.Color:=ColorToRGB(playercolor[map[1,coordy1,coordx1]]);
                  Ellipse(coordx1*40+1,coordy1*40+1,coordx1*40+40-1,coordy1*40+40-1);
                  TextOut(coordx1*40+7,coordy1*40+5,IntToStr(map[2,coordy1,coordx1]));

                 end;
                end;
end;
procedure TForm1.begin1Click(Sender: TObject);
begin
 Randomize;
 sizemap:=0;
 AssignFile(f,'map.txt');
 Reset(f);
 Readln(f,countplayer);
 for i:=1 to countplayer do begin
      Readln(f,r,g,b);
      playercolor[i]:=RGB(r,g,b);
      playersize[1,i]:=0;
      playersize[2,i]:=0;
      playersize[3,i]:=5;
 end;
      Readln(f,xh,yh);
 for  xc:=1 to xh do begin
   for yc:=1 to yh do begin
     read(f,map[1,xc,yc]);
     if map[1,xc,yc]=0 then map[2,xc,yc]:=0 else  begin
     map[1,xc,yc]:=Random(countplayer)+1;
     map[2,xc,yc]:=1;
     inc(sizemap);
     inc(playersize[1,map[1,xc,yc]]);
         end;
   end;
     readln(f);

 end;

  Readln(f,countcountry);

 for i:=1 to countcountry do begin
      Readln(f,r,g,b);
      countrycolor[i]:=RGB(r,g,b);
      countrysize[i]:=0;
 end;
  for  xc:=1 to xh do begin
   for yc:=1 to yh do begin
       read(f,map[3,xc,yc]);
       if map[3,xc,yc]>0 then begin
        Inc(countrysize[map[3,xc,yc]]);
        Inc(countryplayer[map[1,xc,yc],map[3,xc,yc]]);
       end;
   end;
   Readln(f);
   end;
    CloseFile(f);

 draws;
  play:=1;
     pln:=1;
     zcx(pln);
     st1:=3 +zx;
     if playersize[3,pln]>4 then begin
     st1:=st1+2*playersize[3,pln];
     playersize[3,pln]:=0;
     end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
SetWindowLong(Handle, GWL_EXSTYLE, WS_EX_TOOLWINDOW AND NOT WS_EX_APPWINDOW);
 end;
procedure TForm1.btn2Click(Sender: TObject);
begin
  edt1.Text:= IntToStr(StrToInt(edt1.Text)+1);
 draws;
 draws;
end;

procedure TForm1.pb1Click(Sender: TObject);

 var m:TPoint;
    x1,y1:integer;
    label 1;
begin
   GetCursorPos(m);
   m := Form1.ScreenToClient(m);
   x1:=(m.x)div 40;
   y1:=(m.y)div 40;
   if (x1<=yh) and (y1<=xh) and (x1>=1)and (y1>=1) then begin
     if play=1  then begin

      if map[1,y1,x1]=pln then begin
        coordx1:=x1;
        coordy1:=y1;
        flag1:=1;
         if st1-StrToInt(edt1.text)<0 then  else begin
          st1:=st1- StrToInt(edt1.text);
          lbl2.Caption:='подкрепление осталось: '+ IntToStr(st1) ;
          map[2,y1,x1]:=map[2,y1,x1]+ StrToInt(edt1.text);
         end;
         if st1=0 then begin
          play:=2;
          flag1:=0;
          lbl2.Caption:='нападение;' ;
         end;
        end;

     end else if play=2 then begin


        if flag1=0 then begin
          if map[1,y1,x1]=pln then begin
            coordx1:=x1;
            coordy1:=y1;
            flag1:=1;
            flag2:=0;
           end;
        end else begin

               if map[1,y1,x1]=pln then begin
                coordx1:=x1;
                coordy1:=y1;
                flag1:=1;
                end else
               if (map[1,y1,x1]>0) then begin
                coordx2:=x1;
                coordy2:=y1;
                wx:=Abs(coordx1-coordx2);
                wy:=Abs(coordy1-coordy2);
                if (((wx=1) and (wy=0))or((wy=1) and (wx=0)))and(map[2,coordy1,coordx1]>1) then begin
                    st3:=map[2,coordy1,coordx1]-map[2,coordy2,coordx2]-random(4);
                    if st3=0 then begin
                      map[2,coordy2,coordx2]:=1;
                      map[2,coordy1,coordx1]:=1;
                    end else begin
                     if st3<0 then begin

                        if map[2,coordy2,coordx2]<Abs(st3) then begin
                          map[2,coordy2,coordx2]:=1;
                          map[2,coordy1,coordx1]:=1;

                         end else begin
                         map[2,coordy2,coordx2]:=Abs(st3);
                         map[2,coordy1,coordx1]:=1;
                        end;
                      end else begin
                         countryplayer[map[1,coordy2,coordx2],map[3,coordy2,coordx2]]:= countryplayer[map[1,coordy2,coordx2],map[3,coordy2,coordx2]]-1;
                         Inc(countryplayer[map[1,coordy1,coordx1],map[3,coordy2,coordx2]]);
                         playersize[1,map[1,coordy2,coordx2]]:=playersize[1,map[1,coordy2,coordx2]]-1;
                        if playersize[1,map[1,coordy2,coordx2]]=0 then
                        begin
                        playersize[3,map[1,coordy1,coordx1]]:= playersize[3,map[1,coordy1,coordx1]]+ playersize[3,map[1,coordy2,coordx2]] ;
                        playersize[3,map[1,coordy2,coordx2]]:=0;

                        end;


                        map[1,coordy2,coordx2]:=pln;
                        Inc(playersize[1,pln]);
                        st2:=1;
                        if Abs(st3)+2- StrToInt(edt1.text)>1 then begin
                        map[2,coordy2,coordx2]:=Abs(st3)- StrToInt(edt1.text)+1;
                        map[2,coordy1,coordx1]:=StrToInt(edt1.Text);

                        end else begin
                          map[2,coordy2,coordx2]:=Abs(st3);
                          map[2,coordy1,coordx1]:=1;

                        end;
                      end;
                    end;


                end;

              end;



        end;




     end else begin
      if play=3 then begin
         if map[1,y1,x1]=pln then begin
         if flag1=0 then begin

        coordx1:=x1;
        coordy1:=y1;
        flag1:=1;

        end else begin

        coordx2:=x1;
        coordy2:=y1;
          if (coordx1=coordx2)and(coordy1=coordy2) then begin
            flag1:=0;
          end else begin
               // uggggggggggggggggggggggg
               paints();

            if (map[2,coordy1,coordx1]>StrToInt(edt1.Text))and(Paintr=1) then begin


             map[2,coordy2,coordx2]:=map[2,coordy2,coordx2]+ map[2,coordy1,coordx1]-StrToInt(edt1.Text);
             map[2,coordy1,coordx1]:=StrToInt(edt1.Text);
             playersize[3,pln]:=playersize[3,pln]+st2;
             st2:=0;
             play:=1;
             1:
       inc(pln);
       if pln>countplayer then pln:=1;
       if playersize[1,pln]=0 then goto 1;
       zcx(pln);
     st1:=3 +zx;
     if playersize[3,pln]>4 then begin
     st1:=st1+2*playersize[3,pln];
     playersize[3,pln]:=0;
     end;
       lbl2.Caption:='подкрепление осталось: '+ IntToStr(st1);
       shp1.Brush.Color:=playercolor[pln];
              end;

          end;
        end;
        end;

      end;

     end;
     draws;
   end;
end;


procedure TForm1.FormResize(Sender: TObject);
begin
draws;
end;

procedure TForm1.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
draws;
end;

procedure TForm1.btn1Click(Sender: TObject);
label 1;
begin
 if play=2 then begin
  play:=3;
  flag1:=0;
  lbl2.Caption:='передвижение';
 end else begin
   if play=3 then begin
       playersize[3,pln]:=playersize[3,pln]+st2;
       st2:=0;
       play:=1;
       1:
       inc(pln);
     if pln>countplayer then pln:=1;
     if playersize[1,pln]=0 then goto 1;
     zcx(pln);
     st1:=3 +zx;
     if playersize[3,pln]>4 then begin
     st1:=st1+2*playersize[3,pln];
     playersize[3,pln]:=0;
     end;
     lbl2.Caption:='подкрепление осталось: '+ IntToStr(st1);
     shp1.Brush.Color:=playercolor[pln];

   end;

 end;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
  if StrToInt(edt1.Text)>1 then
edt1.Text:= IntToStr(StrToInt(edt1.Text)-1);
 draws;
end;

procedure TForm1.exit1Click(Sender: TObject);
begin
Close;
end;


end.
