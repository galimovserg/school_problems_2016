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
            Int64 i, m, k;
            m = Convert.ToInt64(Console.ReadLine());
            i = 1;
            while (i<=m)
            {
                Console.Write(Convert.ToString(i)+' ');
                i = i * 2;
            }
           // Console.ReadKey();
        }
    }
}
