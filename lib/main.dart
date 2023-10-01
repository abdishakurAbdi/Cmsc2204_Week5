import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Week 6 Git'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool pageLoad = true;
  bool loadData = false;

  List<Customers> customers = [
    Customers("Abdishakur", "Abdi", 1, "Spender"),
    Customers("Bob", "Lee", 2, "Saver"),
    Customers("Monkey D.", "Luffy", 3, "Spender"),
    Customers("Lou", "Zeng", 4, "Frequent"),
    Customers("Yang", "Kai", 5, "Occasional"),
    Customers("Mike", "Ike", 6, "Saver"),
    Customers("Iron", "Man", 7, "Spender"),
    Customers("Winter", "Soldier", 8, "Occadional"),
    Customers("Dylan", "Edward", 9, "Occasional"),
    Customers("First", "Last", 10, "Frequent")
  ];

  void _handleButtonPress() {
    setState(() {
      pageLoad = false;
      loadData = true;
    });

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        loadData = false;
      });
    });
  }

  void _handleHome() {
    setState(() {
      pageLoad = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: pageLoad
            ? ElevatedButton(
                onPressed: _handleButtonPress,
                child: Text("Load Items From Database"),
              )
            : loadData
                ? const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Text("Loading Data"),
                    ],
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: customers.map((customer) {
                        return Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("First Name: ${customer.firstName}"),
                              Text("Last Name: ${customer.lastName}"),
                              Text(
                                  'CustomerID: ${customer.customerID.toString()}'),
                              Text("Type: ${customer.type}")
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleHome,
        child: Icon(Icons.home),
      ),
    );
  }
}

class Customers {
  String firstName;
  String lastName;
  int customerID;
  String type;

  Customers(this.firstName, this.lastName, this.customerID, this.type);
}
