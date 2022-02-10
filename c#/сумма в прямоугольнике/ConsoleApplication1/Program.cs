using System;
/*using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;*/

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            String[] ms = Console.ReadLine().Split(' ');
            Int64 n = Convert.ToInt64(ms[0]),
                  m = Convert.ToInt64(ms[1]),
                  k = Convert.ToInt64(ms[2]),
                  i, j, sstr,
                  x1, y1, x2, y2;
            System.IO.StreamWriter file = new System.IO.StreamWriter("output.txt");
           Int64[] mm = new Int64[k+2];
            Int64[,] mas = new Int64[n+1, m+1];
            for (i = 1; i <= n; i++)
            {
                ms = Console.ReadLine().Split(' ');
                sstr = 0;
                for (j = 1; j <= m; j++)
                {
                    sstr = sstr + Convert.ToInt64(ms[j - 1]);
                    mas[i, j] = mas[i - 1, j] + sstr;
                }
            }
            
            for (i = 1; i <= k; i++)
            {
                ms = Console.ReadLine().Split(' ');
                x1 = Convert.ToInt64(ms[0]);
                y1 = Convert.ToInt64(ms[1]);
                x2 = Convert.ToInt64(ms[2]);
                y2 = Convert.ToInt64(ms[3]);

                mm[i] = mas[x2, y2] + mas[x1 - 1, y1 - 1] - mas[x2, y1 - 1] - mas[x1 - 1, y2];
            }
            for (i = 1; i <= k; i++)
            {
                Console.WriteLine(Convert.ToString(mm[i]));

            }
           // Console.Read();
        }
    }
}
