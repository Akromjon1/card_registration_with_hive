class CardModel{
  late int id;
  late String cardNumder;
  late String name;
  late String date;
  late String cvc;


  CardModel(this.id, this.cardNumder, this.name, this.date, this.cvc);

  CardModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    cardNumder = json["cardNumder"];
    name = json["name"];
    date = json["date"];
    cvc = json["cvc"];
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "cardNumder": cardNumder,
    "name": name,
    "date": date,
    "cvc": cvc,
  };

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  bool operator == (Object other) {
    return other is CardModel && other.id == id;
  }

  @override
  int get hashCode => Object.hash(id,cardNumder, name, cvc, date);
}