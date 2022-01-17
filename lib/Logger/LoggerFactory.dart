
import 'package:logger/logger.dart';

class LoggerFactory{
  static final LoggerFactory loggerFactory = LoggerFactory._init();
  LoggerFactory._init();
  factory LoggerFactory() => loggerFactory;
  final Logger logger = Logger(
    printer: PrettyPrinter(
      colors: true,
      printEmojis: true,
      printTime: true
    )
  );
  //상세 모드(Verbose)
  logV(String input) => logger.v(input);
  //디버그 모드(Debug)
  logD(String input) => logger.d(input);
  //Information 모드(Information)
  logI(String input) => logger.i(input);
  //경고 모드(Warning)
  logW(String input) => logger.w(input);
  //Error 모드(Error)
  logE(String input) => logger.e(input);
  //WhatTheFuck ERROR 모드
  logWtf(String input) => logger.wtf(input);
}
