*** Settings ***
Library  SeleniumLibrary
Library  String
Resource  hw5_Setup_Teardown.robot
Resource  hw5_Login_Logout.robot
Test Setup  Open US JF PROD Browser
Test Teardown  Close the browser  


*** Variables ***
${myaccount label}					xpath://a[@class='icon']
${faq link footer}					xpath://*[@id="__next"]/div/div/footer/div/nav/div[3]/ul/li[3]/a	
${faq us url}						https://support.justfab.com/hc/en-us
${faq jf logo}						xpath://html/body/div[1]/div[1]/header/div/div/form/input[3]
${faq vip membership work link}		xpath://*[@id="category-tree"]/section/div/div/div/section[2]/ul/li[5]/a											
${vip membership work label}		xpath:/html/body/div[1]/div[2]/main/div/div/div[2]/div[2]/article/header/h1/span


*** Test Cases ***
Go to Loggedinshell validating FAQ link is displayed
	Keyword Login
	Wait Until Element Is Visible			${myaccount label}
	Go to			https://www.justfab.com/loggedinshell
	Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
	Element Should Be Visible 			${faq link footer}
	#Sleep3
		Click Link			${faq link footer}
		
Validating FAQ correct URL
	Wait Until Element Is Visible			${faq jf logo}
	#Sleep3
	${url}    Get Location
    Should Match Regexp    ${url}    ${faq us url}
	
Validating FAQ VIP Membership Price
	Element Should Be Visible		${faq vip membership work link} 
	Click Link		${faq vip membership work link}
	Wait Until Element Is Visible	${vip membership work label}
	#Sleep5
	Element Should Contain    //p[contains(text(),"Each month, you'll receive a new boutique with sty")]	   $39.95
	Keyword Logout