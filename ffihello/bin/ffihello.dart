import 'package:ffihello/ffihello.dart' as ffihello;
import 'dart:ffi';
import 'package:ffi/ffi.dart';

typedef HelloWorldFunc = Void Function(Pointer<Void> handle);
typedef HelloWorld = void Function(Pointer<Void> handle);

void main(List<String> arguments) {
  print('Hello world: ${ffihello.calculate()}!');
  final dylib = DynamicLibrary.open(
      "C:\\Program Files\\ATOL\\Drivers10\\KKT\\bin\\fptr10.dll");
  final fptr = calloc<Void>();
  final HelloWorld hello = dylib
      .lookup<NativeFunction<HelloWorldFunc>>('libfptr_create')
      .asFunction();
  hello(fptr);
}
