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
${prd grid review}					xpath://div[@class='scroll_content']//div[1]//div[1]//div[3]//div[1]//span[1]
${read review link}					xpath://span[@class='pdp-review-overview-link']
${reviews pdp}						xpath://span[@class='pdp-review-overview-count']

*** Test Cases ***
Verify rating/reviews are matched on grid & PDP if it is available on the grid 
	Login
	#Sleep 3
	${check_element}=  Run Keyword and Return Status   Wait Until Page Contains Element    ${shoes shopnav}    10s
	Run Keyword If      '${check_element}' == 'True'     Click Element  ${shoes shopnav}
	#Sleep 3
	Wait Until Element is Visible			${grid firstitem}
	${grid review text}= 	Get Text 	${prd grid review}
	Log		${grid review text}
		Click Element 		${grid firstitem}
	#Sleep 3
	${checking element}=  Run Keyword and Return Status   Wait Until Page Contains Element    ${reviews pdp}	10s
	${reviews text}=		Get Text 	${reviews pdp}
	Log		${reviews text}
		Run Keyword If		'${grid review text}' == '${reviews text}'	PASS	ELSE 	FAIL
	Logout
		
	
	
	
	
	