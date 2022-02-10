
public class program {
	
	//класс для работы с геометрическими объектами
	public static class geometryXY{
		//класс точки
		public static class point{
			//координаты в декартовой системе координат X,Y
			public double x;
			public double y;
			//конструктор обьектов класса точка
			public point(double x, double y){
				this.x=x;
				this.y=y;
			}
			//растояние от этой точки до другой
			public double distanceto(point topoint){
				return Math.sqrt((topoint.x-this.x)*(topoint.x-this.x)+(topoint.y-this.y)*(topoint.y-this.y));
			}
			//сравнивает координаты точек
			public boolean equals(point topoint){
				if ((this.x==topoint.x)&(this.y==topoint.y)){
					return true;
				}else{
					return false;
				}
			}
			//копирование
			public void CopyFrom(point cpoint){
				this.x=cpoint.x;
				this.y=cpoint.y;
			}
			//преобразование в текст
			public String toString(){
				return "("+this.x+", "+this.y+")";
		 }
		}
		//класс линии
		public static class lines{
			//отрезок и вектор имеют координаты начала и координаты конца
			public point point1=new point(0,0);
			public point point2=new point(0,0);
			public double len(){
				return Math.sqrt((point1.x-point2.x)*(point1.x-point2.x)+(point1.y-point2.y)*(point1.y-point2.y));
			}
			//класс векторы
			public static class vector extends lines{
				//координаты вектора
				public double x;
				public double y;
			
				//конструктор вектора 1
				public vector(point p1, point p2){
					this.x=p2.x-p1.x;
					this.y=p2.y-p1.y;
					point1.CopyFrom(p1);
					point2.CopyFrom(p2);
				}
				//конструктор вектора 2
				public vector(double x,double y){
					this.x=x;
					this.y=y;
					point1=new point(0,0);
					point2=new point(this.x,this.y);
				}
				//конструктор вектора 3
				public vector(point p1,double x,double y){
					this.x=x;
					this.y=y;
					point1.CopyFrom(p1);
					point2.x=point1.x+this.x;
					point2.y=point1.y+this.y;
				}
				//возвращает скалярное произведение векторов
				public double scalarmult(vector tovector){
					return this.x*tovector.x+this.y*tovector.y;
				}
				//возвращает косинус угла между векторами
				public double cos(vector tovector){
					double cs;
					try{
						cs= this.scalarmult(tovector)/(this.len()*tovector.len());
					}catch(ArithmeticException e){
						cs=0;
					}
					return cs;
				}
				//копирование
				public void CopyFrom(vector cvector){
					this.x=cvector.x;
					this.y=cvector.y;
					this.point1.CopyFrom(cvector.point1);
					this.point2.CopyFrom(cvector.point2);
			 
				}
				//проверяем равенство векторов
				public boolean equals(vector tovector){
					if ((this.x==tovector.x)&&(this.y==tovector.y))
					{return true;} else {return false;}
					
				}
				//проверяем абсолютное равенство векторов(т.е. равенство всех полей)
				public boolean equalsA(vector tovector){
					if (this.point1.equals(tovector.point1)&&this.point2.equals(tovector.point2))
					{return true;} else {return false;}
					
				}
				//преобразование в текст
				public String toStringV(){
					return "("+this.x+", "+this.y+")";
				}
				//преобразование в текст
				public String toStringC(){
					return "{"+this.point1.toString()+", "+this.point2.toString()+"}";
				}
			}
	
			//класс отрезоки
			public static class line extends lines{
				//проверяем отрезки на равенства
				public boolean equals(line toline){
					if ((this.point1.equals(toline.point1)&&this.point2.equals(toline.point2))
						||(this.point2.equals(toline.point1)&&this.point1.equals(toline.point2)))
					{ return true;} else {return false;}
				}
				//конструктор отрезка
				public line(point p1,point p2){
					this.point1.CopyFrom(p1);
					this.point2.CopyFrom(p2);
				}
				//возвращает true если точка принадлежит отрезку
				public boolean pointcontain(point topoint){
					if (this.point1.distanceto(topoint)+this.point2.distanceto(topoint)==this.len())
					{ return true;} else {return false;}
				}
			}
			
		}
	}
	
	public static void main(String args[]){
	
	
	 geometryXY.lines.vector myvector1 = new geometryXY.lines.vector(3,8);
	 geometryXY.lines.vector myvector2 = new geometryXY.lines.vector(3,8);
	 System.out.println(myvector2.cos(myvector1));
	}
}
