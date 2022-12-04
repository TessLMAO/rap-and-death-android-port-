function onEvent(name,value1)
if name == 'darkscreen' then
	if value1 == '0' then
    doTweenAlpha('dark', 'intro', 0, 1, 'linear')
  end		
    if value1 == '1' then
    doTweenAlpha('dark', 'intro', 1, 1, 'linear')
end
   end 
end