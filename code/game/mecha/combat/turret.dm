/obj/mecha/combat/turret
	desc = "Turret to defence from space danger"
	name = "Turret"
	icon_state = "phazon"
	initial_icon = "phazon"
	var/melee_can_hit = 0
	anchored = 0
	health = 300
	damage_absorption = list("brute"=0.7,"fire"=0.7,"bullet"=0.7,"laser"=0.7,"energy"=0.7,"bomb"=0.7)
	max_temperature = 25000
	wreckage = /obj/effect/decal/mecha_wreckage/phazon
	add_req_access = 1
	maint_access = 0
	//operation_req_access = list()
	internal_damage_threshold = 25
	force = 15
	max_equip = 2

/obj/mecha/combat/turret/New()
	..()
	var/obj/item/mecha_parts/mecha_equipment/ME = new /obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/heavy)
	ME.attach(src)
	ME.attach(src)
	return

/obj/mecha/combat/turret/Move()
	return

/obj/mecha/combat/turret/dyndomove()
	return