tell application "Evernote"
	
	set rd_notebooks to {"新浪微博", "微信", "- Inbox"}
	#set src_mark to {"w", "x", "i"}
	
	repeat with i from 1 to 3
		
		set unread_notebook to notebook named "Unread"
		
		set notes_found to find notes ("notebook:\"" & (item i of rd_notebooks) as Unicode text) & "\""
		
		repeat with each_note in notes_found
			set _d to (creation date of each_note)
			
			set m_mm to run script (POSIX file "/Users/IceHe/Documents/AppleScript/Lib/month2mm.applescript") with parameters {_d}
			set d_dd to day of _d
			if d_dd < 10 and d_dd > 0 then
				set d_dd to ("0" & d_dd)
			end if
			
			set datetime to (((year of _d) mod 100) & "/" & m_mm & "/" & d_dd) as string
			if (source URL of each_note) exists then
				move each_note to unread_notebook
			end if
			
			# Export a note & Append its exported enex file to another note
			
			(* 
				else if "\"Pocket\" <hello@getpocket.com>" = (author of each_note) then
					
					set creation_date to creation date of each_note
					set dd to day of creation_date
					if dd < 10 and dd > 0 then
						set dd to ("0" & dd)
					end if
					
					set mm to run script (POSIX file "/Users/IceHe/Documents/AppleScript/Lib/month2mm.applescript") with parameters creation_date
					set yyyy to year of creation_date
					set yy to (yyyy mod 100)
					
					set enex_path to "/Users/IceHe/Desktop/" & yy & mm & dd & ".enex"
					export {each_note} to (POSIX file enex_path)
					display alert "New Pocket Article has been EXPORTED."
					delete each_note
					
					(*
					set en_note to find notes "intitle:\"Repo - Read EN\""
					if 1 = (count of en_note) then
						append item 1 of en_note attachment (POSIX file enex_path)
					end if
					*)
				end if
				*)
			
		end repeat
		
	end repeat
	
	return true
	
end tell