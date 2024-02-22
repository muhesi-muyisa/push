import 'package:flutter/material.dart';

 class NotificationScreen {
  const NotificationScreen({Key? key});

  static const rout='/notification-screen';

  @override
  Widget build (BuildContext context){
        final message=ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Premier Push"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text('${message.notification?.title}'),
            // Text('${message.notification?.body}'),
            // Text('${message.data}')
          ],
        )
      ),
    );
  }
 }