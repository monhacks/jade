	db 0 ; species ID placeholder

	db  85,  80,  90,  60, 105,  95
	evs  0,   0,   0,   0,   2,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 180 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/porygon2/front.dimensions"
	db TRACE, DOWNLOAD, ANALYTIC ; abilities
	db 0 ; unused
	db GROWTH_MEDIUM_FAST ; growth rate
	db 70 ; base happiness
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm
	; end