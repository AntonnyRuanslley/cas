import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../services/settings_service.dart';
import '../routes/routes_names.dart';

class SplashScreenController extends GetxController {
  final settingsService = Get.find<SettingsService>();

  Future<void> initializeApp() async {
    if (settingsService.hasChoice) {
      if (settingsService.isOnline) {
        final connectivityResult = await Connectivity().checkConnectivity();
        if (connectivityResult == ConnectivityResult.none) {
          Get.offAllNamed(RoutesNames.noConnectionPage);
          return;
        }
        settingsService.onLogin().then((value) {
          if (value) {
            Get.offAllNamed(RoutesNames.loginPage);
          } else {
            settingsService.getUser().then((value) {
              if (value) {
                Get.offAllNamed(RoutesNames.homePage);
              } else {
                Get.offAllNamed(RoutesNames.transactionsListPage);
              }
            });
          }
        });
      } else {
        Get.offAllNamed(RoutesNames.transactionsListPage);
        return;
      }
    } else {
      Get.offAllNamed(RoutesNames.selectionPage);
    }
  }
}
