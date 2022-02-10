using System;
//using System.Collections.Generic;
using System.Linq;
//using System.Text;
//using System.Threading.Tasks;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            Int64 n, i, len, lenmax, index;
            n = Convert.ToInt64(Console.ReadLine());
            len = 1;
            lenmax = 1;
            index = 0;

            Double[] mas= Console.ReadLine().Split(' ').Select(double.Parse).ToArray();
            Array.Resize(ref mas, Convert.ToInt32(n + 1));
            mas[n] = mas[n-1] + 1;
            for (i = 1; i <= n; i++)
            {
              if (Math.Abs(mas[i]-mas[i-1])<0.000000001)
                {  len++; }
              else
                {
                   if (len > lenmax)
                    {
                        lenmax = len;
                        index = i - 1;
                    }
                    len = 1;

                }
                    
            }
            
            Console.WriteLine(Convert.ToString(mas[index]) + " " + Convert.ToString(lenmax));
            
        }
    }
}
