using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            Int64 a, i;
            Double sd;
            a = Convert.ToInt64(Console.ReadLine());
            sd = Math.Sqrt(a)+1;
            for (i=2; i<= sd; i++)
            {
                if (a % i == 0) {

                    Console.WriteLine("NO");
                    goto finis; }

            }
            Console.WriteLine("YES");
            finis: { }
          
        }
    }
}
