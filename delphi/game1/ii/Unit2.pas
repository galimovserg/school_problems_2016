unit Unit2;

interface
uses SysUtils,Math,Windows,Graphics;
type
  tp=array of TPoint;
   sergey=record
      x1:Integer;
      x2:Integer;
      y1:Integer;
      y2:Integer;
      colr:tColor;
     end;
var
  MasCircle:array[1..200] of sergey;
    MasRect:array[1..256] of sergey; //массив прямоугольников
     Points:array[0..256] of sergey;//массив точек
 MasPolygPn:array[1..256] of tp;//массив полигонов координаты точек
 MasPolygCn:array[1..256] of Integer;//массив полигонов /количество точек
 MasPolugCr:array[1..256] of TColor; //массив полигонов/ цвета
     MinMax:array[1..256] of sergey;
//возвращает true если точка с координатами x,y лежит в эллипсе с координатами x1,y1,x2,y2
function PointInEllipse(x1,y1,x2,y2,x,y:Real):Boolean;
//возвращает true если отрезки имеют общие точки(точку)
function LineOfIntersection(x1,y1,x2,y2,xx1,yy1,xx2,yy2:real):Boolean;
//возвращает true если окружности меют общие точки
function CircleOfIntersection(x1,y1,r1,x2,y2,r2:Real):Boolean;
//возвращает true если окружность радиусом rr и с координатами xx , yy пересекает границу полигона tp
function CircleInPolygon(xx,yy:real;var maspolygpn1:tp;rr:real):Boolean;
//возвращает true если отрезок с координатой начала x1,y1 и координатой конца x2,y2 имеет общие точки
//с окружностью, координаты которой xx1,yy1 и радиус rr
function LineInCircle(x1,y1,x2,y2,xx1,yy1,rr:real):Boolean;
//возвращает true если  окружность радиусом rr и с координатами x , y  имеет общие точки с
//эллипсом, координаты которого x1,y1,x2,y2
function CircleInEllipse(x1,y1,x2,y2,x,y,rr:Real):Boolean;
//возвращает true если окружность радиусом rr и координатами x,y пересекает прямоугольник
function CircleInRectangle(x1,y1,x2,y2,x,y,rr:Real):Boolean;
implementation
function R(x1,y1,x2,y2:real):Real;
  begin
         R:= (x1-x2)*(x1-x2)+(y1-y2)*(y1-y2);
  end;
function PointInEllipse(x1,y1,x2,y2,x,y:Real):Boolean;
   var xel,yel:Real;
  begin
   xel:=(x1+x2)/2;
   yel:=(y1+y2)/2;
   PointInEllipse:=(Sqr(2*(x-xel)/(x2-x1) ) +sqr(2*(y-yel)/(y2-y1))<1)
  end;
  function PointInEllipse2(x1,y1,x2,y2,x,y:Real):Boolean;
   var xel,yel:Real;
  begin
   xel:=(x1+x2)/2;
   yel:=(y1+y2)/2;
   PointInEllipse2:=(Sqr(2*(x-xel)/(x2-x1) ) +sqr(2*(y-yel)/(y2-y1))<=1)
  end;
function CircleInEllipse(x1,y1,x2,y2,x,y,rr:Real):Boolean;

       

  begin
    if (x+rr>=x1)and(y+rr>=y1)and(y-rr<=y2)and(x-rr<=x2) then begin

    x1:=x1-rr;
    x2:=x2+rr;
    y1:=y1-rr;
    y2:=y2+rr;
     CircleInEllipse:=PointInEllipse2(x1,y1,x2,y2,x,y);

   end else  CircleInEllipse:=false;
  end;
 function LineOfIntersection(x1,y1,x2,y2,xx1,yy1,xx2,yy2:real):Boolean;
  var s1,s2,ss1,ss2:real;
  function intrs(var a,b,c,d:Real):Boolean;
   var cnn:Real;
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
     LineOfIntersection:=true;
  end else LineOfIntersection:=false;
 end;
function LineInCircle(x1,y1,x2,y2,xx1,yy1,rr:real):Boolean;
     var s1,h,d1,d2,l:Real;

     begin

       d1:=R(x1,y1,xx1,yy1);
       d2:=R(x2,y2,xx1,yy1);

       if (d1<=rr*rr)or(d2<=rr*rr) then begin
            LineInCircle:=True;
       end else begin
         s1:=Abs((x2-x1)*(yy1-y1)-(xx1-x1)*(y2-y1));
         l:=Sqrt(R(x1,y1,x2,y2));
         if l>0.000000001 then begin
         h:= s1/l;
          if (h<=rr) then
          if (abs(Sqrt(d1-sqr(h))+Sqrt(d2-sqr(h))-l)<=0.000000001) then begin
            LineInCircle:=True;
          end else
            LineInCircle:=False
            else LineInCircle:=False; end else LineInCircle:=False;
       end;
     end;
function CircleInPolygon(xx,yy:real;var maspolygpn1:tp;rr:real):Boolean;//столкновение окружности с границей полигона
     var
     j:integer;
     label 1;

     begin
     CircleInPolygon:=True;
      for j:=1 to Length(maspolygpn1)-1 do begin
      if LineInCircle(maspolygpn1[j].X,maspolygpn1[j].y,maspolygpn1[j-1].X,maspolygpn1[j-1].y,xx,yy,rr) then
         goto 1
      end;

      if LineInCircle(maspolygpn1[Length(maspolygpn1)-1].X,
      maspolygpn1[Length(maspolygpn1)-1].y,maspolygpn1[0].X,maspolygpn1[0].y,xx,yy,rr) then
         goto 1;
      CircleInPolygon:=false;
     1:
     end;
function CircleInRectangle(x1,y1,x2,y2,x,y,rr:Real):Boolean;
    begin
       CircleInRectangle:=LineInCircle(x1,y1,x1,y2,x,y,rr) or
                          LineInCircle(x2,y1,x2,y2,x,y,rr) or
                          LineInCircle(x1,y1,x2,y1,x,y,rr) or
                          LineInCircle(x1,y2,x2,y2,x,y,rr);
    end;
function CircleOfIntersection(x1,y1,r1,x2,y2,r2:real):Boolean;
    begin
        CircleOfIntersection:=(r1+r2)>=Sqrt(R(x1,y1,x2,y2));
    end;
end.
