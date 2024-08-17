import 'package:ffihello/ffihello.dart' as ffihello;
import 'dart:ffi' as ffi;

typedef HelloWorld = void Function();
typedef hello_world_func = ffi.Void Function();

void main(List<String> arguments) {
  print('Hello world: ${ffihello.calculate()}!');
  final dylib = ffi.DynamicLibrary.open(
      "C:\\Program Files\\ATOL\\Drivers10\\KKT\\bin\\fptr10.dll");
  final HelloWorld hello = dylib
      .lookup<ffi.NativeFunction<hello_world_func>>('libfptr_create')
      .asFunction();
  hello();
}
