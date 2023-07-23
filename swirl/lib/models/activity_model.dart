import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Activity {
  // The column headers.
  final String id;
  final String ownerId;
  final String title;
  final String description;
  final String date;
  final String startTime;
  final String finishTime;
  final String location;
  final String vibes;
  final int maxParticipants;
  final int participants;

  Activity({
  required this.id,
  required this.ownerId,
  required this.title,
  required this.description,
  required this.date,
  required this.startTime,
  required this.finishTime,
  required this.location,
  required this.vibes,
  required this.maxParticipants,
  required this.participants,
  });

  // The factory constructor.
  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      id: json['id'],
      ownerId: json['ownerId'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
      startTime: json['startTime'],
      finishTime: json['finishTime'],
      location: json['location'],
      vibes: json['vibes'],
      maxParticipants: json['maxParticipants'],
      participants: json['participants'],
    );
  }

  static Future<List<Activity>> fetchData() async {
    final response = await http.get(Uri.parse(
      'https://script.google.com/macros/s/AKfycbwYE1D_yuEYmj7QY8_6QW0Rgr9Mazhjm_rddsOlDe-rEycqalxBTerWTlt1dG5z3COTsw/exec'
    ));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => Activity.fromJson(data)).toList();
    } else {
      throw Exception('Failed to fetch data from Activities API');
    }
  }

}