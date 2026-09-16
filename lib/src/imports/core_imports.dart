// Flutter SDK
export 'package:flutter/material.dart';
export 'package:flutter/cupertino.dart' hide RefreshCallback;
export 'package:flutter/foundation.dart';
export 'package:flutter/services.dart';
export 'package:flutter_native_splash/flutter_native_splash.dart';

export 'package:easy_localization/easy_localization.dart' hide TextDirection, MapExtension;

// Project Core — everything exported through shared.dart (theme, extensions,
// utils, widgets, enums) plus routing and services.
export '../core/api/app_config.dart';
export '../routing/app_router.dart';
export '../routing/app_routes.dart';
export '../routing/global_navigator.dart';
export 'services.dart';
export 'shared.dart';

export '../features/auth/login_screen.dart';
export '../features/auth/signup_screen.dart';
export '../features/home/home_page.dart';
export '../features/onboarding/onboarding_page.dart';
