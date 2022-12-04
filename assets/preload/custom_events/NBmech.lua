function onCreate()
    --variables
	Dodged = false;
    canDodge = false;

    precacheSound('flash');
    precacheImage('NBmech');
end

function onEvent(name, value1, value2)
    if name == "NBmech" then
    --Get Dodge time
    --Make Dodge Sprite
	makeAnimatedLuaSprite('NBmech', 'sewer/NBmech', 400, 140);
    luaSpriteAddAnimationByPrefix('NBmech', 'NB1', 'ScreamerNB2', 24, true);
    luaSpriteAddAnimationByPrefix('NBmech', 'NB2', 'ScreamerNB1', 24, true);
	luaSpritePlayAnimation('NBmech', 'NB1');
	setObjectCamera('NBmech', 'other');
	scaleLuaSprite('NBmech', 0.40, 0.40); 
    addLuaSprite('NBmech', true); 
    setProperty('flash.alpha', 1);
    doTweenAlpha('tweenCutOffAlpha', 'flash', 0, 0.5, 'linear');
	
	--Set values so you can dodge
	canDodge = true;
	runTimer('Died', DodgeTime);
	
	end
end

function onUpdate()
   if canDodge == true and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Z') then

    playSound('flash', 1.0);
   setProperty('flash.alpha', 1);
   doTweenAlpha('tweenCutOffAlpha', 'flash', 0, 0.5, 'linear');
   Dodged = true;
    objectPlayAnimation('NBmech','NB2',true)
    doTweenAlpha('NBbyebye', 'NBmech', 0, 0.6, 'linear')
   canDodge = false
   
   end
end