
Flags

Today we're going to be talking about flags and some of the neat things we can do with them.  This is just a neat practice and won't likely be something you'll ever use. It's pretty fun to play with though. There are some actual places where this can be useful, but you're not likely to ever need it unless maybe if you're doing something on your Arduino.  We'll be getting into some boolean logic, but we'll doing it step by step so make sure you understand each section before moving to the next one. And if anything doesn't make sense leave a comment.  I think everyone will be able to follow along just fine though.

Let's start off with the scenario that we have 4 clinics, and we need to track which clinics I'm allowed to see.  For simplicity we'll just have 4 clinics and call them clinics one through four instead of coming up with names. And for brevity sometimes we'll call them cl1, cl2, cl3, cl4.  So, let's say I can see clinic 2 and clinic 4. Normally we would just put these in a list of clinics, but we're going to do something a little different today. We'll store each one as a flag in a table like so.
+-----+-----+-----+-----+
| cl4 | cl3 | cl2 | cl1 |
+-----+-----+-----+-----+
|  Y  |  N  |  Y  |  N  |
+-----+-----+-----+-----+

Pretty straightforward so far. I little odd that we're listing the clinics in reverse order but it'll make sense when we bring in the binary.  So not we have 4 flags we can represent all combinations of permissions with those 4 flags.  If I said someone had permissions [N,N,N,Y] then you know they can only see clinic 1 and someone with [Y,Y,Y,N] can see everything but clinic 1.  Easy to follow right? So let's pretend we have a user that can see clinic 4 and another user than can see clinic 3. What's an easy way to see and track what clinics they can both see?
+--------+-----+-----+-----+-----+
| Person | cl4 | cl3 | cl2 | cl1 |
+--------+-----+-----+-----+-----+
| User 1 |  Y  |  N  |  N  |  N  |
+--------+-----+-----+-----+-----+
| User 2 |  N  |  Y  |  N  |  N  |
+--------+-----+-----+-----+-----+

We can look at it and can tell that combined they can see [Y,Y,N,N]. But how do we get the computer to see that? We'll get there, but first let's go over some boolean logic.  What would be the result if we did an OR on each column?  
Can user 1 or user 2 see cl4? Y
Can user 1 or user 2 see cl3? Y
Can user 1 or user 2 see cl2? N
Can user 1 or user 2 see cl1? N

So our results are [Y,Y,N,N].  Holy crap that's clinic 4 and clinic 3. Sweet we can use OR to condense Y's from multiple rows into one row. This will be on the test.  So now we have one thing we can use to track what they can see together. Not super useful yet but let's just focus on the concepts for now.

The next thing we want to do is check to see if one of them can can see a particular clinic.  Let's check if they can see clinic 3.  Clinic 3 being represented as [N,Y,N,N] and their combined permissions represented as [Y,Y,N,N].  We'll do something like an intersect operation by doing an AND on each column.
+--------+-----+-----+-----+-----+
|        | cl4 | cl3 | cl2 | cl1 |
+--------+-----+-----+-----+-----+
| Users  |  Y  |  Y  |  N  |  N  |
+--------+-----+-----+-----+-----+
|  Cl3   |  N  |  Y  |  N  |  N  |
+--------+-----+-----+-----+-----+

Is cl4 Y and Y? N
Is cl3 Y and Y? Y
Is cl2 Y and Y? N
Is cl1 Y and Y? N
 
Result being [N,Y,N,N], the same as cl3. So if we do an AND we get Y's in our results where the two rows are both Y. We'll dig into this more later but this means we can compare two things and then check if the result is the same as what we compared.  Meaning if we check for cl3, and if the thing we're checking against has cl3, then the result will be the same as the thing we're checking for.  yeah... that... we'll spell it out more later.

Now let's see if we can complicate things a bit while making it clearer at the same time. But first let's recap a few key concepts we've learned so far.
We can represent sets of things as a list of flags.
Doing an OR with lists combines them.
Doing an AND does an intersect.

Let's get computery
Let's get rid of all those messy Y's and N's and instead use 0's and 1's respectively. And while we're at it let's get rid of the array too. Now the combined permissions look like 1100 and cl3 looks like 0100. This is super useful and key to making this whole thing work, because now we can store the string of bits as a int. whaaaaat?  Yeah check it out.
0001 is 1
0010 is 2
0100 is 4
1000 is 8

You see the pattern right? Hopefully that makes sense? If not then nothing going forward will either.

Blah blah blah words are boring let's look at code.


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