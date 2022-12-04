local shaderName = "vcrshader"
local isTrue = false

function onCreatePost()
    shaderCoordFix() -- initialize a fix for textureCoord when resizing game window

    luaDebugMode = true

    makeLuaSprite("tempShader0")
end

function onEvent(n,v1,v2)
if n == 'VCR Key-Change' then

if v1 == 'true' then
    isTrue = true
    runHaxeCode([[
        var shaderName = "]] .. shaderName .. [[";
        
        game.initLuaShader(shaderName);
        
        var shader0 = game.createRuntimeShader(shaderName);
        game.camGame.setFilters([new ShaderFilter(shader0)]);
        game.camHUD.setFilters([new ShaderFilter(shader0)]);
        game.getLuaObject("tempShader0").shader = shader0; // setting it into temporary sprite so luas can set its shader uniforms/properties
    ]])
end

if v1 == 'false' then
--remove shadeR
isTrue = false
runHaxeCode([[
        game.camGame.setFilters([]);
        game.camHUD.setFilters([]);
    ]])
end
end

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

function onUpdatePost()
   if isTrue == true then
      runHaxeCode([[
        shader0.setFloat("iTime", ]] .. os.clock() .. [[);
    ]])
   end
end