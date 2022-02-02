import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/firebase_options.dart';
import 'package:myapp/routes.dart';
import 'package:myapp/theme.dart';

/*
signingReport:
Variant: profileUnitTest
Config: debug
Store: /Users/timoteo/.android/debug.keystore
Alias: AndroidDebugKey
MD5: BF:CE:2C:30:B5:00:9F:84:69:CE:F8:02:90:8D:C9:78
SHA1: 99:05:A7:85:81:C6:24:D9:1E:76:4C:1B:A3:A8:87:AC:6E:6E:C0:C7
SHA-256: 60:B0:AC:A6:AB:B8:AD:78:69:D0:78:F2:26:CD:2C:C8:88:D3:D5:E8:57:A8:E4:A1:E3:8B:E4:25:B4:EB:72:13
Valid until: Friday, January 26, 2052
----------
 */
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(App());
}

/// We are using a StatefulWidget such that we only create the [Future] once,
/// no matter how many times our widget rebuild.
/// If we used a [StatelessWidget], in the event where [App] is rebuilt, that
/// would re-initialize FlutterFire and make our application re-enter loading state,
/// which is undesired.
class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text('error', textDirection: TextDirection.ltr);
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            routes: appRoutes,
            theme: appTheme,
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Text('loading', textDirection: TextDirection.ltr);
      },
    );
  }
}
