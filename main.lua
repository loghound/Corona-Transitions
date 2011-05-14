
local t=require("LHTween")

redSquares={};


-- Setup red squares 
for k,v in pairs(t.transitions) do
	local redSquare = display.newRect( 0, 0, 10, 10 )
	redSquare:setFillColor( 255, 0, 0 )
	redSquare.x = 30*k
	redSquare.y = 60
	redSquares[#redSquares+1]=redSquare;
end


-- Launch the transitions
function tran() 
	for k,tran in pairs(t.transitions) do
	redSquare=redSquares[k];
	redSquare.x = 30*k
	redSquare.y = 60
	transition.to(redSquare,{time=500, transition=tran,y=400});
	end	
end




-- print transitions to console along with timing info suitable for plotting
function printTransitions ()
	for k,trans in pairs(t.transitions) do

	local prt=t.transitionNames[k];
		for t=0,20 do
			tm=t/20; -- get it in fractions of 1
			prt=prt..","..trans(tm,1,0,1);
		end

		print(prt);

	end	
end



tran();




