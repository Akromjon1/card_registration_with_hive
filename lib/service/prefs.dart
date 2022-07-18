import 'dart:convert';
import 'package:card_registration_with_hive/model/card_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum StorageKey {
  cards
}

class PrefService {

  static Future<void> setCards(List<CardModel> cards) async {
    var pref = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> json = cards.map((card) => card.toJson()).toList();
    String data = jsonEncode(json);
    pref.setString(StorageKey.cards.name, data);
  }

  static Future<List<CardModel>> readCards() async {
    var pref = await SharedPreferences.getInstance();
    String data = pref.getString((StorageKey.cards.name)) ?? '[]';
    List json = jsonDecode(data);
     List<CardModel> cards = json.map((item) => CardModel.fromJson(item)).toList();
    //List<CardModel> users = json.map(CardModel.fromJson).toList();
    return cards;
  }

  static Future<void> deleteAllCards() async {
    var pref = await SharedPreferences.getInstance();
    pref.clear();
  }

}