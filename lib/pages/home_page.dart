import 'package:card_registration_with_hive/pages/card_page.dart';
import 'package:card_registration_with_hive/service/theme_service.dart';
import 'package:flutter/material.dart';

import '../model/card_model.dart';
import '../service/hive_service.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = "home_page";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController cardController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController cvcController = TextEditingController();
  void saveUser() async {
    String cardNumber = cardController.text.toString().trim();
    String name = fullNameController.text.toString().trim();
    String date = dateController.text.toString().trim();
    String cvc = cvcController.text.toString().trim();


    if(cardNumber.isNotEmpty && name.isNotEmpty && date.isNotEmpty && cvc.isNotEmpty) {
      // read users
      List<CardModel> cards = HiveService.readCards();
      CardModel card = CardModel(cards.length + 1, cardNumber, name, date, cvc);

      // add user to users list
      cards.add(card);

      // store users
      await HiveService.setCards(cards);

      // close page
      openPage();
    }
  }
  void openPage(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CardPage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/2,
                  width: MediaQuery.of(context).size.width,
                  color: ThemeService.colorBlue,
                ),
                Container(
                  height: MediaQuery.of(context).size.height/2,
                  width: MediaQuery.of(context).size.width,
                  color: ThemeService.colorWhite,
                ),
              ],
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Add your card", style: ThemeService.headerStyle,),
                        GestureDetector(
                            onTap: saveUser,
                            child: const Icon(Icons.save_outlined, color: ThemeService.colorWhite,)),
                      ],
                    ),
                    ThemeService.verticalGap20,
                    Text("Fill in the fields below or use camera cvc", style: TextStyle(color: ThemeService.colorWhite.withOpacity(.7)),),
                    ThemeService.verticalGap20,
                    Text("Your card number", style: ThemeService.labelStyle),
                    ThemeService.verticalGap10,
                    Container(
                      width: double.infinity,
                      height: 50,
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: ThemeService.colorWhite,
                      ),
                      child: TextField(
                        controller: cardController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                          icon: Image.asset("assets/images/logo_card.png") ,
                          // Stack(
                          //   children: [
                          //     const Align(
                          //       alignment: Alignment(-0.95,0),
                          //       child: CircleAvatar(
                          //         backgroundColor: ThemeService.colorBlue,
                          //         radius: 10,
                          //       ),
                          //     ),
                          //     Align(
                          //       alignment: const Alignment(-0.88,0),
                          //       child: CircleAvatar(
                          //         backgroundColor: ThemeService.colorBlue.withOpacity(.5),
                          //         radius: 10,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    ThemeService.verticalGap10,
                    Text("Your fullname", style: ThemeService.labelStyle),
                    ThemeService.verticalGap10,
                    Container(
                      width: double.infinity,
                      height: 50,
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: ThemeService.colorWhite,
                      ),
                      child:  TextField(
                        controller: fullNameController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    ThemeService.verticalGap10,
              
                    SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Expiry date", style: ThemeService.labelStyle),
                                ThemeService.verticalGap10,
                                Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: ThemeService.colorWhite,
                                  ),
                                  child: TextField(
                                    controller: dateController,
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 0),

                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("CVC", style: ThemeService.labelStyle),
                                ThemeService.verticalGap10,
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: ThemeService.colorWhite,
                                  ),
                                  child:  TextField(
                                    controller: cvcController,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),

      ),
    );
  }
}
