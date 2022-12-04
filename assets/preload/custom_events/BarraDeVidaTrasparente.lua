-- Event notes hooks
function onEvent(name, value1, value2)
	if name == 'BarraDeVidaTrasparente' then
		duration = tonumber(value1);
		if duration < 0 then
			duration = 0;
		end

		targetAlpha = tonumber(value2);
		if duration == 0 then
        setProperty('healthBar.alpha', targetAlpha);
        setProperty('dadIcon.alpha', targetAlpha);
        setProperty('bfIcon.alpha', targetAlpha);
        setProperty('scoreTxt.alpha', targetAlpha);
		else
			doTweenAlpha('dadIconFadeEventTween', 'dadIcon', targetAlpha, duration, 'linear');
                                                     doTweenAlpha('bfIconFadeEventTween', 'bfIcon', targetAlpha, duration, 'linear');
			doTweenAlpha('healthBarFadeEventTween', 'healthBar', targetAlpha, duration, 'linear');
		end
		--debugPrint('Event triggered: ', name, duration, targetAlpha);
	end
end