import 'dart:async';

import 'package:appwrite/appwrite.dart';
import 'package:readqr/api/client.dart';
import 'package:readqr/data/entry.dart';
import 'package:flutter/material.dart';

class EntryProvider extends ChangeNotifier {
  static final String _databaseId = ID.custom("ingressos");
  static final String _collectionId =
      ID.custom("terra_do_nunca"); //based on the party

  Entry? _selected;
  Entry? get selected => _selected;

  List<Entry> _entries = [];
  List<Entry> get entries => _entries;
  Future<void> list(String hash) async {
    var result = await ApiClient.database.listDocuments(
        databaseId: _databaseId,
        collectionId: _collectionId,
        queries: [Query.equal('id', hash)]);

    _entries = result.documents
        .map((document) => Entry.fromJson(document.data))
        .toList();

    notifyListeners();
  }
}
