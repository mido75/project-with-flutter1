import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/main.dart';
import 'package:untitled/shared/components/custom_text.dart';
import 'package:untitled/shared/styles/color.dart';

import 'language.dart';
import 'language_constants.dart';


class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {

  String dropdownvalue = 'EN';

  // List of items in our dropdown menu
  var items = [
    'EN',
    'AR',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:
        [
          Container(
            height: 130.h,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: 24, left: 16, right: 16)
                  .r,
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  CustomText(
                    text: 'Language',
                    fontSize: 20.sp,
                    alignment: Alignment.bottomCenter,
                  ),
                  Container(
                    width: 24.w,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0).r,
            child: Row(
              children: [
                Text('change language : ',
                style: TextStyle(fontSize: 20.sp,),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: DropdownButton(
                    value: dropdownvalue,
                    icon: Icon(Icons.keyboard_arrow_down),
                    iconSize: 30,
                    iconEnabledColor: defualtColor,
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue){
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



 
/*
class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'),
      ),
      body: Container(
        child: Center(
            child: DropdownButton<Language>(
              iconSize: 30,
              hint: Text('change_language'),
              onChanged: (Language? language) {
                _changeLanguage(language!);
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                  value: e,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        e.flag,
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(e.name)
                    ],
                  ),
                ),
              ).toList(),
            )),
      ),
    );
  }
}

 */

