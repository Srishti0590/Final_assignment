import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    void _showMessage(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        content: const Text('Book now?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              //sharedPref()
              //.removeAuthToken()
              //.then((value) => Navigator.pushNamed(context, '/login'));
              Navigator.pushNamed(context, '/bookings');
            },
            child: const Text('Yes'),
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
          // appBar: AppBar(
            
          //   title: const Text('Dashboard'),
          //   centerTitle: true,
          //   backgroundColor: const Color.fromARGB(255, 131, 130, 127),
          // ),
          // backgroundColor: const Color.fromRGBO(171, 170, 170, 0),
          body: Center(
            child: Column(
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.only(left: 6, top: 55, right: 6),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Center(
                              child: Text(
                                "All vehicles",
                                style: TextStyle(color: Color.fromARGB(255, 223, 54, 54, ),
                                fontSize: 40),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                      ],
                    )),
                Container(
                  child: Expanded(
                      child: ListView(
                    children: <Widget>[
                      buildItem(
                          "Hyundai",
                          "I20 blue \n6 people \n2500/day  ",
                          "https://wallup.net/wp-content/uploads/2016/01/65578-BMW_M3-BMW-car-blue_cars.jpg",
                          4.2),
                          const Divider(),
                      buildItem(
                          "Toyota",
                          "Venza red \n2-6 people \n2000/day ",
                          "https://mediacloud.carbuyer.co.uk/image/private/s--lN0QKoGF--/v1579629722/carbuyer/prius-124_1.jpg",
                          4.2),
                     

               
                    ],
                    
                  )
                  ),
                  
                ),
                
                
                
              ],),)
                
  
          
        
       );
       
  
    
    
    
  
    
      }

    

    Container buildItem(
      String title, String subtitle, String url, double rating) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(children: <Widget>[
        Container(
          height: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(url),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(1), topRight: Radius.circular(1))),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(1),
                  bottomRight: Radius.circular(1)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 1.0, spreadRadius: 0.0, color: Colors.grey)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.grey),
                  ),
                ],
              ),
              ElevatedButton(onPressed:(){
                //  Navigator.pushNamed(context, '/bookings');
                setState(() {
                  _showMessage(context);
                });
                 
              } , child: const Text("Book Now"))
            ],
          ),
        ),
      ]),
    );
  }
}