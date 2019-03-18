# Test Automation Repository


This repository is meant for Realyr QA Automation Test.

Project has some additional unused dictinories and script files. These are added to give the view of an actual full fledged automation framework which has the capability and felxibility to extend for automation on muliple applications.


## Project layout
Project structure is divided into eight main layers which will be explained further in the following lines:

- Configuration
- Data
- Docker
- Documentation
- Python_src
- Resources
- Results
- Tests

## Technical details

- Automation          : Rest API
- Tool                : Robotframework (requests library for rest API testing)
- Scripting language  : Robot
- Supporting language : Python

## Implementation included

- BDD (gherkin style)
- Docker configuration
- Automated documentation
- Logging
- HTML reporting
- Version control

## Prerequisites

- Project has been developed on python 3.4.2 interpreter. python 3+ is most preferable to have to execute the tests
  download python - https://www.python.org/downloads/
- Two simple packages need to be installed from command line using pip
  1. pip install robotframework==3.1.1
  2. pip install robotframework-requests  
That's it python + robotframework + robotframework-requests, these are enough to run the API tests

## Running the tests

Robot Framework test are executed by giving the path to the file or directory in question.
- The path can be absolute or, more commonly, relative to the directory where tests are executed from.
- The given file or directory creates the top-level test suite.

To run test execute the following commands:

    robot  -d [results path]  [Path test]
	
- Running from command line (Best approach)
  - Step 1 : cd ${path of Realyr_Automation_framework}$
  - Step 2 : robot -d results Tests/API/Rest

- Running with argument file included
  - Step 1 : cd ${path of Realyr_Automation_framework}$
  - Step 2 : robot -A Configuration/arguments_file.txt Tests/API/Rest

- Runing through docker container
  - Step 1 : open bash/powershell
  - Step 2 : go to project folder - cd ${path of Realyr_Automation_framework}$
  - Step 3 : go to Dockerfile location - cd Docker
  - Step 3 : Build docker - Docker build -t robotdocker:your_tag
  - Step 4 : Run docker container - docker run -v /absolute_path_to_your_reports_folder/:/opt/robotframework/reports -v $PWD/:/opt/robotframework/project/ robotdocker:your_tag

### Project Structure:

    - Root\
        - Configurations\
            - config_env.py
            - Data_...
        - Data\
            - API\
                - ConfigurationFiles\
                    - Local_Arguments.txt
                    - ...
                - JsonFiles\
                - ResourceFiles\
        - Docker\
            - bin\
                - docker-entrypoint.sh
                - ...
            - Dockerfile.txt   
        - Documentation\
            - Resources\
                - API\
                    - Rest\
		        - Version\
			    - api_name.html
			    - ..
            - Tests\
                - API\
                    - Rest\
                        - test_name.html
			- ..
            - Robotframework\
                - bultin.html
                - ..				
            - Documentation.sh
        - Python_src\
		    - <python_file_1>.py
		    - ..
	- Resources\
            - API\
                - Rest\
		    - Version#\
		        - api_name_1.roobot
	            - api_collection.robot 
        - Results\
	    - log.html
	    - output.html
            - report.html
	- Tests\
            - API\
	        - Rest\
		    - api_name_1.roobot


##### Data:
This section contains all required data related to the execution of the testcases.
The Data section should be divided among the applications for which it will be applied. For Example Json and XML files for API testing will go under API subfolder in Dat.

  
Structure for this section:

        - Data\
            - API\
                - ConfigurationFiles\
                    - Local_Arguments.txt
                    - ...
                - JsonFiles\
                - ResourceFiles\
			- Web\
			    - ..
    
##### Documentation:
To generate documentation for this project run the following script, Documentation.sh. Below test documentation are included

1. Resource documentation
2. Keyword documentation
3. Robotframework documentation
4. Test documentation

Structure for this section:

    - Documentation\
        - Resources
            - Documents...
        - Robotframework
            - Documents...
        - Tests
            - Documents...
        - Documentation.sh


##### Resources:
This section will be designed with a API object pattern(API)/Page Factory pattern(web) to divide functionalities among framework and applications
It will be divided with the following structure (text between parenthesis are only examples for reader reference):

Structure for this section:

    - Resources\
        - API\
            - REST\
                - (VERSION)\
                    - api_name_1.robot
                    - api_name_2.robot
                    - ...
        - DB\
            - Level\
                - (VERSION)\
                     - DB_Commons.robot
                     - DB_...
        - Web\
            - APP_1\
                 - (VERSION)\
                     - APP_Login.robot
                     - APP_...
            - APP_2\
                - (VERSION)
                    - APP_Login.robot
                    - APP_...
        
##### Tests:

Structure for this section:

    - Tests\
        - API\
            - Regression\
                - Test...
            - Smoke_\
                - Test...
            - Smoke_\
                - Test...
            - ...
        - Web\
            - Regression
                - Test...
            - Smoke_\
                - Test...
            - Smoke_\
                - Test...
        - DB\
            - Regression
                - Test...
            - Smoke\
                - Test...
            - Smoke\
                - Test...
        - (Client)\...

###### Robot scripting best practices implemented in the framework:
        - User keywords are unique, space separated words, follows 'Pascal Casing Style'
	- Documentation mandatory for each keywords
	- Folders name follows 'Pascal Casing Style' and Under_Score seprated
	- robot/python files names are lower case, under_score separated
	- 4 spaces between columns
	- 2 spaces betwen sections in resource and test files
	- Suite setup and teardown mandatory for every test file
	- varible, list, disctionary variable names are small letters and under_score seperated
	- Resulable keywords are created in 'Common' folder
	- Docmentation for test cases in not recomded, as they are alredy in gherkin style
	- .Py files are created in python_src directory
	- Global variables are listed in Configurations/config.ini file
	- Global vaiables are lower case, starting with _under_score
	
