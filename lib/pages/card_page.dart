import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import '../model/card_model.dart';
import '../service/hive_service.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);
  static const String id = "card_page";

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllData();
  }

  bool isLoading = false;

  List<CardModel> items = [];
  void deleteUser(CardModel card) async{
    isLoading = true;
    setState(() {});

    items.remove(card);


    await HiveService.setCards(items);
    /// 1, 2, 3
    /// 1, 2
    ///
    /// db: 1, 2
    isLoading = false;
    setState(() {});
  }

  void getAllData() async {
    isLoading = true;
    setState(() {});

    items = HiveService.readCards();
    //allUsers = items;

    isLoading = false;
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child:  CreditCardWidget(
      //     cardNumber: cardNumber,
      //     expiryDate: expiryDate,
      //     cardHolderName: cardHolderName,
      //     cvvCode: cvvCode,
      //     showBackView: isCvvFocused,
      //     obscureCardNumber: true,
      //     obscureCardCvv: true,
      //     isHolderNameVisible: true,
      //     cardBgColor: Colors.red, onCreditCardWidgetChange: (CreditCardBrand ) {  },
      //   ),
      // ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index){
            return GestureDetector(
              onDoubleTap: (){
                deleteUser(items[index]);
              },
              child: CreditCardWidget(
                cardType: CardType.mastercard,
              cardNumber: items[index].cardNumder,
              expiryDate: items[index].date,
              cardHolderName: items[index].name,
              cvvCode: items[index].cvc,
              showBackView: true,
              obscureCardNumber: true,
              obscureCardCvv: true,
              isHolderNameVisible: true,
              cardBgColor: Colors.red, onCreditCardWidgetChange: (CreditCardBrand ) {  },
              ),
            );
          }),
    );
  }
}
