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
            Int64 n, i, m;
            
            n = Convert.ToInt64(Console.ReadLine());
            m = 1;
            for (i=1; i<= n; i++)
            {
                m = m * 2;
            }
            Console.WriteLine(Convert.ToString(m));
        
        }
    }
}
