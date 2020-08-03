*** Settings ***
Library  SeleniumLibrary
Library  String
Resource  hw6_Setup_Teardown.robot
Resource  hw6_Login_Logout.robot
Test Setup  Open US JF PROD LOGIN
Test Teardown  Close the browser  


*** Variables ***
${my account button}				xpath://a[@class='icon']
${accountinfo button}				xpath://a[contains(text(),'Account Info')]
${accountinfo section label}		xpath://body[@id='page-profile-account']/div[@id='body']/div/div[@id='my']/div[@id='catalog']/div[@id='filters']/ul/li[1]		
${firstname textbox}				xpath://*[@id="form_input_first_name"]
${jf logo}							xpath://a[@class='jflogo-link']//*[local-name()='svg']

${welcome module}					xpath://div[@id='module_wide']


*** Test Cases ***
Validate name in Account Info site
	Login
	#Sleep 5
	Wait Until Element Is Visible		${welcome module}
	Element Should Be Visible			${my account button}	
	Mouse Over  class:icon
		Click Element 		${accountinfo button}
	Wait Until Element Is Visible		${accountinfo section label}
	${firstname account}= 	Get Text 	${firstname textbox}
	Log	${firstname account}
		Click Element		${jf logo}
	Wait Until Element Is Visible		${welcome module}
	Element Should Contain		//div[@id='greeting'] 	${firstname account}
	#Sleep3
	Capture Page Screenshot
	Logout		

