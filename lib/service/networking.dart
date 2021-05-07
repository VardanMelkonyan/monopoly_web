import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class Networking {
  static const _base = "http://localhost:8080/mono";

  static Uri _genUri(String path) {
    return Uri.parse("$_base$path");
  }

  static get headers => {"Content-Type": "application/json"};

  static Future<String> start() async {
    var response;
    try {
      response = await http.get(_genUri("/start"));
    } catch (e) {
      print(e.message);
    }
    if (response.statusCode != 200) return null;
    return response.body;
  }

  static Future<bool> checkIfGameExists(int gameId) async {
    var response =
        await http.get(Uri.parse('$_base/game-exists?gameId=$gameId'));
    return jsonDecode(response.body);
  }

  static Future<int> createGame(Map<String, dynamic> input) async {
    print("CreateScreen");
    var response = await http.post(
      _genUri("/create-game"),
      body: jsonEncode(input),
      headers: headers,
    );

    if (response.statusCode != 200) return response.statusCode;

    var decoded = jsonDecode(response.body);

    FirebaseFirestore.instance.collection("game").doc("game").set(decoded);
    return 200;
  }
}
