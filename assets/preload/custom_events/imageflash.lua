function onEvent(name, value1, value2)
   if name == 'imageflash' then
    makeLuaSprite('image', value1, 0, 0);
	--playSound('sppok', 0.8)
    addLuaSprite('image', true);
    doTweenColor('hello', 'image', 'FFFFFFFF', 0.1, 'quartIn');
    setObjectCamera('image', 'other');
    playSound('static',0.1,'moñ')

    doTweenAlpha('byebye', 'image', 0, 0.3, 'smoothstepinout');

    soundFadeOut('moñ', 0.2, 0)
    end
	end 
    
    function onTweenCompleted(tag)
    if tag == 'byebye' then
    removeLuaSprite('image', true);
    end
	end
