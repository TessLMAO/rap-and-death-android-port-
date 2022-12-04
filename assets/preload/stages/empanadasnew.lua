function onCreate()

    makeLuaSprite('Stage1', 'empanadas/agadgaggva', -650, -280);
    setScrollFactor('Stage1', 1, 1)
    scaleObject('Stage1', 2, 2)
    addLuaSprite('Stage1', false); 

    makeAnimatedLuaSprite('Benito', 'empanadas/Benito', -213, 70);
	addAnimationByPrefix("Benito", "Idle", "Benito_Idle", 24, true)
	addAnimationByPrefix('Benito','Dodge','Benito_Dodge',24,false)
	addLuaSprite("Benito", false)
        scaleObject('Benito', 0.4, 0.4)
	objectPlayAnimation("Benito", "Benito_Idle", true)
        --addOffset('Benito', 'Dodge', 0, 0)

    makeAnimatedLuaSprite('renacidos1', 'empanadas/el_fondo_de_los_renacidosxdxd', -1050, 280);
	addAnimationByPrefix("renacidos1", "el_fondo_de_los_renacidosxdxd", "ola instancia", 24, true)
	addLuaSprite("renacidos1", true)
        scaleObject('renacidos1', 1.1, 1.1)
	setLuaSpriteScrollFactor('renacidos1', 0.7, 0.7);
	objectPlayAnimation("renacidos1", "ola instancia", true)
        setProperty('renacidos1.alpha', 0);

    makeAnimatedLuaSprite('renacidos2', 'empanadas/el_fondo_de_los_renacidsxdxd', 1000, 550);
	addAnimationByPrefix("renacidos2", "el_fondo_de_los_renacidsxdxd", "adios instancia", 24, true)
	addLuaSprite("renacidos2", true)
	setLuaSpriteScrollFactor('renacidos2', 0.8, 0.8);
        scaleObject('renacidos2', 1.1, 1.1)
	objectPlayAnimation("renacidos2", "adios instancia", true)
        setProperty('renacidos2.alpha', 0);

    makeLuaSprite('chichadialog1', 'empanadas/chichadialog', -30, 30);
    scaleObject('chichadialog1', 1.0, 1.0)
    setScrollFactor('chichadialog1', 0, 0)
        setObjectCamera("chichadialog1", 'other');
    addLuaSprite('chichadialog1', true); 
        setProperty('chichadialog1.alpha', 0);

    makeLuaSprite('chichadialog2', 'empanadas/chichadialog2', -30, 30);
    scaleObject('chichadialog2', 1.0, 1.0)
    setScrollFactor('chichadialog2', 0, 0)
        setObjectCamera("chichadialog2", 'other');
    addLuaSprite('chichadialog2', true); 
        setProperty('chichadialog2.alpha', 0);

    makeLuaSprite('Benitodialog', 'empanadas/Benitodialog', -30, 30);
    scaleObject('Benitodialog', 1.0, 1.0)
    setScrollFactor('Benitodialog', 0, 0)
        setObjectCamera("Benitodialog", 'other');
    addLuaSprite('Benitodialog', true); 
        setProperty('Benitodialog.alpha', 0);

    makeLuaSprite('Benitodialog2', 'empanadas/Benitodialog2', -30, 30);
    scaleObject('Benitodialog2', 1.0, 1.0)
    setScrollFactor('Benitodialog2', 0, 0)
        setObjectCamera("Benitodialog2", 'other');
    addLuaSprite('Benitodialog2', true); 
        setProperty('Benitodialog2.alpha', 0);

	makeLuaSprite('intro', 'empanadas/afoifjaanfahbgfa', -700, -300);
	setScrollFactor('intro', 0.9, 0.9);
	scaleObject('intro', 50, 50);
        addLuaSprite('intro', true)
end

function onUpdate()
        doTweenAlpha('introfade', 'intro', 0, 1, 'linear');
end

function onStepHit()

if getProperty('curStep') >= 20 and getProperty('intro.alpha') >= 0 then
        doTweenAlpha('introfade', 'intro', 0, 0.1, 'linear');
end

if getProperty('curStep') == 93 then
        setProperty('chichadialog1.alpha', 100);	
end

if getProperty('curStep') == 128 then
        setProperty('chichadialog1.alpha', 0);	
        setProperty('yappin.alpha', 0);
end

if getProperty('curStep') == 159 then
        setProperty('chichadialog1.alpha', 100);	
end

if getProperty('curStep') == 192 then
        setProperty('yappin.alpha', 0);
        setProperty('chichadialog1.alpha', 0);	
end

if getProperty('curStep') == 240 then
        setProperty('chichadialog2.alpha', 100);	
end

if getProperty('curStep') == 248 then
        setProperty('renacidos2.alpha', 100);
        setProperty('renacidos1.alpha', 100);	
end

if getProperty('curStep') == 256 then
        setProperty('yappin.alpha', 0);
        setProperty('chichadialog2.alpha', 0);	
end

if getProperty('curStep') == 355 then
        setProperty('Benitodialog.alpha', 100);	
end

if getProperty('curStep') == 385 then
        setProperty('yappin.alpha', 0);
        setProperty('Benitodialog.alpha', 0);	
end

if getProperty('curStep') == 585 then
        setProperty('Benitodialog2.alpha', 100);	
end

if getProperty('curStep') == 640 then
        setProperty('yappin.alpha', 0);
        setProperty('Benitodialog2.alpha', 0);	
end

if getProperty('curStep') == 641 then
        setProperty('chichadialog2.alpha', 100);	
end

if getProperty('curStep') == 671 then
        setProperty('yappin.alpha', 0);
        setProperty('chichadialog2.alpha', 0);	
end

if getProperty('curStep') == 740 then
        setProperty('Benitodialog2.alpha', 100);	
end

if getProperty('curStep') == 768 then
        setProperty('yappin.alpha', 0);
        setProperty('Benitodialog2.alpha', 0);	
end

if getProperty('curStep') == 945 then
        setProperty('chichadialog2.alpha', 100);	
end

if getProperty('curStep') == 960 then
        setProperty('yappin.alpha', 0);
        setProperty('chichadialog2.alpha', 0);	
end

if getProperty('curStep') == 1039 then
        setProperty('chichadialog1.alpha', 100);	
end

if getProperty('curStep') == 1056 then
        setProperty('yappin.alpha', 0);
        setProperty('chichadialog1.alpha', 0);	
end

if getProperty('curStep') == 1290 then
        setProperty('chichadialog1.alpha', 100);	
end

if getProperty('curStep') == 1312 then
        setProperty('yappin.alpha', 0);
        setProperty('chichadialog1.alpha', 0);	
end

if getProperty('curStep') == 1313 then
        setProperty('Benitodialog2.alpha', 100);	
end

if getProperty('curStep') == 1344 then
        setProperty('yappin.alpha', 0);
        setProperty('Benitodialog2.alpha', 0);	
end

if getProperty('curStep') == 1512 then
        setProperty('chichadialog1.alpha', 100);	
end

if getProperty('curStep') == 1528 then
        setProperty('yappin.alpha', 0);
        setProperty('chichadialog1.alpha', 0);	
end
end
