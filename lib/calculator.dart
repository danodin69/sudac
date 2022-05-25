import 'package:sudac/file_reader.dart' as sudac;
import 'dart:io';
import 'dart:math';

class InitialiseCalculator {
  bool initialiseCalculation = true;
  String errorMessage =
      '_________-_---________\n\n<< An error occcured somewhere.. ';
//
  void startBot() {
    sudac.loadBotInterface('start_screen');
    getUserInput();
  }

  void getUserInput() {
    print('\n\n');
    var botOptions = stdin.readLineSync()!.toUpperCase();
    switch (botOptions) {
      case '+':
        initialiseAddition();
        break;
      case '-':
        initialiseSubtraction();
        break;
      case '*':
        initialiseMultiplication();
        break;
      case '/':
        initialiseDivision();
        break;
      case '%':
        initialisePercentage();
        break;
      case '^':
        initialiseSquareRoot();
        break;
      case 'I':
        botInfoScreen();
        break;
      default:
        print(
            '<<< [$botOptions]!!!Error You Have Entered An Invalid INPUT!!!, \n\n<<TRY AGAIN-->\n\n');
        return getUserInput();
    }
  }

  void initialiseAddition() {
    while (initialiseCalculation) {
      try {
        print('_________-_---________');
        print('< Input a number -->\n\n');
        double firstNum = double.parse(stdin.readLineSync()!);
        print('<< $firstNum + ?? \n<<Input a second number -->\n\n');
        double secondNum = double.parse(stdin.readLineSync()!);
        print(
            'Adding $firstNum and $secondNum would give you a sum of ${firstNum + secondNum}');
        continueCalculationDialogue('Addition', initialiseAddition);
      } catch (e) {
        print('$errorMessage ($e)');
      }
    }
  }

  void initialiseSubtraction() {
    while (initialiseCalculation) {
      try {
        print('_________-_---________');
        print('< Input a number -->\n\n');
        double firstNum = double.parse(stdin.readLineSync()!);
        print('<< $firstNum - ?? \n<<Input a second number -->\n\n');
        double secondNum = double.parse(stdin.readLineSync()!);
        var result = firstNum - secondNum;

        var isResultLessThanZero = result < 0
            ? '<< Subtracting $firstNum from $secondNum would give you a negative result of $result'
            : '<< Subtracting $firstNum from $secondNum would result to $result';
        print(isResultLessThanZero);
        continueCalculationDialogue('Subtraction', initialiseSubtraction);
      } catch (e) {
        print('$errorMessage ($e)');
      }
    }
  }

  initialiseMultiplication() {
    while (initialiseCalculation) {
      try {
        print('_________-_---________');
        print('< Input a number -->\n\n');
        double firstNum = double.parse(stdin.readLineSync()!);
        print('<< $firstNum x ?? \n<< Input a second number -->\n\n');
        double secondNum = double.parse(stdin.readLineSync()!);
        var result = firstNum * secondNum;

        var isInputZero = firstNum == 0 || secondNum == 0
            ? '<< You can\'t multiply by 0'
            : '<< Multiplying $firstNum by $secondNum will give you $result';

        print(isInputZero);
        continueCalculationDialogue('Multiplication', initialiseMultiplication);
      } catch (e) {
        print('$errorMessage ($e)');
      }
    }
  }

  initialiseDivision() {
    while (initialiseCalculation) {
      try {
        print('_________-_---________');
        print('< Input a number -->\n\n');
        double firstNum = double.parse(stdin.readLineSync()!);
        print('<<$firstNum / ?? \n<< Input a second number -->\n\n');
        double secondNum = double.parse(stdin.readLineSync()!);
        var result = firstNum / secondNum;

        if (result < 0) {
          print('_________-_---________');
          print(
              '<< Dividing $firstNum by $secondNum would give you a negative result of $result');
          print('_________-_---________');
          continueCalculationDialogue('Division', initialiseDivision);
        } else if (secondNum == 0) {
          print('_________-_---________');
          print(
              '<< Dividing $firstNum by $secondNum would give you nothing or infinity.. you can not divide by 0, you are not God!');
          print('_________-_---________');
          continueCalculationDialogue('Division', initialiseDivision);
        } else {
          print('_________-_---________');
          print('<< Dividing $firstNum by $secondNum would give you.. $result');
          print('_________-_---________');
          continueCalculationDialogue('Division', initialiseDivision);
        }
      } catch (e) {
        print('$errorMessage ($e)');
      }
    }
  }

  void initialisePercentage() {
    while (initialiseCalculation) {
      try {
        print('_________-_---________');
        print('< Input the total number -->\n\n');
        double firstNum = double.parse(stdin.readLineSync()!);
        print('_________-_---________');
        print(
            '<< How many percent of $firstNum do you want to calculate -->\n\n');
        double secondNum = double.parse(stdin.readLineSync()!);
        var result = firstNum * secondNum / 100;
        print('_________-_---________');
        print('<< $secondNum percent of $firstNum is $result ');
        continueCalculationDialogue(
            'Percentage calculation', initialisePercentage);
      } catch (e) {
        print('$errorMessage ($e)');
      }
    }
  }

  void initialiseSquareRoot() {
    while (initialiseCalculation) {
      try {
        print('_________-_---________');
        print('< Input a number you wish to find the Square root of -->\n\n');
        double firstNum = double.parse(stdin.readLineSync()!);
        var result = sqrt(firstNum);
        print('_________-_---________');
        print('<< The square root of $firstNum is $result');
        continueCalculationDialogue(
            'Square root calculation', initialiseSquareRoot);
      } catch (e) {
        print('$errorMessage ($e)');
      }
    }
  }

  void continueCalculationDialogue(
      [String? typeOfCalculation, Function? returnCalculator]) {
    print('_________-_---________');
    print(
        'Would you like to continue your $typeOfCalculation \n[Y] Yes [N] No');
    String userChoice = stdin.readLineSync()!.toUpperCase();
    switch (userChoice) {
      case 'Y':
        returnCalculator!();
        break;
      case 'YES':
        returnCalculator!();
        break;
      case 'N':
        print('_________-_---________\n\n');
        startBot();

        break;
      case 'NO':
        print('_________-_---________\n\n');
        startBot();

        break;
      default:
        print(
            '<<< !!!Error You Have Entered An Invalid INPUT!!!, \n\n<<TRY AGAIN-->\n\n');
        return continueCalculationDialogue('calculation?');
    }
  }

  void botInfoScreen() {
    sudac.loadBotInterface('info_screen');
    String returnToMain = stdin.readLineSync()!.toUpperCase();
    if (returnToMain == 'R') {
      startBot();
    } else {
      print(
          '$returnToMain -- [ command not understood, press R and enter to return to main menu :/] ');
      return botInfoScreen();
    }
  }
}

InitialiseCalculator sudacBot = InitialiseCalculator();
