import 'package:ffihello/ffihello.dart' as ffihello;
import 'dart:ffi';
import 'package:ffi/ffi.dart';

typedef FptrGetVersionStrigFunc = Pointer<Utf8> Function();
typedef FptrGetVersionStrig = Pointer<Utf8> Function();

typedef FptrCreateFunc = Int Function(Pointer<Pointer<Void>> handle);
typedef FptrCreate = int Function(Pointer<Pointer<Void>> handle);

typedef FptrDestroyFunc = Int Function(Pointer<Pointer<Void>> handle);
typedef FptrDestroy = int Function(Pointer<Pointer<Void>> handle);

typedef FptrErrorCodeFunc = Int Function(Pointer<Void> handle);
typedef FptrErrorCode = int Function(Pointer<Void> handle);

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

typedef FptrBeepFunc = Int Function(Pointer<Void> handle);
typedef FptrBeep = int Function(Pointer<Void> handle);

typedef FptrLineFeedFunc = Int Function(Pointer<Void> handle);
typedef FptrLineFeed = int Function(Pointer<Void> handle);

typedef FptrPrintClicheFunc = Int Function(Pointer<Void> handle);
typedef FptrPrintCliche = int Function(Pointer<Void> handle);

typedef FptrBeginNonfiscalDocumentFunc = Int Function(Pointer<Void> handle);
typedef FptrBeginNonfiscalDocument = int Function(Pointer<Void> handle);

typedef FptrEndNonfiscalDocumentFunc = Int Function(Pointer<Void> handle);
typedef FptrEndNonfiscalDocument = int Function(Pointer<Void> handle);

typedef FptrPrintTextFunc = Int Function(Pointer<Void> handle);
typedef FptrPrintText = int Function(Pointer<Void> handle);

class Fptr {
  Pointer<Pointer<Void>> handle = calloc();
  final dylib = DynamicLibrary.open(
      "C:\\Program Files\\ATOL\\Drivers10\\KKT\\bin\\fptr10.dll");

  late FptrCreate fptrCreate;
  late FptrDestroy fptrDestroy;

  Fptr() {
    fptrCreate = dylib
        .lookup<NativeFunction<FptrCreateFunc>>('libfptr_create')
        .asFunction();
    fptrDestroy = dylib
        .lookup<NativeFunction<FptrDestroyFunc>>('libfptr_destroy')
        .asFunction();
    fptrCreate(handle);
  }

  int destroy() {
    return fptrDestroy(handle);
  }
}

void main() {
  print('hi');
}

void backup_main(List<String> arguments) {
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

  final FptrErrorCode fptrErrorCode = dylib
      .lookup<NativeFunction<FptrErrorCodeFunc>>('libfptr_error_code')
      .asFunction();

  final FptrShowProperties fptrShowProperties = dylib
      .lookup<NativeFunction<FptrShowPropertiesFunc>>('libfptr_show_properties')
      .asFunction();

  final FptrOpen fptrOpen =
      dylib.lookup<NativeFunction<FptrOpenFunc>>('libfptr_open').asFunction();

  final FptrIsOpened fptrIsOpened = dylib
      .lookup<NativeFunction<FptrIsOpenedFunc>>('libfptr_is_opened')
      .asFunction();

  final FptrClose fptrClose =
      dylib.lookup<NativeFunction<FptrCloseFunc>>('libfptr_close').asFunction();

  final FptrBeep fptrBeep =
      dylib.lookup<NativeFunction<FptrBeepFunc>>('libfptr_beep').asFunction();

  final FptrLineFeed fptrLineFeed = dylib
      .lookup<NativeFunction<FptrLineFeedFunc>>('libfptr_line_feed')
      .asFunction();

  final FptrPrintCliche fptrPrintCliche = dylib
      .lookup<NativeFunction<FptrPrintClicheFunc>>('libfptr_print_cliche')
      .asFunction();

  final FptrBeginNonfiscalDocument fptrBeginNonfiscalDocument = dylib
      .lookup<NativeFunction<FptrBeginNonfiscalDocumentFunc>>(
          'libfptr_begin_nonfiscal_document')
      .asFunction();

  final FptrEndNonfiscalDocument fptrEndNonfiscalDocument = dylib
      .lookup<NativeFunction<FptrEndNonfiscalDocumentFunc>>(
          'libfptr_end_nonfiscal_document')
      .asFunction();

  final FptrPrintText fptrPrintText = dylib
      .lookup<NativeFunction<FptrPrintTextFunc>>('libfptr_print_text')
      .asFunction();

  final version = fptrGetVersionString();
  print(version.toDartString());

  int result;
  Pointer<Pointer<Void>> handle = calloc();
  result = fptrCreate(handle);
  print('fptrCreate $result');
  result = fptrErrorCode(handle.value);
  print('fptrErrorCode $result');
/*   result = fptrShowProperties(handle.value, 0, nullptr);
  print('fptrShowProperties $result'); */
  result = fptrOpen(handle.value);
  print('fptrOpen $result');
  print("kkt is ${fptrIsOpened(handle.value)}");

  result = fptrBeep(handle.value);
  print('fptrBeep $result');
/*   result = fptrLineFeed(handle.value);
  print('fptrFeed $result');
  result = fptrPrintCliche(handle.value);
  print('fptrPrintCliche $result'); */

  result = fptrBeginNonfiscalDocument(handle.value);
  print('fptrBeginNonfiscalDocument $result');
  result = fptrPrintText(handle.value);
  print('fptrPrintText $result');
  result = fptrEndNonfiscalDocument(handle.value);
  print('fptrEndNonfiscalDocument $result');

  result = fptrClose(handle.value);
  print('fptrClose $result');
  result = fptrDestroy(handle);
  print('fptrDestroy $result');

  return;
}
