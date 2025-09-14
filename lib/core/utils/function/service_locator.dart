import "package:get_it/get_it.dart";

import '../cache/cache_helper.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
}
