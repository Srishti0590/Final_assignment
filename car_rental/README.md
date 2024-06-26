Hop_In, A online car rental application:

Introduction:
Finding a car hassel free has always been a issue in Nepal. Although, there are some car companies that provide cars in rent for a certain period of time, those companies are not easily accessible. Hop-In is a similar car rental application where users can look for the cars they want and make bookings according to their desires digitally. The booked cars is then dropped off or picked up by the company staff or the user in the desired address of the user. In this application, there are two users, the one who place their vehicles for rent and the another user who hires them. However, the system admin can also manage and maintain user profiles as well. To, sumarise, this application acts as a middleware between two users providing services and benefits to both of them.  The rental system traverses from designing a database to understanding business concept and above all to make this an easy to adapt system for various travelling needs.



Technologies used:

1. Flutter: Flutter is an open source UI software developed by google to develop cross application platform for android, iOS, windows, linux, macOS etc. The application is written in dart language due to its various features like just-in-time execution engine to allow hot reload. 

2. Node Js: Node.js is a popular cross-platform open-source JavaScript runtime environment. Outside of the browser, Node.js operates the V8 JavaScript engine, which is at the heart of Google Chrome. As a result, Node.js is exceptionally quick. Because Node.js's standard library provides a set of asynchronous I/O primitives that prevent JavaScript code from blocking, and libraries in Node.js are commonly created using non-blocking paradigms, blocking behavior is the exception rather than the rule. As Node.js conducts an I/O action, such as reading from the network or accessing a database or disk, instead of suspending the thread and wasting CPU cycles waiting for a response, Node.js will resume the operations when the response is received.

3. Shared Preferences: Shared Preferences is the package used to store a small pieces of data locally in the form of key-value pairs. 

4. Multer: Multer is a Node.js middleware for managing multipart/form-data that greatly simplifies the normally time-consuming process of uploading files in Node.js. When  forms are submitted with text inputs, the server, in an instance, Node.js, has less work to accomplish. Using Express, one can quickly retrieve all of the inputs entered in the req.body object. However, submitting forms containing files is a bit more complicated because it requires additional processing. Thus, multer is added to make this processing easier and faster. 



Complications and Challenges faced during the project: 
1. The main challenge was running the emulator in android studio. It would take a huge amount of time just to load the application which made the progress slow. 
2. Sometimes, null values would be assigned which led to the data not being displayed on the screen. So, it took a while to get the idea of the process and work to avoid those errors. 
3. While running the projects on physical devices, the internet would create issues due to double factor authentication. SImilarly, changing url's along with new connection address, emulator address, local address was a bit time consuming.  


Future prospects: 
Features like tracking the location of the vehicle after the booking is made could be implemented which helps both the users to track the device to know their delivery time. Similarly, Comment sections, review sections can also be added to make the application more reliable and trustworthy. 


Project architecture: 
MVP model: MVP architecture is a well-known architectural concept that may be used to project organization. The architecture promotes modularity, testability, cleanliness and maintainability of the program. It is composed of the three components:
Model: This layes is responsible for storing data. Domain logic (real-world business rules) as well as communication with the database and network layers are all handled by it.
View: UI (User Interface) layer: It visualizes the data and monitors the user's behavior in order to notify the Presenter.
Presenter: Get data from the model and apply UI logic to decide what to display. It manages the state of the View and takes actions based on the user's input notification from the View.
Hence, to create a clean, organised, testable and workable mobile application, the MVP model was used. 


Conclusion:
While Some of the features of the system are yet to be introduced according to the time, requirements of the users and technology. A fully workable vehicle renting system was developed with the help of various technologies, data collection, analysis, users’ participation and research.

References: 
Flutter - Build Apps For Any Screen (2022) available from <https://flutter.dev/> [1 August 2022]

MVP (Model View Presenter) Architecture Pattern In Android With Example - Geeksforgeeks (2022) available from <https://www.geeksforgeeks.org/mvp-model-view-presenter-architecture-pattern-in-android-with-example/> [1 August 2022]

Introduction To Node.Js (2022) available from <https://nodejs.dev/learn> [31 July 2022]

Appendices:
![1](https://user-images.githubusercontent.com/64901992/182665221-5365198a-7cb2-41aa-988f-e8489811d532.jpg)
![2](https://user-images.githubusercontent.com/64901992/182665241-b9c5eba1-05ab-444f-9ed8-07dccf06fc0f.jpg)
![3](https://user-images.githubusercontent.com/64901992/182665253-cd4d12b4-7bf4-4e0c-90d8-ae0d6bb98fb9.jpg)
![4](https://user-images.githubusercontent.com/64901992/182665274-3e7e7a6a-8eab-473e-9b08-6180d3694edd.jpg)
![5](https://user-images.githubusercontent.com/64901992/182665319-bf8ea14b-f1b7-45af-a3db-984094d171a3.jpg)
![6](https://user-images.githubusercontent.com/64901992/182665353-41a4e940-8954-4a40-bef3-86c45c265645.jpg)
![7](https://user-images.githubusercontent.com/64901992/182665380-460b7108-d313-40e9-9886-75ec89a76cca.jpg)
![8](https://user-images.githubusercontent.com/64901992/182665409-0410bb0c-094d-4564-b904-6ac4107fb0d6.jpg)

 

