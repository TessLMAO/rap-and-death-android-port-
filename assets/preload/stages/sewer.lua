function onCreate()
	makeLuaSprite('sewer', 'sewer/sewer', -600, -130);
	setScrollFactor('sewer', 0.9, 0.9);
	scaleObject('sewer', 1.4, 1.4);
        addLuaSprite('sewer', false)

	makeLuaSprite('lair', 'sewer/lair', -600, -130);
	setScrollFactor('lair', 0.7, 0.9);
	scaleObject('lair', 0.7, 0.7);
        addLuaSprite('lair', true)

	makeLuaSprite('bg', 'sewer/bg', -160, -90);
	setScrollFactor('bg', 0, 0);
	scaleObject('bg', 0.5, 0.5);
        addLuaSprite('bg', true)

	makeAnimatedLuaSprite('newborn_2','sewer/newborn_2', 1050, 550) 
	addAnimationByPrefix('newborn_2','idle','idle',24,true)
	addLuaSprite('newborn_2', true);
	scaleObject('newborn_2', 0.55, 0.55);
	setScrollFactor('newborn_2', 0.9, 0.9);
		setProperty('newborn_2.alpha', 0);

	makeAnimatedLuaSprite('newborn_1','sewer/newborn_1', -420, 550) 
	addAnimationByPrefix('newborn_1','idle','idle',24,true)
	addLuaSprite('newborn_1', true);
	scaleObject('newborn_1', 0.58, 0.58);
	setScrollFactor('newborn_1', 0.9, 0.9);
		setProperty('newborn_1.alpha', 0);	

	makeAnimatedLuaSprite('static','sewer/static', 0, 40) 
    addAnimationByPrefix('static','static','static shit',8,true)
    addLuaSprite('static', true);
	scaleObject('static', 0.9, 1.2);
	setScrollFactor('static', 0, 0);

	makeLuaSprite('screens', 'sewer/screens', -160, -90);
	setScrollFactor('screens', 0, 0);
	scaleObject('screens', 0.5, 0.5);
        addLuaSprite('screens', true)

	makeLuaSprite('mechanics', 'sewer/mechanics', -160, -90);
	setScrollFactor('mechanics', 0, 0);
	scaleObject('mechanics', 0.5, 0.5);
        addLuaSprite('mechanics', true)

	makeLuaSprite('intro', 'sewer/dark', -750, -300);
	setScrollFactor('intro', 0.9, 0.9);
	scaleObject('intro', 50, 50);
        addLuaSprite('intro', true)

		makeLuaSprite('redflash', 'sewer/redflash', 0, 0);
		setLuaSpriteScrollFactor('redflash', 0, 0);
		defaultCamZoom = getProperty('defaultCamZoom') - 0.01;
		setProperty('redflash.scale.x', 30 / defaultCamZoom);
		setProperty('redflash.scale.y', 30 / defaultCamZoom);
		setProperty('redflash.alpha', 0.0001);
		addLuaSprite('redflash', true);
		setProperty('redflash.alpha', 0);
	
		makeLuaSprite('adv', 'sewer/flashadv', 0, 0);
		setLuaSpriteScrollFactor('adv', 0, 0);
		addLuaSprite('adv', true);
		setObjectCamera('adv', 'other');
		setProperty('adv.alpha', 0);

		makeLuaSprite('camera', 'sewer/camera', 0, 0);
		setScrollFactor('camera', 0, 0);
		scaleObject('camera', 1, 1);
			addLuaSprite('camera', true)
			setObjectCamera('camera', 'other');
			setProperty('camera.alpha', 0);

	makeLuaSprite('totaldark', 'sewer/dark', -750, -300);
	setScrollFactor('totaldark', 0.9, 0.9);
	scaleObject('totaldark', 50, 50);
		addLuaSprite('totaldark', true)
		setObjectCamera('totaldark', 'other');
		setProperty('totaldark.alpha', 0);

		
end

function onStepHit()
if getProperty('curStep') == 1 then
        doTweenAlpha('introfade', 'intro', 0, 1, 'linear');	
end

if getProperty('curStep') == 64 then
        setProperty('bg.alpha', 0);
        setProperty('static.alpha', 0);
        setProperty('screens.alpha', 0);
        setProperty('mechanics.alpha', 0);
end

if getProperty('curStep') == 521 then
	setProperty('newborn_1.alpha', 1);
end

if getProperty('curStep') == 1031 then
	setProperty('newborn_2.alpha', 1);
end

if getProperty('curStep') == 1408 then
        setProperty('NB_left.alpha', 1);
end
end