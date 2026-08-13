// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io' show Platform;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

/// Checks the running app version against a minimum version stored in
/// Firestore. If the app is older than the required minimum, it shows a
/// NON-dismissible dialog forcing the user to update before continuing.
///
/// Firestore layout expected (edit these from the Firebase console anytime):
///   collection: app_config
///     document:  version
///       fields:
///         min_required_version : "1.2.0"   (string, semantic version)
///         latest_version       : "1.4.0"   (string, optional prompt)
///         android_store_url    : "https://play.google.com/store/apps/details?id=com.svaplabs.myapp"
///         ios_store_url        : "https://apps.apple.com/app/id0000000000"
///         update_message       : "A new version is required to continue."
///
/// Returns:
///   "force"    -> a blocking dialog was shown (app should not proceed)
///   "optional" -> an update exists but is not mandatory
///   "none"     -> app is up to date
Future<String> forceUpdateCheck(BuildContext context) async {
  try {
    // 1. Current installed version (e.g. "1.1.0")
    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = packageInfo.version;

    // 2. Remote config document
    final snap = await FirebaseFirestore.instance
        .collection('app_config')
        .doc('version')
        .get();

    if (!snap.exists) return 'none';
    final data = snap.data() ?? {};

    final minRequired = (data['min_required_version'] ?? '0.0.0') as String;
    final latest = (data['latest_version'] ?? '0.0.0') as String;
    final message = (data['update_message'] ??
        'A new version is required to continue.') as String;

    final storeUrl = (Platform.isIOS
            ? data['ios_store_url']
            : data['android_store_url']) as String? ??
        '';

    // 3. Compare versions
    final belowMin = _isOlder(currentVersion, minRequired);
    final belowLatest = _isOlder(currentVersion, latest);

    // 4a. Mandatory update -> blocking dialog
    if (belowMin) {
      await showDialog(
        context: context,
        barrierDismissible: false, // user cannot tap outside to close
        builder: (ctx) => PopScope(
          canPop: false, // block Android back button
          child: AlertDialog(
            title: const Text('Update Required'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () async {
                  final uri = Uri.parse(storeUrl);
                  if (storeUrl.isNotEmpty && await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  }
                },
                child: const Text('Update Now'),
              ),
            ],
          ),
        ),
      );
      return 'force';
    }

    // 4b. Optional update available
    if (belowLatest) {
      return 'optional';
    }

    return 'none';
  } catch (e) {
    // Fail open: never lock users out because of a network/config error.
    return 'none';
  }
}

/// Returns true if [current] is older than [minimum].
/// Compares dot-separated numeric versions, e.g. "1.2.0" vs "1.3.0".
bool _isOlder(String current, String minimum) {
  final c = _parse(current);
  final m = _parse(minimum);
  final len = c.length > m.length ? c.length : m.length;
  for (var i = 0; i < len; i++) {
    final cv = i < c.length ? c[i] : 0;
    final mv = i < m.length ? m[i] : 0;
    if (cv < mv) return true;
    if (cv > mv) return false;
  }
  return false; // equal -> not older
}

List<int> _parse(String v) => v
    .split('.')
    .map((s) => int.tryParse(s.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0)
    .toList();
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!
