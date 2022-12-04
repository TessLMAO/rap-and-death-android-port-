function onCreate()
    precacheImage('empanadas/BenitoDEATH')
    precacheImage('empanadas/el_fondo_de_los_renacidosxdxd')
    precacheImage('empanadas/el_fondo_de_los_renacidsxdxd')
end

stepHitFuncs = { --a bunch of timed events, timed to steps
	[93] = function()
        doTweenZoom('ChichaZoom', 'camGame', 1.1, 3, 'quadInOut');
	end,
    [576] = function()
        benitoDeath()
	end,
}

function onStepHit()
    if stepHitFuncs[curStep] then 
        stepHitFuncs[curStep]() -- ejecuta los cursteps.
    end
end

function benitoDeath()
    removeLuaSprite('Benito', false)

    makeLuaSprite('BenitoDead', 'empanadas/BenitoDEATH', -413, -170);
    setProperty('BenitoDead.angle', 70)
    setScrollFactor('BenitoDead', 1, 1)
    scaleObject('BenitoDead', 0.4, 0.4)
    addLuaSprite('BenitoDead', false); 

    doTweenColor('BenitoDEATH', 'BenitoDead', '0xffeb4034', 0.02, 'linear')
    doTweenX('BenitoDies', 'BenitoDead', -713, 0.5, 'quadInOut')
    doTweenAngle('BenitoRotates', 'BenitoDead', 0, 0.2, 'linear')
    runTimer('noooo', 6)
end


















































-- obj = the object to flicker
-- duration = the total length of the flicker in seconds
-- delay = the delay between the object appearing and dissapearing
-- endVisible = whether or not the object is visible at the end
local flickerObjects = {}
local flickerEndVisible = {}
local flickerDelays = {}
function objectFlicker(obj, duration, delay, endVisible)
    if endVisible == nil then endVisible = true end
    table.insert(flickerObjects, obj)
    table.insert(flickerEndVisible, endVisible)
    table.insert(flickerDelays, delay)
    local loops = math.floor(duration/delay)
    runTimer(obj..'flickerOff', delay, loops)
end

function onFlickerCompleted(obj, id)
    setProperty(obj..'.visible', flickerEndVisible[id])
    table.remove(flickerObjects, id)
    table.remove(flickerEndVisible, id)
    table.remove(flickerDelays, id)

    if obj == 'BenitoDead' then
        removeLuaSprite('BenitoDead')
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    -- A loop from a timer you called has been completed, value "tag" is it's tag
    -- loops = how many loops it will have done when it ends completely
    -- loopsLeft = how many are remaining
    if #flickerObjects > 0 then
        local i = 1
        while i <= #flickerObjects do
            local flickerObj = flickerObjects[i]    
            --this could probably be improved
            if tag == flickerObj..'flickerOn' then
                if loops > 0 then
                    setProperty(flickerObj..'.visible', true)
                    runTimer(flickerObj..'flickerOff', flickerDelays[i], loops-1)
                    cancelTimer(tag)
                else
                    onFlickerCompleted(flickerObj, i)
                    i = i - 1
                end
            end
            if tag == flickerObj..'flickerOff' then
                if loops > 0 then
                    setProperty(flickerObj..'.visible', false)
                    runTimer(flickerObj..'flickerOn', flickerDelays[i], loops-1)
                    cancelTimer(tag)
                else
                    onFlickerCompleted(flickerObj, i)
                    i = i - 1
                end
            end
            i = i + 1
        end
    end
    if tag == 'noooo' then
        removeLuaSprite('BenitoDead', false)

        makeAnimatedLuaSprite('Benito', 'empanadas/Benito', -213, 70);
        addAnimationByPrefix("Benito", "Idle", "Benito_Idle", 24, true)
        addAnimationByPrefix('Benito','Dodge','Benito_Dodge',24,false)
        addLuaSprite("Benito", false)
        scaleObject('Benito', 0.4, 0.4)
        objectPlayAnimation("Benito", "Benito_Idle", true)

        objectFlicker('Benito', 1, 0.1, true)
    end
end

function onTweenCompleted(g)
    if g == 'BenitoDies' then
        objectFlicker('BenitoDead', 1, 0.1, false)
    end
end