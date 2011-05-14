

local function redSquareMove_onChange( tween )
	-- blueSquare.x = redSquare.x + 150
	-- blueSquare.y = redSquare.y
	-- blueSquare.alpha = 1 - redSquare.alpha
end





function bounce(current,max,min,delta) -- current, max, min,final
-- print (current,max,min,final);    
    
local normalize=current/max;
local ret=(normalize+normalize*math.sin(normalize*3.14))*delta+min
-- print (normalize,ret);

return ret;
    
-- print ("transition",a,b,c,d,e,f,g,h,i,j);    
--
-- return c+d*a/b;
-- --return math.sin((a/b)*360/(2*3.14)*1.5)*d+c;
    
end

local t=require("LHTween")

function tran() 

print ("size of transitions=",#t.transitions);
	for k,tran in pairs(t.transitions) do
	print ("k,v=",k,v);
	
	redSquare=redSquares[k];
	redSquare.x = 30*k
	redSquare.y = 60
	transition.to(redSquare,{time=2000, transition=tran,y=400});
	end
	
end

redSquares={};

for k,v in pairs(t.transitions) do


	local redSquare = display.newRect( 0, 0, 10, 10 )
	redSquare:setFillColor( 255, 0, 0 )
	redSquare.x = 30*k
	redSquare.y = 60
	redSquares[#redSquares+1]=redSquare;
end

tran();

for k,trans in pairs(t.transitions) do

local prt=t.transitionNames[k];
	for t=0,20 do
		tm=t/20; -- get it in fractions of 1
		prt=prt..","..trans(tm,1,0,1);
	end
	
	print(prt);
	
end



