/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i2;

abstract class Note implements _i1.TableRow<int>, _i1.ProtocolSerialization {
  Note._({
    this.id,
    required this.text,
    required this.createdById,
    this.createdBy,
  });

  factory Note({
    int? id,
    required String text,
    required int createdById,
    _i2.UserInfo? createdBy,
  }) = _NoteImpl;

  factory Note.fromJson(Map<String, dynamic> jsonSerialization) {
    return Note(
      id: jsonSerialization['id'] as int?,
      text: jsonSerialization['text'] as String,
      createdById: jsonSerialization['createdById'] as int,
      createdBy: jsonSerialization['createdBy'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['createdBy'] as Map<String, dynamic>)),
    );
  }

  static final t = NoteTable();

  static const db = NoteRepository._();

  @override
  int? id;

  String text;

  int createdById;

  _i2.UserInfo? createdBy;

  @override
  _i1.Table<int> get table => t;

  /// Returns a shallow copy of this [Note]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Note copyWith({
    int? id,
    String? text,
    int? createdById,
    _i2.UserInfo? createdBy,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'text': text,
      'createdById': createdById,
      if (createdBy != null) 'createdBy': createdBy?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'text': text,
      'createdById': createdById,
      if (createdBy != null) 'createdBy': createdBy?.toJsonForProtocol(),
    };
  }

  static NoteInclude include({_i2.UserInfoInclude? createdBy}) {
    return NoteInclude._(createdBy: createdBy);
  }

  static NoteIncludeList includeList({
    _i1.WhereExpressionBuilder<NoteTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NoteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NoteTable>? orderByList,
    NoteInclude? include,
  }) {
    return NoteIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Note.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Note.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NoteImpl extends Note {
  _NoteImpl({
    int? id,
    required String text,
    required int createdById,
    _i2.UserInfo? createdBy,
  }) : super._(
          id: id,
          text: text,
          createdById: createdById,
          createdBy: createdBy,
        );

  /// Returns a shallow copy of this [Note]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Note copyWith({
    Object? id = _Undefined,
    String? text,
    int? createdById,
    Object? createdBy = _Undefined,
  }) {
    return Note(
      id: id is int? ? id : this.id,
      text: text ?? this.text,
      createdById: createdById ?? this.createdById,
      createdBy:
          createdBy is _i2.UserInfo? ? createdBy : this.createdBy?.copyWith(),
    );
  }
}

class NoteTable extends _i1.Table<int> {
  NoteTable({super.tableRelation}) : super(tableName: 'note') {
    text = _i1.ColumnString(
      'text',
      this,
    );
    createdById = _i1.ColumnInt(
      'createdById',
      this,
    );
  }

  late final _i1.ColumnString text;

  late final _i1.ColumnInt createdById;

  _i2.UserInfoTable? _createdBy;

  _i2.UserInfoTable get createdBy {
    if (_createdBy != null) return _createdBy!;
    _createdBy = _i1.createRelationTable(
      relationFieldName: 'createdBy',
      field: Note.t.createdById,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _createdBy!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        text,
        createdById,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'createdBy') {
      return createdBy;
    }
    return null;
  }
}

class NoteInclude extends _i1.IncludeObject {
  NoteInclude._({_i2.UserInfoInclude? createdBy}) {
    _createdBy = createdBy;
  }

  _i2.UserInfoInclude? _createdBy;

  @override
  Map<String, _i1.Include?> get includes => {'createdBy': _createdBy};

  @override
  _i1.Table<int> get table => Note.t;
}

class NoteIncludeList extends _i1.IncludeList {
  NoteIncludeList._({
    _i1.WhereExpressionBuilder<NoteTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Note.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int> get table => Note.t;
}

class NoteRepository {
  const NoteRepository._();

  final attachRow = const NoteAttachRowRepository._();

  /// Returns a list of [Note]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Note>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NoteTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NoteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NoteTable>? orderByList,
    _i1.Transaction? transaction,
    NoteInclude? include,
  }) async {
    return session.db.find<Note>(
      where: where?.call(Note.t),
      orderBy: orderBy?.call(Note.t),
      orderByList: orderByList?.call(Note.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Note] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Note?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NoteTable>? where,
    int? offset,
    _i1.OrderByBuilder<NoteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NoteTable>? orderByList,
    _i1.Transaction? transaction,
    NoteInclude? include,
  }) async {
    return session.db.findFirstRow<Note>(
      where: where?.call(Note.t),
      orderBy: orderBy?.call(Note.t),
      orderByList: orderByList?.call(Note.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Note] by its [id] or null if no such row exists.
  Future<Note?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    NoteInclude? include,
  }) async {
    return session.db.findById<Note>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Note]s in the list and returns the inserted rows.
  ///
  /// The returned [Note]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Note>> insert(
    _i1.Session session,
    List<Note> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Note>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Note] and returns the inserted row.
  ///
  /// The returned [Note] will have its `id` field set.
  Future<Note> insertRow(
    _i1.Session session,
    Note row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Note>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Note]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Note>> update(
    _i1.Session session,
    List<Note> rows, {
    _i1.ColumnSelections<NoteTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Note>(
      rows,
      columns: columns?.call(Note.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Note]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Note> updateRow(
    _i1.Session session,
    Note row, {
    _i1.ColumnSelections<NoteTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Note>(
      row,
      columns: columns?.call(Note.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Note]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Note>> delete(
    _i1.Session session,
    List<Note> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Note>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Note].
  Future<Note> deleteRow(
    _i1.Session session,
    Note row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Note>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Note>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<NoteTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Note>(
      where: where(Note.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NoteTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Note>(
      where: where?.call(Note.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class NoteAttachRowRepository {
  const NoteAttachRowRepository._();

  /// Creates a relation between the given [Note] and [UserInfo]
  /// by setting the [Note]'s foreign key `createdById` to refer to the [UserInfo].
  Future<void> createdBy(
    _i1.Session session,
    Note note,
    _i2.UserInfo createdBy, {
    _i1.Transaction? transaction,
  }) async {
    if (note.id == null) {
      throw ArgumentError.notNull('note.id');
    }
    if (createdBy.id == null) {
      throw ArgumentError.notNull('createdBy.id');
    }

    var $note = note.copyWith(createdById: createdBy.id);
    await session.db.updateRow<Note>(
      $note,
      columns: [Note.t.createdById],
      transaction: transaction,
    );
  }
}
