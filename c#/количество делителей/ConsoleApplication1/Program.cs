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
            Int64 count, i, m, mcount;
            m = Convert.ToInt64(Console.ReadLine());
            i= 2;
            count= 1;
            mcount= 0;
            while (m >= i)
            {
              if (m % i==0)
                {
                    mcount++;
                    m = m / i;
                }
                else
                {
                    count = count * (mcount+1);
                    mcount= 0;
                    i = i + 1;

                }
            }
            count= count * (mcount + 1);
            Console.WriteLine(Convert.ToString(count));
           // Console.ReadKey();
        }
    }
}
