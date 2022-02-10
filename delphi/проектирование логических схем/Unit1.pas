unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls, Buttons, ComCtrls;

type
  TForm1 = class(TForm)
    pnl1: TPanel;
    pb1: TPaintBox;
    dlgOpen1: TOpenDialog;
    dlgSave1: TSaveDialog;
    mm1: TMainMenu;
    menu1: TMenuItem;
    save1: TMenuItem;
    open1: TMenuItem;
    exit1: TMenuItem;
    projekt1: TMenuItem;
    stat1: TStatusBar;
    pnl2: TPanel;
    lbl1: TLabel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    btn3: TBitBtn;
    btn4: TBitBtn;
    pnl3: TPanel;
    lbl2: TLabel;
    btn8: TBitBtn;
    btn5: TBitBtn;
    btn6: TBitBtn;
    btn7: TBitBtn;
    btn9: TBitBtn;
    btn10: TBitBtn;
    btn11: TBitBtn;
    btn12: TBitBtn;
    btn13: TButton;
    PANELS1: TMenuItem;
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure pb1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure exit1Click(Sender: TObject);
    procedure pb1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pb1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn11Click(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure btn12Click(Sender: TObject);
    procedure save1Click(Sender: TObject);
    procedure open1Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btn13Click(Sender: TObject);
    procedure PANELS1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
const

  //objects
  or_=0;
  and_=1;
  button_=2;
  lamp_=3;
  not_=4;
  xor_=5;
  trg_=6;
  //action
  none_=0;
  move_=1;
  create_=2;
  delte_=3;
  see_=5;
  conect_=4;
type element=record
          x,y:Integer;
        types:integer;
      caption:Integer;
          A,B:Integer;
          pos:Boolean;
          position:Boolean;
    end;
var
  Form1: TForm1;
  objects:Integer;
  action_:integer;
  buf:TBitmap;

  //parametrs of graphic
  bgcolor,textcolor,linecolor,bordercolor,color:TColor;
  widthbtn,heightbtn,widthelement,heightelement,radiuslamp:Integer;
  //position coordinate
  x0,y0,x1,y1,use_i,conect1:Integer;
  sizemas:Integer;
  mas:array of element;
  arms:Boolean;
  f:Text;
implementation

{$R *.dfm}

procedure ff();
var i,a,b:Integer;
  function ft(i:integer):Integer;
   begin
      if (i>0) and (i<= sizemas) then begin

        if mas[i].pos=false then begin
           mas[i].pos:=True;
         if mas[i].position then begin
           ft:=mas[i].caption;
         end else
         if mas[i].types=button_ then begin
           ft:=mas[i].caption;
         end else
         if  mas[i].types=and_ then  begin
           mas[i].caption:=ft(mas[i].a)*ft(mas[i].b);
           ft:=mas[i].caption;
         end else
         if mas[i].types=or_ then begin
            if (ft(mas[i].A)=1) or (ft(mas[i].B)=1) then begin
                ft:=1;
                 mas[i].caption:=1;
            end else begin  ft:=0;mas[i].caption:=0;  end;

         end else
         if mas[i].types=not_ then  begin
             mas[i].caption:=1-ft(mas[i].A);
               ft:=mas[i].caption;
              end else
         if mas[i].types=xor_ then begin
           if ft(mas[i].a)<>ft(mas[i].b) then  begin
           ft:=1;
           mas[i].caption:=1;
           end else begin
           ft:=0;
            mas[i].caption:=0;
           end;
         end else
         if mas[i].types=trg_  then begin
           a:=ft(mas[i].a);
           b:=ft(mas[i].b);
           if b=1 then begin
             mas[i].caption:=1;
           end;
           if a=1 then begin
             mas[i].caption:=0;
           end;
           ft:=mas[i].caption;
         end;

        end else
         ft:=mas[i].caption;

        mas[i].pos:=False;
        mas[i].position:=True;
      end else  ft:=0;

   end;
begin
 for i:=1 to sizemas do begin
   mas[i].position:=False;
 end;
 for i:=1 to sizemas do begin
   if mas[i].types=lamp_ then begin
       mas[i].caption:=ft(mas[i].A);
   end;
 end;
end;
procedure drawss();
 var i:Integer;
begin
  ff;
  buf.Canvas.Brush.Color:= bgcolor;
  buf.Canvas.Rectangle(0,0,buf.Width,buf.Height);
  buf.Canvas.Brush.Color:= clWhite;

  buf.Canvas.Pen.Width:=4;
  buf.Canvas.Font.Color:=textcolor;
  buf.Canvas.Pen.Color:=clBlack;

  //buf.Canvas.Font.Size:=heightelement div 2;
  for i:=1 to sizemas do begin
    if (mas[i].types=or_)or(mas[i].types=and_)
    or(mas[i].types=not_)or(mas[i].types=xor_)
    or(mas[i].types=trg_)
     then begin
                      
       if (mas[i].a>0) and (mas[i].a<=sizemas) then begin

         buf.Canvas.MoveTo(mas[i].x-x0,mas[i].y-y0);
         if (mas[mas[i].A].types=or_)or(mas[mas[i].A].types=and_)
         or(mas[mas[i].a].types=not_)or(mas[mas[i].a].types=xor_)
         or (mas[mas[i].a].types=trg_)
         then
         buf.Canvas.LineTo(mas[mas[i].A].x-x0+ widthelement,mas[mas[i].A].y-y0+ heightelement div 2)
         else
         buf.Canvas.LineTo(mas[mas[i].A].x-x0+ widthbtn,mas[mas[i].A].y-y0+heightbtn div 2) ;
       end;
       if (mas[i].b>0)and (mas[i].b<=sizemas) then begin
         buf.Canvas.MoveTo(mas[i].x-x0,mas[i].y-y0+ heightelement);
          if (mas[mas[i].b].types=or_)or(mas[mas[i].b].types=and_)
          or(mas[mas[i].b].types=not_)or(mas[mas[i].b].types=xor_)
          or(mas[mas[i].b].types=trg_)
          then
         buf.Canvas.LineTo(mas[mas[i].b].x-x0+ widthelement,mas[mas[i].b].y-y0+ heightelement div 2) else
         buf.Canvas.LineTo(mas[mas[i].b].x-x0+ widthbtn,mas[mas[i].b].y-y0+ heightbtn div 2);
       end;
    end else if (mas[i].a>0)and(mas[i].a<=sizemas) then begin
        buf.Canvas.MoveTo(mas[i].x-x0,mas[i].y-y0+heightbtn div 2);
        if (mas[mas[i].A].types=or_)or(mas[mas[i].A].types=and_)or
          (mas[mas[i].a].types=not_)or(mas[mas[i].a].types=xor_)or
           (mas[mas[i].a].types=trg_)
          then   begin
         buf.Canvas.LineTo(mas[mas[i].A].x-x0+ widthelement,mas[mas[i].A].y-y0+ heightelement div 2)
        end else
         buf.Canvas.LineTo(mas[mas[i].A].x-x0+ widthbtn,mas[mas[i].A].y-y0+heightbtn div 2);
    end;
  end;
  buf.Canvas.Pen.Color:=bordercolor;
  for i:=1 to sizemas do begin
    buf.Canvas.Font.Color:=textcolor;
   if (mas[i].types=or_)or(mas[i].types=xor_)or(mas[i].types=and_)or(mas[i].types=trg_) then begin
     buf.Canvas.Font.Size:=heightelement div 2;
     buf.Canvas.Rectangle(mas[i].x-x0,mas[i].y-y0,mas[i].x-x0+ widthelement,mas[i].y-y0+ heightelement);
     buf.Canvas.Rectangle(mas[i].x-x0,mas[i].y-y0,mas[i].x-x0+ widthelement div 3,mas[i].y-y0+ heightelement div 2);
     buf.Canvas.Rectangle(mas[i].x-x0,mas[i].y-y0+ heightelement div 2,mas[i].x-x0+ widthelement div 3 ,mas[i].y-y0+ heightelement);
     if mas[i].types=xor_ then
     buf.Canvas.TextOut(mas[i].x-x0+widthelement div 3+4,mas[i].y-y0+heightelement div 12,'xor') else
     if mas[i].types=or_  then
     buf.Canvas.TextOut(mas[i].x-x0+widthelement div 3+4,mas[i].y-y0+heightelement div 12,' or') else
     if mas[i].types=and_ then
     buf.Canvas.TextOut(mas[i].x-x0+widthelement div 3+4,mas[i].y-y0+heightelement div 12,'and');
     if mas[i].types=trg_ then begin
      buf.Canvas.TextOut(mas[i].x-x0+widthelement div 3+4,mas[i].y-y0+heightelement div 12,' Tr');
      buf.Canvas.Font.Size:=heightelement div 4-1;
      buf.Canvas.TextOut(mas[i].x-x0+10,mas[i].y-y0+4,'R');
      buf.Canvas.TextOut(mas[i].x-x0+10,mas[i].y-y0+4+heightelement div 2,'S');
     end else begin
     buf.Canvas.Font.Size:=heightelement div 4-1;
     buf.Canvas.TextOut(mas[i].x-x0+10,mas[i].y-y0+4,'A');
     buf.Canvas.TextOut(mas[i].x-x0+10,mas[i].y-y0+4+heightelement div 2,'B');
     end;
   end else
   if mas[i].types=not_ then begin
     buf.Canvas.Font.Size:=heightelement div 2;
     buf.Canvas.Rectangle(mas[i].x-x0,mas[i].y-y0,mas[i].x-x0+ widthelement,mas[i].y-y0+ heightelement);
     buf.Canvas.TextOut(mas[i].x-x0+widthelement div 3+4,mas[i].y-y0+heightelement div 12,'not');
   end else
    if mas[i].types=button_ then begin
     buf.Canvas.Font.Size:=heightbtn div 2;
     buf.Canvas.Rectangle(mas[i].x-x0,mas[i].y-y0,mas[i].x-x0+ widthbtn,mas[i].y-y0+ heightbtn);
     buf.Canvas.TextOut(mas[i].x-x0+15,mas[i].y-y0+4,IntToStr(mas[i].caption));
  end else
  if mas[i].types=lamp_ then begin
     buf.Canvas.Font.Color:=clBlue;
     buf.Canvas.Font.Size:=heightbtn div 2;
     buf.Canvas.Rectangle(mas[i].x-x0,mas[i].y-y0,mas[i].x-x0+ widthbtn,mas[i].y-y0+ heightbtn);
     buf.Canvas.TextOut(mas[i].x-x0+15,mas[i].y-y0+4,IntToStr(mas[i].caption));
  end;
  end;
  Form1.pb1.Canvas.Draw(0,0,buf);
end;
procedure searh_xy(x,y:Integer; var use_i:Integer) ;
var i:Integer;
begin
   use_i:=0;
      for i:=sizemas downto 1 do begin
        if (mas[i].types=or_ )or (mas[i].types=and_)
         or(mas[i].types=not_)or(mas[i].types=xor_)
         or(mas[i].types=trg_) then begin
           if (x+x0>mas[i].x)and(x+x0<mas[i].x+ widthelement)
             and(y+y0>mas[i].y)and(y+y0<mas[i].y+ heightelement) then begin
              use_i:=i;
              Break;
           end;
        end else
        if (mas[i].types=button_)or(mas[i].types=lamp_) then begin
            if (x+x0>mas[i].x)and(x+x0<mas[i].x+ widthbtn)
             and(y+y0>mas[i].y)and(y+y0<mas[i].y+ heightbtn) then begin
              use_i:=i;
              Break;
            end;
        end;

      end;
end;
procedure rezz();
begin
 with Form1 do   begin
   pnl1.Left:=Form1.Width- pnl1.Width-25;
   pb1.Width:=pnl1.Left-25;
   pb1.Height:=Form1.Height-100;
   buf.Height:=pb1.Height;
   buf.Width:=pb1.Width;
 end;
end;
procedure downbtns1();
begin
 with Form1 do begin
    btn1.Font.Color:=  clBlack;
    btn2.Font.Color:=  clBlack;
    btn3.Font.Color:=  clBlack;
    btn4.Font.Color:=  clBlack;
    btn11.Font.Color:= clBlack;
    btn10.Font.Color:= clBlack;
    btn12.Font.Color:= clBlack;
 end;
end;
procedure downbtns2();
begin
 with Form1 do begin
    btn5.Font.Color:=clBlack;
    btn6.Font.Color:=clBlack;
    btn7.Font.Color:=clBlack;
    btn8.Font.Color:=clBlack;
 end;
end;
procedure TForm1.FormPaint(Sender: TObject);
begin
 //rezz;
 drawss();
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 buf:= TBitmap.Create;
 rezz;
 sizemas:=0;
 SetLength(mas,0);
 objects:=or_;
 btn1.Font.Color:=clRed;
 action_:=create_;
 btn8.Font.Color:=clRed;
 x0:=0; y0:=0;
 bgcolor:=clBlue;
 color:=clWhite;
 textcolor:=clRed;
 bordercolor:=clBlack;
 widthbtn:=40;
 heightbtn:=40;
 widthelement:=85;
 heightelement:=40;
 radiuslamp:=8;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
 rezz;
end;
//управление кнопки
procedure TForm1.btn1Click(Sender: TObject);
begin
 objects:=or_;
 downbtns1();
 btn1.Font.Color:=clRed;
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
 objects:=and_;
 downbtns1();
 btn2.Font.Color:=clRed;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
 objects:=button_;
 downbtns1();
 btn3.Font.Color:=clRed;
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
 objects:=lamp_;
 downbtns1();
 btn4.Font.Color:=clRed;
end;

procedure TForm1.btn8Click(Sender: TObject);
begin
   action_:=create_;
   downbtns2();
   btn8.Font.Color:=clRed;
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
  arms:=False;
  use_i:=0;
 action_:=move_;
 downbtns2();
 btn5.Font.Color:=clRed;
end;

procedure TForm1.btn6Click(Sender: TObject);
begin
 action_:=delte_;
 downbtns2();
 btn6.Font.Color:=clRed;
end;

procedure TForm1.btn7Click(Sender: TObject);
begin
 action_:=conect_;
 use_i:=0;
 conect1:=0;
 downbtns2();
 btn7.Font.Color:=clRed;
end;

procedure TForm1.pb1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
 var cm:Integer;
begin
   searh_xy(x,y,cm);
   stat1.SimpleText:= 'x= '+IntToStr(x) +' y= '+IntToStr(y);
   if cm>0 then begin
      stat1.SimpleText:= stat1.SimpleText+' out= '+ IntToStr(mas[cm].caption);
   end;
    cm:=0;
   if (arms) then begin
     x0:=x0+x1-x;
     y0:=y0+y1-y;
     drawss;
     x1:=x;
     y1:=y;

   end else
   if action_=move_ then begin
     if use_i>0 then begin
       mas[use_i].x:= mas[use_i].x+x-x1;
       mas[use_i].y:=mas[use_i].y+y-y1;
       x1:=x;
       y1:=y;
       drawss;

     end;
   end;
end;

procedure TForm1.exit1Click(Sender: TObject);
begin
    Halt(0);
end;

procedure TForm1.pb1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var i:integer;
  label 1;
begin
  if action_=create_ then begin
     searh_xy(x,y,use_i);
     if use_i>0 then begin
       if mas[use_i].types=button_ then begin
           mas[use_i].caption:=(1-mas[use_i].caption);
           use_i:=0;
           goto 1;
       end;
     end;
     inc(sizemas);
     SetLength(mas,sizemas+1);
     mas[sizemas].types:=objects;
     mas[sizemas].x:=x+x0;
     mas[sizemas].y:=y+y0;
     1:
  end else
  if action_=conect_ then begin
     searh_xy(x,y,use_i);
     if use_i>0 then begin

         if (conect1=0) and ( mas[use_i].types<>lamp_) then
          begin
            stat1.SimpleText:='aaaa' ;
            conect1:=use_i;

          end else
        if (conect1>0) and ( mas[use_i].types<>button_) then
          begin
             if use_i<>conect1 then begin
                stat1.SimpleText:='aaaa' ;
                if (mas[use_i].types=or_)or(mas[use_i].types=and_)or(mas[use_i].types=xor_)or(mas[use_i].types=trg_) then begin
                  if Y<mas[use_i].y-y0+ heightelement div 2 then
                 mas[use_i].A:=conect1 else
                 mas[use_i].b:=conect1

                end else
                mas[use_i].A:=conect1

             end;
               conect1:=0;
          end;

          use_i:=0;
     end else arms:=True;
     x1:=x;
     y1:=y;
  end else
  if action_=move_  then begin
      searh_xy(x,y,use_i);
      if use_i>0 then else arms:=True;
      x1:=x;
      y1:=y;
  end else
  if action_=delte_ then begin
      searh_xy(x,y,use_i);
      if use_i>0 then  begin

        mas[use_i]:=mas[sizemas];
        mas[sizemas].caption:=0;
        mas[sizemas].A:=0;
        mas[sizemas].B:=0;

         for i:=1 to sizemas do begin
         if mas[i].A=use_i then   mas[i].A:=0;
         if mas[i].B=use_i then   mas[i].B:=0;
        end;
        for i:=1 to sizemas do begin
         if mas[i].A=sizemas then   mas[i].A:=use_i;
         if mas[i].B=sizemas then   mas[i].B:=use_i;
        end;
        Dec(sizemas);
      end else arms:=True;
      x1:=x;
      y1:=y;
  end;
  drawss();
end;

procedure TForm1.pb1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   if  arms then arms:=False;
   if action_=move_ then begin
     if use_i>0 then use_i:=0;

   end;
end;

procedure TForm1.btn11Click(Sender: TObject);
begin
objects:=not_;
 downbtns1();
 btn11.Font.Color:=clRed;
end;

procedure TForm1.btn10Click(Sender: TObject);
begin
objects:=xor_;
downbtns1();
btn10.Font.Color:=clRed;
end;

procedure TForm1.btn12Click(Sender: TObject);
begin
objects:=trg_;
downbtns1();
 btn12.Font.Color:=clRed;
end;

procedure TForm1.save1Click(Sender: TObject);
var i:Integer;
begin
if dlgSave1.Execute then begin
   AssignFile(f,dlgSave1.FileName);
   Rewrite(f);
   Writeln(f,sizemas);
   for i:=1 to sizemas do begin
     with mas[i] do begin
     writeln(f,types);
     Writeln(f,x);
     Writeln(f,y);
     Writeln(f,a);
     Writeln(f,b);
     Writeln(f,caption);
     end;
   end;
   CloseFile(f);
end;
end;

procedure TForm1.open1Click(Sender: TObject);
var i:Integer;
begin

if dlgOpen1.Execute then begin
   AssignFile(f,dlgOpen1.FileName);
   Reset(f);
   Readln(f,sizemas);
   SetLength(mas,sizemas+1);
   for i:=1 to sizemas do begin
     with mas[i] do begin
     Readln(f,mas[i].types);
     Readln(f,x);
     Readln(f,y);
     Readln(f,a);
     Readln(f,b);
     Readln(f,caption);
     end;
   end;
   CloseFile(f);
   ff;
   drawss;
end;
end;

procedure TForm1.btn9Click(Sender: TObject);
begin
action_:=see_;
end;

procedure TForm1.btn13Click(Sender: TObject);
begin
pnl1.Visible:=False;
end;

procedure TForm1.PANELS1Click(Sender: TObject);
begin
pnl1.Visible:=True;
end;

end.
