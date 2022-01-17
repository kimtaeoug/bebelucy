class BLEProtocol{
  final String serviceUUID = '0000fff0-0000-1000-8000-00805f9b34fb';
  final String rxUUID = '0000fff1-0000-1000-8000-00805f9b34fb';
  final String txUUID = '0000fff2-0000-1000-8000-00805f9b34fb';
  List<int> enviromentDataProtocol = [0x5A, 0x01, 0x71, 0xB1, 0xA5];
  List<int> shakeOffProtocol = [0x5A, 0x01, 0x73, 0xB0 + 0, 0xA5];
  List<int> shakeLevel1Protocol = [0x5A, 0x01, 0x73, 0xB1, 0xA5];
  List<int> shakeLevel2Protocol = [0x5A, 0x01, 0x73, 0xB2, 0xA5];
  List<int> shakeLevel3Protocol = [0x5A, 0x01, 0x73, 0xB3, 0xA5];
}
