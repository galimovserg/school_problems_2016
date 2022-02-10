unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, ExtCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    edt2: TEdit;
    lbl1: TLabel;
    btn2: TButton;
    btn3: TButton;
    lbl2: TLabel;
    lbl3: TLabel;
    cbb1: TComboBox;
    lbl4: TLabel;
    mm1: TMainMenu;
    menu1: TMenuItem;
    exit1: TMenuItem;
    heip1: TMenuItem;
    about1: TMenuItem;
    help1: TMenuItem;
    EndTest1: TMenuItem;
    tmr1: TTimer;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure exit1Click(Sender: TObject);
    procedure EndTest1Click(Sender: TObject);
    procedure about1Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure help1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  str1,str2:array of  string;
  txt:Text;
  i,n,count,cz:Integer;
implementation

uses Unit2, Unit3;

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
    if FileExists (IntToStr(cbb1.ItemIndex+1)+'.txt') then begin
    lbl4.Visible:=False;
    lbl2.Visible:=True;
    lbl3.Visible:=True;
    Form1.Caption:=cbb1.text ;
    AssignFile(txt,IntToStr(cbb1.ItemIndex+1)+'.txt');
    reset(txt);
    i:=0;
    while not Eof(txt) do begin
     i:=i+1;
     SetLength(str1,i+1);
     SetLength(str2,i+1);
     Readln(txt,str1[i]);
     Readln(txt,str2[i]);
    end;
     CloseFile(txt);
     Randomize;
     n:=Random(i-1)+1;
     lbl1.Caption:=str1[n];
     count:=0;
     lbl3.Caption:='0';
     btn1.Visible:=False;

     edt2.Visible:=True;
     btn2.Visible:=True;
     btn3.Visible:=True;
     cbb1.Visible:=False; end;
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
  if str2[n]=edt2.Text then begin
   n:= n+1+random(2);
   if n>i then n:=Random(i div 10)+1;
   lbl1.Caption:=str1[n];
   edt2.Text:='';
   count:=count+1;
   lbl3.Caption:=IntToStr(count);
  end else begin


  end;
   btn3.Visible:=True;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
 edt2.Text:=  str2[n];
 count:=count-1; if count<0 then count:=0;
 btn3.Visible:=False;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  cbb1.Items.LoadFromFile('list.txt');
end;

procedure TForm1.exit1Click(Sender: TObject);
begin

   Close;
Exit;
end;

procedure TForm1.EndTest1Click(Sender: TObject);
begin

    lbl4.Visible:=True;
    lbl2.Visible:=False;
    lbl3.Visible:=False;
    Form1.Caption:='english';
    btn1.Visible:=True;
    edt2.Visible:=False;
    btn2.Visible:=False;
    btn3.Visible:=False;
    cbb1.Visible:=True;
end;

procedure TForm1.about1Click(Sender: TObject);
begin
 aboutbox.Visible:=True;
end;

procedure TForm1.tmr1Timer(Sender: TObject);
begin
    cbb1.Items.LoadFromFile('list.txt');
    tmr1.Enabled:=False;
end;

procedure TForm1.help1Click(Sender: TObject);
begin
  AboutBox1.Visible:=True;
end;

end.
