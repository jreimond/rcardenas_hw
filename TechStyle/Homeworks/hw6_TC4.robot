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
${clothing shopnav}				xpath://*[@id="logged-in-header-nav"]/ul/li[5]/a
${itemsamount label}			xpath://span[@class='results-count']
${grid table}					xpath://div[@class='scroll_content']
${shipandterms link}			xpath://a[contains(text(),'Shipping & Returns')]
${shipandterms label}			xpath://div[@class='header']
${shipping table info}			xpath://table[@class='apo-fpo']


*** Test Cases ***
Verify shipping termsed
	Login
	Wait Until Element Is Visible		${welcome module}
	#Sleep5
	Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
	Page Should Contain Element     ${shipandterms link}
		Click Element		${shipandterms link}
	#Sleep5
	Wait Until Element Is Visible    ${shipandterms label}
		${ispresent}=    Run Keyword And Return Status    Page Should Contain Element   ${shipping table info}
	Capture Page Screenshot
	#Sleep 5
	Logout
	