using System;
using System.Diagnostics;

namespace BlogStuff
{
    class Bitwise
    {
        /*
         * First thing's first let's setup an enum to hold all the ways we'll be logging.
         */
        private enum Log
        {
            None = 0,
            Debug = 1,
            Console = 2,
            File = 4,
            Db = 8,
            Email = 16
        }

        /*
         * Sweet a global logging setting so we can set the logging level for the whole app.
         */
        private static Log Logging = Log.None;
        static void Main(string[] args)
        {
            // Here are those OR's we were talking about.
            Logging = Log.Debug | Log.Console | Log.File;
            /*
             * 00001 debug
             * 00010 console
             * 00100 file
             * 00111 final value
             */
            DoLogging("Logging now equals 00111.");

            // We can also remove flags by using a "^" 
            Logging = Logging ^ Log.File;
            DoLogging("No more file logging");

            // Or because bitwise operators are just like all other operators we can combine them with the equal operator.
            // We'll demo by putting file logging back in.
            Logging |= Log.File;
            DoLogging("We got file logging back");

            Console.WriteLine("Press any key to exit.");
            Console.Read();
        }

        private static void DoLogging(string msg)
        {
            Console.WriteLine("Logging: " + Logging);
            Console.WriteLine(msg);
            /*
             * Now we can do a series of AND checks to see which flags are set.
             */

            if ((Logging & Log.Debug) == Log.Debug)
            {
                Console.WriteLine("Log to debug window");
                // Log to debug window code goes here
            }

            if ((Logging & Log.Console) == Log.Console)
            {
                Console.WriteLine("Log to console");
                // Log to console code goes here
            }

            if ((Logging & Log.File) == Log.File)
            {
                Console.WriteLine("Log to file");

                // Log to file code goes here
            }

            if ((Logging & Log.Db) == Log.Db)
            {
                Console.WriteLine("Log to Db");

                // Log to db code goes here
            }

            if ((Logging & Log.Email) == Log.Email)
            {
                Console.WriteLine("Log to email");

                // Log to email code goes here
            }

            Console.WriteLine("");
        }
    }
}