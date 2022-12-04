-- Lua stuff
function onCreate()

	makeLuaSprite('bgg', 'Blood-have/bg', -500, -230);
	setScrollFactor('bgg', 0.9, 0.9);
	scaleObject('bgg', 1.3, 1.3);
        addLuaSprite('bgg', false)

	makeAnimatedLuaSprite('arboles','Blood-have/arboles', -2650, -850) 
    addAnimationByPrefix('arboles','arboles','threesidle instancia',17,true)
    addLuaSprite('arboles', false);
	scaleObject('arboles', 2.9, 2.2);
	setScrollFactor('arboles', 0.7, 0.9);

	makeAnimatedLuaSprite('cesped2','Blood-have/cesped', -2250, 250) 
    addAnimationByPrefix('cesped2','cesped','cesped instancia',19,true)
    addLuaSprite('cesped2', false);
	scaleObject('cesped2', 2.9, 3.2);
	setScrollFactor('cesped2', 0.7, 0.9);

	makeAnimatedLuaSprite('camino','Blood-have/camino', -2200, 400) 
    addAnimationByPrefix('camino','camino','camino instancia',20,true)
    addLuaSprite('camino', false);
	scaleObject('camino', 2.9, 3.2);
	setScrollFactor('camino', 0.7, 0.9);

	makeAnimatedLuaSprite('cesped','Blood-have/cesped', -2100, 670) 
    addAnimationByPrefix('cesped','cesped','cesped instancia',20,true)
    addLuaSprite('cesped', true);
	scaleObject('cesped', 2.9, 3.2);
	setScrollFactor('cesped', 0.7, 0.9);
        setProperty('cesped.alpha', 0);

    makeLuaSprite('bg', 'Tree/Tree', -500, -280);

    scaleObject('fog', 1.5, 1.5)

    makeLuaSprite('Mountains', 'Tree/Mountains', -610, -400);
    setScrollFactor('Mountains', 0.7, 0.7)
    addLuaSprite('Mountains', false); 
    
    makeAnimatedLuaSprite('sussy', 'Tree/Sus_assets', 1010, -300);
	addAnimationByPrefix("sussy", "sus", "SUSSY AMONG ASS WITH SUSSY MUSCLE ARMS OMGG", 24, true)
	addLuaSprite("sussy", false)
	objectPlayAnimation("sussy", "sus", true)
  
    addLuaSprite('bg', false); 

    makeLuaSprite('custard', 'Tree/custard', -610, -290);
    setScrollFactor('custard', 0.9, 0.9)
    addLuaSprite('custard', false); 

    makeAnimatedLuaSprite('tinkylegs', 'Blood-have/tinkylegs', -220, 330);
	addAnimationByPrefix("tinkylegs", "tinkylegs", "legsidle", 24, true)
	addLuaSprite("tinkylegs", false)
        scaleObject('tinkylegs', 1.8, 1.8)
        setProperty('tinkylegs.alpha', 0);

    makeAnimatedLuaSprite('bflegs', 'Blood-have/bflegs', 1060, 420);
	addAnimationByPrefix("bflegs", "tinkylegs", "legsidle", 24, true)
	addLuaSprite("bflegs", false)
        scaleObject('bflegs', 1.4, 1.4)
        setProperty('bflegs.alpha', 0);

    makeLuaSprite('fog', 'Tree/fog', -560, -100);
    setScrollFactor('fog', 1, 1)
    scaleObject('fog', 3.5, 3.5)

	--setProperty('fog', "alpha", 0.75);

    addLuaSprite('fog', true); 

	makeAnimatedLuaSprite('smoke','Tree/smoke', -3550, 100) 
    addAnimationByPrefix('smoke','smoke','Moving',24,true)
    addLuaSprite('smoke', true);
	scaleObject('smoke', 4, 4);
	setScrollFactor('smoke', 0.7, 0.9);

	makeLuaSprite('intro', 'Tree/afoifjaanfahbgfa', -450, -300);
	setScrollFactor('intro', 0.9, 0.9);
	scaleObject('intro', 50, 50);
        addLuaSprite('intro', true)

	makeLuaSprite('cutscene1', 'Tree/cutscene1', -300, -170);
	setScrollFactor('cutscene1', 0, 0);
	scaleObject('cutscene1', 0.6, 0.6);
        addLuaSprite('cutscene1', true)
        setProperty('cutscene1.alpha', 0);

	makeLuaSprite('cutscene2', 'Tree/cutscene2', -300, -170);
	setScrollFactor('cutscene2', 0, 0);
	scaleObject('cutscene2', 0.6, 0.6);
        addLuaSprite('cutscene2', true)
        setProperty('cutscene2.alpha', 0);
end

function onStepHit()


if getProperty('curStep') == 3 then
        doTweenAlpha('introfade', 'dnadn', 0, 2, 'linear');	
end

if getProperty('curStep') == 240 then
        setProperty('cutscene1.alpha', 100);
end

if getProperty('curStep') == 248 then
        setProperty('cutscene1.alpha', 0);
        setProperty('cutscene2.alpha', 100);
end

if getProperty('curStep') == 255 then
        setProperty('cutscene2.alpha', 0);
        setProperty('2.alpha', 0);
        setProperty('three.alpha', 0);
        setProperty('bflegs.alpha', 100);
        setProperty('po.alpha', 0);
        setProperty('bg.alpha', 0);
        setProperty('sussy.alpha', 0);
        setProperty('Mountains.alpha', 0);
        setProperty('smoke.alpha', 0);
        setProperty('cesped.alpha', 100);
        setProperty('tinkylegs.alpha', 100);
        setProperty('intro.alpha', 0);
        setProperty('custard.alpha', 0);
end
end

function onUpdate(elapsed)
if getProperty('curStep') == 405 then
        setProperty('smuk.alpha', 100);	
end
end