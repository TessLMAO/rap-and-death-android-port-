function onCreate()
	makeLuaSprite('flash', 'flash', 0, 0);
	setLuaSpriteScrollFactor('flash', 0, 0);
	defaultCamZoom = getProperty('defaultCamZoom') - 0.01;
	setProperty('flash.scale.x', 30 / defaultCamZoom);
	setProperty('flash.scale.y', 30 / defaultCamZoom);
	setProperty('flash.alpha', 0.0001);
	addLuaSprite('flash', true);
		characterPlayAnim('dad', 'Shock', true);
		characterPlayAnim('boyfriend', 'Flash', true);
		setProperty('boyfriend.specialAnim', true);
		setProperty('dad.specialAnim', true);
end

-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "Flash" then
		setProperty('flash.alpha', 1);
		doTweenAlpha('tweenCutOffAlpha', 'flash', 0, 0.5, 'linear');
		characterPlayAnim('dad', 'Shock', false);
		characterPlayAnim('boyfriend', 'Flash', true);
		setProperty('boyfriend.specialAnim', true);
		setProperty('dad.specialAnim', true);
	end
end