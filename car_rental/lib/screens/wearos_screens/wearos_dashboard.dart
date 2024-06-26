import 'package:flutter/material.dart';
import 'package:wear/wear.dart';

class DashboardWearOS extends StatefulWidget {
  const DashboardWearOS({Key? key}) : super(key: key);

  @override
  State<DashboardWearOS> createState() => _DashboardWearOSState();
}

class _DashboardWearOSState extends State<DashboardWearOS> {
  @override
  Widget build(BuildContext context) {
    return WatchShape(
      builder: (BuildContext context, WearShape, Widget? child) {
    return AmbientMode( builder: (context, WearShape, Widget? child){
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
            //     Container(
                
                
            //   child: ElevatedButton(onPressed: () {
            //                 Navigator.pushNamed(context, '/wear');
            //               },
            //     child: const Text("Log Out")),
            // ),
                Container(
                    padding: const EdgeInsets.only(left: 6, top: 5, right: 6),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Center(
                              child: Text(
                                "Featured",
                                style: TextStyle(color: Color.fromARGB(255, 223, 54, 54)),
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
                          "i20",
                          "https://www.besteconomicalcars.com/wp-content/uploads/2021/01/Hundai-Ioniq-scaled.jpg",
                          4.0),
                      buildItem(
                          "Toyota",
                          "Venza",
                          "https://mediacloud.carbuyer.co.uk/image/private/s--lN0QKoGF--/v1579629722/carbuyer/prius-124_1.jpg",
                          4.2),

                      Container(
              child: ElevatedButton(onPressed: () {
                            Navigator.pushNamed(context, '/wear');
                          },
                child: const Text("Log Out")),
            
                      )
                    ],
                    
                  )
                  ),
                  
                ),
                
                
                
              ],),)
                
  //     appBar: AppBar(title: const Text("Dashboard"),);
  //     return SingleChildScrollView(
  //       child: Column(
  //         children: [
  //            // child: Padding(
  //       //   padding: const EdgeInsets.all(10.0),
  //       //   child: Column(
  //       //     children: [
  //       //       Padding(
  //       //         padding: const EdgeInsets.all(20.0),
  //       //         child: TextFormField(
  //       //           decoration: InputDecoration(
                              
  //       //                       fillColor:const Color.fromARGB(221, 135, 134, 134),
  //       //                       filled: true,
  //       //                       hintText:'Search',
  //       //                       suffixIcon: const Icon(Icons.search),
  //       //                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
  //       //                     ),

  //       //         ),
  //       //       ),    
  //       //     ],
  //       //   ),
  //       // )
  //            SizedBox(
              
  //                     child: ElevatedButton(
  //                       onPressed: () {
  //                         Navigator.pushNamed(context, '/googlemaps');
                         
  //                       },
  //                       // icon: const Icon(Icons.camera_enhance),
  //                       child: const Text('Contact Us',
  //                       style: TextStyle(
  //                       color: Color.fromARGB(255, 216, 215, 214),
  // // backgroundColor: Colors.deepOrange,
  //                       fontSize: 10,
  //                       fontWeight: FontWeight.bold,
  //                     ),),
  //                     // style:const ButtonStyle(
  //                     //   backgroundColor: Colors.deepPurple,
  //                     // ),
  //                     ),
  //                   ),
  //           SizedBox(
  //             child: ElevatedButton(onPressed: () {
  //                           Navigator.pushNamed(context, '/wear');
  //                         },
  //               child: const Text("Log Out")),
  //           )
  //         ],
  //       )
    
          
        
       );
       
  },
    );
    
    },
  
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
                        fontWeight: FontWeight.bold, fontSize: 6),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 2,
                        color: Colors.grey),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 174, 172, 169),
                child: Text(rating.toString(),
                    style: const TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
      ]),
    );
  }
}