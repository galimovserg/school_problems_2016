unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    dlgOpen1: TOpenDialog;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
 type mint=array[0..2700,0..2700] of Boolean;
var
  Form1: TForm1;
     f:Text;
     w,h,i,j,t,r,g,b,count,cmn:Integer;
     mat:array[1..3,1..2700,1..2700] of byte;
     mt,mt2:mint;
implementation

{$R *.dfm}
procedure thets(x,y:integer);
 begin
  if (mt2[x,y]) and (count<=100) then begin
   inc(count);
   mt2[x,y]:=False;
   thets(x+1,y);
   thets(x-1,y);
   thets(x,y+1);
   thets(x,y-1);
  end;
 end;
 procedure delts(x,y:Integer);
 begin
  if (mt[x,y]) and (count>0) then begin
    dec(count);
   mt[x,y]:=False;
   delts(x+1,y);
   delts(x-1,y);
   delts(x,y+1);
   delts(x,y-1);
  end;
 end;
 procedure TForm1.btn1Click(Sender: TObject);
begin
if dlgOpen1.Execute then begin
  AssignFile(f,dlgOpen1.FileName);
  Reset(f);
  Readln(f,w,h);
  for i:=1 to h do begin
     for j:=1 to  w do begin
      read(f,mat[1,i,j],mat[2,i,j],mat[3,i,j]);

     end;
   end;
  for t:=1 to 5 do begin
   r:=0;
   g:=0;
   b:=0;
   for i:=1 to h do begin
     for j:=1 to  w do begin
       r:=r+mat[1,i,j];
       g:=g+mat[2,i,j];
       b:=b+mat[3,i,j];
     end;
   end;
   r:=r div (h*w);
   g:=g div (h*w);
   b:=b div (h*w);
   for i:=1 to h do begin
     for j:=1 to  w do begin
      if (mat[1,i,j]<r div 2+30) or (mat[2,i,j]<g div 2+30 )or(mat[3,i,j]<b div 2+30) then begin
        mat[1,i,j]:=r*mat[1,i,j]*4 div (r+g+b+255);
        mat[2,i,j]:=g*mat[2,i,j]*4 div (r+g+b+255);
        mat[3,i,j]:=b*mat[3,i,j]*4 div (r+g+b+255);
        mt[i,j]:=True;
      end else  begin
        mat[1,i,j]:=255;
        mat[2,i,j]:=255;
        mat[3,i,j]:=255;
        mt[i,j]:=False;
      end;
     end;
   end;

    mt2:=mt;
   for i:=1 to h do begin
       for j:=1 to w do begin
         if mt2[i,j] then begin
          count:=0;
          thets(i,j);
          if count<=10 then  begin  delts(i,j);  end;

         end;

       end;
   end;


    for i:=1 to h do begin
     for j:=1 to  w do begin
       if mt[i,j] then Form1.Canvas.Pixels[j div 3  ,i div 3] :=RGB(mat[1,i,j],mat[2,i,j],mat[3,i,j])
       else  Form1.Canvas.Pixels[j div 3 ,i div 3 ]:=RGB(255,255,255);
     end;
    end;
     end;
    CloseFile(f);
   end;





end;

end.
