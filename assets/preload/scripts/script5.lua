local iconSize = 0.2;
local iconSpeed = 0.02;

local iconP1X = 0;
local iconP1Y = 0;

local iconP2X = 0;
local iconP2Y = 0;

local funnies = false;

local fuck = 0;
local shit = 0;
local holy = 0;
local holx = 0;

-- winningIcon by swordcube
-- This script remakes how the icons work, and adds winning icons in the process!

-- You need to put your icons in a path like this:
-- mods/xml-icons/cool-guy/assets

-- You need: assets.png, and assets.xml, grab both files from the "dad" folder for a template.

function onCreatePost()
	-- putting semicolons because i'm too used to doing it in haxe

	-- hide og icons
	setProperty('iconP1.alpha', 0);
	setProperty('iconP2.alpha', 0);

	-- add dad and bf icon
	makeIcons();
end

function onUpdatePost()
	if curBeat == 0 then
		if not funnies then
			iconP2X = getProperty('iconP2.x');
			iconP2Y = getProperty('iconP2.y');

			iconP1X = getProperty('iconP1.x');
			iconP1Y = getProperty('iconP1.y');
			funnies = true;
		end
	end

	iconSize = iconSize - iconSpeed;

	if iconSize < 0.2 then
		iconSize = 0.2;
	end

	scaleObject('dadIcon', iconSize, iconSize);
	scaleObject('bfIcon', iconSize, iconSize);

	positionIcons();

	playIconAnims();
end

function onBeatHit()
	iconSize = 0.25;
end

function makeIcons()
	makeAnimatedLuaSprite('dadIcon', 'xml-icons/' .. getProperty('dad.healthIcon') .. '/assets', 0, 0);
	addAnimationByPrefix('dadIcon', 'normal', 'normal0', 24, true);
	addAnimationByPrefix('dadIcon', 'dead', 'dead0', 24, true);
	addAnimationByPrefix('dadIcon', 'win', 'win0', 24, true);
	addLuaSprite('dadIcon');

	makeAnimatedLuaSprite('bfIcon', 'xml-icons/' .. getProperty('boyfriend.healthIcon') .. '/assets', 0, 0);
	addAnimationByPrefix('bfIcon', 'normal', 'normal0', 24, true);
	addAnimationByPrefix('bfIcon', 'dead', 'dead0', 24, true);
	addAnimationByPrefix('bfIcon', 'win', 'win0', 24, true);
	addLuaSprite('bfIcon');

	-- make the icons be on hud and shti
	objectPlayAnimation('dadIcon', 'normal');
	objectPlayAnimation('bfIcon', 'normal');

	setObjectCamera('dadIcon', 'hud');
	setObjectCamera('bfIcon', 'hud');

	-- make the icons go in front of health bar lmao
	setObjectOrder('dadIcon', 99999);
	setObjectOrder('bfIcon', 99999);

	-- make score text go in front of icons because i'm 99.99% sure it does that originally
	setObjectOrder('scoreTxt', 999999);
end

function positionIcons()
	fuck = getProperty('health') - 1;
	if fuck > 1 then
		fuck = 1;
	end
	if fuck < -1 then
		fuck = -1;
	end

	shit = fuck * 300;

	hol = 980;

	if getProperty('dad.healthIcon') == 'chicha' then
	holx = 600;
	holy = 30;
	elseif getProperty('dad.healthIcon') == 'tinky' then
	holx = 600;
	holy = 40;
	elseif getProperty('dad.healthIcon') == 'gftelet' then
	holx =  590;
	holy = 50;
	elseif getProperty('dad.healthIcon') == 'newborn1' then
	holx = 580;
	end


	setProperty('dadIcon.x', iconP2X - getProperty('dadIcon.width') + getProperty('dadIcon.frameWidth') - shit - holx);
	setProperty('dadIcon.y', iconP2Y - holy);

	setProperty('bfIcon.x', iconP1X - shit + 20);
	setProperty('bfIcon.y', iconP1Y);
end

function onEvent(eventName, value1, value2)
	if eventName == 'Change Character' then
		removeIcons();
		makeIcons();
	end
end

function removeIcons()
	removeLuaSprite('dadIcon');
	removeLuaSprite('bfIcon');
end

function goodNoteHit()
	positionIcons();
end

function playIconAnims()
	if getProperty('health') < 0.4150 then
		objectPlayAnimation('bfIcon', 'dead');
		objectPlayAnimation('dadIcon', 'win');
	else
		objectPlayAnimation('bfIcon', 'normal');
		objectPlayAnimation('dadIcon', 'normal');
	end
	
	if getProperty('health') > 1.625 then
		objectPlayAnimation('bfIcon', 'win');
		objectPlayAnimation('dadIcon', 'dead');
	end
end