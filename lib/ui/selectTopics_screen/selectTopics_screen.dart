import 'package:cs310insta/core/state/states.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectTopics extends StatelessWidget {
  final ShareState shareState = Get.put(ShareState());

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
                child: Text("Bu Sayda Değişecek"),
                onPressed: () {},
              ),
              OutlinedButton(
                child: Text("Bu Sayda Değişecek"),
                onPressed: () {},
              ),
              OutlinedButton(
                child: Text("Bu Sayda Değişecek"),
                onPressed: () {},
              ),
              OutlinedButton(
                child: Text("Bu Sayda Değişecek"),
                onPressed: () {},
              ),
              OutlinedButton(
                child: Text("Bu Sayda Değişecek"),
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      child: Icon(
                        Icons.close,
                        size: 44,
                      ),
                      onTap: shareState.removeImage,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: ClipRRect(
                  child: Image.file(
                    shareState.getImage(),
                    height: 600,
                    width: 400,
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
