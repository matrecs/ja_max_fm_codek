/obj/structure/sign/double/paint
	icon = 'icons/obj/paints.dmi'
	icon_state = "empty"
	anchored = 1
	pixel_x = 12
	pixel_y = 40
	New()
		pickImage(pick("mona loisa", "space ship", "yarrr pirate", "black cube", "homestuck", "sunset", "do not honk", "cliff", "waterfall"))
		return
	proc/pickImage(var/Text)
		src.name = "[Text]"
		src.desc = "Another space picture by Space Picasso"
		src.icon_state = "[Text]"
		return