using System;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            int k = Convert.ToInt32(Console.ReadLine());
            int[] p= new int[k+1];
            int count=1, i,j;
            p[1] = 2;
            for (i=3;count< k; i += 2)
            {
                for (j=1;p[j]*p[j]<=i; j++)
                {
                    if (i%p[j]==0) { goto outs; }
                }
                count++;
                p[count] = i;
                outs: { }
            }
            Console.WriteLine(Convert.ToString(p[count]));
        }
    }
}
