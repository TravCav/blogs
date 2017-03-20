

clinic1 = 1
clinic2 = 2
clinic3 = 4
clinic4 = 8


i can see: clinic1 | clinic2 | clinic4 = 1 | 2 | 8 = 13
user has: clinic 3 | clinic 4 = 4 | 8 = 12

01011
01100



public bool HasPermissions(Permission userPermissions, Permission permissionsToCheckFor)
{
    return permissionsToCheckFor == Permission.None ? 
        false : 
        (userPermissions & permissionsToCheckFor) == permissionsToCheckFor;
}


clinics.HasFlag(Clinics.clinic1)



Flags

Today we're going to be talking about flags and some of the neat things we can do with them.  This is just a neat practice and won't likely be something you'll ever use. It's pretty fun to play with though and there are some actual places where this can be useful.  We'll be getting into some boolean logic, but we'll doing it step by step so make sure you understand each section before moving to the next one. And if anything doesn't make sense leave a comment.  I think everyone will be able to follow along just fine though.

Let's start off with the scenario that we have 4 clinics, and we need to track which clinics I'm allowed to see.  For simplicity we'll just have 4 clinics and call them clinics one through four instead of comming up with names. And for brevity sometimes we'll call them cl1, cl2, cl3, cl4.  So, let's say I can see clinic 2 and clinic 4. Normally we would just put these in a list of clinics I can see but we're going to do something a little different today. We'll store each one as a flag in a table like so.
+-----+-----+-----+-----+
| cl4 | cl3 | cl2 | cl1 |
+-----+-----+-----+-----+
|  Y  |  N  |  Y  |  N  |
+-----+-----+-----+-----+

Pretty straightforward so far. I little odd that we're listing the clinics in reverse order but it'll make sense when we bring in the binary.  So not we have 4 flags we can represent all combinations of permissions with those 4 flags.  If I said someone had permissions [N,N,N,Y] then you know they can only see clinic 1 and someone with [Y,Y,Y,N] can see everything but clinic 1.  Easy to follow right? So let's pretend we have a user that can see clinc 4 and another user than can see clinic 3. What's an easy way to see and track what clinics they can both see?
+--------+-----+-----+-----+-----+
| Person | cl4 | cl3 | cl2 | cl1 |
+--------+-----+-----+-----+-----+
| User 1 |  Y  |  N  |  N  |  N  |
+--------+-----+-----+-----+-----+
| User 2 |  N  |  Y  |  N  |  N  |
+--------+-----+-----+-----+-----+

We can look at it can tell they can see [Y,Y,N,N]. But how do we get the computer to see that? We'll get there, but first let's go over some boolean logic.  What would be the result if we did an OR on each column?  
Can user 1 or user 2 see cl4? Y
Can user 1 or user 2 see cl3? Y
Can user 1 or user 2 see cl2? N
Can user 1 or user 2 see cl1? N

So our results are [Y,Y,N,N].  Holy crap that's clinic 4 and clinic 3. Sweet we can use OR to condense Y's from multiple rows into one row. This will be on the test.  So now have one thing we can use to track what they can see together. Not super useful but let's just focus on the concepts for now.






 
 
 
 So now that we have a bunch of Y's and N's we could just represent those with 0's for N's and 1's for Y's