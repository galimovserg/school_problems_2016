
public class program {
	
	//����� ��� ������ � ��������������� ���������
	public static class geometryXY{
		//����� �����
		public static class point{
			//���������� � ���������� ������� ��������� X,Y
			public double x;
			public double y;
			//����������� �������� ������ �����
			public point(double x, double y){
				this.x=x;
				this.y=y;
			}
			//��������� �� ���� ����� �� ������
			public double distanceto(point topoint){
				return Math.sqrt((topoint.x-this.x)*(topoint.x-this.x)+(topoint.y-this.y)*(topoint.y-this.y));
			}
			//���������� ���������� �����
			public boolean equals(point topoint){
				if ((this.x==topoint.x)&(this.y==topoint.y)){
					return true;
				}else{
					return false;
				}
			}
			//�����������
			public void CopyFrom(point cpoint){
				this.x=cpoint.x;
				this.y=cpoint.y;
			}
			//�������������� � �����
			public String toString(){
				return "("+this.x+", "+this.y+")";
		 }
		}
		//����� �����
		public static class lines{
			//������� � ������ ����� ���������� ������ � ���������� �����
			public point point1=new point(0,0);
			public point point2=new point(0,0);
			public double len(){
				return Math.sqrt((point1.x-point2.x)*(point1.x-point2.x)+(point1.y-point2.y)*(point1.y-point2.y));
			}
			//����� �������
			public static class vector extends lines{
				//���������� �������
				public double x;
				public double y;
			
				//����������� ������� 1
				public vector(point p1, point p2){
					this.x=p2.x-p1.x;
					this.y=p2.y-p1.y;
					point1.CopyFrom(p1);
					point2.CopyFrom(p2);
				}
				//����������� ������� 2
				public vector(double x,double y){
					this.x=x;
					this.y=y;
					point1=new point(0,0);
					point2=new point(this.x,this.y);
				}
				//����������� ������� 3
				public vector(point p1,double x,double y){
					this.x=x;
					this.y=y;
					point1.CopyFrom(p1);
					point2.x=point1.x+this.x;
					point2.y=point1.y+this.y;
				}
				//���������� ��������� ������������ ��������
				public double scalarmult(vector tovector){
					return this.x*tovector.x+this.y*tovector.y;
				}
				//���������� ������� ���� ����� ���������
				public double cos(vector tovector){
					double cs;
					try{
						cs= this.scalarmult(tovector)/(this.len()*tovector.len());
					}catch(ArithmeticException e){
						cs=0;
					}
					return cs;
				}
				//�����������
				public void CopyFrom(vector cvector){
					this.x=cvector.x;
					this.y=cvector.y;
					this.point1.CopyFrom(cvector.point1);
					this.point2.CopyFrom(cvector.point2);
			 
				}
				//��������� ��������� ��������
				public boolean equals(vector tovector){
					if ((this.x==tovector.x)&&(this.y==tovector.y))
					{return true;} else {return false;}
					
				}
				//��������� ���������� ��������� ��������(�.�. ��������� ���� �����)
				public boolean equalsA(vector tovector){
					if (this.point1.equals(tovector.point1)&&this.point2.equals(tovector.point2))
					{return true;} else {return false;}
					
				}
				//�������������� � �����
				public String toStringV(){
					return "("+this.x+", "+this.y+")";
				}
				//�������������� � �����
				public String toStringC(){
					return "{"+this.point1.toString()+", "+this.point2.toString()+"}";
				}
			}
	
			//����� ��������
			public static class line extends lines{
				//��������� ������� �� ���������
				public boolean equals(line toline){
					if ((this.point1.equals(toline.point1)&&this.point2.equals(toline.point2))
						||(this.point2.equals(toline.point1)&&this.point1.equals(toline.point2)))
					{ return true;} else {return false;}
				}
				//����������� �������
				public line(point p1,point p2){
					this.point1.CopyFrom(p1);
					this.point2.CopyFrom(p2);
				}
				//���������� true ���� ����� ����������� �������
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
