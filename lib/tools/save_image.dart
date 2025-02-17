import 'dart:io';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:pica_comic/base.dart';
import 'package:pica_comic/foundation/log.dart';
import 'package:pica_comic/network/picacg_network/methods.dart';
import 'package:pica_comic/foundation/image_manager.dart';
import 'package:pica_comic/tools/translations.dart';
import 'package:pica_comic/views/widgets/show_message.dart';
import 'package:share_plus/share_plus.dart';

import '../foundation/app.dart';

///保存图片
void saveImage(String urlOrHash, String id, {bool reading=false}) async{
  if(App.isAndroid || App.isIOS) {
      var url_ = getImageUrl(urlOrHash);
      var b = await saveImageFormCache(url_, id, reading: reading);
      if(b) {
        showMessage(App.globalContext, "成功保存于Picture中".tl);
      }
      else {
        showMessage(App.globalContext, "保存失败".tl);
      }
  }else if(App.isWindows){
    try {
      File? file;
      file = (await ImageManager().getImage(urlOrHash).last).getFile();
      var f = file;
      var basename = file.path;
      var bytes = await f.readAsBytes();
      for(var i = basename.length-1;i>=0;i--){
        if(basename[i] == '/'||basename[i]=='\\'){
          basename = basename.substring(i+1);
          break;
        }
      }
      final String? path = (await getSaveLocation(suggestedName: basename))?.path;
      if (path != null) {
        const String mimeType = 'image/jpeg';
        final XFile file = XFile.fromData(
            bytes, mimeType: mimeType, name: basename);
        await file.saveTo(path);
      }
    }
    catch(e, s){
      LogManager.addLog(LogLevel.error, "Save Image", "$e\n$s");
    }
  }
}

Future<bool> saveImageFormCache(String urlOrHash, String id, {bool reading=false}) async{
  try {
    File? file;
    file = (await ImageManager().getImage(urlOrHash).last).getFile();
    var f = file;
    var name = file.path;
    for(var i = name.length-1;i>=0;i--){
      if(name[i] == '/'){
        name = name.substring(i+1);
        break;
      }
    }
    Uint8List data = await f.readAsBytes();
    await ImageGallerySaver.saveImage(
        data,
        quality: 100,
        name: name);
    return true;
  }
  catch(e){
    return false;
  }
}

void saveImageFromDisk(String image) async{
  if(App.isAndroid || App.isIOS) {
    await ImageGallerySaver.saveFile(image);
    showMessage(App.globalContext, "成功保存到Picture中".tl);
  }else if(App.isWindows){
    var f = File(image);
    String name;
    int i;
    for(i=image.length-1;i>=0;i--){
      if(image[i]==pathSep){
        break;
      }
    }
    name = image.substring(i+1);
    final String? path = (await getSaveLocation(suggestedName: name))?.path;
    if (path != null) {
      const String mimeType = 'image/jpeg';
      final XFile file = XFile.fromData(
          await f.readAsBytes(), mimeType: mimeType, name: name);
      await file.saveTo(path);
    }
  }
}

void shareImageFromCache(String urlOrHash, String id, [bool reading=false]) async{
  try{
    var file = (await ImageManager().getImage(urlOrHash).last).getFile();
    Share.shareXFiles([XFile(file.path)]);
  }
  catch(e, s){
    LogManager.addLog(LogLevel.error, "Share Image", "$e\n$s");
    showMessage(App.globalContext, "分享失败".tl);
  }
}

void shareImageFromDisk(String path) async{
  try{
    Share.shareXFiles([XFile(path)]);
  }
  catch(e){
    showMessage(App.globalContext, "分享失败".tl);
  }
}