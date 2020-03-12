import 'package:facefood/models/post.dart';
import 'package:facefood/style/style.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter/painting.dart';

class ImageUploadComponent extends StatefulWidget {
  final String location;
  final Post _post;

  @override
  ImageUploadComponent(this.location, this._post);

  _ImageUploadComponentState createState() => _ImageUploadComponentState();
}

class _ImageUploadComponentState extends State<ImageUploadComponent> {
  var _image, _uploadedFileURL;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // now this button is add new or update depend on _image
              Container(
                padding: EdgeInsets.only(right: 2),
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: RaisedButton(
                    child: Text(_image == null ? "Add image" : "Update Image",
                        style: TextStyle(color: Colors.white)),
                    onPressed: () => chooseFile(),
                    color: Colors.red,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0)),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2 - 20,
                padding: EdgeInsets.only(left: 2),
                child: RaisedButton(
                    child: Text('Delete image',
                        style: TextStyle(color: Colors.white)),
                    onPressed: _image != null ? () => deleteFile() : null,
                    color: Colors.red,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0)),
              )
            ],
          ),
          // this hold picture (if any) but allway show on screen
          Container(
            width: MediaQuery.of(context).size.width - 10,
            height: MediaQuery.of(context).size.width * 0.7,
            decoration:
                BoxDecoration(border: Border.all(color: colorTextDefault)),
            child: _image != null
                ? FittedBox(
                    child: Image.asset(
                      _image.path,
                      height: 200,
                      width: 300,
                    ),
                    fit: BoxFit.cover,
                  )
                : Icon(
                    Icons.add_a_photo,
                    size: 100,
                  ),
          )
        ],
      ),
    );
  }

  Future chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
    });
  }

  Future uploadFile(String location) async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child(location + '/${Path.basename(_image.path)}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
        widget._post.imageUrl = _uploadedFileURL;
      });
    });
  }

  Future deleteFile() async {
    setState(() {
      _image = null;
    });
  }
}
