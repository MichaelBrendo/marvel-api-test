# Marvel api test.

## How to run the test
```bash
#All with report
robot -d ./logs/ specs

#Specific with report
robot -d ./logs/ specs/CreateCharacters.robot

#All with Allure report
robot -d ./logs/ --listener allure_robotframework specs
```

***

## Original report

```bash
#Original report
xdg-open logs/report.html
```

***

## Allure report
Node js and java required

```bash
#Install allure-cli
npm install allure-commandline -g

#Check installation
allure --version

#Start Allure reporting server
allure serve output/allure
```

***

## Tecnology:
- [Python](https://www.python.org/)
    - [Bson](https://pypi.org/project/bson/)
    - [Faker](https://faker.readthedocs.io/en/master/)
- [Robot Framework](https://robotframework.org/)
    - [Python Requests Library](https://github.com/MarketSquare/robotframework-requests#readme)
- [Allure Framework](https://github.com/allure-framework/allure-python/tree/master/allure-robotframework)
- [Nodejs](https://github.com/nodesource/distributions/blob/master/README.md)
- [Jabba/Java](https://github.com/shyiko/jabba)
- [VSCode](https://code.visualstudio.com/)
    - Extensions:
        - Robot Framework Intelisense
        - Robot Framework Formatter