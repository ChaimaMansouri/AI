:- dynamic task/4.

% Clear all tasks

clear :- retractall(task(_, _, _, _)).

%task(Identifier, Description, User, Status)

% Create a task
create_task(Identifier, Description, User) :-
    assertz(task(Identifier, Description, User, false)),
    write('Task created: '), write(Identifier), nl.

% Assign a task
assign_task(Identifier, NewUser) :-
    retract(task(Identifier, Description, _, Status)),
    assertz(task(Identifier, Description, NewUser, Status)),
    write('Task '), write(Identifier), write(' assigned to user: '), write(NewUser), nl.

% Mark a task as completed
mark_completed(Identifier) :-
    retract(task(Identifier, Description, User, _)),
    assertz(task(Identifier, Description, User, true)),
    write('Task '), write(Identifier), write(' marked as completed.'), nl.

% Display all tasks
display_list([]).
display_list([task(Identifier, Description, User, Status) | Tail]) :-
    write('Task '), write(Identifier), write(': '), nl,
    write('- Description: '), write(Description), nl,
    write('- Assignee: '), write(User), nl,
    write('- Completion status: '), write(Status), nl,
    display_list(Tail).

display_tasks :-
    findall(task(Identifier, Description, User, Status), task(Identifier, Description, User, Status), Tasks),
    display_list(Tasks).

% Display completed tasks
display_completed_tasks :-
    write('Completed tasks: '), nl,
    findall(task(Identifier, Description, User, true), task(Identifier, Description, User, true), Tasks),
    display_list(Tasks).

% Display tasks assigned to a specific user
display_Tasks_Assigned(User) :-
    write('Tasks assigned to '), write(User), write(': '), nl,
    findall(task(Identifier, Description, User, Status), task(Identifier, Description, User, Status), Tasks),
    display_list(Tasks).
