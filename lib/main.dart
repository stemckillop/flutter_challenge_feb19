import 'package:flutter/material.dart';
import 'listdata.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomeDemo(),
    );
  }
}

class MyHomeDemo extends StatelessWidget{
  const MyHomeDemo({super.key});

  @override
  Widget build(BuildContext context) {

    var data = [];
    data.add(const ListData(type: 0, core: "2023-02-19", additional: ""));
    data.add(const ListData(type: 1, core: "Stephen", additional: "Loan"));
    data.add(const ListData(type: 1, core: "Brandon", additional: "Payment for plants"));
    data.add(const ListData(type: 2, core: "Stephane", additional: "Cheers bro!"));
    data.add(const ListData(type: 0, core: "2023-02-17", additional: ""));
    data.add(const ListData(type: 1, core: "Farah", additional: "Naol"));
    data.add(const ListData(type: 1, core: "Bradley", additional: "Payment for plants"));
    data.add(const ListData(type: 2, core: "Jeffrey", additional: "Cheers bro!"));

    return Scaffold(
      body: Column(
        children: [
          Expanded(child: 
          ListView.builder(
            itemCount: data.length,
            itemBuilder: ((context, index) {
            if (data[index].type == 0) {
              return ListDateWidget(info: data[index]);
            } else if (data[index].type == 1) {
              return ListEntryWidget(info: data[index]);
            } else {
              return const ListTile(title: Text("Hello"));
            }
          }),
          ))
        ],
      ),
    );
  }
}

class ListEntryWidget extends StatelessWidget {
  const ListEntryWidget({super.key, required this.info});
  final ListData info;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      child: 
      GestureDetector(
        child: Row(
                children: [
                  Icon(Icons.person),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(info.core, style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
                      Text(info.additional, style: TextStyle(color: Colors.grey[800], fontSize: 14, fontWeight: FontWeight.w300),)
                    ],
                  )
                ],
              ),
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WidgetInformation(data: info)),
              );

      },
    )
    );
  }
}

class ListDateWidget extends StatelessWidget {
  const ListDateWidget({super.key, required this.info});
  final ListData info;

  String printDateTitle() {
    var today = DateTime.now();
    var date = DateTime.parse(this.info.core);
    if (date.day == today.day && date.month == today.month && date.year == today.year) {
      return "Today";
    }
    return DateFormat('d MMMM, y').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(printDateTitle())
        ],
      ),
    );
  }
}

class WidgetInformation extends StatelessWidget {
  const WidgetInformation({super.key, required this.data});
  final ListData data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            IconButton(onPressed: (){ Navigator.pop(context); }, icon: const Icon(Icons.chevron_left))
          ],
        ),)
    );
  }
}