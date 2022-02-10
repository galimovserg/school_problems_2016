unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPServer, IdCustomHTTPServer,
  IdHTTPServer, StdCtrls, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TForm1 = class(TForm)
    btn1: TButton;
    edt1: TEdit;
    idhtpsrvr1: TIdHTTPServer;
    mmo1: TMemo;
    idhtp1: TIdHTTP;
    btn2: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
mmo1.Text:=idhtp1.Get('http://sergalru.esy.es/server.php'+'?s='+edt1.Text);
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
 mmo1.Text:=idhtp1.Get('http://sergalru.esy.es/cursorpos.in');
end;

end.
