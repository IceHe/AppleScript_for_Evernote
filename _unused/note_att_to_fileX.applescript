on run #{note_name}
	
	set note_name to "xiHour 备份 [2015-10-16_11:18:57]"
	
	run script (POSIX file "/Users/IceHe/Documents/AppleScript/Evernote/evernote_launch.applescript")
	
	(*
	set file_xxx to "/Users/IceHe/Documents/AppleScript/temp/avatar_03a.jpg"
	#log file_xxx
	set fp to open for access POSIX file file_xxx
	close access fp
	*)
	set file_name to file "Macintosh HD:Users:IceHe:Documents:AppleScript:temp:avatar_03a.jpg" as alias
	#set file_alias to (file_name)
	#log file_name
	log file_name
	
	(*
	set file_name to "Macintosh HD:Users:IceHe:Documents:AppleScript:temp:avatar_03a.jpg"
	set file_alias to file file_name
	log file_name
	log class of file_name
	log file_alias
	*)
	
	(*
	tell application "Evernote"
		
		set note_found to find notes "intitle:\"" & note_name & "\""
		
		if 1 = (count of note_found) then
			repeat with att in (attachment of item 1 of note_found)
				
				#set file_name to ("/Users/IceHe/Documents/AppleScript/temp/" & (filename of att))
				#log file_name
				(*
				#set fp to open for access POSIX file file_name
				#close access fp
				
				#set file_alias to (POSIX file enex_path) as alias
				#set file_alias to (POSIX file file_name) as alias
				set file_alias to (POSIX file file_name)
				#set file_alias to POSIX file "/Users/IceHe/Documents/AppleScript/temp/avatar_03a.jpg"
				
				write att to file_alias
				*)
				
				set file_name to "Macintosh HD:Users:IceHe:Documents:AppleScript:temp:" & (filename of att)
				log file_name
				
				write att to file_name
				
			end repeat
			
			
			return true
		end if
		
		return false
		
	end tell
	*)
	
	
end run