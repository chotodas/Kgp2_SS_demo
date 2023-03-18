import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profanity_filter/profanity_filter.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textEditingController = TextEditingController();
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _textEditingController,
              onChanged: (value) {
                setState(() {
                  bool isBadWord = ProfanityFilter().checkString(value);
                  if (isBadWord) {
                    _result = 'Please don\'t use profanity.';
                  } else {
                    _result = '';
                  }
                });
              },
              decoration: InputDecoration(
                hintText: 'Type something...',
                errorText: _result,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                var imagePicker = ImagePicker();
                var image = await imagePicker.pickImage(
                  source: ImageSource.gallery,
                  imageQuality: 50,
                );
                bool hasNudity = await NudityDetection.hasNudity(image!.path);
                setState(() {
                  if (hasNudity) {
                    _result = 'The selected image contains nudity.';
                  } else {
                    _result = 'The selected image is safe to use.';
                  }
                });
              },
              child: Text('Pick Image'),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
