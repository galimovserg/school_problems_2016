using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication1
{
    class Program
    {
        static int i = 0;
        static double lett2(string str)
        {
            double itog = 1;
            string[] s1 = str.Split('*'),s2;
            int i, j;
            for (i = 0; i < s1.Length; i++)
            {
                if (s1[i] != "") {
                    s2 = s1[i].Split('/');
                    if (s2[0]!="") {
                        itog = itog * Convert.ToDouble(s2[0]);
                       
                    }
                    for (j = 1; j < s2.Length; j++)
                    {
                        
                        if (s2[j] != "")
                        {
                            itog = itog / Convert.ToDouble(s2[j]);
                        }
                    }
                } else { itog = 0; }
            }

            return itog;

        }
        static double lett1(string str)
        {
            
            double itog=0;
            string[] 
            s1 = str.Split('+'),s2;
            int i, j;
            for (i = 0; i < s1.Length; i++)
            {
                s2 = s1[i].Split('-');
                itog = itog + lett2(s2[0]);
                for (j=1;j<s2.Length;j++)
                {
                    itog = itog-lett2(s2[j]);
                }
            }


            return itog;
        }
        static double PRS(string str)
        {
            
            
            string s = "";
            while (str.Length > i)
            {
                if (str[i] == '(')
                {
                    i++;
                    s=s+Convert.ToString( PRS(str));
                    
                } else
                {
                    if (str[i] == ')') { i++;  break; }
                    else
                    {
                        s = s + str[i];
                        i++;
                    }
                }

                
            }
            Console.WriteLine(s);
            return lett1(s);
        }
        static void Main(string[] args)
        {
            string s = Console.ReadLine();

           // PRS(s);
            
            Console.WriteLine(PRS(s));
            Console.ReadKey();
        }
    }
}
