import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:restaurant_booking_app/screen/login.dart';
import 'package:shake/shake.dart';

import 'card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
    final List<double> _accelerometerValues = <double>[];
   @override
  void initState() {
    super.initState();
    detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        

        setState(() {
          _showAlertDialog(context);
          // Navigator.pushNamed(context, "/");
        });
      },
    );
    //Provider.of<>(context, listen: false).getproduct(context);
  }
  late ShakeDetector detector;
  @override
  void dispose() {
    detector.stopListening();
    super.dispose();
  }
  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Warning!!'),
        content: const Text('Do you want to log out?'),
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
              Navigator.pushNamed(context, '/');
            },
            child: const Text('Yes'),
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 50, fontWeight: FontWeight.bold);
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/logn.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 40.0, horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Let's start by adding the text
                  Row(
                    children: [
                      Text(
                        "Welcome!!",
                        style: GoogleFonts.arsenal(
                          textStyle: style,
                          color: const Color.fromARGB(255, 201, 76, 76),
                        ),
                      ),
                      // Container(
                      //   padding: const EdgeInsets.only(top: 5),
                      //   child: SizedBox(
                      //     height: 140,
                      //     width: 92,
                      //     child: Lottie.asset('assets/food.json'),
                      //   ),
                      // ),
                    ],
                  ),

                  const Text(
                    "Explore...",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),

                  Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(30.0),
                    shadowColor: const Color(0x55434343),
                    child: const TextField(
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: "Search for cars",
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black54,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  //Now let's Add a Tabulation bar
                  Container(
                    child: DefaultTabController(
                      length: 1,
                      child: Expanded(
                        child: Column(
                          children: [
                            const TabBar(
                              labelStyle: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                              indicatorColor: Color.fromARGB(255, 249, 253, 23),
                              unselectedLabelColor:
                                  Color.fromARGB(255, 94, 93, 93),
                              labelColor: Color.fromARGB(255, 204, 79, 79),
                              labelPadding:
                                  EdgeInsets.symmetric(horizontal: 8.0),
                              tabs: [
                                
                                Tab(
                                  text: "Trending",
                                ),
                                // Tab(
                                //   text: "view all>>",
                                  
                                  
                                // ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              child: SizedBox(
                                height: 200.0,
                                child: TabBarView(
                                  children: [
                                    // first tab page
                                    Container(
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          //add first card
                                          viewCard(
                                              "https://www.besteconomicalcars.com/wp-content/uploads/2021/01/Hundai-Ioniq-scaled.jpg",
                                              "Hyundai",
                                              "i20",
                                              5),
                                          viewCard(
                                              "https://mediacloud.carbuyer.co.uk/image/private/s--lN0QKoGF--/v1579629722/carbuyer/prius-124_1.jpg",
                                              "Toyota",
                                              "Venza",
                                              4),
                                          viewCard(
                                              "https://cdn.motor1.com/images/mgl/POk4A/s1/2021-skoda-octavia-sportline.jpg",
                                              "Skoda",
                                              "kodiaq",
                                              5),
                                          viewCard(
                                              "https://img-ik.cars.co.za/legacy/gallery/suzuki-celerio-2/tr:n-news_1200x/IMG_2373.jpg",
                                              "Suzuki",
                                              "Vitara",
                                              
                                              4),
                                    
                                        ],
                                      ),
                                    ),
                                    // Container(
                                    //   child: Expanded(
                                    //       child: ListView(
                                            
                                          
                                        // children: <Widget>[
                                        //   buildItem(
                                        //       "Vivanta Hotel",
                                        //       "Jhamsikhel, Kathmandu",
                                        //       "https://www.vivantahotels.com/content/dam/vivanta/hotels/vivantakathmandu/gallery/exterior%203.jpg/jcr:content/renditions/cq5dam.web.1280.1280.jpeg",
                                        //       4.0),
                                        //   buildItem(
                                        //       "KFC Nepal",
                                        //       "Durbar Marg, Kathmandu",
                                        //       "http://img1.feinfood.com/upload/hotel2/20200920/dd7a2d396b0c463dbe9036a25b2d22a7.jpg",
                                        //       4.7),
                                        //   buildItem(
                                        //       "Hyundai",
                                        //       "",
                                        //       "https://b.zmtcdn.com/data/pictures/8/19690708/8c9f43b5465c2e2c92c86a3f94c0aa07.jpg",
                                         //       5.0),
                                        // ],
                                    //   )),
                                    // ),
                                    
                                  ],
                                ),
                              ),
                              
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          
                            
                            
                          ],
                          
                        ),
                        
                        
                      ),
                    ),
                  ),
                ],
              ),             
            ),            
          ],          
        ),       
      ),
    );
    
  }


  Container buildItem(
      String title, String subtitle, String url, double rating) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      padding: const EdgeInsets.only(left: 5, top: 5, right: 5),
      child: Column(children: <Widget>[
        Container(
          height: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(url),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 2.0, spreadRadius: 1.0, color: Colors.grey)
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
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.grey),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: Colors.orange,
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
