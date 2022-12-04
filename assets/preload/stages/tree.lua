function onCreate()
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

    makeLuaSprite('fog', 'Tree/fog', -560, -100);
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

    --screenCenter('fog', 'x'

	close(true); --Esto es para que no se lagee todo xdxdxd
end