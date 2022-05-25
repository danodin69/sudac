import 'dart:io';

void loadBotInterface(String interface) {
  var interfaceFile = interface;
  var botInterface =
      File('./utils/' + interfaceFile + '.sudac').readAsStringSync();
  print(botInterface);
}
