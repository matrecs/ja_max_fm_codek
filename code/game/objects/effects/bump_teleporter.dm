var/list/obj/effect/bump_teleporter/BUMP_TELEPORTERS = list()

/obj/effect/bump_teleporter
	name = "bump-teleporter"
	icon = 'icons/mob/screen1.dmi'
	icon_state = "x2"
	var/id = null			//id of this bump_teleporter.
	var/id_target = null	//id of bump_teleporter which this moves you to.
	invisibility = 101 		//nope, can't see this
	anchored = 1
	density = 1
	opacity = 0

/obj/effect/bump_teleporter/New()
	..()
	BUMP_TELEPORTERS += src

/obj/effect/bump_teleporter/Del()
	BUMP_TELEPORTERS -= src
	..()

/obj/effect/bump_teleporter/Bumped(atom/user)
	if(!ismob(user))
		//user.loc = src.loc	//Stop at teleporter location
		return

	if(!id_target)
		//user.loc = src.loc	//Stop at teleporter location, there is nowhere to teleport to.
		return

	for(var/obj/effect/bump_teleporter/BT in BUMP_TELEPORTERS)
		if(BT.id == src.id_target)
			usr.loc = BT.loc	//Teleport to location with correct id.
			return

/obj/effect/sidebumber
	icon = 'icons/effects/tile_effects.dmi'
	icon_state = "arrow"
	invisibility = 101
	anchored = 1
	density = 0
	opacity = 0

/obj/effect/sidebumber/HasEntered(atom/movable/M as mob|obj)
	sleep(1)
	if (M.loc == src.loc)
		if (src.dir == 1)
			M.y--
		if (src.dir == 2)
			M.y++
		if (src.dir == 4)
			M.x++
		if (src.dir == 8)
			M.x--
		if (src.dir == 5)
			M.y--
			M.x++
		if (src.dir == 6)
			M.y++
			M.x++
		if (src.dir == 9)
			M.y--
			M.x--
		if (src.dir == 10)
			M.y++
			M.x--

/obj/effect/throwaway
	icon = 'icons/effects/tile_effects.dmi'
	icon_state = "teleport"
	invisibility = 101
	anchored = 1
	density = 0
	opacity = 0

/obj/effect/throwaway/HasEntered(atom/movable/M as mob|obj)
	M.z = 6