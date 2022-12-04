function onCreate()

	makeLuaSprite('Stage3', 'prologue/bggg', -550, 100);

    setScrollFactor('Stage3', 1, 1)

    scaleObject('Stage3', 20.9, 20.9)

	addLuaSprite('Stage3', false);

	makeAnimatedLuaSprite('Trees', 'prologue/trees', -1350, 0);

	addAnimationByPrefix("Trees", "trees", "treesidle instancia", 27, true)

    setScrollFactor('Trees', 0.7, 0.9)

    scaleObject('Trees', 1, 1)

	addLuaSprite('Trees', false);

	objectPlayAnimation("Trees", "treesidle instancia", true)

	makeLuaSprite('Stage0', 'prologue/bg', -550, 100);

    setScrollFactor('Stage0', 1, 1)

    scaleObject('Stage0', 1.55, 1.55)

	addLuaSprite('Stage0', false);

	makeAnimatedLuaSprite('Militar1', 'prologue/militar', -240, 170);

	addAnimationByPrefix("Militar1", "militar", "Militar_idle", 24, true)

    setScrollFactor('Militar1', 0.9, 0.9)

    scaleObject('Militar1', 0.4, 0.4)

	addLuaSprite('Militar1', false);

	objectPlayAnimation("Militar2", "Militar_idle", false)

	makeAnimatedLuaSprite('Militar2', 'prologue/militar', 800, 170);

	addAnimationByPrefix("Militar2", "militar", "Militar_idle", 24, true)

	setPropertyLuaSprite('Militar2', 'flipX', true);

    setScrollFactor('Militar2', 0.9, 0.9)

    scaleObject('Militar2', 0.4, 0.4)

	addLuaSprite('Militar2', false);

	objectPlayAnimation("Militar1", "Militar_idle", true)

	
	close(true); --Esto es para que no se lagee todo xdxdxd
end