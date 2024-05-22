	db 0 ; species ID placeholder

	db  95, 135,  80, 100, 110,  80
	evs  0,   3,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, FLYING ; type
	db 45 ; catch rate
	db 218 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/placeholder/front.dimensions"
	db INTIMIDATE, INTIMIDATE, MOXIE ; abilities
	db 0 ; unused
	db GROWTH_SLOW ; growth rate
	db 35 ; base happiness
	dn EGG_DRAGON, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm
	; end