*** Setting ***
Library  SeleniumLibrary


***Variables***
${homelogo}        xpath://a[contains(text(),"ShoeDazzle - Women's Shoes, Boots, Bags & Clothes")]
${siginlink}       xpath://a[@class='signin-link login_modal_trigger']
${loginpopup}      xpath://div[@class='login-main login-lightbox-pane show']
${user_textbox_popup}        xpath://input[@id='reference_data']  
${password_textbox_popup}    xpath://input[@id='verification_data']

${user email}  	    ramon_ccpa3@test.com
${user password}	test123

${signin_button_popup}       xpath://form[@id='loginForm']//div//div//div[contains(text(),'Sign In')]
${myaccount_button}          xpath://i[@class='fontello icon-user-sd']
${logout_button}             xpath://a[@id='top_nav_sign_out_link']



*** Keywords ***
LoginHOME
    Open Browser    url=https://www.shoedazzle.com/  browser=chrome
	Maximize Browser Window
    Wait Until Element Is Visible			${homelogo}
	#Sleep3
	
	Wait until element is visible            ${siginlink}
	Click Link        ${siginlink}
	Wait until element is visible        ${loginpopup}
	#sleep3
	
	Element should be visible        ${user_textbox_popup}
    Input text    ${user_textbox_popup}    ${user email}	
    Element should be visible        ${password_textbox_popup}
    Input text    ${password_textbox_popup}    ${user password}
    #Sleep3
    
    Element should be visible        ${signin_button_popup}
    Click element        ${signin_button_popup}
    #sleep3
    
    Wait until element is visible        ${myaccount_button}
    Capture page screenshot
    

OktaLogin
    Open Browser    url=https://www.shoedazzle.com/debug    browser=chrome
    #sleep 3
    Go to    https://www.shoedazzle.com/debug
    
    


LogoutNORMAL
    Wait until element is visible		${myaccount_button}	
	Mouse over        ${myaccount_button}
	#Sleep3
	Wait until element is visible         ${logout_button} 
	Click element        ${logout_button} 			