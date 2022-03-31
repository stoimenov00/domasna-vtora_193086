import 'dart:io';
import'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Фотографија од галерија'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  File _image;


  // Future getImage() async{
  //   final image = await ImagePicker().getImage(source: ImageSource.camera);
  //
  //   setState(() {
  //     _image = image;
  //   });
  // }

  Future getImage() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);
    _image = File(image.path);

    setState(() {
      _image = image as File;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        title: Text(widget.title),



      ),
      body: Center(

          child: _image == null ? Text("Image is not loaded") : Image.file(_image)

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          getImage();

          },
        tooltip: 'Increment',
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}