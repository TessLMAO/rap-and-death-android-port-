function onCreate()
	makeLuaSprite('pilar', 'sewer/pilar', -500, -120);
    setScrollFactor('pilar', 1, 1)
    scaleObject('pilar', 1, 1)
	addLuaSprite('pilar', true);

	makeLuaSprite('Stage0', 'sewer/bggggg', -250, -120);
    setScrollFactor('Stage0', 1, 1)
    scaleObject('Stage0', 3.9, 3.9)
	addLuaSprite('Stage0', false);

    makeAnimatedLuaSprite('newborn', 'sewer/Newborn_Background', 205, 280);
	addAnimationByPrefix("newborn", "Newborn_Background", "NNB BACK", 24, true)
	addLuaSprite("newborn", false)
	objectPlayAnimation("newborn", "Newborn_Background", true)

	makeLuaSprite('box', 'sewer/box', 700, 120);
    setScrollFactor('box', 1, 1)
    scaleObject('box', 1.6, 1.6)
	addLuaSprite('box', false);

    makeAnimatedLuaSprite('guardian', 'sewer/guardian', 940, 230);
	addAnimationByPrefix("guardian", "guardian", "idle", 24, true)
    scaleObject('guardian', 0.70, 0.70)
	addLuaSprite("guardian", false)

	makeLuaSprite('intro', 'sewer/afoifjaanfahbgfa', -750, -300);
	setScrollFactor('intro', 0.9, 0.9);
	scaleObject('intro', 50, 50);
        addLuaSprite('intro', true)
end
	
function onStepHit()
if getProperty('curStep') == 2 then
        doTweenAlpha('introfade', 'intro', 0, 0.5, 'linear');	
end
end