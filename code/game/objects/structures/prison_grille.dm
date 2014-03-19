/obj/structure/prison_grille
	desc = "A flimsy lattice of metal rods, with screws to secure it to the floor."
	name = "grille"
	icon = 'icons/obj/structures.dmi'
	icon_state = "prison_grille"
	density = 1
	anchored = 1
	flags = FPRINT | CONDUCT
	pressure_resistance = 5*ONE_ATMOSPHERE
	layer = 2.9
	explosion_resistance = 5
	var/health = 10
	var/destroyed = 0

/obj/structure/prison_grille/blob_act()
	del(src)

/obj/structure/prison_grille/meteorhit(var/obj/M)
	del(src)

/obj/structure/prison_grille/attack_hand(mob/user as mob)
	playsound(loc, 'sound/effects/grillehit.ogg', 80, 1)
	user.visible_message("<span class='warning'>[user] kicks [src].</span>", \
						 "<span class='warning'>You kick [src].</span>", \
						 "You hear twisting metal.")
	if(HULK in user.mutations)
		icon_state = "prison_grille_broken"

/obj/structure/prison_grille/attackby(obj/item/W as obj, mob/user as mob)
	if( istype(W, /obj/item/weapon/weldingtool) )
		var/obj/item/weapon/weldingtool/WT = W
		var/turf/T = user.loc
		playsound(src.loc, 'sound/items/Welder.ogg', 100, 1)
		user << "<span class='notice'>You begin slicing through the metal grille.</span>"
		sleep(100)
		if( user.loc == T && user.get_active_hand() == WT)
			src.icon_state = "prison_grille_melted"
			density = 0
			user << "<span class='notice'>You press firmly on the grille, slicing through it.</span>"
		return
	if(istype(W, /obj/item/weapon/melee/energy/blade))
		user << "<span class='notice'>You slice through the grille.</span>"
		icon_state="prison_grille_melted"
		density = 0
		return