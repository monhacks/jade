	db 0 ; species ID placeholder

	db  20,  15,  20,  80,  10,  55
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 255 ; catch rate
	db 61 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/placeholder/front.dimensions"
	db SWIFT_SWIM, OBLIVIOUS, ADAPTABILITY ; abilities
	db 0 ; unused
	db GROWTH_ERRATIC ; growth rate
	db 70 ; base happiness
	dn EGG_WATER_1, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm
	; end