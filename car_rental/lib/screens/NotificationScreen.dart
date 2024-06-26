import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  _checkNotificationEnabled(){
    AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed){
        if(!isAllowed){
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
      }


      
    );
  }
  @override
  int counter=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications")),

        body: Center(
          
          child: ElevatedButton(
             child: const Text("Show Notifications"),
              onPressed:() {
                AwesomeNotifications().createNotification(
                  content: NotificationContent(
                    id:counter,
                    channelKey: 'basic_channel',
                    title: 'Notification title',
                    body: "This is my body where the text message is shown"
                  )
                  );
                  setState((){
                    counter++;
                  });
              
              },
            
            
          )),
    );
    
  }
}