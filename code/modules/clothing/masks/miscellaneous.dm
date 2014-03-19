/obj/item/clothing/mask/muzzle
	name = "muzzle"
	desc = "To stop that awful noise."
	icon_state = "muzzle"
	item_state = "muzzle"
	flags = FPRINT|TABLEPASS|MASKCOVERSMOUTH
	w_class = 2
	gas_transfer_coefficient = 0.90

//Monkeys can not take the muzzle off of themself! Call PETA!
/obj/item/clothing/mask/muzzle/attack_paw(mob/user as mob)
	if (src == user.wear_mask)
		return
	else
		..()
	return


/obj/item/clothing/mask/surgical
	name = "sterile mask"
	desc = "A sterile mask designed to help prevent the spread of diseases."
	icon_state = "sterile"
	item_state = "sterile"
	w_class = 1
	flags = FPRINT|TABLEPASS|MASKCOVERSMOUTH
	gas_transfer_coefficient = 0.90
	permeability_coefficient = 0.01
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 25, rad = 0)

/obj/item/clothing/mask/fakemoustache
	name = "fake moustache"
	desc = "Warning: moustache is fake."
	icon_state = "fake-moustache"
	flags = FPRINT|TABLEPASS
	flags_inv = HIDEFACE

/obj/item/clothing/mask/snorkel
	name = "Snorkel"
	desc = "For the Swimming Savant."
	icon_state = "snorkel"
	flags = FPRINT|TABLEPASS
	flags_inv = HIDEFACE

//Шарфы

/obj/item/clothing/mask/scarf
	name = "Scarf"
	desc = "A neck scarf, can warm your neck or hide your face."
	flags = FPRINT|TABLEPASS|MASKCOVERSMOUTH
	w_class = 2
	gas_transfer_coefficient = 0.90
	var/hanging = 1
	icon_state = "scarf"
	item_state = "scarf"

	verb/toggle()
		set category = "Object"
		set name = "Adjust scarf"
		set src in usr
		if(usr.canmove && !usr.stat && !usr.restrained())
			if(!src.hanging)
				src.hanging = !src.hanging
				item_state = "scarf"
				icon_state = "scarf"
				flags_inv = null
				usr << "Your scarf is now hanging on your neck."
			else
				src.hanging = !src.hanging
				item_state = "scarfalt"
				icon_state = "scarfalt"
				flags_inv = HIDEEARS|HIDEEYES|HIDEFACE
				usr << "You pull the scarf up to cover your face."
			usr.update_inv_wear_mask()

//Цвета шарфов

/obj/item/clothing/mask/scarfcolor
	name = "Scarf"
	desc = "A neck scarf, can warm your neck or hide your face."
	flags = FPRINT|TABLEPASS|MASKCOVERSMOUTH
	w_class = 2
	gas_transfer_coefficient = 0.90
	var/hanging = 1
	var/scarf_color
	icon_state = "scarf"
	item_state = "scarf"

	verb/toggle()
		set category = "Object"
		set name = "Adjust scarf"
		set src in usr
		if(usr.canmove && !usr.stat && !usr.restrained())
			if(!src.hanging)
				src.hanging = !src.hanging
				item_state = "[scarf_color]scarf"
				icon_state = "[scarf_color]scarf"
				flags_inv = null
				usr << "Your scarf is now hanging on your neck."
			else
				src.hanging = !src.hanging
				item_state = "[scarf_color]scarfalt"
				icon_state = "[scarf_color]scarfalt"
				flags_inv = HIDEEARS|HIDEEYES|HIDEFACE
				usr << "You pull the scarf up to cover your face."
			usr.update_inv_wear_mask()

/obj/item/clothing/mask/scarfcolor/New()
	scarf_color = pick( list("r","b","g","o","p") )
	icon_state = "[scarf_color]scarf"
	item_state = "[scarf_color]scarf"

//конец шарфов

/obj/item/clothing/mask/ninjascarf
	name = "ninja scarf"
	desc = "A stealthy, dark scarf."
	icon_state = "ninja_scarf"
	item_state = "ninja_scarf"
	flags = FPRINT|TABLEPASS|MASKCOVERSMOUTH
	w_class = 2
	gas_transfer_coefficient = 0.90
	siemens_coefficient = 0

/obj/item/clothing/mask/pig
	name = "pig mask"
	desc = "A rubber pig mask."
	icon_state = "pig"
	item_state = "pig"
	flags = FPRINT|TABLEPASS|BLOCKHAIR
	flags_inv = HIDEFACE
	w_class = 2
	siemens_coefficient = 0.9

/obj/item/clothing/mask/horsehead
	name = "horse head mask"
	desc = "A mask made of soft vinyl and latex, representing the head of a horse."
	icon_state = "horsehead"
	item_state = "horsehead"
	flags = FPRINT|TABLEPASS|BLOCKHAIR
	flags_inv = HIDEFACE
	w_class = 2
	var/voicechange = 0
	siemens_coefficient = 0.9
