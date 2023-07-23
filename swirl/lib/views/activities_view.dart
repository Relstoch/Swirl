// import 'dart:async';
// import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

import '../models/activity_model.dart';

class Activities extends StatefulWidget {
  const Activities({super.key});

  @override
  State<Activities> createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  List<Activity> activities = [];

  @override
  void initState() {
    super.initState();
    Activity.fetchData().then((data) {
      setState(() {
        activities = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activities Pool'),
      ),
      body: FutureBuilder<List<Activity>>(
        future: Activity.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            List<Activity> activities = snapshot.data!;
            return ListView.builder(
              itemCount: activities.length,
              itemBuilder: (context, index) {
                Activity activity = activities[index];
                return ListTile(
                  title: Text(activity.title),
                  subtitle: Text(activity.description),
                );
              },
            );
          } else {
            return const Center(child: Text('Error building Activies Pool'));
          }
        },
      ),
    );
  }


  // @override
  // Widget build(BuildContext context) {
  //   return FutureBuilder<List<Activity>>(
  //     future: Activity.fetchData(),
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return Center(child: CircularProgressIndicator());
  //       } else if (snapshot.hasData) {
  //         List<Activity> activities = snapshot.data!;
  //         return ListView.builder(
  //           itemCount: activities.length,
  //           itemBuilder: (context, index) {
  //             Activity activity = activities[index];
  //             return ListTile(
  //               title: Text(activity.title),
  //               subtitle: Text(activity.description),
  //             );
  //           },
  //         );
  //       } else {
  //         return Center(child: Text('Something went wrong'));
  //       }
  //     },
  //   );
  // }
}