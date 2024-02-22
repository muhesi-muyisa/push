

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:push/api/pages/notification_screen.dart';
import 'package:push/main.dart';

Future <void>handleBackgroundMessage(RemoteMessage message)async{
  print('Titre: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Playoad: ${message.data}');
}

class FirebaseApi{
  final _firebaseMessaging=FirebaseMessaging.instance;


  void handleMessage(RemoteMessage? message){
    if (message==null) { return;
    navigatorKey.currentState?.pushNamed(
      NotificationScreen.rout,arguments: message,
    );
      
    }

    Future initPushNotification() async{
      await FirebaseMessaging.instance
      .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
      FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
      FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
      FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    }
  }

  // Une notification 
  Future<void>initNotifications()async{
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('Token: $fCMToken');
    //FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    initNotifications();
  }
}