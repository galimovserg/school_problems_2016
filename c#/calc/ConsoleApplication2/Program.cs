using System;
/*readme2016
программу написал: Галимов Сергей Азаматович.
предназначена для вычисления арифметического выражения
заданное в строке.
выражение может содержать:
цифры: 0,1,2,3,4,5,6,7,8,9;
знаки операций: +,-,/,*,^;
круглые скобки: (,);
остальное: ,. для представления вещественного числа
*/

namespace ConsoleApplication2
{
    class Program
    {
        class viir
        {
            const int split = 2;//деление
            const int app = 3;//умножение
            const int stepp = 4;//возведение в степень
            static int i = 0;
            static double stepen(double a, double n)
            {
                return Math.Pow(a, n);
            }
            static double chet(string s)
            {
                #region здесь обьявляю локальные переменные
                double itog = 0;//локальное значение выражения
                double locl1 = 1,
                       locl2 = 0,
                       stepdrob = 0.1, stepn = 1;
                bool drob = false;
                int type2 = app,
                     type1 = app;
                #endregion
                while (true)
                {

                    switch (s[i])
                    {
                        /*((((((((((((((((((((((((((((((((((*/
                        #region обработка для (
                        case '(':
                            {
                                i++;
                                locl2 = chet(s);
                                drob = false;
                                stepdrob = 0.1;
                                break;
                            }
                        #endregion
                        /*))))))))))))))))))))))))))))))))))*/
                        #region обработка для )
                        case ')':
                            {
                                drob = false;
                                stepdrob = 0.1;
                                goto outwhile;
                            }
                        #endregion
                        /*/////////////////******************/
                        #region обработка для *,/
                        case '*':
                        case '/':
                            {
                                if (type2 == split)
                                {
                                    locl1 = locl1 / locl2;
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
                                        locl1 = locl1 * stepen(stepn, locl2);
                                    }
                                    else
                                    if (type1 == split)
                                    {
                                        locl1 = locl1 / stepen(stepn, locl2);
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
                                stepdrob = 0.1;
                                break;
                            }
                        #endregion
                        /*^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^*/
                        #region обработка для ^
                        case '^':
                            {
                                if (type2 == stepp)
                                {
                                    stepn = stepen(stepn, locl2);
                                    locl2 = 0;
                                }
                                else {
                                    type2 = stepp;
                                    stepn = locl2;
                                }
                                locl2 = 0;
                                drob = false;
                                stepdrob = 0.1;

                                break;
                            }
                        #endregion
                        /*---------------+++++++++++++++++++*/
                        #region обработка для -+
                        case '-':
                        case '+':
                            {

                                if (type2 == split)
                                {
                                    itog = itog + locl1 / locl2;
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
                                        itog = itog + locl1 * stepen(stepn, locl2);
                                    }
                                    else
                                    {
                                        itog = itog + locl1 / stepen(stepn, locl2);
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
                                stepdrob = 0.1;

                                break;
                            }
                        #endregion
                        /*................,,,,,,,,,,,,,,,,,,*/
                        #region обработка для .,
                        case '.':
                        case ',':
                            {
                                drob = true;
                                stepdrob = 0.1;

                                break;
                            }
                        #endregion
                        /*.0123456789.0123456789.0123456789.*/
                        #region обработка цифр
                        default:
                            {
                                if (drob)
                                {
                                    locl2 = locl2 + stepdrob * Convert.ToDouble(s[i] + "");
                                    stepdrob = stepdrob * 0.1;
                                }
                                else {
                                    //Console.WriteLine(s[i]);
                                    locl2 = locl2 * 10 + Convert.ToDouble(s[i] + "");

                                }

                                break;
                            }
                            #endregion
                    }
                    //двигаем указатель дальше
                    i++;
                    //если  конец строки то выходим 
                    if (i == s.Length)
                    {
                        goto outwhile;
                    }
                }
                outwhile:
                {
                    /*
                    прибавим к(вычтим от)  itog locl1*(/)
                    перед выходом
                    */
                    #region outwhile
                    if (type2 == split)
                    {
                        itog = itog + locl1 / locl2;
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
                            itog = itog + locl1 * stepen(stepn, locl2);
                        }
                        else
                        {
                            itog = itog + locl1 / stepen(stepn, locl2);
                        }
                    }
                    #endregion
                }
                return itog;
            }
            public static double f(string s)
            {
                i = 0;
                return chet(s);
            }
        }

        static void Main(string[] args)
        {          
            Console.WriteLine(viir.f(Console.ReadLine()));
            Console.WriteLine(viir.f(Console.ReadLine()));
            Console.ReadKey();
        }
    }
}
