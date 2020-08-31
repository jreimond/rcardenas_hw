*** Settings ***
Library  SeleniumLibrary
Library  String
Library  Screenshot
Library    Collections
Resource  hw6_Setup_Teardown.robot
Resource  hw6_Login_Logout.robot
Test Setup  Open US JF PROD LOGIN
 Test Teardown  Close the browser

*** Variables ***
${welcome module}				xpath://div[@id='module_wide']
${accountinfo button}			xpath://a[contains(text(),'Account Info')]
${store credits}				xpath://strong[@class='ctHidden']
${welcome window}				xpath://*[@id="cboxLoadedContent"]
${welcome window x}				xpath://*[@id="cboxClose"]
${my account button}			xpath://a[@class='icon']
${myfashion found}				xpath://span[contains(text(),'2550 pts')]
${profile label}				xpath://div[contains(text(),'Profile')]
${info storecredit}				xpath://span[contains(text(),'$39.95')]
${info rewardpoints}			xpath://a[@class='inline']

*** Test Cases ***
Verify if credits displayed on hovering my account icon matches with detail in My profile page
	LoginTwo
	#Sleep 3
		${check_element}=  Run Keyword and Return Status   Wait Until Page Contains Element    ${welcome window}	10s
		Run Keyword If      '${check_element}' == 'True'     Click Element  ${welcome window x}	
	#Sleep5
	Wait Until Element Is Visible		${welcome module}
	#Sleep 3
	Wait Until Element Is Visible		${store credits}
		${store credit homepage}= 	Get Text 	${store credits}
		Log		${store credit homepage}
	#Sleep 3
	Wait Until Element Is Visible			${my account button}	
	Mouse Over  class:icon
		${fashion credits}=	Get Text 	${myfashion found}
		Log		${fashion credits}
		Click Element 		${accountinfo button}
	#Sleep 3
	Element Should Be Visible			${profile label}
	#Sleep 3
		${info store}=	Get Text 	${info storecredit}
	Run Keyword If		'${info store}' == '${store credit homepage}'	PASS	ELSE 	FAIL	
		${fashion credits}=	Get Text 	${myfashion found}
	Run Keyword If		'$${fashion credits}' == '${fashion credits}'	PASS	ELSE 	FAIL
	Logout
	