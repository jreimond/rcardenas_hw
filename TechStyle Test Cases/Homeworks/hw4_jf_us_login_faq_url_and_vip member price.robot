*** Settings ***
Library  SeleniumLibrary
Library  String


*** Variables ***
${useraccount vip}  				ramon_ccpa3@test.com
${useraccount vip pw}  				test123

${memberlogin label}				xpath://span[contains(text(),'Member Login')]
${email textbox}					xpath://input[@id='id-11']
${password textbox}					//input[@id='id-13']	
${login button}						xpath:///*[@id="__next"]/div/div/div[1]/main/section[1]/section/form/div[5]/button
${myaccount button}					xpath://a[@class='icon']

${faq link footer}					xpath://*[@id="__next"]/div/div/footer/div/nav/div[3]/ul/li[3]/a	
${faq search textbox}				xpath://input[@id='query']
${faq question label}				xpath://div[contains(text(),'What can we help you with?')]
${faq vip member price}				xpath://a[contains(text(),'How does the VIP membership work?')]
${faq us url}						https://support.justfab.com/hc/en-us
${faq jf logo}						xpath://html/body/div[1]/div[1]/header/div/div/form/input[3]
${faq vip membership work link}		xpath://*[@id="category-tree"]/section/div/div/div/section[2]/ul/li[5]/a											
${vip membership work label}		xpath:/html/body/div[1]/div[2]/main/div/div/div[2]/div[2]/article/header/h1/span




*** Test Cases ***
Open browser and maximize
	Open Browser    url=https://www.justfab.com/login  browser=chrome
	Maximize Browser Window
	#Sleep3
	
	
Log In Successfully
	Wait Until Element Is Visible 			${memberlogin label}
	Input Text			${email textbox}   ${useraccount vip}
	Input Text			${password textbox}	 ${useraccount vip pw}
	#Sleep3
		Click Button			${login button}					
	
	
Go to Loggedinshell and validate FAQ link is displayed
	Wait Until Element Is Visible			${myaccount button}
	Go to			https://www.justfab.com/loggedinshell
	Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
	Element Should Be Visible 			${faq link footer}
	#Sleep3
		Click Link			${faq link footer}
		
Validating FAQ correcr URL
	Wait Until Element Is Visible			${faq jf logo}
	#Sleep3
	${url}    Get Location
    Should Match Regexp    ${url}    ${faq us url}
	
Validating FAQ VIP Membership Price
	Click Link		${faq vip membership work link}
	Wait Until Element Is Visible	${vip membership work label}
	#Sleep5
	Element Should Contain    //p[contains(text(),"Each month, you'll receive a new boutique with sty")]	   $39.95
	
			
	
Close the browser
		Close Browser
		Log  Success!	