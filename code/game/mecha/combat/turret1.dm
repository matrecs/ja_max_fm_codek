/obj/mecha/combat/turret1
	desc = "Turret to defence from space danger"
	name = "Turret"
	icon_state = "turret1"
	initial_icon = "turret1"
	melee_can_hit = 0
	health = 250
	damage_absorption = list("brute"=0.85,"fire"=0.85,"bullet"=0.5,"laser"=0.5,"energy"=0.5,"bomb"=0.85)
	max_temperature = 25000
	wreckage = /obj/effect/decal/mecha_wreckage/turret1
	add_req_access = 1
	maint_access = 0
	can_move = 0
	//operation_req_access = list()
	internal_damage_threshold = 25
	force = 15
	max_equip = 4

// /obj/mecha/combat/turret1/New()
// 	..()
// 	var/obj/item/mecha_parts/mecha_equipment/ME = new /obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/heavy
// 	ME.attach(src)
// 	ME.attach(src)
// 	return
