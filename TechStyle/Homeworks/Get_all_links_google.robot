*** Settings ***
Library  SeleniumLibrary
Library  Collections


*** Variables ***



*** Test Cases ***
Open browser and maximize
    Open Browser  url=https://www.amazon.com.mx/  browser=chrome
	Maximize Browser Window
	#Sleep3
	
Type Iphone 11, click search button
    Input text  id=twotabsearchtextbox  Iphone 11
    Click Button  xpath=//div[@class='nav-search-submit nav-sprite']//input[@class='nav-input']
	Wait Until Element Is Visible   xpath=//li[@class='a-normal']//a[contains(text(),'2')]
	#Sleep3
	
    ${AllLinksCount}=    Get Matching Xpath Count    //a
    Log    ${AllLinksCount}
    
    @{LinkItems}    Create List
	
    Comment    Ciclo que va entre todos los links y guarda los links que tienen mas de un caracter
    FOR    ${INDEX}    IN RANGE    1    ${AllLinksCount}
    \    Log    ${INDEX}
    \    
    \    ${lintext}=    Get Text    xpath=(//a)[${INDEX}]
    \    Log    ${lintext}
    \    
    \    ${linklength}    Get Length    ${lintext}
    \    Run Keyword If    ${linklength}>1    Append To List    ${LinkItems}    ${lintext}
    ${LinkSize}=    Get Length    ${LinkItems}
    Log    ${LinkSize}
    
    Comment    Print all links
    FOR    ${ELEMENT}    IN    @{LinkItems}
    \    Log    ${ELEMENT}

    Close Browser