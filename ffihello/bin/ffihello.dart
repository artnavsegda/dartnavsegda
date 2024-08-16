import 'package:ffihello/ffihello.dart' as ffihello;
import 'dart:ffi' as ffi;

typedef HelloWorld = void Function();
typedef hello_world_func = ffi.Void Function();

void main(List<String> arguments) {
  print('Hello world: ${ffihello.calculate()}!');
  final dylib = ffi.DynamicLibrary.open("C:\\sc552\\pilot_nt.dll");
  final HelloWorld hello = dylib
      .lookup<ffi.NativeFunction<hello_world_func>>('_card_authorize9')
      .asFunction();
}
