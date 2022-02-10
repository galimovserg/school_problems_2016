using System;


//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;

namespace ConsoleApplication2
{
    class Program
    {

        const int split = 2;
        const int app = 3;
        const int stepp = 4;
        static int i = 0;
        static double stepen(double a, double n)
        {
            return Math.Pow(a, n);
        }
        static Int64 chet(string s)
        {

            #region 
            Int64 itog = 0;
            Int64 locl1 = 1,
                   locl2 = 0,
                   stepdrob = 1, stepn = 1;
            bool drob = false;
            int type2 = app,
                  type1 = app;
            #endregion
            while (true)
            {

                switch (s[i])
                {

                    /*((((((((((((((((((((((((((((((((((*/
                    #region
                    case '(':
                        {
                            i++;
                            locl2 = chet(s);
                            drob = false;
                            // stepdrob = 0.1;
                            break;
                        }
                    #endregion
                    /*))))))))))))))))))))))))))))))))))*/
                    #region
                    case ')':
                        {

                            i++;
                            drob = false;
                            //   stepdrob = 0.1;
                            goto outwhile;
                        }
                    #endregion
                    /*/////////////////******************/
                    #region
                    case '*':
                    case '/':
                        {
                            if (type2 == split)
                            {
                                locl1 = Convert.ToInt64(locl1) / Convert.ToInt64(locl2);
                            }
                            else
                            if (type2 == app)
                            {
                                locl1 = locl1 * locl2;
                            }
                            else
                            {
                                if (type1 == app)
                                {
                                    // locl1 = locl1 * stepen(stepn, locl2);
                                }
                                else
                                if (type1 == split)
                                {
                                    //locl1 = locl1 / stepen(stepn, locl2);
                                }
                            }
                            if (s[i] == '*')
                            {
                                type2 = app;
                                type1 = app;

                            }
                            else
                            if (s[i] == '/')
                            {
                                type2 = split;
                                type1 = split;
                            }

                            locl2 = 0;
                            drob = false;
                            // stepdrob = 0.1;
                            i++;
                            break;
                        }
                    #endregion
                    /*^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^*/
                    #region
                    case '^':
                        {
                            if (type2 == stepp)
                            {
                                //   stepn = stepen(stepn, locl2);
                                locl2 = 0;
                            }
                            else {
                                type2 = stepp;
                                stepn = locl2;
                            }
                            locl2 = 0;
                            drob = false;
                            //stepdrob = 0.1;
                            i++;
                            break;
                        }
                    #endregion
                    /*---------------+++++++++++++++++++*/
                    #region
                    case '-':
                    case '+':
                        {

                            if (type2 == split)
                            {
                                itog = itog + Convert.ToInt64(locl1) / Convert.ToInt64(locl2);
                            }
                            else
                            if (type2 == app)
                            {
                                itog = itog + locl1 * locl2;
                            }
                            else
                            if (type2 == stepp)
                            {
                                if (type1 == app)
                                {
                                    //      itog = itog + locl1 * stepen(stepn, locl2);
                                }
                                else
                                {
                                    //    itog = itog + locl1 / stepen(stepn, locl2);
                                }
                                type2 = app;
                            }
                            if (s[i] == '-')
                            {
                                locl1 = -1;
                            }
                            else
                            {
                                locl1 = 1;
                            }
                            locl2 = 0;
                            type1 = app;
                            drob = false;
                            //stepdrob = 0.1;
                            i++;
                            break;
                        }
                    #endregion
                    /*................,,,,,,,,,,,,,,,,,,*/
                    #region
                    case '.':
                    case ',':
                        {
                            drob = true;
                            // stepdrob = 0.1;
                            i++;
                            break;
                        }
                    #endregion
                    /*.0123456789.0123456789.0123456789.*/
                    #region
                    default:
                        {
                            if (drob)
                            {
                                //   locl2 = locl2 + stepdrob * Convert.ToDouble(s[i] + "");
                                // stepdrob = stepdrob * 0.1;
                            }
                            else {
                                //Console.WriteLine(s[i]);
                                locl2 = locl2 * 10 + Convert.ToInt64(s[i] + "");

                            }
                            i++;
                            break;
                        }
                        #endregion
                }

                if (i == s.Length)
                {

                    goto outwhile;
                }
            }
            outwhile:
            {
                #region
                if (type2 == split)
                {
                    itog = itog + Convert.ToInt64(locl1) / Convert.ToInt64(locl2);
                }
                else
                if (type2 == app)
                {
                    itog = itog + locl1 * locl2;
                }
                else
                if (type2 == stepp)
                {
                    if (type1 == app)
                    {
                        //    itog = itog + locl1 * stepen(stepn, locl2);
                    }
                    else
                    {
                        //   itog = itog + locl1 / stepen(stepn, locl2);
                    }
                }
               // type1 = app;
                type2 = app;
                #endregion
            }
            return itog;
        }
        static void Main(string[] args)
        {
            string s = Console.ReadLine();
            i = 0;
            Console.WriteLine(chet(s));
            //Console.ReadKey();
        }
    }
}

