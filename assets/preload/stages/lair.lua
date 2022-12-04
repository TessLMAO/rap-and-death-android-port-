function onCreate()
	makeLuaSprite('bg', 'lair/bg', -300, 100);
    scaleObject('bg', 1.5, 1.5)
	addLuaSprite('bg', false);

	makeLuaSprite('3', 'lair/screen3', -300, 100);
    scaleObject('3', 0.75, 0.75)
	addLuaSprite('3', false);

	makeLuaSprite('2', 'lair/bg', -300, 100);
    scaleObject('2', 1.5, 1.5)
	addLuaSprite('2', false);
end

function onStepHit()
if getProperty('curStep') == 520 then
        setProperty('light.alpha', 0);
        setProperty('1.alpha', 0);
        setProperty('2.alpha', 0);
        setProperty('tvon.alpha', 0);
end

if getProperty('curStep') == 525 then
	setProperty('light.alpha', 100);
	setProperty('1.alpha', 0);
	setProperty('2.alpha', 100);
	setProperty('tvon.alpha', 100);
end

if getProperty('curStep') == 905 then
        setProperty('light.alpha', 0);
        setProperty('1.alpha', 0);
        setProperty('2.alpha', 0);
        setProperty('tvon.alpha', 0);
  end
end 	