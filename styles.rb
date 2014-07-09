def get_bicycle_styles
	returned = ""
	bugs = [
	#free colours: red
				["footway should be path", "black"],
				["cycleway should be path", "black"],
				["missing segregated", "blue"],
				["no_and_yes_bug", "purple"],
				["no_surface_info", "violet"],
				["weird segregated", "brown", "segregated"],
				["weird cycleway value", "teal", "cycleway"],
				["weird bicycle value", "orange", "bicycle"],
				["weird surface value", "yellow", "surface"],
				["bicycle unexpected status no source mentioned", "gray", "bicycle", "bicycle unexpected status without source:bicycle"],
				["weird highway value", "lime", "highway"],
				["bicycle oneway tag synch oneway bicycle", "#663300", "", "bicycle oneway tag synch +(oneway:bicycle)"], #bark brown
				["bicycle oneway tag synch cycleway", "#a61e00", "", "cycleway=opposite or cycleway=opposite is missing"], #bark brown + red
				#
			]
	bugs.each do |element|
		name = "name \" - #{element[0]}"
		if (element[3] != nil)
			name = "name \" - #{element[3]}" #use name that contains special signs and was not usable as internal Maperitive name
		end
		if (element[2] != nil)
			name += "- \" #{element[2]}" #display value of this tag
		else
			name += '"' #final quote sign is anyway necessary
		end
		returned += "	target: #{element[0]}
		define
			min-zoom: 1
			line-color: #{element[1]}
			line-width: 10
			line-style: solid
		draw: line
		define
			min-zoom: 12
			text: #{name}
			font-size: 12
		draw: text

"
	end
returned += "
	/////////////////////////////
	//railway areas + debug for this
	/////////////////////////////
	target: blocked area
		define
			fill-color: #bfbfbf
			line-width: 0
			line-color: #bfbfbf
		draw: fill
	target: railway
		define
			min-zoom: 1
			line-color: #a1a1a1
			line-width: 1
		draw: line

	/////////////////////////////
	//fixme
	/////////////////////////////
	target: fixme
		define
			min-zoom: 1
			fill-color: pink
			shape-size: 6
			line-width: 0
		draw: shape
		define
			min-zoom: 12
			text: fixme
			font-size: 12
		draw: text

	/////////////////////////////
	//bicycle crossings
	/////////////////////////////
	target: not_defined_bicycle_crossing
		define
			min-zoom: 1
			fill-color: violet
			shape-size: 14:2; 16:3; 17:4; 18:5; 19:6; 20:7; 21:8
			line-width: 0
			//line-color: red
		draw: shape
	
	target: not_defined_segregated_on_bicycle_crossing
		define
			min-zoom: 1
			fill-color: lime
			shape-size: 14:2; 16:3; 17:4; 18:5; 19:6; 20:7; 21:8
			line-width: 0
			//line-color: red
		draw: shape

	target: badly_defined_crossing
		define
			min-zoom: 1
			fill-color: black
			shape-size: 14:6; 16:10; 17:15; 18:20; 19:25
			line-width: 0
		draw: shape			

	target: not_OK_bicycle_crossing
		define
			min-zoom: 12
			fill-color: red
			shape-size: 14:2; 16:3; 17:4; 18:5; 19:6; 20:7; 21:8
			line-width: 0
			//line-color: red
		draw: shape

	target: OK_bicycle_crossing_but_not_segregated
		define
			min-zoom: 13
			fill-color: orange
			shape-size: 14:2; 16:3; 17:4; 18:5; 19:6; 20:7; 21:8
			line-width: 0
			//line-color: orange
		draw: shape

	target: OK_bicycle_crossing
		define
			min-zoom: 14
			fill-color: green
			shape-size: 14:2; 16:3; 17:4; 18:5; 19:6; 20:7; 21:8
			line-width: 0
			//line-color: green
		draw: shape

	/////////////////////////////
	//advanced stop line
	/////////////////////////////
	target: advanced_stop_line
		define
			min-zoom: 1
			fill-color: blue
			shape: triangle
			shape-size: 11:5; 13:7; 14:9; 15:14; 16:20; 17:24; 18:30; 19:35 
			line-width: 0
			//line-color: blue
		draw: shape

	/////////////////////////////
	//bicycle parkings
	/////////////////////////////
	target: bicycle_parking_no_operator
		define
			min-zoom: 1
			fill-color: yellow
			shape-size: 2
			line-width: 0
			line-color: yellow
			shape: circle
		draw: shape

	target: bicycle_parking_no_type
		define
			min-zoom: 1
			fill-color: red
			shape-size: 3
			line-width: 0
			shape: circle
		draw: shape

	target: bicycle_parking_no_capacity
		define
			min-zoom: 1
			fill-color: violet
			shape-size: 4
			line-width: 0
			shape: circle
		draw: shape

	target: bicycle_parking
		define
			fill-color: #6060ff
			min-zoom: 14
			shape-size: 14:4; 15:10; 16:12; 17:14; 18:16; 19:20
			line-width: 0
			line-color: white
			shape: square
		draw: shape
		define
			min-zoom: 11
			max-zoom: 14
			shape-size: 10:1; 11:1; 12:1; 13:2; 14:3
			line-color: #6060ff
		draw: shape
		define
			min-zoom: 15
			max-zoom: 25
			text: capacity
		draw: text

	/////////////////////////////
	//other bicycle amenities
	/////////////////////////////
	target: bicycle shop
		define
			icon-image: icons/SJJB/png/shopping_bicycle.n.32.png
			min-zoom: 11
			max-zoom: 15
			icon-width: 10:2; 11:3; 12:4; 13:6; 14:9; 15:11; 16:13; 17:14; 18:15; 19:16
		draw: icon
		define
			text: \"Sklep rowerowy \" name \" - \" opening_hours
			min-zoom: 15
			max-zoom: 25
			font-size: 13:9.5; 17:14
			font-weight: normal
			text-halo-color: #fffd8b
		draw: text

	target: drinking_water
		define
			icon-image: icons/SJJB/png/food_drinkingtap.n.32.png
			min-zoom: 13
			icon-width: 10:1; 12:2; 13:2; 14:3; 15:6; 16:9; 17:12; 18:14; 19:16
		draw: icon
"
cycleway_wide_marker = "14:2; 15:3; 16:4"
cycleway_narrow_marker = "14:2; 15:2"
cycleway_very_narrow_marker = "14:1; 15:2"
returned += "
	/////////////////////////////
	//cycleways
	/////////////////////////////
	target: proper cycleway
		define
			min-zoom: 9
			line-color: green
			line-width: #{cycleway_wide_marker}
			line-style: solid
		draw: line
		draw: text

	target: proper cycleway with a bad surface
		define
			min-zoom: 9
			line-color: #A0522D
			line-width: #{cycleway_wide_marker}
			line-style: solid
		draw: line
		draw: text

	target: lame cycleway with a bad surface
		define
			min-zoom: 9
			line-color: #A0522D
			line-width: #{cycleway_narrow_marker}
			line-style: solid
		draw: line
		draw: text

	target: proper cycleway with a terrible surface
		define
			min-zoom: 9
			line-color: red
			line-width: #{cycleway_wide_marker}
			line-style: solid
		draw: line
		draw: text

	target: lame cycleway with a terrible surface
		define
			min-zoom: 9
			line-color: red
			line-width: #{cycleway_narrow_marker}
			line-style: solid
		draw: line
		draw: text

	target: lame cycleway with a good surface
		define
			min-zoom: 9
			line-color: green
			line-width: #{cycleway_narrow_marker}
			line-style: solid
		draw: line
		draw: text

	target: bicycle allowed with a terrible surface
		define
			min-zoom: 9
			line-color: red
			line-width: #{cycleway_narrow_marker}
			line-style: solid
			border-width: 0%
		draw: line
		draw: text

	target: bicycle_allowed_in_park
		define
			min-zoom: 11
			line-color: orange
			line-width: #{cycleway_very_narrow_marker}
			line-style: solid
			border-width: 0%
		draw: line
		draw: text

	target: bicycle_allowed_not_in_park
		define
			min-zoom: 10
			line-color: orange
			line-width: #{cycleway_narrow_marker}
			line-style: solid
			border-width: 0%
		draw: line
		draw: text

	/////////////////////////////
	//special cycleways
	/////////////////////////////
	target: marked contraflow
		define
			min-zoom: 9
			line-color: blue
			line-width: 7:1;12:2.5;17:3
			line-style: solid
			line-offset: 14:1;15:2;16:3;17:3
			line-offset-sides: left
		for: oneway=-1
			define
				line-offset-sides: right
		draw: line
		draw: text
		
	target: unmarked contraflow
		define
			min-zoom: 9
			line-color: blue
			line-width: 7:1;12:2.5;17:3
			line-style: dot
			line-offset: 14:0.5;15:1;16:2;17:3
			line-offset-sides: left
		for: oneway=-1
			define
				line-offset-sides: right
		draw: line
		draw: text
		define
			line-width: 1
			line-style: solid
		draw: line

	target: unexpected cycling ban
		define
			min-zoom: 12
			line-color: red
			line-width: 14:1.5; 15:2
			line-style: dot
			border-width: 0%
		draw: line
		draw: text
		define
			line-width: 1
			line-style: solid
		draw: line

	target: expected explicit cycling ban
		define
			min-zoom: 9
			line-color: lime
			line-width: 14:1.5; 15:2
			line-style: dot
			border-width: 0%
		draw: line
		draw: text
		define
			line-width: 1
			line-style: solid
		draw: line

	/////////////////////////////
	//oneway arrows
	/////////////////////////////
	target: oneway
		define
			min-zoom: 15
			shape: custom
			shape-def: 0,10, 10,0, 0,-10, 10,0;Z
			shape-size: 7
			shape-spacing: 4
			line-width: 1
		draw: shape
	
	/////////////////////////////
	//roads
	/////////////////////////////
	target: high traffic cycleable road
		define
			min-zoom: 1
			line-width: 1
			line-color: black
		draw: line
		define
			min-zoom: 16
		draw: text

	target: normal traffic cycleable road
		define
			min-zoom: 11
			line-width: 1
			line-color: #7a7a7a
		draw: line
		define
			min-zoom: 10.5
			max-zoom: 11
			line-width: 1
			line-color: #999999
		draw: line
		define
			min-zoom: 16
		draw: text
	
	target: low traffic cycleable road
		define
			min-zoom: 14
			line-width: 1
			line-color: #999999
		draw: line
		define
			min-zoom: 13
			max-zoom: 14
			line-width: 1
			line-color: #bbbbbb
		draw: line
		define
			min-zoom: 11.5
			max-zoom: 13
			line-width: 1
			line-color: #dddddd
		draw: line
		define
			min-zoom: 16
			max-zoom: 25
		draw: text

	target: no maxspeed info
		define
			min-zoom: 13
			line-color: pink
			line-width: 2
			line-style: solid
		draw: line

	target: plus 50 maxspeed
		define
			min-zoom: 1
			line-color: black
			line-width: 2
			line-style: solid
		draw: line

	target: motorway
		define
			min-zoom: 1
			line-width: 2
			line-color: #999999
			line-style: solid
		draw: line

	/////////////////////////////
	//water
	/////////////////////////////
	target: water
		define
			fill-color: #b0b0ef
			line-width: 0
			line-color: #b0b0ef
		draw: fill
	target: water-line
		define
			line-width: 2
			line-color: #b0b0ef
		draw: line

	/////////////////////////////
	//trees
	/////////////////////////////
	target: trees
		define
			fill-color: #a5ef9b
			line-width: 0
			line-color: #a5ef9b
		draw: fill
		define
			min-zoom: 15
		draw: text
"
return returned
end