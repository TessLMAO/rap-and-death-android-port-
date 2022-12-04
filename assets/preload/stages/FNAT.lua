function onCreate()	

    makeLuaSprite('Stage2', 'nightshift/bg', -680, -80);
    setScrollFactor('Stage2', 0.8, 0.8)
    scaleObject('Stage2', 4.5, 4.5)
    addLuaSprite('Stage2', false); 

    makeLuaSprite('Stage1', 'nightshift/table', -750, -40);
    setScrollFactor('Stage1', 1.3, 1.3)
    setObjectOrder('Stage1', getObjectOrder('dadGroup') + 1)
    scaleObject('Stage1', 2.8, 2.8)
    addLuaSprite('Stage1', false); 

    makeLuaSprite('Overlay', 'nightshift/overlay', -620, -90);
    setScrollFactor('Overlay', 1, 1)
    scaleObject('Overlay', 27.9, 27.9)
    addLuaSprite('Overlay', true); 

    makeLuaSprite('a', 'afoifjaanfahbgfa', -720, 50);
    setScrollFactor('a', 0.9, 0.9);
    scaleObject('a', 50, 50);
    addLuaSprite('a', false)
    setProperty('a.alpha', 0);

    makeLuaSprite('Overlayhud', 'nightshift/overlay', -620, 0);
    setScrollFactor('Overlayhud', 1, 1)
    scaleObject('Overlayhud', 0.8, 0.5)
    addLuaSprite('Overlayhud', true); 
   setObjectCamera("Overlayhud", 'other');
        setProperty('Overlayhud.alpha', 0);

end

function onStepHit()
if getProperty('curStep') == 892 then
        setProperty('a.alpha', 100);
        setObjectOrder('a', getObjectOrder('dadGroup') +1)	
end
if getProperty('curStep') == 893 then
        setProperty('a.alpha', 0);	
end
if getProperty('curStep') == 894 then
        setProperty('a.alpha', 100);	
end
if getProperty('curStep') == 895 then
        setProperty('a.alpha', 0);	
end
if getProperty('curStep') == 896 then
        setObjectOrder('a', getObjectOrder('dadGroup') -1)	
        setProperty('a.alpha', 100);	
        setObjectOrder('Stage1', getObjectOrder('dadGroup') - 6)
        setProperty('Overlayhud.alpha', 100);
        addShader('vcr')
end

if getProperty('curStep') == 1152 then
        setProperty('a.alpha', 0);
        setProperty('Overlayhud.alpha', 0);
        setObjectOrder('Stage1', getObjectOrder('dadGroup') + 1)
        removeShaders()
end

if getProperty('curStep') == 1664 then
        setObjectOrder('a', getObjectOrder('dadGroup') +1)	
        doTweenAlpha('ay', 'a', 1, 31, 'smoothstepOut')
        doTweenAlpha('asy', 'Overlayhud', 1, 31, 'smoothstepOut')
        doTweenAlpha('camHUDFadeEventTween', 'camHUD', 0.4, 30, 'linear');
       -- doTweenAlpha('sy', 'matt', 1, 28, 'smoothstepOut')
end
if getProperty('curStep') == 1920 then
        setProperty('dadGroup.alpha', 0.0002)
        setObjectOrder('Stage1', getObjectOrder('dadGroup') -1)
        triggerEvent('Change Character', "dad", "tinky-animatronic-dark")
        doTweenAlpha('fadesd', 'dadGroup', 1, 1, 'bounceInOut')
        setObjectOrder('dadGroup', getObjectOrder('a') + 1)
        addShader('vcr')
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

function setObjectClip(spr, x, y, width, height) -- holy shit raltyro
        -- Check and Fix Arguments
        if (type(spr) ~= "string" or type(getProperty(spr .. ".frame.frame.x")) ~= "number") then return end
        x = type(x) == "number" and x or getProperty(spr .. ".frame.frame.x")
        y = type(y) == "number" and y or getProperty(spr .. ".frame.frame.y")
        width = type(width) == "number" and width >= 0 and width or getProperty(spr .. ".frame.frame.width")
        height = type(height) == "number" and height >= 0 and height or getProperty(spr .. ".frame.frame.height")
        -- ClipRect
        setProperty(spr .. "._frame.frame.x", x)
        setProperty(spr .. "._frame.frame.y", y)
        setProperty(spr .. "._frame.frame.width", width)
        setProperty(spr .. "._frame.frame.height", height)
        return x, y, width, height
end