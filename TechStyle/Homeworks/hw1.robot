*** Settings ***
Library  SeleniumLibrary    

*** Variables ***


*** Test Cases ***
Open Browser and Sleep
		Open Browser  https://www.shoedazzle.com/login  chrome
		#Sleep3

Wait until element is present and sleep
		Wait Until Element Is Visible   xpath=//a[@class='Button__ButtonElement-sc-10x0nm1-0 cMnmwT']
		Click Element   xpath=//button[@class='Button__ButtonElement-sc-10x0nm1-0 cMnmwT']
		#Sleep3
		
Validating if the label "That doesn't appear to be a valid email address." is present
		Wait Until Page Contains   That doesn't appear to be a valid email address.
		#Sleep3
		
Close the browser
		Close Browser
		Log  Success!

