Viola-Jones
    Rapid Object Detection using a Boosted Cascade of Simple Features

    because sometimes the complicated things turn out to be really simple, and sometimes the hard things turn out to be really easy

face detection
    not recognition

    The Viola-Jones face detector uses a “rejection cascade” consisting of many layers of classifiers. If at any layer the detection window is _not _recognized as a face, it’s rejected and we move on to the next window. 

haar objects
    integral image

adaboost
A weak classifier is simply a classifier that performs poorly, but performs better than random guessing
draw the rest of the owl



Man there's nothing I love more than doing a deep dive into technical things and rambling on about the fiddly bits.  But today I want to try going a different direction.  I want to speak simply about something that's simple but has a lot of complicated things hidden in the details.  

Today we're going to be looking at rapid object detection using a boosted cascade of simple features. Dude! no! We promised simple. Let's start over and try it again.

Today we're going to be looking at the Viola-Jones algorithm.  It's a famous face detection algorithm. It's a great example of a simple solution to something that sounds like a complex problem.  Despite all the math and other techno wizard nerd science involved, the core concepts are pretty simple.

It sounds like a big problem right?  All the possible different faces. All the different picture environments.  Turns out most of the problems are in details we don't even care about. Almost every face we're looking at is going to be looking straight ahead at a camera. And generally people try to take pictures where you can see everyone's face pretty clearly.

Okay I hear you. Even if we assume people are trying to get good pictures of people, how do we account for all the different faces.  People look so different from each other right?  Well...yes, but we don't care about those parts either. This isn't face recognition and we don't care who it is. We just care that it's a face.  And faces almost always look the same. Two eyes, a nose, and a mouth. Sure there are some outliers in the data, but it's safe to assume our dataset will look like that most of the time.  The general concept of a face is so vague that even our brains see faces where there aren't any. I'll just leave this here. https://www.reddit.com/r/Pareidolia/

Okay so now we're just going to assume we have a straight on picture of a face that has two eyes, a nose, and a mouth. That seems simpler right? Go ahead take a second to think of an algorithm to detect two eyes.  Now select all that code and hit the delete key.  We're not trying to make eye tracking software over here. What if they're wearing shades or something. Nah man keep it simple. We just need to find haar-like features by calculating integral images. Uh... I mean... We gotta find light and dark boxes.

If we scan across a picture we should eventually find a rectangular area where the left and right sides are darker than the middle.  Them are eye areas with a nose bridge in the middle! And if we look a little lower than that we'll find a similar sized rectangular area where the top half is darker than the bottom half. Oh heck eyes are above cheeks! That's sort of it.  Do that and you've found most faces in pictures.  Of course you can improve upon it for different scenarios with different light and dark pattern boxes, but that's seriously the gist of it. 




