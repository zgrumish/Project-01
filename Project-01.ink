/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!
    */ 
   

VAR dollars = 5
VAR energy = 0
VAR work_eng = 0
VAR cafe_eng = 0
VAR homework_eng = 1

== apartment_morning ==
You wake up after getting about an hour and a half of sleep from partying and spending time with some friends from the night before. Much to your alarm you see you have a mountain of assignments due tonight at 11:59pm. And while that is good amount of time from now you have some more pressing matters. How are you getting tot class?
+ [Take the Bus] -> bus
+ [Take a scooter] -> scootered
+ [Sleep] ->class_skipped

->END

== scootered ==
Since you are chosing to scooter you get to sleep a little longer before class starts one full hour to be exact. You also have to pay $5 so that you can renta scooter to class. Hey at least you got to rest. +1 Energy  -$5
+[Class] -> class

-> END

== bus ==
Did I forget to mention via bus you are going to need to take one that leaves an hour and a half before your class. Oops. You definately won't be tardy but it also means no quick shuteye before you leave.
+[Class]-> class

-> END

== class ==
You arrive at class your head his foggy from delerium and anxiety. You teacher is reading through slides that will be posted later that means you got some options of how you will spend your class time. What are you going to do?
+[Work on homeork] -> homework
+[Nap] -> nap
+[Listen to the lecure] -> lecture

->END

== lecture ==
You spent your time listening to the lecture it was a good lesson. But he even stated at the beginning of class that this would all be posted after class for your review. 
+[Class ends] -> class_end

->END

== homework ==
You've decided it might be as good time to tackle that mountain of work. You get a decent amount of it done but their's still alot of work to go. 
~ homework_eng = homework_eng + 1

 + [Class ends] -> class_end
 
 ->END
 
 == nap ==
 The lecturerur reading verbatium off of slides and the cozy temprature of the room lull you peacefully to sleep. +1 Energy 
 + [Class ends] -> class_end
 
-> END

==class_skipped==
You slept and allowed yourself to gain some energy in the process you still have a decent amount of time left in the day since you didn't go to you're class + 2 Energy
~ energy = energy + 2
+[Go to work] -> work
+[Cafe] -> cafe

->END

== class_end ==
The ruckus of students gathering their things five minutes before the end of class alerts you to get ready to choose where you're heading next. Where are you going?
+[Go to work] -> work
+[Cafe] -> cafe

->END
== work ==
You decided to go to work today something's gotta pay the bills sadly you can't really do much while at work  althought you do arrive at the breakroom ready to start anyways.
~ work_eng = work_eng + 1 
*  {dollars ==5} [Buy a coffee] -> coffee
+[Power through the shift] ->working

-> END

== working ==
You continue to work until almost 11pm. Anxious and full of adrenilne you race home to attemtp finish your remeaining assignments.
[Home] ->apartment_night

->END

== cafe ==
You are at the campus cafe. Great place to study and get a very mediocre cup of coffee. What would you like to do?
~ cafe_eng = cafe_eng + 1
* { dollars ==5} [Buy a cup of coffee] -> coffee
+[Study] -> study
+[ leave] -> apartment_night

-> END

== apartment_night == 
You've returned home for the night. It's been a long day. What would you like to do?
* { energy > 1} [Study] -> study_night
+[sleep] -> ending_landingpge

-> END

== coffee==
You get a cup of coffee. You feel energized.
~ energy = energy + 1 
~ dollars = dollars - 5
* { work >0} [Return to work] -> work
* { cafe >0} [Return to the cafe] -> cafe

-> END
 
 == study ==
 You decided to study. You've made some headway on your mountain of homework.
 ~ homework_eng = homework_eng + 1
 
 +[Go home] -> apartment_night
 -> END
 
 == study_night ==
 You decided to study. You've made some headway on your mountain of homework.
 ~ homework_eng = homework_eng + 1
 
 + [ Go to bed] -> ending_landingpge
 
 -> END
 
 == ending_landingpge ==
 You' got some rest you're exhausted and a little out of it. You check your phone.
 
 * { work >0}{ homework_eng > 1} [Continue] ->work_HW_complete
 * { work >0}{ homework_eng < 2} [Continue] -> work_complete
 * { work <1 }{ homework_eng > 1} [Continue] -> HW_complete
 * { work <1 }{ homework_eng < 2} [Continue] -> Work_HW_incomplete
 
 ->END
 
 == work_HW_complete ==
 You've successfully completed your homework and worked. You can afford your rent this month and don't have to use your grocerry money. You also maintained your hi grade. Yipeee.
 -> END
 
 == work_complete ==
 You weren't able to complete your homework your grade tanked and you had to drop the class. But hey at least you can afford to pay your rent this month.
 -> END
 
 == HW_complete ==
 You were able to complete the mointain of homework yipee you maintained your grade. Unfortunately you won't be able to afford your rent this month unless you use your grocery money. Guess you're eating beans for a couple weeks.
 -> END
 
 == Work_HW_incomplete ==
 You weren't able to complete your homeowkr you're grade tanked and you had to drop the class. since you didn't go to work you can't afford your rent this month without using your grocery money enjoy eating beans for a couple weeks.
 -> END
 