function onCreate()
    setProperty('gf.visible', true);
end

stepHitFuncs = { --a bunch of timed events, timed to steps
	[93] = function()
        doTweenZoom('ChichaZoom', 'camGame', 1.1, 3, 'quadInOut');
	end,
}

function onStepHit()
    if stepHitFuncs[curStep] then 
        stepHitFuncs[curStep]() -- ejecuta los cursteps.
    end
end

