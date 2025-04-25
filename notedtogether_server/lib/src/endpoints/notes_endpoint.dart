import "package:notedtogether_server/src/generated/protocol.dart";
import "package:serverpod/serverpod.dart";
import "package:serverpod_auth_server/module.dart";

class NotesEndpoint extends Endpoint
{
  @override
  bool get requireLogin => true;

  Future<void> createNote
}