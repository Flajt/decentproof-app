import 'package:decentproof/pages/videoimagepage/logic/ImageManger.dart';
import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  const ImageButton({Key? key, required this.imageManager}) : super(key: key);
  final ImageManager imageManager;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .7,
      height: size.height * .3,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2.0),
          borderRadius: const BorderRadius.all(Radius.circular(20.0))),
      child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => imageManager.saveImage(),
            radius: size.width,
            splashColor: Colors.lightGreenAccent,
            child: Row(children: const [
              Icon(
                Icons.photo,
                size: 100.0,
              ),
              Text("Take a Photo",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0))
            ]),
          )),
    );
  }
}
