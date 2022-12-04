function onCreate()
    makeLuaSprite('bg', 'sanstubby/bg', -300, -80);
    setScrollFactor('bg', 1, 1)
    scaleObject('bg', 0.8, 0.8)
    addLuaSprite('bg', false); 

    makeLuaSprite('trees', 'sanstubby/trees', -600, -220);
    setScrollFactor('trees', 0.8, 0.9)
    scaleObject('trees', 0.9, 0.9)
    addLuaSprite('trees', true); 
	
	close(true); --Esto es para que no se lagee todo xdxdxd
end