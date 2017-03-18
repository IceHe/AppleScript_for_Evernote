tell application "Evernote"
	
	# Create Tags
	
	set all_tags to {}
	
	repeat with each_tag in tags
		set all_tags to all_tags & {name of each_tag}
	end repeat
	
	set todo_tags to {"0 must", "1 joy", "2 grow", "3 work"}
	
	repeat with each_tag in todo_tags
		if all_tags does not contain each_tag then make new tag with properties {name:each_tag}
	end repeat
	
	
	# Todo Tags
	
	set todo_signs to {"m", "j", "g", "w"}
	
	repeat with i from 1 to 4
		set note_query to "intitle:\"#" & (item i of todo_signs) & "\""
		set notes_found to find notes note_query
		if {} ­ notes_found then assign tag (item i of todo_tags) to notes_found
	end repeat
	
	
	# Clear Unused Tags
	
	set reserved_tags to todo_tags #& {}
	
	repeat with each_tag in all_tags
		#log (name of each_tag)
		if reserved_tags does not contain each_tag then #log name of each_tag
			delete tag each_tag
		end if
	end repeat
	
	return true
	
end tell
