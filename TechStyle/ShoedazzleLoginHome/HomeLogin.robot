*** Setting ***
Library   SeleniumLibrary
Resource  KeywordsLoginLogout.robot


*** variables ***
${useraccount email}            ramon_ccpa3@test.com
${useraccount password}			test123


*** Test Cases ***
Validate Home Login
    Login
    Logout
	Close browser	
