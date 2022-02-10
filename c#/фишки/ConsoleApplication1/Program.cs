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
            Int64 k = Convert.ToInt64(Console.ReadLine());
           if (k > 0)
            {
                if (k % 4 == 0)
                {
                    Console.WriteLine("YES");
                }
                else
                {
                    if (k == 1)
                    {
                        Console.WriteLine("YES");
                    }
                    else
                    {
                        Console.WriteLine("NO");
                    }
                }
            } else
            {
                Console.WriteLine("YES");
            }
           // Console.ReadKey();
        }
    }
}
