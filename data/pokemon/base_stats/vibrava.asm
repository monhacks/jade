	db 0 ; species ID placeholder

	db  50,  70,  50,  70,  50,  50
	evs  0,   1,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GROUND, DRAGON ; type
	db 120 ; catch rate
	db 126 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/vibrava/front.dimensions"
	db LEVITATE, LEVITATE, LEVITATE ; abilities
	db 0 ; unused
	db GROWTH_MEDIUM_SLOW ; growth rate
	db 70 ; base happiness
	dn EGG_BUG, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm
	; end