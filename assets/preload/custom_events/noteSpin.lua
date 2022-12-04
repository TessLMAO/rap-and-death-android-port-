function onEvent(name, value1, value2)
if name == 'noteSpin' or name == 'TweenSpin' then
	-- whats the solution to jank? even more jank!
	noteTweenAngle('AJ',4 , 0 , 0.01, "quartInOut");
	noteTweenAngle('BJ',5 , 0 , 0.01, "quartInOut");
	noteTweenAngle('CJ',6 , 0 , 0.01, "quartInOut");
	noteTweenAngle('DJ',7 , 0 , 0.01, "quartInOut");
	noteTweenAngle('EJ',0 , 0 , 0.01, "quartInOut");
	noteTweenAngle('FJ',1 , 0 , 0.01, "quartInOut");
	noteTweenAngle('GJ',2 , 0 , 0.01, "quartInOut");
	noteTweenAngle('HJ',3 , 0 , 0.01, "quartInOut");

	
	-- bf notespin

	noteTweenAngle('A',4 , value2 , value1,"quartInOut");
	noteTweenAngle('B',5 , value2 , value1, "quartInOut");
	noteTweenAngle('C',6 , value2 , value1, "quartInOut");
	noteTweenAngle('D',7 , value2 , value1, "quartInOut");
	
	-- oppt notespin
	noteTweenAngle('E',0 , value2 , value1, "quartInOut");
	noteTweenAngle('F',1 , value2 , value1, "quartInOut");
	noteTweenAngle('G',2 , value2 , value1, "quartInOut");
	noteTweenAngle('H',3 , value2 , value1, "quartInOut");
	
	
	
end
end
