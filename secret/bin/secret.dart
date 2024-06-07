import 'package:secret/secret.dart' as secret;
import 'package:crypto/crypto.dart';
import 'dart:convert';

void main(List<String> arguments) {
  var bytes = utf8.encode("foobar"); // data being hashed
  var digest = sha256.convert(bytes);

  print('Hello world: ${digest}!');
}
