import 'package:car_rental/screens/booking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class bookings extends StatefulWidget {
  const bookings({Key? key}) : super(key: key);

  @override
  State<bookings> createState() => _bookingsState();
}

class _bookingsState extends State<bookings> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(title: const Text("my bookings"),),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 24),
            Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text('Booking Details', style: heading)),
            buildBookingDetail(),
            buildBookingEndStrip(),
            
            buildBookingButton(),
          ],
        ),
      ),
    );
  }

 
  Widget buildBookingButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 44),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/dashboard');
           _showMessage(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        content: const Text('Congratulations, your booking has been made. You will get a call soon!!'),
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
              Navigator.pushNamed(context, '/dashboard');
            },
            child: const Text('Yes'),
          )
        ],
      ),
    );
  }
        },
        color: Colors.orange[900],
        textColor: Colors.white,
        elevation: 2,
        child: const Text('Book Now'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
      ),
    );
  }

  Widget buildBookingEndStrip() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(flex: 2, child: buildMarkerIcon()),
          Flexible(
            flex: 8,
            fit: FlexFit.loose,
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [raisedBoxShadow],
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                title: Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text('Booking Date & Time', style: heading2)),
                subtitle: Text('August 3, 1:05 PM', style: heading1),
                trailing: RaisedButton(
                  onPressed: () {
                    print('object');
                  },
                  color: mainColor,
                  textColor: Colors.white,
                  elevation: 1,
                  child: const Text('Book Now'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBookingDetail() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: buildLeftFlex(),
              flex: 2,
            ),
            Flexible(
              child: buildRightFlex(),
              flex: 8,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRightFlex() {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 24),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [raisedBoxShadow],
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          buildTablePicture(),
          Flexible(
            fit: FlexFit.tight,
            child: buildTableDescriptions(),
          )
        ],
      ),
    );
  }

  Widget buildTableDescriptions() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Text('Hyundai', style: inverseHeading1),
        ),
        const SizedBox(height: 2 ) ,
        Text('2500/day', style: heading1),
        const SizedBox(height: 2),
        // RatingBar(
        //   onRatingUpdate: null,
        //   itemSize: 20,
        //   initialRating: 5,
        //   minRating: 5,
        //   direction: Axis.horizontal,
        //   allowHalfRating: true,
        //   itemCount: 5,
        //   itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
        //   itemBuilder: (context, _) =>
        //       Icon(Icons.star, color: Colors.orange[900]),
        // ),
        const SizedBox(height: 2),
        Text('12 users review', style: heading2),
      ],
    );
  }

  Widget buildTablePicture() {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.loose,
      children: <Widget>[
        Container(width: 120),
        Image.asset('assets/images/vehicle.jpg', width: 100, fit: BoxFit.fitWidth),
        Positioned(
          left: 0,
          bottom: 0,
          child: Container(
            height: 36,
            width: 36,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: mainColor,
              shape: BoxShape.circle,
              boxShadow: [raisedBoxShadow],
            ),
            child: const Center(
              child: Icon(Icons.done_all, color: Colors.white, size: 24),
            ),
          ),
        )
      ],
    );
  }

  Widget buildLeftFlex() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        buildMarkerIcon(),
        const Flexible(
          fit: FlexFit.loose,
          child: VerticalDivider(
            color: Colors.blueGrey,
            thickness: 1.5,
          ),
        ),
      ],
    );
  }

  Widget buildMarkerIcon() {
    return Container(
      height: 56,
      width: 56,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [raisedBoxShadow],
        shape: BoxShape.circle,
      ),
      child: Image.asset('assets/images/logo1.jpg', width: 40, fit: BoxFit.contain),
    );
  }

  

  Widget customAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(
          left: 24,
          bottom: 12,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [mainColor, Colors.orange],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Icon(Icons.restaurant_menu, size: 42, color: Colors.white),
            const SizedBox(width: 16),
            Text(
              'Booking Details',
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}