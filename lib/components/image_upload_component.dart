import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestore
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For Image Picker
import 'package:path/path.dart' as Path;

class ImageUploadComponent extends StatefulWidget {
  @override
  final String location;
  ImageUploadComponent(this.location);
  _ImageUploadComponentState createState() => _ImageUploadComponentState();
}

class _ImageUploadComponentState extends State<ImageUploadComponent> {
  var _image, _uploadedFileURL, location;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
      child: Row(
        children: <Widget>[
          Text('Selected Image'),
          _image != null
              ? Image.asset(
                  _image.path,
                  height: 150,
                )
              : Container(height: 150),
          _image == null
              ? RaisedButton(
                  child: Text('Choose File'),
                  onPressed: chooseFile,
                  color: Colors.cyan,
                )
              : Container(),
          _image != null
              ? RaisedButton(
                  child: Text('Upload File'),
                  onPressed: uploadFile,
                  color: Colors.cyan,
                )
              : Container(),
          Text('Uploaded Image'),
          _uploadedFileURL != null
              ? Image.network(
                  _uploadedFileURL,
                  height: 150,
                )
              : Container(),
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

  Future uploadFile() async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('posts/${Path.basename(_image.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
      });
    });
  }
}
