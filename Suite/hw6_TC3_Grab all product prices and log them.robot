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
${label price}					xpath://*[@class="details-block "]//div[@class="price"]



*** Test Cases ***
Grab all product prices and log them.
	Login
	Wait Until Element Is Visible		${welcome module}
	#Sleep5
	Wait Until Element Is Visible			${clothing shopnav}
		Click Element		${clothing shopnav}
	#Sleep5
	Wait Until Element Is Visible			${itemsamount label}
		${present}=    Run Keyword And Return Status    Page Should Contain Element   ${itemsamount label}
	Capture Page Screenshot
	#Sleep 5
	@{locators}=   Get Webelements   ${label price}
	 @{result}=   Create List
	 : FOR    ${locator}    IN    @{locators}
	 \    ${price}=    Get Text    ${locator}
	 \    Log     ${price}
	 \    Append To List   ${result}    ${price}
	 Log   ${result}
	 Logout	