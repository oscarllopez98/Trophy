# **Trophy**

## **What is Trophy?**

Trophy is an app that allows user to flexibly customize their unique exercises for the best possible insight into their fitness goals. This app reverses the idea that other fitness tracking applications follow — requiring the user to follow data input guidelines, instead of the user providing any form of exercise data to the app.

Example Use Cases:
* Let's say you are a runner preparing for a competitive 5k. Other fitness tracking apps might track data like distance and time. However, you're curious to also track how much effort you put into each run, so that you can better understand how much effort it takes to run a certain time/distance. Trophy allows the standard tracking of distance and time, in addition to allowing you to choose an Intensity attribute, measured as either low, medium, or high. This combination gives you the ability to better understand how your runs truly vary for one another, ultimately giving you deeper insight to your fitness goals.
  
| High Level Architecture Example | Sequence Diagram |
| -------------------- | ----- |
| ![Image for High Level Architecture](https://drive.google.com/uc?export=view&id=1mVap_tXQXA1vTI_9CwIqAa8z30zjqU--)| ![Image for Sequence Diagram](https://drive.google.com/uc?export=view&id=1YRo3cjR1yNt1vLn6Si3GCrTjxWdMHA7K) |

# Table of Contents
- [**Trophy**](#trophy)
  - [**What is Trophy?**](#what-is-trophy)
  - [**Section 0** - _Backend Model + UI Design_](#section-0---backend-model--ui-design)
  - [**Section 1** - _MVVM Implementation + Unit Testing_](#section-1---mvvm-implementation--unit-testing)
  - [**Section 2** - _Dynamic Content + Improved UI_](#section-2---dynamic-content--improved-ui)
  - [**Section 3** - _AWS API Gateway Integration_](#section-3---aws-api-gateway-integration)
  - [**Section 4** - _AWS Lambda Integration_](#section-4---aws-lambda-integration)
  - [**Section 5** - _TrophyRESTAPI Gateway + Lambda Function Development_](#section-5---trophyrestapi-gateway--lambda-function-development)
  - [**Section 6** - _Financial Optimization within AWS_](#section-6---financial-optimization-within-aws)
  - [**Section 7** - _Generative AI Integration_](#section-7---generative-ai-integration)

## **Section 0** - _Backend Model + UI Design_

### Intro
In this section, I focused on designing the fitness application before diving straight into any form of development.
I leveraged tools such as Figma and draw.io to flesh out my Frontend UI and Backend relationships 

I implemented key skills such as: 
- Software Architecure Design (MVVM)
- UML Diagraming
- Model Design
- View Design
- ViewModel Design 


## **Section 1** - _MVVM Implementation + Unit Testing_
### Intro
In this section, I focused on the actual Backend implementation and testing of the MVVM architecture, allowing me to create complex and strong data structures, using Software Engineering best practices and skills.

Best practices and skills such as:
- Separation of Responsibility
- Principle of Least Privilege
- MVVM
- Unit Testing
- Inheritance
- Object-Oriented Programming
- SwiftUI
- Xcode
- Factory Design
- Singleton Design
- Test Driven Development
- Software Engineering
- Git
- Linux

Below is a demo showing off the progress at Section 1

| Demo | Demo Content |
| --- | --- |
| ![Test Alt Text](Trophy/Assets/Videos/ExerciseModalDemo.v1.gif) | This demo shows off our main ContentView (i.e. Homepage), an Exercise Summary Modal, and how Exercises with different attributes will be displayed according to the attributes they possess (e.g. Distance)|


## **Section 2** - _Dynamic Content + Improved UI_
### Intro
In this section, I focused on two topics. 
Firstly, allowing the user the ability to dynamically add Exercises in a UI friendly way. This key feature being implemented allowed absolute flexibility in the Exercise the user would want to create.
Secondly, practicing good UI design through the use of the Coolors.co website for developing proper Color Sets to use within my application.  

Skills Implemented in this Section Include:
- State Management
- Database Management
- Dynamic Content
- Component Design
- Color Sets
- User Input
- Event Handling
- Framework Development

| Demo | Demo Content |
| -------------------- | ----- |
| [Link to Video Demo](https://drive.google.com/file/d/1XLULtfyo_SGpCxH-LduXSWSue9_EKtpH/view?usp=sharing) | This demo not only continues to show off the progress in our ContentView and Exercise Summary Modal, but it demos the user's new ability to add custom Exercises via User Input. This is where the power of the application truly starts to shine|


## **Section 3** - _AWS API Gateway Integration_
### Intro
In this section, I set out to accomplish one goal: Connecting my iOS application to my TrophyRESTAPI hosted in AWS API Gateway.
I approached this by breaking my goal into subgoals:
1. Understand the relationship between iOS and API Gateway
2. Implement a basic API with mock integration typing, so that my application could have API Endpoints to call 
3. Integrate the iOS SDK generated by API Gateway with my iOS application
4. Test that my application was able to call a test TrophyRESTAPI function without failure

**Step 1**
* To understand the relationship between iOS and API Gateway, I followed the official documentation on how to [Use iOS SDK generated by API Gateway for a REST API in Objective-C or Swift](https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-generate-sdk-ios.html).

**Step 2**
* To implement best practices through hands-on experience, I followed an [official AWS tutorial](https://docs.aws.amazon.com/apigateway/latest/developerguide/simple-calc-lambda-api.html).
![Image of API Gateway implementation](https://drive.google.com/uc?export=view&id=1Sk8xj1JHm9TQW8R2LVZJm8AwTk7shGXX)

**Step 3**
* During this step, I installed the iOS SDK using [Cocoapods](https://cocoapods.org/).
* During my Integration Testing, I found that one of my targets (TrophyTests) was unable to access the Pods that were used by Trophy, which would have allowed for my application to make RESTful API calls to my API. This became a brick wall that temporarily halted my development, as I researched for solutions for the error: 'AWSApiGatewayBridge.h' file not found".
![Image of File Not Found error](https://drive.google.com/uc?export=view&id=186y4VZBWNedWsfsEB1aCUONFrx16ZDeP)

* The odd part was that the application would build without any errors, so I narrowed it down to some form of access control issue.
* If the 'file not found' error was my brick wall, Cocoapod's Abstract Targets were my sledgehammer. Implementing the abstract\_target standard practice allowed me to group my targets together, so they both had access to the same Pods that were needed. 
![Image of a demo for how to implement Abstract Targets using Cocoapods](https://drive.google.com/uc?export=view&id=1bEujhh_Fw61ELOhUiq9EHMuXMVzPEjUv)

**Step 4**
* With the heavy lifting out of the way, all that was left to do was to ensure that my TrophyRESTAPI client would successfully be able to make a call to the TrophyRESTAPI test function without receiving any errors in return.
* Fortunately, by mirroring the [iOS API Gateway Developer Guide](https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-generate-sdk-ios-swift.html), I was able to successfully integrate my application with the TrophyRESTAPI.

Skills Implemented in this Section Include:
- AWS API Gateway
- RESTful API
- API Integration
- API Endpoints
- CocoaPods
- iOS SDK for AWS
- Version Control
- Integration Testing
- API Integration Testing
- Dependency Management


## **Section 4** - _AWS Lambda Integration_
### Intro
In this section, I focused on establishing and testing the Request-Response relationship between 3 components:
1. Trophy iOS Application
2. AWS API Gateway
3. AWS Lambda

**Trophy ==> API Gateway**
* Initiate a POST Request containing a payload for values _{a}_,_{b}_, and _{op}_ for API Gateway to route. 
![Image of Trophy REST API call graph metrics.](https://drive.google.com/uc?export=view&id=1yepFE1995EuxuPmJiU6jVfONbZ2OTVy-)

**API Gateway ==> Lambda**
* Transform the request based on the configured integration settings and forward it to AWS Lambda.

**Lambda**
* Perform computations based off of request payload

|Lambda Function Overview|Lambda Test Event Response|
|--|--|
| ![Lambda function overview](https://drive.google.com/uc?export=view&id=1Ma2unio3Vn5AArl9FYF4RtyLbJZGV9N0) | ![Lambda test-response content](https://drive.google.com/uc?export=view&id=12h-OpIxdzSks2cBlHn01JEEXQ48kXSWF)|

**Lambda ==> API Gateway**
* Generate and return a Response based on the outcome of the execution and forward it to API Gateway

**API Gateway ==> Trophy**
* Transform the resposne based on the configured integration settings and forward it to Trophy
![Trophy REST API test logs](https://drive.google.com/uc?export=view&id=1Y_ctkznTN_NMcLDZlJlkcKGPGxowOHZV)

Skills Implemented in this Section:
- Serverless Architecture
- Event-Driven Programming
- RESTful APIs
- API Design
- API Gateway
- API Integration Testing
- API Deployment
- AWS Lambda
- AWS CloudWatch
- Metrics/Monitoring
- Node.js
- Postman

## **Section 5** - _TrophyRESTAPI Gateway + Lambda Function Development_
### Intro
This section is dedicated to outline the development of the primary CRUD functions that will be needed to allow a user to create, retreive, update, and delete Exercises. I broke this goal into 4 tasks:

1. **API Gateway Model Design**
* With Lambda already integrated at a basic level, I could now flesh out a more complex Lambda function to take the next step in my development, but first, I would need to establish how I wanted my Lambda functions to receive Exercise data.
* I designed and implemented 2 API Gateway Models. One for restricting the API caller's Method Request to a specific format, and another for restricting Lambda functions to a specific format for the Method Response.
* This solved the dilemma for ensuring consistent data formatting.     

2. **Lambda & Layer Design**

My next task was to design the code that would operate as a data-processing facilitator to my RDS database tables.
My biggest obstacle here was answering the following questions:
  a) How do I ensure my CRUD functions remain modular/independent of one another?
  b) How can I avoid bloat in my code, such that I do as little duplication of code as reasonably possible?
  c) How can I do both of the prior, if my CRUD functions all share a need for connecting with the database, but I don't want to want to create a single Lambda function that handles all the CRUD operations? 
* My solution was Lambda Layers. Layers allowed me to write code once and upload it via the Lambda console, and easily import the code into a single Lambda function. Layers answered my question such that:
  * Each CRUD function could operate independently
  * Coding Layer code such as database connections, CRUD functions, and validation code could be coded once and simply added to my Lambda function. If I needed to update the Layer code, I would only have to do it in one location, and I would only need to ensure I am using the latest version of my Layer!
![Lambda Layers](https://drive.google.com/uc?export=view&id=1pnQfM7zH_UeLBg7FaP0QnUHf8PhQ3MWU)

3. **Lambda & Layer Development**

This section was fairly straightforward in the sense that I knew what my data looked like coming into Lambda, and I knew what my data needed to look like for storing the SQL tables.
The biggest concerns included: Security, QA-minded Development, and Developing "Bottom-Up" 
* Security
    * Concern: Up to this point, I had been using Lambda environment variables to store DB credentials. However, that would be bad security practice and not scalable for the long term.
    * Solution: I integrated Secrets Manager, such that I retrieved my database credentials safely. This would also facilitate scalability, as future Lambda functions could simply reference that same Secret if needed.
* QA-minded Development
    * Concern: As a former QA Engineer, I understand how much easier it can be when the code that you are testing:
        a) Is well commented (e.g. function comments)
        b) Error Handleds well (e.g. Custom error messages with detailed error response output)
    * Solution: As I developed, I ensured an ease of future debugging through:
        a) Function Comments
            * I leverage OpenAI's ChatGPT to outline many function comments for me, saving me time and ensuring my functions' purpose were able to be quickly understand, and the requirements/parameters were specifically outline
        b) Error Handles
            * Creating an Error file containg constant variables that would describe the issue found at a high level (e.g. ERROR_INVALID_JSON_FORMAT = "Invalid JSON format"). This helped me quickly narrow down on what the overall cause of the issue was.
            * Creating several Validation functions that would output all Errors found during a JSON object's validation process. This cut down on filtering for reasons for why a function was not behaving as I intended.
* Developing Bottom-Up:
    * Concern: In order to create an Exercise, a user would very likely use Exercise Attributes to describe features of their Exercise(e.g. Distance, Time, Weight). I wanted to develop in a manner such that if any bugs were found during development, they were easily managed
    * Solution: I developed and unit tested starting from the smallest form of data and worked my way up. 
        * I think of this structure as working in a binary tree, but starting from the bottom of the tree and working our way up breadth-wise.
        * This development process ensured that components needed from a parent component would be available during the parent's component development

4. **Test, Test, Test...**

In this task, I needed to validate edge cases, improper inputs, and various scenarios that could occur during the life of the app relating to Exercise CRUD operations using the following JSONs.

| Exercise JSON | Updated Exercise JSON |
| --- | --- |
| ![Test Exercise JSON](https://drive.google.com/uc?export=view&id=1hae8PeeBNhCliIYORdCs4VKaSfN_JYv-) | ![Test Updated Exercise JSON](https://drive.google.com/uc?export=view&id=1ouy03EOt_5W8cSWNT3L4gROJ6VTE7TSY) |

_Create Exercise_
  * Concerns: Ensuring that data entered by a user for an Exercise creation would be handled as expected.
  * Solutions: To ensure proper Creation, below are some scenarios tested
      * User creates an Exercise with all JSON properties filled
      * User creates an Exercise with no JSON properties filled
      * User creates an Exercise with no Exercise Attributes attached
      * User creates an Exercise with missing data required for database storage
![Logs Create Exercise](https://drive.google.com/uc?export=view&id=1MltI_Wwy1JWTvZdBs9hm6KK7-cMnIeYu)

_Retrieve Exercise_
  * Concerns: Ensuring that data entered into the SQL table would be retrieved as expected from the user.
  * Solutions: To ensure proper Retrieval, below are some scenarios tested
      * User retrieves an Exercise with a valid exercise\_id
      * User retrieves an Exercise with an invalid exercise\_id
      * User retrieves an Exercise with valid NULL field values
      * User retrieves an Exercise with no NULL field values
![Logs Retrieve Exercise](https://drive.google.com/uc?export=view&id=1lXN5uyCZ5LpAal7ciG5cGjsrgGJyYkX_)

_Update Exercise_
  * Concerns: Ensuring that data entered by a user for an Exercise update would be handled as expected.
  * Solutions: To ensure proper Updating, below are some scenarios tested
      * User updates an Exercise with completely new data
      * User updates an Exercise with the exact same data
      * User updates an Exercise from no Exercise Attributes with Exercise Attributes
      * User updates an Exercise from Exercise Attributes with Exercise Attributes
      * User updates an Exercise with missing data required for database storage

| Exercise Attribute Update | Exercise Update Summary |
| --- | --- |
| ![Logs Update Exercise 2](https://drive.google.com/uc?export=view&id=1xPp0zSIXJ0ZHDUxJc7wy1Bx08hkLlJKF) | ![Logs Update Exercise 3](https://drive.google.com/uc?export=view&id=1BOaZS70B8milbquQONw0OjszlOsoSk0k) |

_Delete Exercise_
  * Concerns: Ensuring that existing data deletes as expected
  * Solutions: To ensure proper Deletion, below are some scenarios tested
      * User deletes an Exercise with a valid exercise\_id
      * User deletes an Exercise with an invalid exercise_\id
      * User deletes an Exercise, all associated Exercise Attributes are Deleted
            
| Exercise Attributes to Delete | Exercise Attribute + Exercise Deletion Statuses |
| --- | --- |
| ![Logs Delete Exercise](https://drive.google.com/uc?export=view&id=1HNFKEKH0jNjNKzak3OhL42N_4LH-RTyF) | ![Logs Delete Exercise 2](https://drive.google.com/uc?export=view&id=1uMxkwQQ4VxZL9hAH-o69vbajzw4_CXna) |


Skills Implemented in this Section:
- API Design
- API Gateway
- API Integration Testing
- AWS Lambda/Lambda Layers
- AWS CloudWatch
- AWS Secrets Manager
- Metrics/Monitoring
- Networks
- SQL/MySQL
- JavaScript
- Test-Driven Development/QA/Unit Testing
- Component Design
- Security Groups
- EC2
- VPC

## **Section 6** - _Financial Optimization within AWS_
### Intro
In this section, I will touch on my journey of financial optimization within AWS, starting from the revelation of unexpectedly high costs, followed by the identification of areas for reduction, and finishing in the implementation of targeted strategies to alleviate excessive expenditures and reshape my AWS cost structure.

**High Costs Detected**
* During my development, I found that my costs had exceeded what I was comfortable spending on a personal project per month.
* Below is the bill I received from AWS that sparked my attention:

![Image of Bill](https://drive.google.com/uc?export=view&id=1WECaRvzLDcg47rjidcRnvW99HRaKG3A1)

**Areas for Reduction**
* Through analyzing this bill, I found that my major concerns were with the following billed-areas:
    1. RDS
    2. VPC
    3. EC2-Other
    
** Cost Reduction **
* Relational Database Service (RDS)
    * For this service, Amazon RDS Proxy was contributing to 59.8% of my RDS cost (~23.8% of my **total** costs)
    * I initially used a Proxy for connection pooling and scalability. After determining that although those benefits are great for development and the longevity of my application, it was not a concern for my immediate or near-future development. So, this service was ultimately removed entirely.
* Virtual Private Cloud (VPC)
    * For this service, 82.3% of my VPC costs (~30.2% of my **total** costs)
    * During analysis, I came to 2 conclusions:
        1. I had created an extra VPC during my developing, and I had been using that instead of the default VPC available to me by AWS
        2. I could opt for a public database that leverages safety principles AWS offers (e.g. Secrets Manager, Principle of Leaste Privilege, etc.)
    * Ultimately, I decided to remove the extra VPC
* Elasic Compute Cloud 
    * For this service, the entire service was not needed and contributed 22.7% of my **total** costs
    * The reason for such an expense was caused by a NATGateway that was completely unused, and was therefore removed entirely until it's needed for future development
* Conclusion
    * I was able to eliminate ~76.7% of my total costs through these analyses

**New Cost Structure**
* Below are the daily expenses graphs before and after cost restructure

| Before Cost Reduction | After Cost Reduction |
| -- | -- |
| ![Image of Expenses Before Reduction](https://drive.google.com/uc?export=view&id=1ZA5p0vAzdnr8BWX1wZJwQ6VAEj-tlAYq) | ![Image of Expenses After Reduction](https://drive.google.com/uc?export=view&id=1ZYhHhPwi-w9ItZxbdpLUIXa2rs6jBxVt) |

Skills Implemented in this Section
* Cost Analysis and Optimization
* AWS Service Management
* Infrastructure as Code (IaC)
* Problem-Solving and Decision Making
* Documentation and Communication
* Monitoring and Performance Analysis
* Security Best Practices
* Data Visualization
* 

## **Section 7** - _Generative AI Integration_
### Intro
This section is currently in development. Implementing a generative AI solution will allow user's to quickly create Exercises through text/voice-to-text input. For example, the user uses voice-to-text to input "I just ran 5 kilometers for 25 minutes and 30 seconds. Name the exercise 'My 5k'". Trophy will leverage generative AI to extract key data and create a JSON structured Exercise via my existing RESTful API like in Section 5, Step 4. Steps in this section include the following:
1) Analyze generative AI solutions to determine which is suitable for generating templated JSON data via text input (e.g. GPT-4o)
2) Implement new Lambda function(s) to manage connection between Trophy API - AI Model - Data Processing Lambda Functions
3) Implement new REST methods to allow Trophy to call the implemented new Lambda function(s)
