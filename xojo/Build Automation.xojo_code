#tag BuildAutomation
			Begin BuildStepList Linux
				Begin BuildProjectStep Build
				End
			End
			Begin BuildStepList Mac OS X
				Begin BuildProjectStep Build
				End
				Begin SignProjectStep Sign
				  DeveloperID=
				End
				Begin CopyFilesBuildStep CopyDyLib
					AppliesTo = 0
					Architecture = 1
					Target = 0
					Destination = 2
					Subdirectory = 
					FolderItem = Li4vLi4veGNvZGUvbGliU2NyZWVuU2FtcGxlci5keWxpYg==
				End
				Begin CopyFilesBuildStep CopyGradients
					AppliesTo = 0
					Architecture = 1
					Target = 0
					Destination = 1
					Subdirectory = 
					FolderItem = Li4vZ3JhZGllbnRzL0ZyZWViaWUtR3JhZGllbnRUZXh0dXJlcy0wMS5qcGc=
					FolderItem = Li4vZ3JhZGllbnRzL0ZyZWViaWUtR3JhZGllbnRUZXh0dXJlcy0wMi5qcGc=
					FolderItem = Li4vZ3JhZGllbnRzL0ZyZWViaWUtR3JhZGllbnRUZXh0dXJlcy0wMy5qcGc=
					FolderItem = Li4vZ3JhZGllbnRzL0ZyZWViaWUtR3JhZGllbnRUZXh0dXJlcy0wNC5qcGc=
					FolderItem = Li4vZ3JhZGllbnRzL0ZyZWViaWUtR3JhZGllbnRUZXh0dXJlcy0wNS5qcGc=
				End
			End
			Begin BuildStepList Windows
				Begin BuildProjectStep Build
				End
			End
#tag EndBuildAutomation
