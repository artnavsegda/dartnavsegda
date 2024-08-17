import 'package:ffihello/ffihello.dart' as ffihello;
import 'dart:ffi';
import 'package:ffi/ffi.dart';

typedef FptrGetVersionStrigFunc = Pointer<Utf8> Function();
typedef FptrGetVersionStrig = Pointer<Utf8> Function();

typedef FptrCreateFunc = Int Function(Pointer<Void> handle);
typedef FptrCreate = int Function(Pointer<Void> handle);

typedef FptrDestroyFunc = Int Function(Pointer<Void> handle);
typedef FptrDestroy = int Function(Pointer<Void> handle);

typedef FptrShowPropertiesFunc = Int Function(
    Pointer<Void> handle, Int parentType, Pointer<Int>);
typedef FptrShowProperties = int Function(
    Pointer<Void> handle, int parentType, Pointer<Int>);

typedef FptrOpenFunc = Int Function(Pointer<Void> handle);
typedef FptrOpen = int Function(Pointer<Void> handle);

typedef FptrIsOpenedFunc = Bool Function(Pointer<Void> handle);
typedef FptrIsOpened = bool Function(Pointer<Void> handle);

typedef FptrCloseFunc = Int Function(Pointer<Void> handle);
typedef FptrClose = int Function(Pointer<Void> handle);

void main(List<String> arguments) {
  final dylib = DynamicLibrary.open(
      "C:\\Program Files\\ATOL\\Drivers10\\KKT\\bin\\fptr10.dll");

  final FptrGetVersionStrig fptrGetVersionString = dylib
      .lookup<NativeFunction<FptrGetVersionStrigFunc>>(
          'libfptr_get_version_string')
      .asFunction();

  final FptrCreate fptrCreate = dylib
      .lookup<NativeFunction<FptrCreateFunc>>('libfptr_create')
      .asFunction();

  final FptrDestroy fptrDestroy = dylib
      .lookup<NativeFunction<FptrDestroyFunc>>('libfptr_destroy')
      .asFunction();

  final FptrOpen fptrOpen =
      dylib.lookup<NativeFunction<FptrOpenFunc>>('libfptr_open').asFunction();

  final FptrIsOpened fptrIsOpened = dylib
      .lookup<NativeFunction<FptrIsOpenedFunc>>('libfptr_is_opened')
      .asFunction();

  final FptrClose fptrClose =
      dylib.lookup<NativeFunction<FptrCloseFunc>>('libfptr_close').asFunction();

  final version = fptrGetVersionString();
  print(version.toDartString());

  Pointer<Void> fptr = calloc<Int32>() as Pointer<Void>;
  print('1');
  fptrCreate(fptr);
  print('2');
  fptrDestroy(fptr);
  print('3');

  return;

  fptrOpen(fptr);
  print('3');
  print("kkt is ${fptrIsOpened(fptr)}");
  fptrClose(fptr);
  print('4');
}
