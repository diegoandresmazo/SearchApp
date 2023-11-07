# SearchApp
Search App Challenge using MercadoLibre API

## `Execution Guide`
1. git clone git@github.com:diegoandresmazo/SearchApp.git
2. cd SearchApp
3. pod install
4. open SearchApp.xcworkspace

## `Architecture`
The application uses Swift MVP Architecture, utilizing Combine to make API calls and UIKit to make the Views.

 The Search App is separated in 4 parts:
 
 1. Networking: Responsible for making the connection with the API. 
 2. Model: The Data folder contains the Entities Models.
 3. Presentation: Composed by the Views of the application created in UIKit.
 4. Presenters: In charge of having the logic and the connection between the View and the Model.
 5. Mocks: Models and Views Using to Unit tests.

## `Design Patterns & Good Programming Practices` 
  * SOLID Principles.
  * Architecture designed for the use of dependency injection.
  * Inheritance.
  * Reused Code.
  * Views by code.
  * Generics.
  * Errors Handler.
