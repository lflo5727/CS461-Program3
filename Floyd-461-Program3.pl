/*
    CS 461
    Program 3
    Liam Floyd
    
    A college dorm hallway has 5 1-person rooms. Each resident is a different major, listens to a different style of music, drives a different make of car, has a different favorite sports team, and a different favorite beverage.

    The computer science student lives in the middle of the corridor
    The history major is a jazz fan.
    The Yankees fan drives a Toyota.
    The accounting major drinks Coke.
    The engineering major drinks coffee.
    The computer science student and history student are neighbors.
    The student at the far end of the hall likes classical music
    The tea drinker drives a Tesla.
    The classical music fan lives next to the jazz listener.
    The English major does not live in either of the first two rooms.
    The Royals fan drives a Tesla.
    The Cubs fan listens to jazz.
    The engineering major follows the Chiefs
    The first room is the home of the Broncos fan
    The Coke drinker drives a Nissan.
    The country music fan and the techno fan are neighbors.
    The accounting major lives in the first room.
    The fans of the 2 Kansas City teams (Chiefs and Royals) are neighbors
    The accounting major listens to rock music
    The Yankees fan drinks milk.
    The Chevy driver listens to country music.
    The jazz fan drives a Ford.

*/


next(A, B, List) :- append(_, [A, B|_], List).
next(A, B, List) :- append(_, [B, A|_], List).
adjacent(A, B, List) :- next(A, B, List); next(B, A, List).

%Use hall(Rooms) to list out each room with each item
hall(Rooms) :-
    length(Rooms, 5),
    
    Rooms = [_, _, (room(compsci,_,_,_,_)), _, _],
    member(room(history, _, _, jazz, _), Rooms),
    member(room(_, toyota, yankees, _, _), Rooms),
    member(room(accounting, _, _, _, coke), Rooms),
    member(room(engineering, _, _, _, coffee), Rooms),
    member(room(_, tesla, _, _, tea), Rooms),
    member(room(_, tesla, royals, _, _), Rooms),
    member(room(_, _, cubs, jazz, _), Rooms),
    member(room(engineering, _, chiefs, _, _), Rooms),
    member(room(_, nissan, _, _, coke), Rooms),
    member(room(accounting, _, _, rock, _), Rooms),
    member(room(_, _, yankees, _, milk), Rooms),
    member(room(_, chevy, _, country, _), Rooms),
    member(room(_, ford, _, jazz, _), Rooms),
    
    %Undeclared
    member(room(english, _, _, _, _), Rooms),
    member(room(_, _, _, _, water), Rooms),
    
    adjacent((room(compsci, _, _, _, _)), (room(history, _, _, _, _)), Rooms),
    adjacent((room(_, _, _, classical, _)), (room(_, _, _, jazz, _)), Rooms),
    adjacent((room(_, _, _, country, _)), (room(_, _, _, techno, _)), Rooms),
    adjacent((room(_, _, chiefs, _, _)), (room(_, _, royals, _, _)), Rooms),
    
    Rooms = [_, _, _, _, (room(_, _, _, classical, _))],
    Rooms = [room(_, _, broncos, _, _), _, _, _, _],
    Rooms = [room(accounting, _, _, _, _), _, _, _, _],
    
    not(Rooms = [room(english, _, _, _, _), _, _, _, _]),
    not(Rooms = [_, room(english, _, _, _, _), _, _, _]).
  
%Find CS Major's music genre  
compsci_music(Music) :-
	hall(Rooms),
	member(room(compsci, _, _, Music, _), Rooms).

%Find English Major's favorite drink
english_drink(Drink) :-
	hall(Rooms),
	member(room(english, _, _, _, Drink), Rooms).
    
    
    