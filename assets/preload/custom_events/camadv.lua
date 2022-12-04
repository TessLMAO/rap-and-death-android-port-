function onEvent(name, value1, value2)
    if name == "camadv" then
        if value1 == 'on' then
            setProperty('redflash.alpha', 1);
            doTweenAlpha('redflashalpha', 'redflash', 0, 0.5, 'linear');
            setProperty('adv.alpha', 1);
     end
end

if value1 == 'off' then
    doTweenAlpha('advalpha', 'adv', 0, 0.5, 'linear');
end
end