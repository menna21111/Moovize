import 'dart:developer';

import '../helper/cachhelper.dart';


class ThemeCachHelper {
  Future<void> saveThemeData(bool isDark) async {
    await CacheHelper().saveData(key: 'isDark', value: isDark);
  }

  Future<bool> getThemeData() async {
    final isDark = CacheHelper().getData(key: 'isDark');
    log('${CacheHelper().getData(key: 'isDark')}');
    return isDark ?? false;
  }
}
