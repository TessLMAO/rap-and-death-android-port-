function opponentNoteHit(id,dir,type,sus)
	if type == 'both' then
		characterPlayAnim('gf', getProperty('singAnimations')[math.abs(dir)+1], true)
		setProperty('gf.holdTimer', 0)
	end
end