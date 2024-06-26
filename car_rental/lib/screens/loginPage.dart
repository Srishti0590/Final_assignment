import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:car_rental/screens/fingerprint.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

import '../repository/UserRepository.dart';
import 'NavigatorDrawerScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  int _counter = 1;
    bool showBiometric = false;
  bool isAuthenticated = false;

isBiometricsAvailable() async {
    showBiometric = await BiometricHelper().hasEnrolledBiometrics();
    setState(() {
      // _showAlertDialog(context);
          //Navigator.pushNamed(context, "/dashboard");
    });
  }

    _checkNotificationEnabled() {
      AwesomeNotifications().isNotificationAllowed().then((value) {
        if (value) {
          print("Notification allowed");
        } else {
          print("Notification not allowed");
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
      });
    }

  _loginUser() async{
    try {
    bool isLogin = await UserRepository().loginUser(_emailController.text, _passwordController.text);
    if (isLogin){
     _showMessage(isLogin);
     AwesomeNotifications().createNotification(
              content: NotificationContent(
            id: 1,
            channelKey: 'basic_channel',
            title: 'New Notification',
            body: 'You are logged in',
          ));
          setState(() {
            _counter++;
          });         
    }
    else{
      _showMessage(isLogin);
    }
  }
  catch (err) {
      debugPrint(err.toString());
    }
  }
  _showMessage(bool isLogin){
    if (isLogin){
       Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const NavigationDrawerScreen())

      );
        
    }
    else{
      MotionToast.error(description: const Text("login failed"),
      ).show(context);
    }
  }
 @override
  void initState() {
    super.initState();
    _checkNotificationEnabled();
    isBiometricsAvailable();
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login.jpg'),
            fit:BoxFit.cover
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children:[
              Container(
                padding: const EdgeInsets.only(left: 80, top:80),
                child: const CircleAvatar(
                  radius: 70.0,
                            backgroundImage: AssetImage("assets/images/vehicle.jpg"),
                          ),
                          
              ),
              Container(
                padding: const EdgeInsets.only(left: 100, top:230),
              child:
               const Text('Login', style:TextStyle(color:Color.fromARGB(255, 160, 35, 35), fontSize: 40)
               )
          ),
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.48, right: 35, left: 35),
                
                child: Column(
                  children:[
                    
                    TextFormField(
                     key: const ValueKey("email"),

                      controller: _emailController,
                      decoration: InputDecoration(
                        fillColor:const Color.fromARGB(221, 186, 185, 185),
                        filled: true,
                        hintText:'Enter your email',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                      ),
                      validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter email address';
                            }
                            return null;
                          },
                    ),
          
                    const SizedBox(height:30),
                    TextFormField(
                      key: const ValueKey("password"),

                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor:const Color.fromARGB(221, 186, 185, 185),
                        filled: true,
                        hintText:'Enter password',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                      ),
                      validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                    ),
                    const SizedBox(
                      height:40
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                                         
                        Container(
                          
                          padding: const EdgeInsets.only(left: 70, bottom: 5, top: 0),
                          child: ElevatedButton( 
                            key: const ValueKey("btnlogin"),

                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _loginUser();
                                //Navigator.pushNamed(context, '/dashboard');
                                AwesomeNotifications().createNotification(
                                  content: NotificationContent(
                                    id:1,
                                    channelKey:'Basic_channel',
                                    title: 'Welcome user',
                                    body:'You are logged in',

                                  ),
                                );
                              }
                            },
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 185, 43, 33),
                            ),
                           child: const Text(
                            'Login',
                          style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 218, 217, 219) ),
                          
                          )),
                        ),
                        // CircleAvatar(
                        //   radius:25, backgroundColor: Color(0xff4c505b),
                        //   child: IconButton(
                        //     color: Colors.red,
                        //     onPressed: (){},
                        //     icon: Icon(Icons.arrow_forward),
          
                        //   )
                        // )
                      ],
                    ),
                    Column(
                      children: [
                    //     FloatingActionButton(
                    // onPressed: () async {
                    //   isAuthenticated = await BiometricHelper().authenticate();
                    //   setState(() {
                    //     Navigator.pushNamed(context, "/dashboard");
                    //   });
                    // },
                    // child: const Icon(Icons.fingerprint),
                  //),
                        TextButton(onPressed: (){
                          setState(() {
                            Navigator.pushNamed(context, '/register');
                                
                          });
                        }, 
                        child:  Container(
                          padding: const EdgeInsets.only(left: 0, top: 06), 
                          child: const Text('New user? Click here to register!',
                          style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 24, 20, 7), decoration: TextDecoration.underline, fontStyle: FontStyle.italic  ),
                           ),
                        )),
                        
                      ],
                    )
                  ]
                )
              ),
            ),
          )
          ]
          )
          )
          );
   
    
    
      

    
  }
}