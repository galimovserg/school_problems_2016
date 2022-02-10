using System;
/*using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;*/

namespace ConsoleApplication1
{
    class Program
    {
        class vect
        {
            public Double x;
            public Double y;
            public vect(Double x, Double y)
            {
                this.x = x;
                this.y = y;
            }
        }
        struct point
        {
            public Double x;
            public Double y;
            public bool pos;
            public point(Double x, Double y, bool pos)
            {
                this.x = x;
                this.y = y;
                this.pos = pos;
            }
        }
        static void Main(string[] args)
        {
            Int64 n = Convert.ToInt64(Console.ReadLine());
            Int64 i = 0;
            Double x = 0, y = 0;
            String[] MAS;
            point[] a = new point[n + 1];

            /*вводим данные
            и определяем стартовую точку (индекс в current)*/
            Int64 current = 1;
            for (i = 1; i <= n; i++)
            {    //ввод
                MAS = Console.ReadLine().Split(' ');
                x = Convert.ToDouble(MAS[0]);
                y = Convert.ToDouble(MAS[1]);
                a[i] = new point(x, y, false);
                //определяем current
                if ((a[i].x < a[current].x) | ((a[i].x == a[current].x) & (a[i].y < a[current].y)))
                {
                    current = i;
                }
            }
            Int64 currentstert = current;

            /*начальное направление вектора*/
            vect vector = new vect(-1, 0);
            //пока не вернемся в исходную точку
            Double p = 0;
            do
            {
                /*cosmax изначально минимальный*/
                Double cosmax = -2;
                Double lenmax = 0;
                Int64 t = 0;
                /*
                  найдем вершину(индекс в t) с минимальным углом между 
                  вектором vector и вектором с началом a[current] и концом a[t]
                  в следущем цикле for,
                  рассматривая не помеченные точки

                */

                for (i = 1; i <= n; i++)
                {
                    if ((!a[i].pos) & (i != current))
                    {
                        Double cos = vector.x * (a[i].x - a[current].x) +
                                     vector.y * (a[i].y - a[current].y);

                        Double len = Math.Sqrt((a[i].x - a[current].x) * (a[i].x - a[current].x) +
                                               (a[i].y - a[current].y) * (a[i].y - a[current].y));
                        /*если растояние в пределах погрешности
                        то отметим ее и продолжим поиск 
                        */
                        if (len > 0.0001)
                        {   
                            if (cos / len > cosmax)
                            {
                                cosmax = cos / len;
                                t = i;
                                lenmax = len;
                            }

                        } else
                        {
                            a[i].pos = true;
                        }
                    }
                }
                //вычисляем вектор
                vector.x = (a[t].x - a[current].x) / lenmax;
                vector.y = (a[t].y - a[current].y) / lenmax;

                current = t;
                //точка a[t] посещена т.е a[t].pos=true
                a[current].pos = true;
                //увеличиваем периметр
                p = p + lenmax;
            } while (current != currentstert);

            Console.WriteLine("{0:0.0}", p);
           /* for (i=1;i<=n;i++)
            {
                if (a[i].pos)
                {
                    Console.WriteLine( Convert.ToString( a[i].x)+" "+ Convert.ToString( a[i].y));
                }

            }*/
            //Console.ReadKey();
        }
    }
}
