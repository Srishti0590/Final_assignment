import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
   const ProfileScreen({ Key? key}) : super(key: key);

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
         title: const Text(' My Profile'),
        centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red, Colors.deepOrange.shade300],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: const [0.5, 0.9],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.red.shade300,
                        minRadius: 35.0,
                        child: const Icon(
                          Icons.call,
                          size: 30.0
                        ),
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.white70,
                        minRadius: 55.0,
                        child: CircleAvatar(
                          radius: 45.0,
                          backgroundImage:
                              AssetImage('assets/images/theme.jpg'),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.red.shade300,
                        minRadius: 35.0,
                        child: const Icon(
                          Icons.message,
                          size: 30.0
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'admin admin',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    '987643130',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
           
            Container(
              child: Column(
                
                children: const <Widget>[
                  
                  SizedBox(
                    height: 52,
                    child: ListTile(
                      title: Text(
                        'Email',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'admin@gmail.com',
                        style: TextStyle(
                          fontSize: 14
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    
                    height: 38,
                    child: ListTile(
                      title: Text(
                        'Update Profile',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,                                        
                        ),
                      ),
                     
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 48,
                    child: ListTile(
                      
                      title: Text(
                        'My Bookings',
                        
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '2',
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                    ),
                  ),
                 
                  
                  
                ]
                
              ),
              
            ),
            const Divider(),
            Container(
              child: Row(
              children: [
                    const SizedBox(height: 10, width:6,),

                    SizedBox(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/googlemaps');
                         
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            ),
                        // icon: const Icon(Icons.camera_enhance),
                        child: const Text('Contact Us',
                        style: TextStyle(
                        color: Color.fromARGB(255, 44, 33, 30),
                        // backgroundColor: Colors.deepOrange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      
                      ),
                      // style:const ButtonStyle(
                      //   backgroundColor: Colors.deepPurple,
                      // ),
                      ),
                      
                    ),
                    
                    const SizedBox(height: 8, width: 8,),
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/');
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.deepOrange,
                            ),
                        // icon: const Icon(Icons.browse_gallery_sharp),
                        child: const Text('Sign Out',
                        style: TextStyle(
                        color: Color.fromARGB(255, 46, 40, 39),
                        // backgroundColor: Colors.deepOrange,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),),
                      ),
                    ),
                  ],

      ),

            )
          ],
        ),
      ),
    );
  }
}