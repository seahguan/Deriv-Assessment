@echo off
cd C:\Users\ASUS\Documents\Automation\DerIv-Assessment\
call robot -d DerIv-Assessment/Results/WEB -v BROWSER:edge Tests/WEB/TestScenario1.robot
call robot -d DerIv-Assessment/Results/API Tests/API/TestScenario3.robot
