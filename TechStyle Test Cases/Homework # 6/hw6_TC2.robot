*** Settings ***
Library  SeleniumLibrary
Library  String
Library  Screenshot
Resource  hw6_Setup_Teardown.robot
Resource  hw6_Login_Logout.robot
Test Setup  Open US JF PROD LOGIN
Test Teardown  Close the browser  


*** Variables ***
${welcome module}				xpath://div[@id='module_wide']
${clothing shopnav}				xpath://*[@id="logged-in-header-nav"]/ul/li[5]/a
${itemsamount label}			xpath://span[@class='results-count']
${clothing grids}				xpath://div[@class='scroll_content']
${grid delimiter}				xpath://div[@class='product_grid_container']//div[1]//div[101]
${page count}					xpath://div[@class='product_grid_container']//div[1]//div[101]//span[1]



*** Test Cases ***
Validate product grid and verify amount of products displayed
	Login
	Wait Until Element Is Visible		${welcome module}
	#Sleep5
	Wait Until Element Is Visible			${clothing shopnav}
		Click Element		${clothing shopnav}
	#Sleep5
	Wait Until Element Is Visible			${itemsamount label}
		${ispresent}=    Run Keyword And Return Status    Page Should Contain Element   ${itemsamount label}
	Capture Page Screenshot
	#Sleep 5
		${count}=    Get Element Count		//div[@class='grid_product_item item large ']
		Log 		${count}
	Run Keyword If	${count} == 100	 GetElements	ELSE	TEST FAIL
	Logout	
	