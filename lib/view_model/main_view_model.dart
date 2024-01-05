import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_api/model/character.dart';

class MainViewModel with ChangeNotifier {
  final String _apiUrl = "https://rickandmortyapi.com/api/character/";

  final List<Character> _characters = [];

  List<Character> get characters => _characters;

  MainViewModel() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getCharacters();
    });
  }

  MaterialColor statusColor = Colors.grey;


  void _getCharacters() async {
    Uri uri = Uri.parse(_apiUrl);
    http.Response response = await http.get(uri);

    Map<String, dynamic> apiResponse = jsonDecode(response.body);
    List<dynamic> allCharacters = apiResponse['results'];
    for (Map<String, dynamic> character in allCharacters) {
      Character char = Character.fromJson(character);
      _characters.add(char);
    }
    notifyListeners();
  }
}
