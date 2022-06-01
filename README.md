# Introduction

This is a repo of API testing using RobotFramework.

My GitHub account: https://github.com/kozlovartemq/

# Files

**/Resources**
- keywords.resource – a resource file that contains variables and keywords.

**/Results** – a results directory.
- log.html
- output.xml
- report.html

**/Tests** – a directory that contains test cases.
- tests_APIDocumentation.robot
- tests_BasePages.robot

**requirements.txt** – requirements file.

# How to run

1. Install all requirements:

```bash
pip install -r requirements.txt
```

2. Run tests:

```bash
robot -d Results Tests
```