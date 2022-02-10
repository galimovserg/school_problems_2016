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
            String[] mas = Console.ReadLine().Split(' ');
            Int64 n = Convert.ToInt64(mas[0]),
                  m = Convert.ToInt64(mas[1]);
            Int64 i = 0, j = 0, m_ = 0;
            Int64[,] a = new Int64[n + 1, m + 1];
            for (i = 1; i <= n; i++)
            {

                if (i % 2 == 1)
                {
                    for (j = 1; j <= m; j++)
                    {
                        a[i, j] = m_;
                        m_++;
                    }
                }
                else {
                    for (j = m; j >= 1; j--)
                    {
                        a[i, j] = m_;
                        m_++;
                    }
                }
               
            }
            for (i = 1; i <= n; i++)
            {
                for (j = 1; j <= m; j++)
                {
                    m_ = a[i, j];
                    if (m_ < 10)
                    {
                        Console.Write("  ");
                    }
                    else {
                        if (m_ < 100)
                        {
                            Console.Write(" ");
                        }
                    }
                    Console.Write(m_);
                    Console.Write(" ");
                    
                }
                Console.WriteLine();
            }
            //Console.ReadKey();
        }
    }
}
