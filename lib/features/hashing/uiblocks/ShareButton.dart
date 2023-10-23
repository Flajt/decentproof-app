import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareButton extends StatelessWidget {
  final String filePath;
  const ShareButton({Key? key, required this.filePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isIOS = Platform.isIOS;
    Size size = MediaQuery.of(context).size;

    return IconButton(
        onPressed: () async => await Share.shareXFiles([XFile(filePath)],
            sharePositionOrigin: Offset.zero & size),
        icon: Icon(isIOS ? Icons.ios_share : Icons.share));
  }
}
