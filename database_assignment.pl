:- dynamic (item/5).
item(15970,"Turtle Men Shirt",topwear,blue,20.45).
item(39386,"Peter England Men Party Blue Jeans",bottomwear,blue,26.9).
item(59263,"Titan Women Silver Watch",accessories,grey,10.7).
item(21379,"Manchester United Men Solid Black Track Pants",bottomwear,black,10.65).
item(53759,"Puma Men Grey T-shirt",topwear,grey,11.2).
item(21379,"Inkfruit Mens Chain Reaction T-shirt",topwear,green,11.5).
item(53759,"Fabindia Men Striped Green Shirt",topwear,green,21.2).
item(18555,"Jealous 21 Women Purple Shirt",topwear,purple,30.5).
item(30805,"Puma Men Pack of 3 Socks",accessories,black,5.66).
item(26960,"Skagen Men Black Watch",accessories,black,40.6).
item(29114,"Puma Men Future Cat Remix SF Black Casual Shoes",shoes,black,33.3).
item(30039,"Fossil Women Black Huarache Weave Belt",accessories,black,22.7).
item(92043,"Fila Men Cush Flex Black Slippers",shoes,black,19.6).
item(18653,"Murcia Women Blue Handbag",accessories,blue,33.5).
item(47957,"Ben 10 Boys Navy Blue Slippers",shoes,blue,20.5).
item(46885,"Reid & Taylor Men Check White Shirts",topwear,white,16.4).
item(42419,"Police Men Black Dial Watch PL12889JVSB",accessories,black,11.8).
item(46851,"Gini and Jony Girls Knit White Top",topwear,white,34.6).
item(45619,"Bwitch Beige Women Jeans BW335",bottomwear,green,20.5).
item(88653,"Gucci Women Handbag",accessories,green,104.5).



start:-
	%write("____________________________"),nl,
	ansi_format([fg(white),bg(black)],"\tAPPARELS DATABSE MENU\t\t",[]),nl,
	write("____________________________"),nl,
	write("Press 1 to Print All Items"),nl,
	write("Press 2 to Search Items"),nl,
	write("Press 3 to Add New Item"),nl,
	write("Press 4 to Update Item"),nl,
	write("Press 5 to Delete Item"),nl,
	write("::"),
	read(INPUT),
	actionForInput(INPUT).


actionForInput(X):-
	X is 1, show_all.
actionForInput(X):-
	X is 2, search.
actionForInput(X):-
	X is 3, add_new_item.
actionForInput(X):-
	X is 4, update_item.
actionForInput(X):-
	X is 5, del_item.
actionForInput(X):-
	X=\=1 ,X=\=2 ,X=\=3 ,X=\=4,X=\=5,
	start.

show_all:-
	ansi_format([fg(white),bg(blue)],"\n\t\t\t\t\t\t\t\t\tALL ITEMS\t\t\t\t\t\t\t\t\t\n",[]),
	forall(item(A,B,C,D,E), format("ITEM ID: ~w, ITEM TITLE: ~w ,ITEM TYPE: ~w, ITEM COLOR: ~w, ITEM PRICE: ~w USD \n", [A,B,C,D,E])),nl,
	start.




search:-
	%write("____________________________"),nl,
	ansi_format([fg(white),bg(black)],"\tSEARCH ITEM\t\t",[]),nl,
	write("____________________________"),nl,
	write("Press \n-1 for SEARCH BY ID\n-2 for SEARCH BY COLOR\n-3 for SEARCH BY CATEGORY\n-Any Other Digit for MAIN MENU\n::"),
	read(X), search(X).
search(X):-
	X is 1, id_search.
search(X):-
	X is 2, color_search.
search(X):-
	X is 3, category_search.
search(X):-
	X is 4, start.
search(X):-
	X=\=1 ,X=\=2 ,X=\=3,X=\=4,
	start.

id_search:-
	write("Enter ITEM ID"),nl,
	read(ID),
	ansi_format([fg(white),bg(blue)],"\n\t\t\t\t\t\t\t\t\tSEARCH RESULTS\t\t\t\t\t\t\t\t\t\n",[]),
	forall(item(ID,A,B,C,D), format("ITEM ID: ~w, ITEM TITLE: ~w ,ITEM TYPE: ~w, ITEM COLOR: ~w, ITEM PRICE: ~w USD \n", [ID,A,B,C,D])),nl,
	search.
color_search:-
	write("Enter Color i.e. black,white,green"),nl,
	read(COLOR),
	ansi_format([fg(white),bg(blue)],"\n\t\t\t\t\t\t\t\t\tSEARCH RESULTS\t\t\t\t\t\t\t\t\t\n",[]),
	forall(item(A,B,C,COLOR,D), format("ITEM ID: ~w, ITEM TITLE: ~w ,ITEM TYPE: ~w, ITEM COLOR: ~w, ITEM PRICE: ~w USD \n", [A,B,C,COLOR,D])),nl,
	search.
category_search:-
	write("Choose Category \n 'topwear' | 'bottomwear' | 'accessories' | 'shoes'"),nl,
	read(CAT),
	ansi_format([fg(white),bg(blue)],"\n\t\t\t\t\t\t\t\t\tSEARCH RESULTS\t\t\t\t\t\t\t\t\t\n",[]),
	forall(item(A,B,CAT,C,D), format("ITEM ID: ~w, ITEM TITLE: ~w ,ITEM TYPE: ~w, ITEM COLOR: ~w, ITEM PRICE: ~w USD \n", [A,B,CAT,C,D])),nl,
	search.


add_new_item:-
	%write("____________________________"),nl,
	ansi_format([fg(white),bg(black)],"\tADD NEW ITEM\t\t",[]),nl,
	write("____________________________"),nl,
	random_between(10000,99999, R), ID is R,
	write("Enter Item Title(Enter In double quotes i.e. \"item_title\")"),read(TITLE),nl,
	write("Choose Item Category:\n 'topwear' | 'bottomwear' | 'accessories' | 'shoes' \t"),read(CAT),nl,
	write('Enter Item Color:\t'),read(COLOR),nl,
	write("Enter Item Price(USD):\t"),read(PRICE),nl,
	assert(item(ID,TITLE,CAT,COLOR,PRICE)),
	ansi_format([fg(green)],"\t1 ITEM ADDED SUCCESSFULLY!",[]),nl,nl,
	start.


del_item:-
	write("____________________________"),nl,
	ansi_format([fg(white),bg(black)],"\tDELETE ITEM\t\t",[]),nl,
	write("____________________________"),nl,
	write("Enter Item ID to Delete ::"), read(X),nl,
	forall(item(X,A,B,C,D), format("ITEM ID: ~w, ITEM TITLE: ~w ,ITEM TYPE: ~w, ITEM COLOR: ~w, ITEM PRICE: ~w USD \n", [X,A,B,C,D])),nl,
	forall(item(X,_,_,_,_), retract(item(X,_,_,_,_))),nl,
	ansi_format([fg(green)],"\tDeletion Process Complete!",[]),nl,nl, start.

update_item:-
	ansi_format([fg(white),bg(black)],"\tUPDATE ITEM\t\t",[]),nl,
	%write("____________________________"),nl,
	ansi_format([fg(blue)],"NOTE:\n\t Please make sure the Item with ID exist Already,\n\t else a new Item will be added.",[]),nl,
	write("____________________________"),nl,
	write('Enter Item ID:\t'),read(ID),nl,
	forall(item(ID,A,B,C,D), format("FOUND = ITEM ID: ~w, ITEM TITLE: ~w ,ITEM TYPE: ~w, ITEM COLOR: ~w, ITEM PRICE: ~w USD \n", [X,A,B,C,D])),!,nl,	
	write("Enter Item Title(Enter In double quotes i.e. \"item_title\")"),read(TITLE),nl,
	write("Choose Item Category:\n 'topwear' | 'bottomwear' | 'accessories' | 'shoes' \t"),read(CAT),nl,
	write('Enter Item Color:\t'),read(COLOR),nl,
	write("Enter Item Price(USD):\t"),read(PRICE),nl,
	forall(item(ID,_,_,_,_), retract(item(ID,_,_,_,_))),nl,
	assert(item(ID,TITLE,CAT,COLOR,PRICE)),
	ansi_format([fg(green)],"\t1 ITEM UPDATED SUCCESSFULLY!\n\n",[]),
	start.



