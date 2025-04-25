import 'package:notedtogether_client/notedtogether_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import "package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart";

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client(
  'http://$localhost:8080/',
  authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )
   
  ..connectivityMonitor = FlutterConnectivityMonitor();

  final sessionManager = SessionManager(caller: client.modules.auth);

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  sessionManager.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Noted Together'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> 
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text(
          'Hello, world!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class NotesPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold()
  }
}

