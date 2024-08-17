import 'package:ffihello/ffihello.dart' as ffihello;
import 'dart:ffi';
import 'package:ffi/ffi.dart';

typedef FptrCreateFunc = Void Function(Pointer<Void> handle);
typedef FptrCreate = void Function(Pointer<Void> handle);

typedef FptrGetVersionStrigFunc = Void Function();
typedef FptrGetVersionStrig = void Function();

void main(List<String> arguments) {
  print('Hello world: ${ffihello.calculate()}!');
  final dylib = DynamicLibrary.open(
      "C:\\Program Files\\ATOL\\Drivers10\\KKT\\bin\\fptr10.dll");
  final FptrCreate fptrCreate = dylib
      .lookup<NativeFunction<FptrCreateFunc>>('libfptr_create')
      .asFunction();
  final FptrGetVersionStrig fptrGetVersionString = dylib
      .lookup<NativeFunction<FptrGetVersionStrigFunc>>(
          'libfptr_get_version_string')
      .asFunction();

  Pointer<Int32> fptr = calloc<Int32>();
  fptrCreate(fptr as Pointer<Void>);
  fptrGetVersionString();
}
