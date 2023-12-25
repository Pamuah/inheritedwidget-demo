import 'package:flutter/material.dart';
import 'package:inherited_widget/DateTimeWidget.dart';
import 'package:uuid/uuid.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  ValueKey _textkey = ValueKey<String?>(null);
  
  @override
  Widget build(BuildContext context) {
    final color=Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.primary,
        toolbarHeight: 90,
        title: Text(ApiProvider.of(context).api.dateAndTime??''),
        elevation: 0,centerTitle: true,
      ),

    body: GestureDetector(
      onTap: ()async{
        final api = ApiProvider.of(context).api;
        final dateAndTime = await api.getDateAndTime();
        setState(() {
          _textkey=ValueKey(dateAndTime);
        });
      },
      child: SizedBox.expand(
        child: DateTimeWidget(key: _textkey,),
      ),
    ),
    );
  }
}


class Api{
  String? dateAndTime;

  Future<String> getDateAndTime() async {
    return await Future.delayed(const Duration(seconds: 1),
    () =>  DateTime.now().toString()).then((value) {
      dateAndTime=value;
      return value;
    });
  }
}


class ApiProvider extends InheritedWidget {
  final Api api;
  final String uuid;

   ApiProvider({
    Key? key, 
    required this.api,
     required Widget child
     }):uuid= const Uuid().v4(),
  super(key: key,
  child: child);
  @override
  bool updateShouldNotify(covariant ApiProvider oldWidget) {
    return uuid != oldWidget.uuid;
  }
  
  static ApiProvider of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<ApiProvider>() as ApiProvider;
  }
  }