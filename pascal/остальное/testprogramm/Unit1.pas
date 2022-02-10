unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Menus;

type
  TForm1 = class(TForm)
    pnl1: TPanel;
    mmo1: TMemo;
    lbl1: TLabel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    pnl7: TPanel;
    lbl2: TLabel;
    btn1: TButton;
    btn2: TButton;
    mm1: TMainMenu;
    mmo2: TMemo;
    mmo3: TMemo;
    mmo4: TMemo;
    mmo5: TMemo;
    mmo6: TMemo;
    mmo7: TMemo;
    lbl3: TLabel;
    menu1: TMenuItem;
    exit1: TMenuItem;
    procedure pnl2Click(Sender: TObject);
    procedure mmo2Click(Sender: TObject);
    procedure pnl3Click(Sender: TObject);
    procedure mmo3Click(Sender: TObject);
    procedure pnl4Click(Sender: TObject);
    procedure mmo4Click(Sender: TObject);
    procedure pnl5Click(Sender: TObject);
    procedure mmo5Click(Sender: TObject);
    procedure pnl6Click(Sender: TObject);
    procedure mmo6Click(Sender: TObject);
    procedure pnl7Click(Sender: TObject);
    procedure mmo7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  testname:string;
  serg:array[1..6] of Byte;
implementation

{$R *.dfm}

procedure TForm1.pnl2Click(Sender: TObject);
begin
 if serg[1]=0 then begin
 pnl2.Color:=clYellow;
 serg[1]:=1;
 end else if serg[1]=1 then begin
 pnl2.Color:=clWhite;
 serg[1]:=0;
 end;
end;

procedure TForm1.mmo2Click(Sender: TObject);
begin
  if serg[1]=0 then begin
 pnl2.Color:=clYellow;
 serg[1]:=1;
 end else if serg[1]=1 then begin
 pnl2.Color:=clWhite;
 serg[1]:=0;
 end;
end;

procedure TForm1.pnl3Click(Sender: TObject);
begin
   if serg[2]=0 then begin
 pnl3.Color:=clYellow;
 serg[2]:=1;
 end else if serg[2]=1 then begin
 pnl3.Color:=clWhite;
 serg[2]:=0;
 end;
end;

procedure TForm1.mmo3Click(Sender: TObject);
begin
   if serg[2]=0 then begin
 pnl3.Color:=clYellow;
 serg[2]:=1;
 end else if serg[2]=1 then begin
 pnl3.Color:=clWhite;
 serg[2]:=0;
 end;
end;

procedure TForm1.pnl4Click(Sender: TObject);
begin
  if serg[3]=0 then begin
 pnl4.Color:=clYellow;
 serg[3]:=1;
 end else if serg[3]=1 then begin
 pnl4.Color:=clWhite;
 serg[3]:=0;
 end;
end;

procedure TForm1.mmo4Click(Sender: TObject);
begin
  if serg[3]=0 then begin
 pnl4.Color:=clYellow;
 serg[3]:=1;
 end else if serg[3]=1 then begin
 pnl4.Color:=clWhite;
 serg[3]:=0;
 end;
end;

procedure TForm1.pnl5Click(Sender: TObject);
begin
  if serg[4]=0 then begin
 pnl5.Color:=clYellow;
 serg[4]:=1;
 end else if serg[4]=1 then begin
 pnl5.Color:=clWhite;
 serg[4]:=0;
 end;
end;

procedure TForm1.mmo5Click(Sender: TObject);
begin
  if serg[4]=0 then begin
 pnl5.Color:=clYellow;
 serg[4]:=1;
 end else if serg[4]=1 then begin
 pnl5.Color:=clWhite;
 serg[4]:=0;
 end;
end;

procedure TForm1.pnl6Click(Sender: TObject);
begin
   if serg[5]=0 then begin
 pnl6.Color:=clYellow;
 serg[5]:=1;
 end else if serg[5]=1 then begin
 pnl6.Color:=clWhite;
 serg[5]:=0;
 end;
end;

procedure TForm1.mmo6Click(Sender: TObject);
begin
  if serg[5]=0 then begin
 pnl6.Color:=clYellow;
 serg[5]:=1;
 end else if serg[5]=1 then begin
 pnl6.Color:=clWhite;
 serg[5]:=0;
 end;
end;

procedure TForm1.pnl7Click(Sender: TObject);
begin
  if serg[6]=0 then begin
 pnl7.Color:=clYellow;
 serg[6]:=1;
 end else if serg[6]=1 then begin
 pnl7.Color:=clWhite;
 serg[6]:=0;
 end;
end;

procedure TForm1.mmo7Click(Sender: TObject);
begin
 if serg[6]=0 then begin
 pnl7.Color:=clYellow;
 serg[6]:=1;
 end else if serg[6]=1 then begin
 pnl7.Color:=clWhite;
 serg[6]:=0;
 end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.Visible:=False;
end;
   begin
  Application.ShowMainForm:=false;

end.
