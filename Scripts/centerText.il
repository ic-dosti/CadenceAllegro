;;                load("d:\\skill\\test.il")


axlCmdRegister("Center text" 'centerText)

cc_menuList='(
	("Center components text" "Center text")
 )

procedure( regCenterTextMenu()	
	res = axlUIMenuRegister("reports" cc_menuList 'bottom)
)
	
regCenterTextMenu()
	
procedure( insertCenterTextMenu()
	let( (addMenu, insMenu)
		when( (axlUIMenuFind( nil "Center text" ) == nil) 
			addMenu = axlUIMenuFind( nil "reports" )
			insMenu = axlUIMenuInsert(addMenu, "Center components text", "Center text")
			;q = axlUIMenuFind( nil "Center text")
		)
	)
)

insertCenterTextMenu()


procedure( getBBoxCenter( bBox )
	let( ( llx lly urx ury )
		ury = yCoord( upperRight( bBox ))
		urx = xCoord( upperRight( bBox ))

		llx = xCoord( lowerLeft( bBox ))
		lly = yCoord( lowerLeft( bBox ))
		( urx + llx )/2 : ( ury + lly )/2
    ) ; let
) ; procedure

procedure( getCompCenterByPins( pins )
	let( ( maxx maxy minx miny )
		maxx = xCoord(car(pins)->xy)
		minx = xCoord(car(pins)->xy)
		maxy = yCoord(car(pins)->xy)
		miny = yCoord(car(pins)->xy)
		foreach( pin pins 
			when(!null(pin->xy)
				when( maxx < xCoord( pin->xy )
					maxx = xCoord( pin->xy )
				)
				when( minx > xCoord( pin->xy )
					minx = xCoord( pin->xy )
				)
				when( maxy < yCoord( pin->xy )
					maxy = yCoord( pin->xy )
				)
				when( miny > yCoord( pin->xy )
					miny = yCoord( pin->xy )
				)	
			)
		)
	((maxx + minx) / 2) : ((miny + maxy) / 2)
	)
)

procedure( centerText()

	axlClearSelSet()

	(axlSetFindFilter ?enabled "text" ?onButtons "text")

	axlAddSelectAll()

	foreach( x axlGetSelSet() 
		;println(strcmp( (substring x->layer 1 7) "REF DES") )
		when( eq(strcmp((substring x->layer 1 7) "REF DES")  0 )
			
			;println( x->text )
			cent1 = getBBoxCenter(x->bBox)
			cent2 = 0:0
			when( !null(x->parent->pins) 
				cent2 = getCompCenterByPins(x->parent->pins)
			)
			;println( cent1 )
			;println( cent2 )
			;println( x->?? )
			;path = axlPathStart( list( car(x->parent->bBox) xCoord(cadr(x->parent->bBox)):yCoord(car(x->parent->bBox)) cadr(x->parent->bBox) xCoord(car(x->parent->bBox)):yCoord(cadr(x->parent->bBox)) car(x->parent->bBox)))
			;shp = axlDBCreateOpenShape(path)
			xDelta =  xCoord( cent2 ) - xCoord( cent1 )
			yDelta = yCoord( cent2 ) - yCoord( cent1 ) 
			delta = xDelta:yDelta
			when( !null(x->parent->pins) 
				axlTransformObject(x, ?move delta)
			)
			;println("-------------------------------")
		)
	)
	axlClearSelSet()
)



