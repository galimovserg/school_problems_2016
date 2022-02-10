unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdAntiFreezeBase, IdAntiFreeze, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TForm1 = class(TForm)
    idhtp1: TIdHTTP;
    edt1: TEdit;
    btn1: TButton;
    mmo1: TMemo;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  s,t:TStringList;
  buf:string;
implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
      s:=TStringList.Create;
     s.Add('fn='+edt1.Text);

      s.AddStrings(mmo1.Lines);
       s.AddStrings(mmo1.Lines);
      buf:=idhtp1.Post('www://localhost/sergey/bin/game.php',s);
end;

end.
