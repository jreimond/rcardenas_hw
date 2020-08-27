*** Settings ***
Library  SeleniumLibrary
Library  String

*** variables ***
${useraccount vip}  				ramon_ccpa3@test.com
${useraccount vip pw}  				test123

${memberlogin label}				xpath://span[contains(text(),'Member Login')]
${email textbox}					xpath://input[@id='id-11']
${password textbox}					xpath://input[@id='id-13']	
${login button}						xpath://div[@class='LoginForm__ButtonWrapper-sc-1k88zse-8 iYJSAI']//button[@name='action']
${my account button}				xpath://span[contains(text(),'My Account')]
${logout button}					xpath://span[contains(text(),'Log Out')]

*** Keywords ***
Keyword Login
	Wait Until Element Is Visible 			${memberlogin label}
	Input Text			${email textbox}   ${useraccount vip}
	Input Text			${password textbox}	 ${useraccount vip pw}
	#Sleep3
		Click Button			${login button}	
		
Keyword Logout
	Go to			https://www.justfab.com/loggedinshell
	#Sleep3
	Wait Until Element Is Visible	${my account button}	
	Mouse Over  class:icon
	Click Element 		${logout button}