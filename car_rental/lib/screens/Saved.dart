import 'package:car_rental/model/ProductModel.dart';
import 'package:car_rental/repository/ProductRepository.dart';
import 'package:flutter/material.dart';

import '../response/ProductResponse.dart';
import 'dart:async';


class ViewAll extends StatefulWidget {
  const ViewAll({Key? key}) : super(key: key);

  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  late Future<ProductResponse?> allProducts;

// double _proximityValue=0;
    final List<StreamSubscription<dynamic>> _streamSubscriptions= <StreamSubscription<dynamic>>[];

    @override

    // void initState(){
    //   _streamSubscriptions.add(
    //     proximityEvents!.listen(
    //       (ProximityEvent event){
    //         setState(() {
    //           _proximityValue=event.proximity;
    //         });
    //       }
    //     )
    //   );
    // }
  @override
  Widget build(BuildContext context) {    
    return Container(      
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/login.jpg'), fit: BoxFit.cover)),
            
      child: Scaffold(
          appBar: AppBar(title: const Text('')),
          backgroundColor: Colors.transparent,
          body: Container(
            child: SafeArea(
              child: FutureBuilder<ProductResponse?>(
                future: ProductRepository().getProducts(),
                builder: (context, AsyncSnapshot snapshot) {
                  print("trying");
                  const SizedBox(height: 240);
                  if (snapshot.connectionState == ConnectionState.done) {
                    
                    if (snapshot.hasData) {
                      print("hare shiva");
                      print(snapshot);
                      ProductResponse? productResponses = snapshot.data;
                      List<Product> lstProduct = productResponses!.productResponse!;
                      //List<Product> lstProduct= snapshot.data!.data!;
                      print(lstProduct.length);
                       print("trying");
                      return SizedBox(
                        
                        child: ListView.builder(
                            itemCount: lstProduct.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color.fromARGB(
                                        255, 211, 193, 193)),
                                child: ListTile(
                                  visualDensity: const VisualDensity(vertical: 4),
                                   
                                   leading: const CircleAvatar(
                                            backgroundImage: AssetImage("assets/images/login.jpg"), // no matter how big it is, it won't overflow
                                          ),
                                  title: Text((index + 1).toString() +
                                      ".      " +
                                      lstProduct[index].name!),
                                      
                                  subtitle: Text(
                                       lstProduct[index].model!+  lstProduct[index].power! + lstProduct[index].capacity! +lstProduct[index].colour! ),
                                      
                                  trailing: Column(
                                    children: [
                                       IconButton(
                                        icon: const Icon(Icons.add_shopping_cart_outlined),
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/bookings');
                                        },
                                        hoverColor: Colors.red,
                                        
                                      ),
                                //       TextButton(
                                //       onPressed: () async {
                                //   ProductAPI api = ProductAPI();
                                //   bool? response = await api
                                //       .getDelete(lstProduct[index].id!);
                                //   if (response ?? false) {
                                //     setState(() {
                                //       lstProduct.removeAt(index);
                                //     });
                                //   }
                                // },
                                // child: const Icon(
                                //   Icons.delete,
                                //   size: 30,
                                //   color: Colors.black38,
                                // )),
                                    ],
                                    
                                  ),
                                  // leading: IconButton(
                                  //   icon: const Icon(Icons.add),
                                  //   onPressed: () {
                                  //     Navigator.pushNamed(
                                  //         context, '/dashboard');
                                  //   },
                                  // ),
                                ),
                              );
                            }),
                      );
                    } else {
                      return const Center(
                        child: Text("No Data Avilable"),                                                
                      );                     
                    }
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
          ),
    );
    

    
  }
}
