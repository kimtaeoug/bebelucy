// class BleProtocol{
//   final String serviceUUID = '0000fff0-0000-1000-8000-00805f9b34fb';
//   final String rxUUID = '0000fff1-0000-1000-8000-00805f9b34fb';
//   final String txUUID = '0000fff2-0000-1000-8000-00805f9b34fb';
//   List<int> activateSleep(){
//     return [0x5A, 0x01, 0x73, 0xB0 + 1, 0xA5];
//   }
//   List<int> inactivateSleep(){
//     return [0x5A, 0x01, 0x73, 0xB0 + 0, 0xA5];
//   }
//   List<int> sleepLastState(){
//     return [0x5A, 0x01, 0x74, 0xB1, 0xA5];
//   }
//   List<int> getData(){
//     return [0x5A, 0x01, 0x71, 0xB1, 0xA5];
//   }
//
//   //Action
//   final String getSleepState = 'getSleepState';
//   final String controlSleep = 'controlSleep';
//   final String getDetailData = 'getDetailData';
// }
