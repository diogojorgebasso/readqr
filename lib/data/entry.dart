import 'package:readqr/extension/datetime.dart';

class Entry {
  final String hash;
  final String nome;
  final String cpf;
  final String festa;
  final String lote;
  final String? description;
  final DateTime? partyDate;
  final DateTime? buyDate;
  final bool isValidated;

  Entry({
    required this.hash,
    required this.nome,
    required this.cpf,
    required this.festa,
    this.partyDate,
    required this.lote,
    this.description,
    this.buyDate,
    required this.isValidated,
  });

  static Entry fromJson(Map<String, dynamic> data) {
    return Entry(
      hash: data['\$hash'],
      nome: data['nome'],
      lote: data['lote'],
      festa: data['festa'],
      cpf: data['cpf'],
      description: data['description'],
      partyDate: data['netflixReleaseDate'] != null
          ? DateTimeExt.fromUnixTimestampInt(data['partyDate'])
          : null,
      buyDate: data['releaseDate'] != null
          ? DateTimeExt.fromUnixTimestampInt(data['buyDate'])
          : null,
      isValidated: data['isValidated'],
    );
  }
}
