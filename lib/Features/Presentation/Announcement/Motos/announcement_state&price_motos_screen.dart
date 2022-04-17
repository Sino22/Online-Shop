import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Features/Presentation/Announcement/Motos/announcement_motos_preview.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class StateAndPriceMotosItemScreen extends StatefulWidget {
  final String categorie;
  final String announcementTitle;
  final String color;
  final String description;
  final double kilometrage;
  final String modelYear;
  final String datemiseencircul;
  final String typemotos;
  final String marque;
  final String model;
  final List<String> urls;
  StateAndPriceMotosItemScreen({
    Key? key,
    required this.categorie,
    required this.announcementTitle,
    required this.color,
    required this.description,
    required this.urls,
    required this.kilometrage,
    required this.datemiseencircul,
    required this.modelYear,
    required this.typemotos,
    required this.marque,
    required this.model,
  }) : super(key: key);

  @override
  _StateAndPriceMotosItemScreenState createState() =>
      _StateAndPriceMotosItemScreenState();
}

class _StateAndPriceMotosItemScreenState
    extends State<StateAndPriceMotosItemScreen> {
  final _price = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isUsedSelected = false;
  bool _isNewSelected = false;
  String? countryValue;
  String? stateValue;
  String? cityValue;
  String _state = '';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: KbackgroundColor,
      appBar: new AppBar(
        title: Row(
          children: [
            SizedBox(width: 70),
            Center(
              child: new Text(
                "Price and Condition",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Price",
                    style: headline6,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                height: 65,
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: width > 320 ? 100 : 60),
                        Container(
                          width: 160,
                          child: TextFormField(
                            controller: _price,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Price",
                              fillColor: Colors.white,
                              filled: true,
                              border: InputBorder.none,
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'veuillez saisir le prix';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        Text("TND")
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Governorate / Delegation",
                    style: headline6,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Form(
                child: Column(
                  children: [
                    CSCPicker(
                      defaultCountry: DefaultCountry.Tunisia,
                      stateDropdownLabel: "governorate",
                      cityDropdownLabel: "delegation",
                      disableCountry: true,
                      onCountryChanged: (value) {
                        setState(() {
                          countryValue = value;
                        });
                      },
                      onStateChanged: (value) {
                        setState(() {
                          stateValue = value;
                        });
                      },
                      onCityChanged: (value) {
                        setState(() {
                          cityValue = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              //// **** select state **** ////
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Select item condition",
                    style: headline6,
                  ),
                ),
              ),

              SizedBox(height: 10),

              TextButton(
                onPressed: () {
                  setState(() {
                    _isUsedSelected = !_isUsedSelected;
                    _isNewSelected = false;
                    _state = "Utilisé";
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 0),
                  height: 60,
                  width: 370,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Used',
                    style: _isUsedSelected
                        ? TextStyle(color: Colors.black)
                        : TextStyle(color: Colors.grey),
                  ),
                ),
              ),

              TextButton(
                onPressed: () {
                  setState(() {
                    _isNewSelected = !_isNewSelected;
                    _isUsedSelected = false;
                    _state = "Neuf";
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 0),
                  height: 60,
                  width: 370,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'New',
                    style: _isNewSelected
                        ? TextStyle(color: Colors.black)
                        : TextStyle(color: Colors.grey),
                  ),
                ),
              ),

              /// **** button *** ///
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: 370,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                      ),
                      onPressed: () {
                        final String categorie = widget.categorie;
                        final String announcementTitle =
                            widget.announcementTitle;

                        final String color = widget.color;

                        final String description = widget.description;
                        final String gouvernorate = stateValue.toString();
                        final String delegation = cityValue.toString();
                        final String state = _state;
                        final double price = double.parse(_price.text);
                        final double kilometrage = widget.kilometrage;
                        final String modelYear = widget.modelYear;
                        final String datemiseencircul = widget.datemiseencircul;
                        final String typemotos = widget.typemotos;
                        final String marque = widget.marque;
                        final String model = widget.model;
                        if (_state.isEmpty ||
                            stateValue!.isEmpty ||
                            cityValue!.isEmpty) {
                          showTopSnackBar(
                            context,
                            CustomSnackBar.info(
                              backgroundColor: Colors.white,
                              message: "Veuillez remplir les champs ",
                              textStyle: TextStyle(color: Colors.red),
                            ),
                          );
                        } else
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AnnouncementMotosPreviewScreen(
                                announcementTitle: announcementTitle,
                                categorie: categorie,
                                delegation: delegation,
                                description: description,
                                color: color,
                                gouvernorate: gouvernorate,
                                price: price,
                                state: state,
                                images: widget.urls,
                                datemiseencircul: datemiseencircul,
                                kilometrage: kilometrage,
                                modelYear: modelYear,
                                typeMotos: typemotos,
                                marque: marque,
                                model: model,
                              ),
                            ),
                          );
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
