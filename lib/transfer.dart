import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './my classes.dart';
import './form.dart';

// Передача данных из других экранов
class TransferWidget extends StatefulWidget {
  const TransferWidget({Key? key, required this.name, required this.age, required this.comment}) : super(key: key);
  final String name;
  final String age;
  final String comment;

  @override
  State<TransferWidget> createState() => _TransferWidgetState();
}

class _TransferWidgetState extends State<TransferWidget> {
  final String background = "assets/main.jpg";
  String name = "";
  String age = "";
  String comment = "";

  bool check = true;

  @override
  void initState() {
    super.initState();
    name = widget.name;
    age = widget.age;
    comment = widget.comment;
    _loadData();
    print('name is $name');
    print('age is $age');
    print('comment is $comment');
  }


  // Загрузка значений из формы
  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = (prefs.getString('name') ?? "");
      age = (prefs.getString('age') ?? "");
      comment = (prefs.getString('comment') ?? "");
      print('name is $name');
      print('age is $age');
      print('comment is $comment');
    });
  }


  void functionThatSetsTheState(){
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(background),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              if (name == "") ...[
                CustomText('Вы не заполнили форму оценки качества этого приложения. Пожалуйста, сделайте это сейчас и возвращайтесь как можно скорее'),
                Center(
                  child: GradientButton(label: "Заполнить форму", onTap: ()
                  async {
                    final value = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FormWidget()),
                    );
                    _loadData();
                  }
                  ),
                ),
            ] else ...[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText('Нижеследующие данные взяты из формы оценки качества этого приложения. Если бы их не было, вы бы увидели другой текст и дополнительную кнопку "Заполнить форму".'),
                    CustomText('Ваше имя: $name'),
                    CustomText('Ваша оценка: $age'),
                    CustomText('Ваш комментарий: $comment'),
                  ],
                ),

        ]
            ],
          ),
        ),
      ),
    );
  }
}

