module(..., package.seeall)

--[[
/**
 * Easing equation function for a bounce (exponentially decaying parabolic bounce) easing out: decelerating from zero velocity.

]]


function easeOutBounce(t,b,c,d)
    
     t,d,b,c= t,b,c,d;
    
     t=t/d;
     if (t<(1/2.75)) then
          ret=c*(7.5625*t*t)+b
     elseif (t<(2/2.75)) then
          t=t-(1.5/2.75)
          ret=c*(7.5625*(t*t)+.75)+b
     elseif (t<(2.5/2.75)) then
          t=t-2.25/2.75;
          ret=c*(7.5625*t*t+.9375)+b
     else
          t=t-2.625/2.75;
          ret=c*(7.5625*t*t+.984375)+b
     end
    
return ret;
end

function _easeOutBounce(t,b,c,d)
    
     return easeOutBounce(t,d,b,c);
end


--[[/**
      * Easing equation function for a bounce (exponentially decaying parabolic bounce) easing in: accelerating from zero velocity.
      *
]]
    
    
function easeInBounce(t,b,c,d)
     t,d,b,c= t,b,c,d;    
     local ret=c-_easeOutBounce(d-t,0,c,d)+b;

return ret;    
end

function _easeInBounce(t,b,c,d)
     return easeInBounce(t,d,b,c);
end


--[[
/**
 * Easing equation function for a bounce (exponentially decaying parabolic bounce) easing in/out: acceleration until halfway, then deceleration.
 *
]]

function easeInOutBounce(t,d,b,c)
local ret=0;
if (t<d/2) then
     ret=_easeInBounce(t*2,0,c,d)*.5+b
else
     ret=_easeOutBounce(t*2-d,0,c,d)*.5+c*.5+b;
end
--print (t,ret);    

return ret;    
end


--[[/**
 * Easing equation function for a bounce (exponentially decaying parabolic bounce) easing out/in: deceleration until halfway, then acceleration.
 *
]]

function easeOutInBounce(t,d,b,c)
     local ret;
     if (t<d/2) then
          ret=_easeOutBounce(t*2,b,c/2,d)
     else
          ret=_easeInBounce((t*2)-d,b+c/2,c/2,d);
     end
         
     return ret;
end


--[[ easeNone -- linear --]]

function easeNone(t,d,b,c)
    
     return t/d*c+b;
end;

--[[ easeQuad
* Easing equation function for a quadratic (t^2) easing in: accelerating from zero velocity.
]]
function easeQuad(t,d,b,c)
     local ret
     t=t/d; -- 0..1
     t=t*t;
     ret= t*c+b;
     return ret;
end;


--[[/**
           * Easing equation function for a quadratic (t^2) easing out: decelerating to zero velocity.
           *
           *]]
         
         
function easeOutQuad (t,d,b,c)
     local ret;
     t=t/d -- 0..1
     t=-t*(t-2);
     ret=t*c+b;

     return ret;
end


--[[* Easing equation function for a cubic (t^3) easing in: accelerating from zero velocity.
]]

function easeInCubic(t,d,b,c)
     local ret;
     t=t/d;
     t=t*t*t;
     ret=t*c+b;
     return ret;
    
end

--[[/**
 * Easing equation function for a cubic (t^3) easing out: decelerating from zero velocity.
 *
]]

function easeOutCubic(t,d,b,c)
     local ret;
     t=t/d;
     t=t-1
     t=t*t*t+1;
     ret=t*c+b
     return ret;
end

--[[
/**
 * Easing equation function for a quartic (t^4) easing in: accelerating from zero velocity.
 *
]]

function easeInQuart(t,d,b,c)
     local ret;
     t=t/d;
     t=t*t*t*t;
     ret=t*c+b    
     return ret;
end

--[[/**
 * Easing equation function for a quartic (t^4) easing out: decelerating from zero velocity.
 *
]]

function easeOutQuart(t,d,b,c)
          local ret;
          t=t/d;
          t=t-1;
          t=(t*t*t*t-1)*-1;
          ret=t*c+b    
          return ret;
end
    
--[[
/**
 * Easing equation function for a quartic (t^4) easing in: accelerating from zero velocity.
 *
]]

function easeInQuint(t,d,b,c)
     local ret;
     t=t/d;
     t=t*t*t*t*t;
     ret=t*c+b    
     return ret;
end

--[[/**
 * Easing equation function for a quartic (t^4) easing out: decelerating from zero velocity.
 *
]]

function easeOutQuint(t,d,b,c)
          local ret;
          t=t/d;
          t=t-1;
          t=(t*t*t*t*t+1);
          ret=t*c+b    
          return ret;
end


--[[/**
		 * Easing equation function for a circular (sqrt(1-t^2)) easing in: accelerating from zero velocity.

		]]

function easeInCirc(t,d,b,c)
		     local ret;
			t=t/d;

			ret= -c * (math.sqrt(1-t*t)-1)+b;

		    return ret;    
end


--[[/**
 * Easing equation function for a circular (sqrt(1-t^2)) easing out: decelerating from zero velocity.
]]

function easeOutCirc(t,d,b,c)
		     local ret;
			t=t/d-1;

			ret= c *math.sqrt(1-t*t)+b

		    return ret;    
end

--[[/**
 * Easing equation function for a sinusoidal (sin(t)) easing in: accelerating from zero velocity.
]]
function easeInSine(t,d,b,c)
     local ret;
 

	ret= -c * math.cos(t/d * (math.pi/2)) + c + b;

    return ret;    
end

--[[/**
 * Easing equation function for a sinusoidal (sin(t)) easing in/out: acceleration until halfway, then deceleration.
]]
function easeInOutSine(t,d,b,c)
     local ret;


	ret= -c/2 * (math.cos(math.pi*t/d) - 1) + b;

    return ret;    
end


--[[/**
 * Easing equation function for an exponential (2^t) easing in: accelerating from zero velocity.
]]

function easeInExpo(t,d,b,c)
     local ret;
     t=t/d;

	if (t==0) then
		ret=0;
	else
		t=math.pow(2,10*(t-1));
		ret=t*c+b
	end


--	print (t,ret)
    return ret;    
end

--[[/**
 * Easing equation function for an exponential (2^t) easing out: decelerating from zero velocity.
]]

function easeOutExpo(t,d,b,c)
     local ret;
     t=t/d;
	 t=1-1.001*math.pow(2,-10*t);
	 ret=t*c+b
	

    return ret;    
end



--[[/**
 * Easing equation function for a sinusoidal (sin(t)) easing out: decelerating from zero velocity.

 */
]]
function easeOutSine(t,d,b,c)
     local ret;
	ret=c * math.sin(t/d * (math.pi/2)) + b;

    return ret;    
end

function easeOutBounce(t,b,c,d)
    
     t,d,b,c= t,b,c,d;
    
     t=t/d;
     if (t<(1/2.75)) then
          ret=c*(7.5625*t*t)+b
     elseif (t<(2/2.75)) then
          t=t-(1.5/2.75)
          ret=c*(7.5625*(t*t)+.75)+b
     elseif (t<(2.5/2.75)) then
          t=t-2.25/2.75;
          ret=c*(7.5625*t*t+.9375)+b
     else
          t=t-2.625/2.75;
          ret=c*(7.5625*t*t+.984375)+b
     end
    
return ret;
end


--[[/**
 * Easing equation function for a back (overshooting cubic easing: (s+1)*t^3 - s*t^2) easing in: accelerating from zero velocity.

]]

function easeInBack(t,d,b,c)
    
	local s=1.70158
    
     t=t/d;
     ret=c*t*t*((s+1)*t-s)+b;
return ret;
end


--[[/**
 * Easing equation function for a back (overshooting cubic easing: (s+1)*t^3 - s*t^2) easing out: decelerating from zero velocity.
]]

function easeOutBack(t,d,b,c)
    
	local s=1.70158
    
     t=t/d-1;
     ret=c*(t*t*((s+1)*t+s)+1)+b;
return ret;
end




transitions={easeNone,easeOutSine,easeInSine,easeInExpo,easeOutExpo,easeInBounce,easeOutBounce,easeInOutBounce,easeOutInBounce,
			easeInQuint,easeOutQuint,easeInCirc,easeOutCirc,easeInBack,easeOutBack}
			
transitionNames={"easeNone","easeOutSine","easeInSine","easeInExpo","easeOutExpo","easeInBounce","easeOutBounce","easeInOutBounce","easeOutInBounce",
				"easeInQuint","easeOutQuint","easeInCirc","easeOutCirc","easeInBack","easeOutBack"}
			
