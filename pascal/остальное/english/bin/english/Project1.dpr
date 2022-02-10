program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {AboutBox},
  Unit3 in 'Unit3.pas' {AboutBox1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'english';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TAboutBox1, AboutBox1);
  Application.Run;
end.
