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
            Int64 sum, prz, cz;
            cz = Convert.ToInt64(Console.ReadLine());

            sum = 0;
            prz = 1;
            while (cz!=0)
            {
                sum = sum + cz;
                prz = prz * cz;
                cz = Convert.ToInt64(Console.ReadLine());

            }
            if (sum != 0)
            {
                Console.WriteLine(Convert.ToString(sum) + ' ' + Convert.ToString(prz));
            } else
            {
                Console.WriteLine(Convert.ToString(sum) + ' ' + Convert.ToString(0));
            }
           // Console.ReadKey();
            
        }
    }
}
