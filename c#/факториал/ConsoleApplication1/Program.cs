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
            Int64 m, i,itog;
            m = Convert.ToInt64(Console.ReadLine());
            itog = 1;
            for (i=1;i<= m; i++)
            {
                itog = itog * i;
            }
            Console.WriteLine(Convert.ToString(itog));
        }
    }
}
