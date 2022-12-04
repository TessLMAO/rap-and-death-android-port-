function onEvent(name, value1, value2)
	if name == "Fadeintro" then
		setProperty('intro.alpha', 1);
		doTweenAlpha('tweenCutOffAlpha', 'intro', 0, 2, 'linear');
	end
end