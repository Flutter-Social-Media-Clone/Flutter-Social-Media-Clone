import 'package:flutter/material.dart';

class SelectTopics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Topics"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              OutlinedButton(
                  child: Text("Bu Sayda Değişecek"), onPressed: () {}),
              OutlinedButton(
                  child: Text("Bu Sayda Değişecek"), onPressed: () {}),
              OutlinedButton(
                  child: Text("Bu Sayda Değişecek"), onPressed: () {}),
              OutlinedButton(
                  child: Text("Bu Sayda Değişecek"), onPressed: () {}),
              OutlinedButton(
                  child: Text("Bu Sayda Değişecek"), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
