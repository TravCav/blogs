
Wise Bits of bitwise wisdom
Bitwise operators? Operators that do stuff with bits? Yep of course that's a thing.  Not a thing anyone uses anymore because we have more than enough storage and cpu cycles to spare, but they're still there. So this is just neat stuff and it won't likely be something you'll ever use. It's pretty fun to play with though. There are some actual places where this can be useful, but it's not likely to come up unless maybe if you're doing something on your Arduino or have some other weird use case.  Let's get into some binary and poke around at some boolean logic.

Let me set the scene. Let's say you have a bunch of flags right? How are you gonna check those flags? IF statements? Yeah, of course. Like one by one though? What if you want to check for multiple flags?  Obviously we can just add more conditions. Yeah just keep adding conditions that'll be fun.  What if we got like 8 flags and we want to make sure we have only a certain three and none of the other ones.  Ugh now we have to check for every stupid flag we do want and we have to also check every flag we don't want.  We don't have time for all that typing. Let's just visualize this for a second.

if (flag1 == true  && flag2 == false && flag3 == true && flag4 == true && flag5 == false && flag6 == false && flag7 == false && flag8 == false) 
{ 
    // code for when only flags 1, 3, and 4 are true
}

Oh yeah I totally want to come across that while I'm maintaining something.  Let's try refactoring maybe we can simplify a bit.

if ((flag1 && flag3 && flag4) && !(flag2 && flag5 && flag6 && flag7 && flag8)) 
{ 
    // code for when only flags 1, 3, and 4 are true
}

I mean yeah that's a little better but geez man. So much typing. My fingers are exhausted. 
Before we go on I feel the need to throw in a disclaimer here.  This is for demonstration purposes only. Don't do any of this unless you have really good reason. If you put this in your code I'm not responsible for the actions of the next person that has to maintain your code. But check out this one clever trick that programmers don't want you to know about.
flags = 1 | 4 | 8;
if((flags ^ 13) == 0)
{
    // code for when only flags 1, 3, and 4 are true
}

whaaaaaaaa... What just happened? Okay I just threw in a bunch of concepts without explaining any of it, but don't hate me, I'm going to explain everything.  We're going to have to get bitty now. bitten? bitter? bittish? BITWISE! Let's make this a little more maintainable and try to explain it at the same time.  First thing's first, what the deuce is going on with flags = 1 | 4 | 8;.  Well we're using the binary version of each number to represent the bits. Let me write it out and see if that helps anything.
flag1 = 00000001 = 1
flag2 = 00000010 = 2
flag3 = 00000100 = 4
flag4 = 00001000 = 8
flag5 = 00010000 = 16
flag6 = 00100000 = 32
flag7 = 01000000 = 64
flag8 = 10000000 = 128

Try not to think of it too much as binary though. Think of it more as 8 placeholders with each bit indicating a flag.  So starting right to left we can see the first bit represents flag 1 and the second bit from the right flag 2 and so on.  The fun part of all this though is that these placeholder ones and zeros are indeed valid binary. So each series of ones and zeros can be converted to an integer number. K great blah blah blah. Let's look at that first statement again and see what else is going on there. What's with the pipes? Great question. I'm glad I asked.  Those are OR operators.  It's doing boolean logic on each bit column and checking for true. Imagine that for each column it's doing an OR truth table. So if flag1's first bit is 1 OR flag3's first bit is 1 OR flag4's first bit is 1 then return 1.  It does it much faster than it sounds. On the cpu it can run the bits through hardware and just get back the answer with little effort. Yeah hardware level math processing going on here. Let's write it all out again just for fun. 
flag1 = 00000001 = 1
flag3 = 00000100 = 4
flag4 = 00001000 = 8
flags = 00001101 = 13 all the columns that had a 1 get mashed together

Now we see flags is equal to 00001101 or if we convert to decimal we get 13. Amazing! This means that with a single 1 byte integer we can represent any of the 255 combinations of flags. Okay let's go back and clean up the first part by making our flags constants and assigning them their decimal values.  Then we can rewrite flags = 1 | 4 | 8; as flags = flag1 | flag3 | flag4; much more maintainable since now we don't have to know their numbers. Let's also replace that 13 with a variable too.  flags134 = flag1 | flag3 | flag4;  Hopefully your code will have better names.  So what's with the IF statement we had? Let's look at it again with our new variables.

flags = flag1 | flag3 | flag4;
if((flags ^ flags134) == 0)
{
    // code for when only flags 1, 3, and 4 are true
}

We got OR's under our belts so let's move on to that little caret. That's an XOR(eXclusive OR). This thing tells us when one and only one bit in the column is 1. And as we can see from our example below they're either always 0 or always 1 so we get back all 0's. Telling us that our two variables match bit for bit. I know! Neat right? XOR can be used to remove bits. So essentially what we did was say, if we remove flags 1, 3, and 4 is there nothing left? And we got back all zeros so we know the only flags that existed were 1, 3, and 4.
00001101 flags
00001101 flags134
00000000 all the places one and only one row has a 1

We can use that to modify our list too. We can say flags ^= flag3; and we'll end up with flags = 00001001. Same as flags = flag1 | flag4.
00001101 flags
00000100 flags3
00001001 all the places one and only one row has a 1

Cool now we can add flags with | and remove them with ^.  And yeah they work like any other operator so we can even combine it with = if the language allows it.

That's all fine and good you say. But now you only care about one flag. You just want to see if they have flag3 for some reason. Fair enough. We can see XOR isn't going to help us here. Time to bring in the ampersand! Check out what happens if we do (flags & flags134). It will do the boolean logic AND truth table on each of the bits.  
00001101 flags
00001101 flags134
00001101 all the places both rows were 1 AND 1

Our result is 13. The same as flags134.  It's almost like asking it to tell you all the places the two variables intersect. Let's try it with our current flags value and a different set of flags. Let's say flags 4, 5, and 6.
00001101 flags
00111000 flags456
00001000 all the places both rows were 1 AND 1

In this case our result is 8 or just flag4.  So we could do an IF statement like if((flags & flags456) > 0) and we'd know that the too sets of flags overlapped...somewhere. But we just wanted to check for a single flag so we can ignore all that and just need something like this if((flags & flag3) == flag3))
00001101 flags
00000100 flag1
00000100 all the places both rows were 1 AND 1

If the flag was in there then the result should come out the same as whatever we were checking for. We can do the same if we want to check for multiple flags too.  If we want to check that flags has at least flags 1, 3, and 4 we can check with if((flags & flag134) == flag134)). Granted there might be others, but we know it contains at least 1, 3, and 4.

Just the greatest thing since sliced bread. We didn't go over NOT which is usually a ~ and inverts the bits and there's also << and >> which shift all the bits to the left or right. But that's the gist of it. We can hold flags for days in a single variable. We can store whole subsets and combinations of flags and do quicks checks with a single operation. Maybe you have flags for permissions. Maybe anything above flag4 is an admin role. if (flags > flag4){ //BAM! admin stuff! } That totally works! Maybe you want to track different logging settings. You can store or pass around a single integer and check your flags with quick boolean math in your logging function instead of iterating over lists and arrays.  If your language has enums, you can use that to make your flags more manageable too.  if((logging & log.file) == log.file) seems pretty maintainable. And if you need to make it really readable, C# even has a flags attribute for enums so you can say logging.HasFlag(log.file). HasFlag does sacrifice some performance though because it has to check types. This stuff works in SQL statements too. Imagine doing quick boolean math over a million records on a single column instead of checking column after column.

Another tool in the toolbox.  Use it wisely and don't get too clever with it.


