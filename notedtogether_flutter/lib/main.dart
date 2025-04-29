import 'package:notedtogether_client/notedtogether_client.dart';
import 'package:notedtogether_flutter/note_dialog.dart';
import 'package:notedtogether_flutter/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
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
)..connectivityMonitor = FlutterConnectivityMonitor();

final sessionManager = SessionManager(caller: client.modules.auth);

void main() async {
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
  void initState()
  {
    super.initState();

    sessionManager.addListener((){
      setState(() {
        {}
      });
    });
  }

  @override 
  Widget build(BuildContext context)
  {
    return switch(sessionManager.isSignedIn)
    {
      true => NotesPage(),
      false => SignInPage(),
    };
  }
}

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  NotesPageState createState() => NotesPageState();
}

class NotesPageState extends State<NotesPage> 
{
  List<Note>? _notes;
  Exception? _connectionException;

void initState()
{
  super.initState();
  _loadNotes();
}
Future<void> _createNote(String text) async
{
  var note = Note(
    text: text,
    createdById: sessionManager.signedInUser!.id!,
  );

  setState(()
  {
    _notes?.add(note);
  });

  try
  {
    await client.notes.createNote(note);
    await _loadNotes();
  }
  catch(e)
  {
    _connectionFailed(e);
  }
}

Future<void> _loadNotes() async
{
  try
  {
    var notes = await client.notes.getAllNotes();
    setState(()
    {
      _notes = notes;
    });
  }
  catch(e)
  {
    _connectionFailed(e);
  }
}

Future<void> _deleteNote(note) async
{
  setState(() {
    _notes!.remove(note);
  });

  try
  {
    await client.notes.deleteNote(note);
    await _loadNotes();
  }
  catch(e)
  {
    _connectionFailed(e);
  }
}

void _connectionFailed(dynamic exception)
{
  setState(()
  {
    _notes = null;
    _connectionException = exception;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:AppBar(
      title: const Text("Noted Together"),
      actions: [
        IconButton(
          onPressed: ,
           icon: Icon(Icons.))
      ]
     )
    );
  }
}

class SignInPage extends StatelessWidget
{
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar:AppBar(
        title: const Text("Noted Together"),
      ),
      body: Center(
        child: SignInWithEmailButton(caller: client.modules.auth),
        )
      ); 
  }
}