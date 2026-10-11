// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart' hide RepeatMode;
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart'
    show kIsWeb, defaultTargetPlatform, TargetPlatform;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

/// Checks the running app version against the minimum version stored in
/// Firestore. If the app is older than the required minimum, it shows a
/// NON-dismissible dialog forcing the user to update before continuing.
///
/// Firestore layout (edit from the Firebase console anytime):
///   collection: app_version   <- first document is used
///     min_required_version : "1.2.0"   (string, semantic version)
///     latest_version       : "1.4.0"   (string, optional prompt)
///     android_store_url    : "https://play.google.com/store/apps/details?id=..."
///     ios_store_url        : "https://apps.apple.com/app/id0000000000"
///     update_message       : "A new version is required to continue."
///
/// Returns:
///   "force"    -> a blocking dialog was shown (app must not proceed)
///   "optional" -> an update exists but is not mandatory
///   "none"     -> app is up to date
///
/// The 'force' dialog blocks by never completing: nothing pops it, the barrier
/// is inert and the back button is trapped. Do NOT add a "Later"/"Cancel"
/// button or a Navigator.pop here -- that would let callers fall through into
/// the app and silently downgrade this to an optional prompt.
Future<String> forceUpdateCheck(BuildContext context) async {
  try {
    // 1. Current installed version (e.g. "1.1.0").
    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = packageInfo.version;

    // 2. Remote config document. The known document ID is auto-generated, so
    //    it would change if that document were ever deleted and recreated --
    //    and a miss here fails open and silently. Fall back to the first doc
    //    in the collection so a recreated config keeps working.
    final versions = FirebaseFirestore.instance.collection('app_version');

    Map<String, dynamic>? data;
    final byId = await versions.doc('8MiwZ1QDmRuL2bwExTy0').get();
    if (byId.exists) {
      data = byId.data();
    } else {
      final first = await versions.limit(1).get();
      if (first.docs.isNotEmpty) data = first.docs.first.data();
    }

    if (data == null) return 'none';

    final minRequired = (data['min_required_version'] ?? '0.0.0') as String;
    final latest = (data['latest_version'] ?? '0.0.0') as String;
    final message = (data['update_message'] ??
        'A new version is required to continue.') as String;

    // dart:io is unavailable on web, so derive the platform from foundation.
    final isIOS = !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;
    final storeUrl = (isIOS ? data['ios_store_url'] : data['android_store_url'])
            as String? ??
        '';

    // 3. Compare versions.
    final belowMin = _isOlder(currentVersion, minRequired);
    final belowLatest = _isOlder(currentVersion, latest);

    // 4a. Mandatory update -> blocking dialog.
    if (belowMin) {
      // Without a store URL the dialog would have no working exit, so fail
      // open rather than locking the user out of the app entirely.
      if (storeUrl.isEmpty) return 'none';

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
                  if (await canLaunchUrl(uri)) {
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

    // 4b. Optional update available.
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
