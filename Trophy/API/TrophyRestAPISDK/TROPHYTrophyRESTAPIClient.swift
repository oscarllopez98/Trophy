///*
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
// */
//
//
//import AWSCore
//import AWSAPIGateway
//
//public class TROPHYTrophyRESTAPIClient: AWSAPIGatewayClient {
//
//	static let AWSInfoClientKey = "TROPHYTrophyRESTAPIClient"
//
//	private static let _serviceClients = AWSSynchronizedMutableDictionary()
//	private static let _defaultClient:TROPHYTrophyRESTAPIClient = {
//		var serviceConfiguration: AWSServiceConfiguration? = nil
//        let serviceInfo = AWSInfo.default().defaultServiceInfo(AWSInfoClientKey)
//        if let serviceInfo = serviceInfo {
//            serviceConfiguration = AWSServiceConfiguration(region: serviceInfo.region, credentialsProvider: serviceInfo.cognitoCredentialsProvider)
//        } else if (AWSServiceManager.default().defaultServiceConfiguration != nil) {
//            serviceConfiguration = AWSServiceManager.default().defaultServiceConfiguration
//        } else {
//            serviceConfiguration = AWSServiceConfiguration(region: .Unknown, credentialsProvider: nil)
//        }
//        
//        return TROPHYTrophyRESTAPIClient(configuration: serviceConfiguration!)
//	}()
//    
//	/**
//	 Returns the singleton service client. If the singleton object does not exist, the SDK instantiates the default service client with `defaultServiceConfiguration` from `AWSServiceManager.defaultServiceManager()`. The reference to this object is maintained by the SDK, and you do not need to retain it manually.
//	
//	 If you want to enable AWS Signature, set the default service configuration in `func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?)`
//	
//	     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//	        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
//	        let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
//	        AWSServiceManager.default().defaultServiceConfiguration = configuration
//	 
//	        return true
//	     }
//	
//	 Then call the following to get the default service client:
//	
//	     let serviceClient = TROPHYTrophyRESTAPIClient.default()
//
//     Alternatively, this configuration could also be set in the `info.plist` file of your app under `AWS` dictionary with a configuration dictionary by name `TROPHYTrophyRESTAPIClient`.
//	
//	 @return The default service client.
//	 */ 
//	 
//	public class func `default`() -> TROPHYTrophyRESTAPIClient{
//		return _defaultClient
//	}
//
//	/**
//	 Creates a service client with the given service configuration and registers it for the key.
//	
//	 If you want to enable AWS Signature, set the default service configuration in `func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?)`
//	
//	     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//	         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
//	         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
//	         TROPHYTrophyRESTAPIClient.registerClient(withConfiguration: configuration, forKey: "USWest2TROPHYTrophyRESTAPIClient")
//	
//	         return true
//	     }
//	
//	 Then call the following to get the service client:
//	
//	
//	     let serviceClient = TROPHYTrophyRESTAPIClient.client(forKey: "USWest2TROPHYTrophyRESTAPIClient")
//	
//	 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.
//	
//	 @param configuration A service configuration object.
//	 @param key           A string to identify the service client.
//	 */
//	
//	public class func registerClient(withConfiguration configuration: AWSServiceConfiguration, forKey key: String){
//		_serviceClients.setObject(TROPHYTrophyRESTAPIClient(configuration: configuration), forKey: key  as NSString);
//	}
//
//	/**
//	 Retrieves the service client associated with the key. You need to call `registerClient(withConfiguration:configuration, forKey:)` before invoking this method or alternatively, set the configuration in your application's `info.plist` file. If `registerClientWithConfiguration(configuration, forKey:)` has not been called in advance or if a configuration is not present in the `info.plist` file of the app, this method returns `nil`.
//	
//	 For example, set the default service configuration in `func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) `
//	
//	     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//	         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
//	         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
//	         TROPHYTrophyRESTAPIClient.registerClient(withConfiguration: configuration, forKey: "USWest2TROPHYTrophyRESTAPIClient")
//	
//	         return true
//	     }
//	
//	 Then call the following to get the service client:
//	 
//	 	let serviceClient = TROPHYTrophyRESTAPIClient.client(forKey: "USWest2TROPHYTrophyRESTAPIClient")
//	 
//	 @param key A string to identify the service client.
//	 @return An instance of the service client.
//	 */
//	public class func client(forKey key: String) -> TROPHYTrophyRESTAPIClient {
//		objc_sync_enter(self)
//		if let client: TROPHYTrophyRESTAPIClient = _serviceClients.object(forKey: key) as? TROPHYTrophyRESTAPIClient {
//			objc_sync_exit(self)
//		    return client
//		}
//
//		let serviceInfo = AWSInfo.default().defaultServiceInfo(AWSInfoClientKey)
//		if let serviceInfo = serviceInfo {
//			let serviceConfiguration = AWSServiceConfiguration(region: serviceInfo.region, credentialsProvider: serviceInfo.cognitoCredentialsProvider)
//			TROPHYTrophyRESTAPIClient.registerClient(withConfiguration: serviceConfiguration!, forKey: key)
//		}
//		objc_sync_exit(self)
//		return _serviceClients.object(forKey: key) as! TROPHYTrophyRESTAPIClient;
//	}
//
//	/**
//	 Removes the service client associated with the key and release it.
//	 
//	 @warning Before calling this method, make sure no method is running on this client.
//	 
//	 @param key A string to identify the service client.
//	 */
//	public class func removeClient(forKey key: String) -> Void{
//		_serviceClients.remove(key)
//	}
//	
//	init(configuration: AWSServiceConfiguration) {
//	    super.init()
//	
//	    self.configuration = configuration.copy() as! AWSServiceConfiguration
//	    var URLString: String = "https://xhh2wpxj6f.execute-api.us-east-1.amazonaws.com/Prod"
//	    if URLString.hasSuffix("/") {
//	        URLString = URLString.substring(to: URLString.index(before: URLString.endIndex))
//	    }
//	    self.configuration.endpoint = AWSEndpoint(region: configuration.regionType, service: .APIGateway, url: URL(string: URLString))
//	    let signer: AWSSignatureV4Signer = AWSSignatureV4Signer(credentialsProvider: configuration.credentialsProvider, endpoint: self.configuration.endpoint)
//	    if let endpoint = self.configuration.endpoint {
//	    	self.configuration.baseURL = endpoint.url
//	    }
//	    self.configuration.requestInterceptors = [AWSNetworkingRequestInterceptor(), signer]
//	}
//
//	
//    /*
//     
//     
//     @param userId 
//     @param body 
//     
//     return type: TROPHYPutExerciseOutput
//     */
//    public func usersUserIdExercisesPut(userId: String, body: TROPHYInputExercise) -> AWSTask<TROPHYPutExerciseOutput> {
//	    let headerParameters = [
//                   "Content-Type": "application/json",
//                   "Accept": "application/json",
//                   
//	            ]
//	    
//	    let queryParameters:[String:Any] = [:]
//	    
//	    var pathParameters:[String:Any] = [:]
//	    pathParameters["userId"] = userId
//	    
//	    return self.invokeHTTPRequest("PUT", urlString: "/users/{userId}/exercises", pathParameters: pathParameters, queryParameters: queryParameters, headerParameters: headerParameters, body: body, responseClass: TROPHYPutExerciseOutput.self) as! AWSTask<TROPHYPutExerciseOutput>
//	}
//
//	
//    /*
//     
//     
//     @param userId 
//     @param exerciseId 
//     
//     return type: TROPHYOutputExercise
//     */
//    public func usersUserIdExercisesExerciseIdGet(userId: String, exerciseId: String) -> AWSTask<TROPHYOutputExercise> {
//	    let headerParameters = [
//                   "Content-Type": "application/json",
//                   "Accept": "application/json",
//                   
//	            ]
//	    
//	    let queryParameters:[String:Any] = [:]
//	    
//	    var pathParameters:[String:Any] = [:]
//	    pathParameters["userId"] = userId
//	    pathParameters["exerciseId"] = exerciseId
//	    
//	    return self.invokeHTTPRequest("GET", urlString: "/users/{userId}/exercises/{exerciseId}", pathParameters: pathParameters, queryParameters: queryParameters, headerParameters: headerParameters, body: nil, responseClass: TROPHYOutputExercise.self) as! AWSTask<TROPHYOutputExercise>
//	}
//
//	
//    /*
//     
//     
//     @param userId 
//     @param exerciseId 
//     @param body 
//     
//     return type: TROPHYPutExerciseOutput
//     */
//    public func usersUserIdExercisesExerciseIdPut(userId: String, exerciseId: String, body: TROPHYInputExercise) -> AWSTask<TROPHYPutExerciseOutput> {
//	    let headerParameters = [
//                   "Content-Type": "application/json",
//                   "Accept": "application/json",
//                   
//	            ]
//	    
//	    let queryParameters:[String:Any] = [:]
//	    
//	    var pathParameters:[String:Any] = [:]
//	    pathParameters["userId"] = userId
//	    pathParameters["exerciseId"] = exerciseId
//	    
//	    return self.invokeHTTPRequest("PUT", urlString: "/users/{userId}/exercises/{exerciseId}", pathParameters: pathParameters, queryParameters: queryParameters, headerParameters: headerParameters, body: body, responseClass: TROPHYPutExerciseOutput.self) as! AWSTask<TROPHYPutExerciseOutput>
//	}
//
//	
//    /*
//     
//     
//     @param userId 
//     @param exerciseId 
//     
//     return type: TROPHYDeleteExerciseOutput
//     */
//    public func usersUserIdExercisesExerciseIdDelete(userId: String, exerciseId: String) -> AWSTask<TROPHYDeleteExerciseOutput> {
//	    let headerParameters = [
//                   "Content-Type": "application/json",
//                   "Accept": "application/json",
//                   
//	            ]
//	    
//	    let queryParameters:[String:Any] = [:]
//	    
//	    var pathParameters:[String:Any] = [:]
//	    pathParameters["userId"] = userId
//	    pathParameters["exerciseId"] = exerciseId
//	    
//	    return self.invokeHTTPRequest("DELETE", urlString: "/users/{userId}/exercises/{exerciseId}", pathParameters: pathParameters, queryParameters: queryParameters, headerParameters: headerParameters, body: nil, responseClass: TROPHYDeleteExerciseOutput.self) as! AWSTask<TROPHYDeleteExerciseOutput>
//	}
//
//
//
//
//}
