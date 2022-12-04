function onCreate()
    --variables
	On = false;
    canOn = false;

    precacheSound('flash');
end

function onEvent(name, value1, value2)
    if name == "Cammech" then
        if value1 == 'on' then
    --Get Dodge time
    --Make Dodge Sprite
        doTweenAlpha('lightoff', 'light', 0, 1, 'linear')
        doTweenAlpha('totalllldark', 'totaldark', 1,0.5, 'linear')
	
	--Set values so you can dodge
	canOn = true;
	runTimer('Died', DodgeTime);
	
	end
end

function onUpdate()
   if canOn == true and keyJustPressed('space') then

    characterPlayAnim('boyfriend', 'Flash', true);
    playSound('flash', 1.0);
    doTweenAlpha('cameraon', 'camera', 1, 0.5, 'linear')
    doTweenAlpha('totalllldark', 'totaldark', 0, 0.7, 'linear')
    addShader('vcr')
    
   On = true;
   canOn = false
   
   end
end

if keyJustPressed('') then
    doTweenAlpha('totalllldark', 'totaldark', 0.5, 1, 'linear')
    doTweenAlpha('cameraon', 'camera', 1, 0, 'linear')
end

if value1 == 'off' then
    doTweenAlpha('cameraon', 'camera', 0, 1, 'linear')
    doTweenAlpha('totalllldark', 'totaldark', 0, 1, 'linear')
    doTweenAlpha('lightoff', 'light', 1, 1, 'linear')

    removeShaders()
end
end

function addShader(shaderName)
	shaderCoordFix() -- initialize a fix for textureCoord when resizing game window
    makeLuaSprite("tempShader0")
    runHaxeCode([[
        var shaderName = "]] .. shaderName .. [[";
        
        game.initLuaShader(shaderName);
        
        var shader0 = game.createRuntimeShader(shaderName);
        game.camGame.setFilters([new ShaderFilter(shader0)]);
        game.camHUD.setFilters([new ShaderFilter(shader0)]);
        game.getLuaObject("tempShader0").shader = shader0;
    ]])
end

function removeShaders()
    runHaxeCode([[
        game.camGame.setFilters([]);
        game.camHUD.setFilters([]);
    ]])
end

function onUpdatePost()
    setShaderFloat("tempShader0", "iTime", os.clock())

    --setObjectClip('dad', nil, nil, nil, 1200)
end

function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData3 = spr.__cacheBitmapData2 = spr.__cacheBitmapData = null;
            spr.__cacheBitmapColorTransform = null;
        }
        
        fixShaderCoordFix = function(?_) {
            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }
        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
    ]])
    local temp = onDestroy
    function onDestroy()
        runHaxeCode([[
            FlxG.signals.gameResized.remove(fixShaderCoordFix);
        ]])
        temp()
    end
end