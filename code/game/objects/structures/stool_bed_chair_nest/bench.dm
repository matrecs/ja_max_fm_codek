/obj/structure/stool/bench
	name = "bench"
	desc = "You sit in this. Either by will or force."
	icon = 'icons/obj/bench.dmi'
	icon_state = "bench"
	var/parts = /obj/item/weapon/bench_parts
	anchored = 1
	density = 0
	var/flipped = 0

/obj/structure/stool/bench/MouseDrop(atom/over_object)
	return

/obj/structure/stool/bench/New()
	for(var/obj/structure/stool/bench/T in src.loc)
		if(T != src)
			del(T)
	update_icon()
	update_adjacent()

/obj/structure/stool/bench/Del()
	update_adjacent()
	..()

/obj/structure/stool/bench/proc/destroy()
	new parts(loc)
	density = 0
	del(src)

/obj/structure/stool/bench/update_icon()
	spawn(2)
		if(flipped)
			var/type = 0
			var/benchdirs = 0
			for(var/direction in list(turn(dir,90), turn(dir,-90)) )
				var/obj/structure/stool/bench/T = locate(/obj/structure/stool/bench,get_step(src,direction))
				if (T && T.flipped && T.dir == src.dir)
					type++
					benchdirs |= direction
			var/base = "bench"
			icon_state = "[base]flip[type]"
			if (type==1)
				if (benchdirs & turn(dir,90))
					icon_state = icon_state+"-"
				if (benchdirs & turn(dir,-90))
					icon_state = icon_state+"+"
			return 1
		var/dir_sum = 0
		for(var/direction in list(1,2,4,8,5,6,9,10))
			var/skip_sum = 0
			for(var/obj/structure/window/W in src.loc)
				if(W.dir == direction)
					skip_sum = 1
					continue
			var/inv_direction
			switch(direction)
				if(1)
					inv_direction = 2
				if(2)
					inv_direction = 1
				if(4)
					inv_direction = 8
				if(8)
					inv_direction = 4
				if(5)
					inv_direction = 10
				if(6)
					inv_direction = 9
				if(9)
					inv_direction = 6
				if(10)
					inv_direction = 5
			for(var/obj/structure/window/W in get_step(src,direction))
				if(W.dir == inv_direction)
					skip_sum = 1
					continue
			if(!skip_sum)
				var/obj/structure/stool/bench/T = locate(/obj/structure/stool/bench,get_step(src,direction))
				if(T && !T.flipped)
					if(direction <5)
						dir_sum += direction
					else
						if(direction == 5)
							dir_sum += 16
						if(direction == 6)
							dir_sum += 32
						if(direction == 8)
							dir_sum += 8
						if(direction == 10)
							dir_sum += 64
						if(direction == 9)
							dir_sum += 128

		var/bench_type = 0
		if(dir_sum%16 in cardinal)
			bench_type = 1
			dir_sum %= 16
		if(dir_sum%16 in list(3,12))
			bench_type = 2
			if(dir_sum%16 == 3)
				dir_sum = 2
			if(dir_sum%16 == 12)
				dir_sum = 4
		if(dir_sum%16 in list(5,6,9,10))
			if(locate(/obj/structure/stool/bench,get_step(src.loc,dir_sum%16)))
				bench_type = 3
			else
				bench_type = 2
			dir_sum %= 16
		if(dir_sum%16 in list(13,14,7,11))
			bench_type = 5
			switch(dir_sum%16)
				if(7)
					if(dir_sum == 23)
						bench_type = 6
						dir_sum = 8
					else if(dir_sum == 39)
						dir_sum = 4
						bench_type = 6
					else if(dir_sum == 55 || dir_sum == 119 || dir_sum == 247 || dir_sum == 183)
						dir_sum = 4
						bench_type = 3
					else
						dir_sum = 4
				if(11)
					if(dir_sum == 75)
						dir_sum = 5
						bench_type = 6
					else if(dir_sum == 139)
						dir_sum = 9
						bench_type = 6
					else if(dir_sum == 203 || dir_sum == 219 || dir_sum == 251 || dir_sum == 235)
						dir_sum = 8
						bench_type = 3
					else
						dir_sum = 8
				if(13)
					if(dir_sum == 29)
						dir_sum = 10
						bench_type = 6
					else if(dir_sum == 141)
						dir_sum = 6
						bench_type = 6
					else if(dir_sum == 189 || dir_sum == 221 || dir_sum == 253 || dir_sum == 157)
						dir_sum = 1
						bench_type = 3
					else
						dir_sum = 1
				if(14)
					if(dir_sum == 46)
						dir_sum = 1
						bench_type = 6
					else if(dir_sum == 78)
						dir_sum = 2
						bench_type = 6
					else if(dir_sum == 110 || dir_sum == 254 || dir_sum == 238 || dir_sum == 126)
						dir_sum = 2
						bench_type = 3
					else
						dir_sum = 2
		if(dir_sum%16 == 15)
			bench_type = 4.

		switch(bench_type)
			if(0)
				icon_state = "bench"
			if(1)
				icon_state = "bench_1tileendbench"
			if(2)
				icon_state = "bench_1tilethick"
			if(3)
				icon_state = "benchdir"
			if(4)
				icon_state = "bench_middle"
			if(5)
				icon_state = "benchdir2"
			if(6)
				icon_state = "benchdir3"
		if (dir_sum in list(1,2,4,8,5,6,9,10))
			dir = dir_sum
		else
			dir = 2

/obj/structure/stool/bench/attack_paw(mob/user)
	if(HULK in user.mutations)
		user.say(pick(";RAAAAAAAARGH!", ";HNNNNNNNNNGGGGGGH!", ";GWAAAAAAAARRRHHH!", "NNNNNNNNGGGGGGGGHH!", ";AAAAAAARRRGH!" ))
		visible_message("<span class='danger'>[user] smashes the [src] apart!</span>")
		destroy()


/obj/structure/stool/bench/attack_alien(mob/user)
	visible_message("<span class='danger'>[user] slices [src] apart!</span>")
	destroy()

/obj/structure/stool/bench/attack_animal(mob/living/simple_animal/user)
	if(user.wall_smash)
		visible_message("<span class='danger'>[user] smashes [src] apart!</span>")
		destroy()



/obj/structure/stool/bench/attack_hand(mob/user)
	if(HULK in user.mutations)
		visible_message("<span class='danger'>[user] smashes [src] apart!</span>")
		user.say(pick(";RAAAAAAAARGH!", ";HNNNNNNNNNGGGGGGH!", ";GWAAAAAAAARRRHHH!", "NNNNNNNNGGGGGGGGHH!", ";AAAAAAARRRGH!" ))
		destroy()

/obj/structure/stool/bench/attack_tk() // no telehulk sorry
	return

/obj/structure/stool/bench/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if (flipped)
		if (get_dir(loc, target) == dir)
			return !density
		else
			return 1
	else
		return 1
	return 0

/obj/structure/stool/bench/proc/check_cover(obj/item/projectile/P, turf/from)
	var/health = 100
	var/turf/cover = flipped ? get_turf(src) : get_step(loc, get_dir(from, loc))
	if (get_dist(P.starting, loc) <= 1)
		return 1
	if (get_turf(P.original) == cover)
		var/chance = 10
		if (ismob(P.original))
			var/mob/M = P.original
			if (M.lying)
				chance += 20
		if(flipped)
			if(get_dir(loc, from) == dir)
				chance += 20
			else
				return 1
		if(prob(chance))
			health -= P.damage/2
			if (health > 0)
				visible_message("<span class='warning'>[P] hits \the [src]!</span>")
				return 0
			else
				visible_message("<span class='warning'>[src] breaks down!</span>")
				destroy()
				return 1
	return 1

/obj/structure/stool/bench/verb/do_flip()
	set name = "Flip bench"
	set desc = "Flips a bench"
	set category = "Object"
	set src in oview(1)
	var/mob/living/L = usr
	var/mob/living/carbon/C = L
	if( C.handcuffed )
		usr << "<span class='notice'>You are handcuffed.</span>"
		return
	if(ismouse(usr))
		return
	if (!can_touch(usr))
		return
	if(!flip(get_cardinal_dir(usr,src)))
		usr << "<span class='notice'>It won't budge.</span>"
	else
		usr.visible_message("<span class='warning'>[usr] flips \the [src]!</span>")
		return

/obj/structure/stool/bench/proc/unflipping_check(var/direction)
	for(var/mob/M in oview(src,0))
		return 0

	var/list/L = list()
	if(direction)
		L.Add(direction)
	else
		L.Add(turn(src.dir,-90))
		L.Add(turn(src.dir,90))
	for(var/new_dir in L)
		var/obj/structure/stool/bench/T = locate() in get_step(src.loc,new_dir)
		if(T)
			if(T.flipped && T.dir == src.dir && !T.unflipping_check(new_dir))
				return 0
	return 1

/obj/structure/stool/bench/proc/do_put()
	set name = "Put bench back"
	set desc = "Puts flipped bench back"
	set category = "Object"
	set src in oview(1)

	if (!can_touch(usr))
		return

	if (!unflipping_check())
		usr << "<span class='notice'>It won't budge.</span>"
		return
	unflip()

/obj/structure/stool/bench/proc/flip(var/direction)
	if( !straight_bench_check(turn(direction,90)) || !straight_bench_check(turn(direction,-90)) )
		return 0

	verbs -=/obj/structure/stool/bench/verb/do_flip
	verbs +=/obj/structure/stool/bench/proc/do_put

	var/list/targets = list(get_step(src,dir),get_step(src,turn(dir, 45)),get_step(src,turn(dir, -45)))
	for (var/atom/movable/A in get_turf(src))
		if (!A.anchored)
			spawn(0)
				A.throw_at(pick(targets),1,1)

	dir = direction
	if(dir != NORTH)
		layer = 5
	flipped = 1
	flags |= ON_BORDER
	for(var/D in list(turn(direction, 90), turn(direction, -90)))
		var/obj/structure/stool/bench/T = locate() in get_step(src,D)
		if(T && !T.flipped)
			T.flip(direction)
	update_icon()
	update_adjacent()
	return 1

/obj/structure/stool/bench/proc/unflip()
	verbs -=/obj/structure/stool/bench/proc/do_put
	verbs +=/obj/structure/stool/bench/verb/do_flip

	layer = initial(layer)
	flipped = 0
	flags &= ~ON_BORDER
	for(var/D in list(turn(dir, 90), turn(dir, -90)))
		var/obj/structure/stool/bench/T = locate() in get_step(src.loc,D)
		if(T && T.flipped && T.dir == src.dir)
			T.unflip()
	update_icon()
	update_adjacent()
	return 1

/obj/structure/stool/bench/proc/straight_bench_check(var/direction)
	var/obj/structure/stool/bench/T
	for(var/angle in list(-90,90))
		T = locate() in get_step(src.loc,turn(direction,angle))
		if(T && !T.flipped)
			return 0
	T = locate() in get_step(src.loc,direction)
	if (!T || T.flipped)
		return 1
	return T.straight_bench_check(direction)

/obj/structure/stool/bench/verb/can_touch(var/mob/user)
	if (!user)
		return 0
	if (user.stat)
		return 0
	if (issilicon(user))
		user << "<span class='notice'>You need hands for this.</span>"
		return 0
	return 1

/obj/structure/stool/bench/proc/update_adjacent()
	for(var/direction in list(1,2,4,8,5,6,9,10))
		if(locate(/obj/structure/stool/bench,get_step(src,direction)))
			var/obj/structure/stool/bench/T = locate(/obj/structure/stool/bench,get_step(src,direction))
			T.update_icon()