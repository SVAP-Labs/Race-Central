// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart' hide RepeatMode;
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class UniversalBackHandler extends StatefulWidget {
  const UniversalBackHandler({
    super.key,
    this.width,
    this.height,
    required this.onBackAction, // This will handle our safe, native navigation
  });

  final double? width;
  final double? height;
  final Future Function() onBackAction;

  @override
  State<UniversalBackHandler> createState() => _UniversalBackHandlerState();
}

class _UniversalBackHandlerState extends State<UniversalBackHandler> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // Completely blocks browser panic-closing and native loops
      onPopInvokedWithResult: (bool didPop, dynamic result) async {
        if (didPop) return;

        if (context.mounted) {
          await widget.onBackAction(); // Run your custom navigation
        }
      },
      child: SizedBox(
        width: widget.width ?? 1.0,
        height: widget.height ?? 1.0,
      ),
    );
  }
}
