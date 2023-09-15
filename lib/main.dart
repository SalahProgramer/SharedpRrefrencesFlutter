import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool vis = false;
  String? note;
@override
  void initState() {
getNode();
super.initState();
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController control = TextEditingController();

    return Container(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Text("Shared refrences"),
        ),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                      controller: control,
                      textAlign: TextAlign.center,
                      expands: false,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).hoverColor, width: 2),
                          borderRadius: BorderRadius.circular(40),
                        ),
                      )),
                ),

                ElevatedButton(
                    onPressed: () {
                      setNotes(control.text);
getNode();
                      setState(() {
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                    ),
                    child: Text("Save")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        vis = !vis;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                    ),
                    child: Text("View Notes")),
                Visibility(
                    visible: vis,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0), child: note==null ? Text("Empty"):
                        Text(""+note!)

                      // TextFormField(
                      //     maxLines: 9,
                      //     minLines: 8,
                      //
                      //
                      //     decoration: InputDecoration(
                      //       contentPadding: EdgeInsets.all(30),
                      //       filled: true,
                      //       border: OutlineInputBorder(
                      //         borderSide: BorderSide(
                      //             color: Theme.of(context).hoverColor,
                      //             width: 2),
                      //         borderRadius: BorderRadius.circular(40),
                      //       ),
                      //     )),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> setNotes(notevalue) async {
    final SharedPreferences pref1 = await SharedPreferences.getInstance();
    getNode();
    pref1.setString("Note data", note!+"\n"+notevalue);
  }
  void getNode () async{
    final SharedPreferences pref1 = await SharedPreferences.getInstance();
    note = pref1.getString("Note data");



  }

}
