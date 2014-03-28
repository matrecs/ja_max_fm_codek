obj/structure
	icon = 'icons/obj/structures.dmi'

obj/structure/blob_act()
	if(prob(50))
		del(src)

obj/structure/ex_act(severity)
	switch(severity)
		if(1.0)
			del(src)
			return
		if(2.0)
			if(prob(50))
				del(src)
				return
		if(3.0)
			return

obj/structure/meteorhit(obj/O as obj)
	del(src)

obj/structure/gradonite_crystal
	anchored = 0
	density = 1
	icon_state = "gradonite crystal off"
	name = "Gradonite crystal"
	desc = "Cold and inactive"
	var/shine = 0

obj/structure/gradonite_crystal/attackby(var/obj/O as obj, var/mob/user as mob)

	if (istype(O, /obj/item/weapon/gradonite_charger))
		shine = 1
		icon_state = "gradonite crystal on"
		user << "You activate the [src.name] with [O.name]."
		desc = "Shines brightly"
		playsound(src.loc, 'sound/effects/EMPulse.ogg', 50, 1)
		return
	playsound(src.loc, 'sound/items/Crowbar.ogg', 50, 1)
	if (shine == 1)
		var/gradonite_type = "br1"
		spawn(3)
			gradonite_type = pick("br1","br2","br3","br4","br5","br6","br7","br8","normal1","normal2","normal3","red","blue","green")
			if (gradonite_type == "br1")
				new /obj/item/weapon/gradonite/broken(usr.loc)
			if (gradonite_type == "br2")
				new /obj/item/weapon/gradonite/broken(src.loc)
			if (gradonite_type == "br3")
				new /obj/item/weapon/gradonite/broken(src.loc)
			if (gradonite_type == "br4")
				new /obj/item/weapon/gradonite/broken(src.loc)
			if (gradonite_type == "br5")
				new /obj/item/weapon/gradonite/broken(src.loc)
			if (gradonite_type == "br6")
				new /obj/item/weapon/gradonite/broken(src.loc)
			if (gradonite_type == "br7")
				new /obj/item/weapon/gradonite/broken(src.loc)
			if (gradonite_type == "br8")
				new /obj/item/weapon/gradonite/broken(src.loc)
			if (gradonite_type == "normal1")
				new /obj/item/stack/sheet/mineral/gradonite(src.loc)
			if (gradonite_type == "normal2")
				new /obj/item/stack/sheet/mineral/gradonite(src.loc)
			if (gradonite_type == "normal3")
				new /obj/item/stack/sheet/mineral/gradonite(src.loc)
			if (gradonite_type == "red")
				new /obj/item/weapon/gradonite/red(src.loc)
			if (gradonite_type == "blue")
				new /obj/item/weapon/gradonite/blue(src.loc)
			if (gradonite_type == "green")
				new /obj/item/weapon/gradonite/green(src.loc)
		del(src)
		return


