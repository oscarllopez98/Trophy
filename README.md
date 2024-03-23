# **Trophy**

## **What is Trophy?**

Trophy is an app that allows user to flexibly customize their unique exercises for the best possible insight into their fitness goals. This app reverses the idea that other fitness tracking applications follow — requiring the user to follow data input guidelines, instead of the user providing any form of exercise data to the app.

Example Use Cases:
* Let's say you are a runner preparing for a competitive 5k. Other fitness tracking apps might track data like distance and time. However, you're curious to also track how much effort you put into each run, so that you can better understand how much effort it takes to run a certain time/distance. Trophy allows the standard tracking of distance and time, in addition to allowing you to choose an Intensity attribute, measured as either low, medium, or high. This combination gives you the ability to better understand how your runs truly vary for one another, ultimately giving you deeper insight to your fitness goals.
  
* Take an example where you are learning to climb at your local bouldering gym, and you would like to check your progress for a certain climb/beta. Trophy allows you to create your named exercise and choose to track attributes such as Time and Level (measured 0-10). This combination of exercise attributes allows you to better understand the progress of your specific climb over time.


## **Version 0** - _Backend Model + UI Design_

### Intro
In this section, I focused on designing the fitness application before diving straight into any form of development.
I leveraged tools such as Figma and draw.io to flesh out my Frontend UI and Backend relationships 

I implemented key skills such as: 
- Software Architecure Design (MVVM)
- UML Diagraming
- Model Design
- View Design
- ViewModel Design 


## **Version 1** - _MVVM Implementation + Unit Testing_
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

Below is a demo showing off the progress at Version 1

| Demo | Demo Content |
| --- | --- |
| ![Test Alt Text](Trophy/Assets/Videos/ExerciseModalDemo.v1.gif) | This demo shows off our main ContentView (i.e. Homepage), an Exercise Summary Modal, and how Exercises with different attributes will be displayed according to the attributes they possess (e.g. Distance)|


## **Version 2** - _Dynamic Content + Improved UI_
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


## **Version 3** - _AWS API Gateway Integration_
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
* With the heavy lifting out of the way, all the was left to do was to ensure that my TrophyRESTAPI client would successfully be able to make a call to the TrophyRESTAPI test function without receiving any errors in return.
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


## **Version 4** - _AWS Lambda Integration_
### Intro
_This section is in development and is dedicated to implementing the core API abilities that Trophy will rely on._
_The end goal will be to have an API that successfully communicates with AWS Lambda for basic testing API functions, until we're ready to connect Lambda to AWS RDS._ 
