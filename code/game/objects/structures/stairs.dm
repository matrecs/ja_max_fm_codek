/obj/structure/stairs/main
	name = "Stairs Trigger"
	icon = 'icons/effects/tile_effects.dmi'
	icon_state = "arrow"
	anchored = 1.0
	unacidable = 1
	var/obj/structure/stairs/main/exit = null //выход
	var/obj/structure/stairs/main/sub = null //дочерний вход
	var/obj/structure/stairs/main/subexit = null //дочерний выход
	var/id = null
	var/sdir = null


/obj/structure/stairs/exittrig
	name = "Stairs Exit"
	var/id = null

/obj/structure/stairs/subtrig
	name = "Stairs Trigger Sub"
	icon = 'icons/mob/screen1.dmi'
	icon_state = "x"
	var/id = null

/obj/structure/stairs/subexittrig
	name = "Stairs Exit Sub"
	icon = 'icons/mob/screen1.dmi'
	icon_state = "x"
	var/id = null

/obj/structure/stairs/main/New()
	id = "[src.x]_[src.y]_[src.z]"
	invisibility = 101    //невидимые для всех
	sub = new /obj/structure/stairs/subtrig(src.loc)

	switch(src.dir)
		if(1)	sub.y = src.y - 1
		if(2)	sub.y = src.y + 1
		if(4)	sub.x = src.x + 1
		if(8)	sub.x = src.x - 1
	sub.id = src.id

	exit = new /obj/structure/stairs/exittrig(src.loc)
	subexit = new /obj/structure/stairs/subexittrig(src.loc)
	exit.id = src.id
	subexit.id = src.id

	if (src.z == 1)
		exit.z = 7
		subexit.z = 7
	if (src.z == 7)
		exit.z = 1
		subexit.z = 1

	switch(src.dir)
		if(8)
			exit.x = src.x
			subexit.x = src.x + 1
		if(4)
			exit.x = src.x
			subexit.x = src.x - 1
		if(2)
			exit.y = src.y
			subexit.y = src.y + 1
		if(1)
			exit.y = src.y
			subexit.y = src.y - 1

/obj/structure/stairs/subtrig/New()
	invisibility = 101    //невидимые для всех

/obj/structure/stairs/exittrig/New()
	invisibility = 101    //невидимые для всех

/obj/structure/stairs/subexittrig/New()
	invisibility = 101    //невидимые для всех


/obj/structure/stairs/main/Entered(atom/movable/M as mob|obj)  //триггер триггера
	M.loc = get_turf(exit)                     //телепорт наступившего на триггер
	var/turf/subT = get_turf(sub)
	if (!(istype(M, /mob/dead/observer)))
		for(var/atom/movable/ROI in subT)            //телепорт объекта с суб-триггера
			ROI.loc = get_turf(subexit)