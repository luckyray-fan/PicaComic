import 'package:app_links/app_links.dart';
import 'package:pica_comic/foundation/history.dart';
import 'package:pica_comic/foundation/local_favorites.dart';
import 'package:pica_comic/foundation/log.dart';
import 'package:pica_comic/network/http_proxy.dart';
import 'package:pica_comic/tools/app_links.dart';
import 'package:pica_comic/tools/background_service.dart';
import 'package:pica_comic/tools/cache_auto_clear.dart';
import 'package:pica_comic/tools/io_tools.dart';
import 'package:workmanager/workmanager.dart';
import 'base.dart';
import 'foundation/app.dart';
import 'network/jm_network/jm_network.dart';
import 'network/nhentai_network/nhentai_main_network.dart';

Future<void> init() async{
  try {
    LogManager.addLog(LogLevel.info, "App Status", "Start initialization.");
    await appdata.readData();
    await App.init();
    HttpProxyServer.createConfigFile();
    if(appdata.settings[58] == "1"){
      HttpProxyServer.startServer();
    }
    startClearCache();
    if (App.isAndroid) {
      final appLinks = AppLinks();
      appLinks.allUriLinkStream.listen((uri) {
        handleAppLinks(uri);
      });
    }
    if (App.isMobile) {
      Workmanager().initialize(
        onStart,
      );
    }
    await checkDownloadPath();
    await downloadManager.init();
    await NhentaiNetwork().init();
    await JmNetwork().init();
    await LocalFavoritesManager().init();
    await LocalFavoritesManager().readData();
    await HistoryManager().init();
  }
  catch(e, s){
    LogManager.addLog(LogLevel.error, "Init", "App initialization failed!\n$e$s");
  }
}