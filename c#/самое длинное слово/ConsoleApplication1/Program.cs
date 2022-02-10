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
            String[] s = Console.ReadLine().Split(' ');
            Int32 len = s.Length,
                i,z;
            z = 0;
            for (i=0;i<=len-1;i++)
            {
                if (s[i].Length>s[z].Length) { z = i; }
            }
            Console.WriteLine(s[z]);
            Console.WriteLine(Convert.ToString(s[z].Length));
            //Console.ReadKey();
        }
    }
}
