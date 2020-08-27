*** Setting ***
Library  SeleniumLibrary

*** Keywords ***
Open US JF PROD LOGIN
	Open Browser    url=https://www.justfab.com/login  browser=chrome
	Maximize Browser Window
	#Sleep3

Close the browser
	Close Browser

Open US JF PROD HOME
	Open Browser    url=https://www.justfab.com/  browser=chrome
	Maximize Browser Window
	#Sleep3
			