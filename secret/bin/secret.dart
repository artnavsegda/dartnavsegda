import 'package:crypto/crypto.dart';
import 'dart:convert';

void main(List<String> arguments) {
  final secret = "53Cr3t";
  final guid = "936DE051-3022-4217-834B-F5BDBFDBEE3A";
  final version = "4.0.9";

  final plaintextData = "$secret:$guid:$version:${DateTime.now().toUtc().day}";
  print('Plaintext data: $plaintextData');
  final hashedData = sha256.convert(utf8.encode(plaintextData));
  print('Hashed data: $hashedData');
}
