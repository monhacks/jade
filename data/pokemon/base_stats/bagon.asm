	db 0 ; species ID placeholder

	db  45,  75,  60,  50,  40,  30
	evs  0,   1,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, DRAGON ; type
	db 45 ; catch rate
	db 89 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/placeholder/front.dimensions"
	db ROCK_HEAD, ROCK_HEAD, SHEER_FORCE ; abilities
	db 0 ; unused
	db GROWTH_SLOW ; growth rate
	db 35 ; base happiness
	dn EGG_DRAGON, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm
	; end