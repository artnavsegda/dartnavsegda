import 'package:ffihello/ffihello.dart' as ffihello;
import 'dart:ffi' as ffi;

typedef HelloWorld = void Function();
typedef hello_world_func = ffi.Void Function();

void main(List<String> arguments) {
  print('Hello world: ${ffihello.calculate()}!');
  final dylib = ffi.DynamicLibrary.open("hello.dll");
  final HelloWorld hello = dylib
      .lookup<ffi.NativeFunction<hello_world_func>>('hello_world')
      .asFunction();
}
