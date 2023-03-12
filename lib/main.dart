import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/animation.dart';

//Мои виджеты и классы
import './my classes.dart';
import './image.dart';
import './audio.dart';
import './form.dart';
import './transfer.dart';
import './interface.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: MainWidget(),
        ),
      ),
    );
  }
}

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  final CheckUserConnection _checkUserConnection = CheckUserConnection();
  final MyInternetDialogHandler _myInternetDialogHandler = MyInternetDialogHandler();
  bool? _internetAvailable;
  String name = "";
  String age = "";
  String comment = "";

  @override
  void initState(){
    super.initState();
    checkNet();
    _loadData();
  }

  //Проверка доступа в Интернет
  void checkNet() async{
    _internetAvailable = await
    _checkUserConnection.checkInternetAvailability();
    setState((){});
  }

  // Загрузка значений из формы
  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = (prefs.getString('name') ?? "");
      age = (prefs.getString('age') ?? "");
      comment = (prefs.getString('comment') ?? "");
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
    decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/main.jpg"),
            fit: BoxFit.cover)),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
            children: [
              GradientButton(label: "Работа с изображениями", onTap: ()
                  {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ImageWidget()),
                  );
                  }
              ),
              GradientButton(label: "Работа с аудио", onTap: ()
              {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AudiosWidget()),
              );
              }
              ),
              GradientButton(label: "Работа с формами и диалоговыми окнами", onTap: ()
              {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FormWidget(
                  // name: name, age: age, comment: comment
                )),
              );
              }
              ),
              GradientButton(label: "Передача данных из других экранов", onTap: ()
              {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TransferWidget(
                    name: name, age: age, comment: comment
                )),
              );
              }
              ),
              GradientButton(label: "Проверка доступа в Интернет", onTap: ()
              {
                checkNet();
                if (_internetAvailable!)
                {
                  checkNet();
                  _myInternetDialogHandler.showInternetDialog(context, "С вашим Интернет-соединением всё в порядке");
                } else {
                  checkNet();
                  _myInternetDialogHandler.showInternetDialog(context, "Проверьте своё Интернет-соединение");
                }
              }
              ),
              GradientButton(label: "Интерфейс с множеством элементов", onTap: ()
              {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InterfaceWidget()),
              );
              }
              ),
              GradientButton(label: "Анимация", onTap: ()
              {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AnimationWidget()),
              );
              }
              )
            ],
        ),
      ),
    );
  }
}