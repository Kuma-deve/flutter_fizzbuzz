import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FizzBuzz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FizzBuzz(),
    );
  }
}

class FizzBuzz extends StatefulWidget {
  const FizzBuzz({Key? key}) : super(key: key);

  @override
  _FizzBuzzState createState() => _FizzBuzzState();
}

class _FizzBuzzState extends State<FizzBuzz> {
  var start = 1;
  final TextEditingController _controller = TextEditingController();
  List list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FizzBuzz"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                hintText: "数値",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                int stop = int.parse(_controller.text);
                for (var i = start; i <= stop; i++) {
                  var result = fizzBuzz(i);
                  setState(() {
                    list.add(result);
                  });
                  if (kDebugMode) {
                    print("$i is $result");
                  }
                }
              },
              child: const Text("Start"),
            ),
            SizedBox(
              height: 500,
              width: double.infinity,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Text(list[index].toString());
                },
                itemCount: list.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  fizzBuzz(int num, [int fizz = 3, int buzz = 5]) {
    if (num % fizz == 0 && num % buzz == 0) {
      return "FizzBuzz";
    } else if (num % fizz == 0) {
      return "Fizz";
    } else if (num % buzz == 0) {
      return "Buzz";
    } else {
      return num;
    }
  }
}
