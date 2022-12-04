function onEvent(name, value1, value2)
    if name == 'empanada' then
    makeLuaSprite('empanada', 'empanadas/empanada', -600, -500);
    
    setScrollFactor('empanada', 1, 1)

    scaleObject('empanada', 0.95, 0.95)

    addLuaSprite('empanada', false); 

    setObjectOrder('empanada', 1000) --si c

    doTweenAngle('Empatween', 'empanada', 380, 10, 'linear');

    doTweenX('Empatween2', 'empanada', value1, 3, 'quadMotionInOut'); --3900
    doTweenY('Empatween3', 'empanada', 6660, 3, 'quadMotionInOut');
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'Empatween3' then
        removeLuaSprite('empanada')
	end
end