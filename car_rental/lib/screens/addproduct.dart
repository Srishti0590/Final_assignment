import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_toast/motion_toast.dart';

import '../model/ProductModel.dart';
import '../repository/ProductRepository.dart';
import 'package:image_picker/image_picker.dart';


class AddVehicle extends StatefulWidget {
  const AddVehicle({Key? key}) : super(key: key);

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  @override
    void initState() {
    super.initState();
    //_loadCategory();
  }

  // String dropdownValue = "One";
  // List<DropdownCategory?> _lstCategoryList = [];
  // _loadCategory() async {
  //   _lstCategoryList = await CategoryRepository().loadCategory();
  // }

  // Load camera and gallery images and store it to the File object.
  File? img;
  Future _loadImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          img = File(image.path);
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint('Failed to pick Image $e');
    }
  }

  final String _selectedValue = "Please select a value";
  _addProduct(Product product) async {
    bool isAdded = await ProductRepository().addProduct(img, product);
    if (isAdded) {
      const SizedBox(width: 50);
      _displayMessage(isAdded);
    } else {
      _displayMessage(isAdded);
    }
  }

  _displayMessage(bool isAdded) {
    if (isAdded) {
      MotionToast.success(description: const Text("Product added!", style: TextStyle(fontSize: 15),))
          .show(context);
    } else {
      MotionToast.error(description: const Text("Error adding product"))
          .show(context);
    }
  }

  var gap = const SizedBox(height: 10);
  var nameController = TextEditingController(text: "");
  var modelController = TextEditingController(text: "");
  var capacityController = TextEditingController(text: "");
  var powerController = TextEditingController(text: "");
  var colourController = TextEditingController(text: "");
  // var ratingController = TextEditingController(text: "3");
  // var numReviewsController = TextEditingController(text: "3");
  // var isFeaturedController = TextEditingController(text: "false");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("add Vehicle",
        style: GoogleFonts.inter(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
          ),
          backgroundColor: const Color.fromRGBO(130, 143, 68, 1),
        centerTitle: true,

      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                 _displayImage(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _loadImage(ImageSource.camera);
                        },
                        icon: const Icon(Icons.camera_enhance),
                        label: const Text('Open Camera'),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _loadImage(ImageSource.gallery);
                        },
                        icon: const Icon(Icons.browse_gallery_sharp),
                        label: const Text('Open Gallery'),
                      ),
                    ),
                  ],
                ),
                // FutureBuilder(
                //   future: _loadCategory(),
                //   builder: (context, snapshot) {
                //     if (snapshot.hasData) {
                //       return DropdownButton(
                //         onChanged: (String? newValue){
                //           setState(() {
                //             _selectedValue = newValue!;
                //           });
                //         },
                //         value: _selectedValue,
                //         items: _lstCategoryList
                //             .map((DropdownCategory dropdownCategory) {
                //               return DropdownMenuItem(
                //                 value: dropdownCategory.id,
                //                 child: Text(dropdownCategory.name),
                //               );
                //             })
                //             .toList(),
                //       ),

                //     }
                //   },
                // ),
                gap,
                TextFormField(
                  key: const ValueKey("name"),

                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Product Name',
                    hintText: 'Enter Product Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  key: const ValueKey("model"),

                  controller: modelController,
                  decoration: const InputDecoration(
                    labelText: 'Product Description',
                    hintText: 'Enter Product model',
                    border: OutlineInputBorder(),
                  ),
                ),
                gap,
                TextFormField(
                  key: const ValueKey("capacity"),

                  keyboardType: TextInputType.number,
                  controller: capacityController,
                  decoration: const InputDecoration(
                    labelText: 'Product capacity',
                    hintText: 'Enter Product capacity',
                    border: OutlineInputBorder(),
                  ),
                ),
                gap,
                TextFormField(
                  key: const ValueKey("power"),

                  controller: powerController,
                  decoration: const InputDecoration(
                    labelText: 'Product power',
                    hintText: 'Select Product power',
                    border: OutlineInputBorder(),
                  ),
                ),
                gap,
                TextFormField(
                  key: const ValueKey("colour"),

                  // keyboardType: TextInputType.number,
                  controller: colourController,
                  decoration: const InputDecoration(
                    labelText: 'Colour',
                    hintText: 'Enter colour',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                gap,
                // TextFormField(
                //   keyboardType: TextInputType.number,
                //   controller: ratingController,
                //   decoration: const InputDecoration(
                //     labelText: 'Rating',
                //     hintText: 'Enter rating',
                //     border: OutlineInputBorder(),
                //   ),
                // ),
                // gap,
                // TextFormField(
                //   keyboardType: TextInputType.number,
                //   controller: numReviewsController,
                //   decoration: const InputDecoration(
                //     labelText: 'Num reviews',
                //     hintText: 'Enter num reviews',
                //     border: OutlineInputBorder(),
                //   ),
                // ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                    key: const ValueKey("btnadd"),

                    onPressed: () {
                      Product product = Product(
                        name: nameController.text,
                        model: modelController.text,
                        capacity: capacityController.text,
                        power: powerController.text,
                        colour: colourController.text,
                        // rating: ratingController.text,
                        // numReviews: numReviewsController.text,
                        // isFeatured: isFeaturedController.text,
                      );
                      _addProduct(product);
                    },
                    label: const Text('Add Product'),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
    
  }

  Widget _displayImage() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: Colors.green,
          width: 2,
        ),
      ),
      child: ClipRRect(
        // For rounded upper right corner and left corner in imageview
        borderRadius: BorderRadius.circular(20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: img == null
                    ? SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.network(
                          'https://mediacloud.carbuyer.co.uk/image/private/s--lN0QKoGF--/v1579629722/carbuyer/prius-124_1.jpg',
                          fit: BoxFit.fill,
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: double.infinity,
                        ),
                      )
                    : Image.file(img!),
              ),
            ],
          ),
        ),
      ),
    );

    
    
    
  }
}