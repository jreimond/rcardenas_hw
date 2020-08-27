*** Setting ***
Library  SeleniumLibrary

*** Keywords ***
Open US JF PROD Browser
	Open Browser    url=https://www.justfab.com/login  browser=chrome
	Maximize Browser Window
	#Sleep3

Close the browser
	Close Browser
			