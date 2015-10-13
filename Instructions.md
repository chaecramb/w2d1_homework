Add a leave method to allow people off the lifts. Where will these Passenger objects 'go' when they leave the passengers collection of a lift? Presumably they need to be put into another array somewhere -- maybe the building needs an 'occupants' array? Where is the code that controls and co-ordinates this going to 'live'? Maybe we need some methods outside our objects (in our main.rb file) to ask passengers to leave lifts and add them to the occupants of the building?)

When a passenger gets off a lift, how do we know which floor they're on? Presumably they're on whatever floor the lift was on at the time, so we need an attribute in the passenger to record that.

Add functionality to make the lifts travel to different floors.

Think about how lifts in buildings really work. People don't choose which lift to get in (mostly), they press a button, and the nearest one comes. Can you recreate this functionality? It will involve (maybe) functionality in the building for a person to 'call a lift', which will work out which lift is closest to the floor the user is on, and then move that lift's floor before adding the passenger. Does this lead to any more 'logical' changes to the code?

What does your code do when given weird data or commands? Can lifts move to astromonical floors? Can people be in more than one lift at a time?