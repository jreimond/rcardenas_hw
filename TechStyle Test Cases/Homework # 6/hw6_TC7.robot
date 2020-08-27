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
${shoes shopnav}					xpath://*[@id="logged-in-header-nav"]/ul/li[4]/a
${grid firstitem}					xpath://body//div[@class='product_grid_container']/div[@class='scroll_content']/div[1]
${first product grid name}			xpath://div[@class='scroll_content']//div[1]//div[1]//div[1]//a[1]
${product pdp label}				xpath://*[@id="body"]/div/div[3]/div[1]/h1

*** Test Cases ***
Verify user navigated to the product they clicked on grid verifying product name
	Login
	#Sleep 3
	${check_element}=  Run Keyword and Return Status   Wait Until Page Contains Element    ${shoes shopnav}    10s
	Run Keyword If      '${check_element}' == 'True'     Click Element  ${shoes shopnav}
	#Sleep 3
	Wait Until Element is Visible			${grid firstitem}
	${name product}= 	Get Text 	${first product grid name}
	Log		${name product}
		Click Element 		${grid firstitem}
	#Sleep 3
	Wait Until Element is Visible 			${product pdp label}
	${name product pdp}= 	Get Text 	${product pdp label}
	Log		${name product pdp}
	#Sleep 3
		Run Keyword If		'${name product}' == '${name product pdp}'	PASS	ELSE 	FAIL
	Logout	
	