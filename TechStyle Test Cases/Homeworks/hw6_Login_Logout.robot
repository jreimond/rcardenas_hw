*** Setting ***
Library  SeleniumLibrary

*** variables ***
${useraccount email}  					ramon_ccpa3@test.com
${useraccount password}					test123

${useraccount email credits}  			JFUS1@test.com
${useraccount password credits}			test123

${memberlogin label}				xpath://span[contains(text(),'Member Login')]
${email textbox}					xpath://input[@id='id-11']
${password textbox}					xpath://input[@id='id-13']	
${login button}						xpath://div[@class='LoginForm__ButtonWrapper-sc-1k88zse-8 iYJSAI']//button[@name='action']
${my account button}				xpath://a[@class='icon']
${logout button}					xpath://a[contains(text(),'Log Out')]
${JF label home}					xpath://a[@class='jflogo-link']
${clothing shopnav}					xpath://*[@id="logged-in-header-nav"]/ul/li[4]/a
${grid firstitem}					xpath://body[@class='en_US logged_out page-shopping']/div[@class='logged_out']/div[@class='selections']/div[contains(@class,'region shopping smart')]/div/div[@class='selections']/div[@class='product_grid_container']/div[@class='scroll_content']/div[1]

*** Keywords ***
Login
	Wait Until Element Is Visible 			${memberlogin label}
	Input Text			${email textbox}   ${useraccount email}  
	Input Text			${password textbox}	 ${useraccount password} 
	#Sleep3
		Click Button			${login button}	
		
Logout
	Element Should Be Visible			${my account button}	
	Mouse Over  class:icon
	Click Element 		${logout button}
	
PRESENT
	Log     Element Present!!!

NOT PRESENT
	Log     Element NOT Present!!!
	
GetElements
	${count}=    Get Element Count		//div[@class='grid_product_item item large ']
	Log 		${count}
	
ScrollDown
		Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
				

PASS
	Log 		Test Pass!!!


TEST FAIL
	Log 		Test Fail!!!
	

PDP
	${check_element}=  Run Keyword and Return Status   Wait Until Page Contains Element    ${clothing shopnav}    10s
	Run Keyword If      '${check_element}' == 'True'     Click Element  ${clothing shopnav}
	#Sleep5
	Wait Until Element is Visible			${grid firstitem}
		Click Element 		${grid firstitem}
	#Sleep5
	

LoginTwo
	Wait Until Element Is Visible 			${memberlogin label}
	Input Text			${email textbox}   ${useraccount email credits}  
	Input Text			${password textbox}	 ${useraccount password credits} 
	#Sleep3
		Click Button			${login button}	