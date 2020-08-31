*** Settings ***
Library  SeleniumLibrary
Library  String
Library  Screenshot
Library    Collections
Resource  hw6_Setup_Teardown.robot
Resource  hw6_Login_Logout.robot
Test Setup  Open US JF PROD HOME
Test Teardown  Close the browser
 

*** Variables ***
${button atb}						xpath://*[@id="join_btn"]
${login modal}						xpath://div[@class='jf-ssModal']
${loginmodal email}					xpath://input[@id='ssaEmail']
${loginmodal password}				xpath://input[@id='ssPass']
${loginmodal dropdown}				xpath://select[@id='customer_referrer_id']
${useraccount email}  				ramon_202023077@test.com
${useraccount password}  			test123
${other ddown option}				xpath://option[contains(text(),'Other')]
${loginmodal continue}				xpath://input[@id='ssaSubmit']


${email resto}					@test.com
${my account button}			xpath://a[@class='icon']
${accountinfo button}			xpath://a[contains(text(),'Account Info')]
${detail page body}				xpath://body[@id='page-product-detail']
${window checkout}				xpath://*[@id="atc-content"]
${window x button}				xpath://*[@id="atc-modal"]/button
${emailinfo}					xpath://*[@id="span_change_email_address_current_email"]



*** Test Cases ***
Verify details provided during quiz/registration matches in My profile page
	PDP
	Capture Page Screenshot
	Wait Until Element Is Visible 			${button atb}
		Click Button			${button atb}
	#Sleep5
	Wait Until Element Is Visible    ${login modal}
	#Sleep5
	${random_email}=    Generate Random String    12    [LOWER]
		Input Text			${loginmodal email}   ${random_email}${email resto}
			Log		${random_email}
		Input Text			${loginmodal password}   ${useraccount password}
	Element Should Be Visible			${loginmodal dropdown}	
	Element Should Be Visible 			${other ddown option}
		Click Element 		${other ddown option}
	Element Should Be Visible			${loginmodal continue}
		Click Element 		${loginmodal continue}
	#Sleep5
	${check_element}=  Run Keyword and Return Status   Wait Until Page Contains Element    ${window checkout}    10s
	Run Keyword If      '${check_element}' == 'True'     Click Element  ${window x button}
	#Sleep5
	Wait Until Element Is Visible			${my account button}	
	Mouse Over  class:icon
		Click Element 		${accountinfo button}
	#Sleep5
	Wait Until Element Is Visible			${emailinfo}
		${email account}= 	Get Text 	${emailinfo}
		Log		${email account}
	#Sleep#5
	Run Keyword If		'${random_email}${email resto}' == '${email account}'	PASS	ELSE 	FAIL
	Logout