import 'dart:io';

class ATMmachine {
  int pin = 1234;
  double balance = 0.00;

  void checkPin() {
    print("\n");
    stdout.write('Enter your pin number: ');
    int enterPin = int.parse(stdin.readLineSync()!);
    if (enterPin == pin) {
      menu();
    } else {
      stdout.write("\nInvalid Pin number :( Please enter the correct pin number\n");
      checkPin();
    }
  }

  void checkBalance() {
    stdout.write("Balance: ${balance.toStringAsFixed(2)}");
    print("\n");
    menu();
  }

  void deposit() {
    print("Enter the deposit amount: ");
    double amount = double.parse(stdin.readLineSync()!);
    balance = balance + amount;
    print("Money deposit successfully :) ");
    checkBalance();
    print("\n");
  }

  void withdraw() {
    print("Enter the withdraw amount: ");
    double amount = double.parse(stdin.readLineSync()!);
    if (amount > balance) {
      print("Insufficient Balance! :(");
      checkBalance();
    } else {
      balance = balance - amount;
      print("Money withdraw successfully :)");
      checkBalance();
    }
    print("\n");
  }

  void menu() {
    print("1. Check A/C Balance");
    print("2. Deposit Money");
    print("3. Withdraw Money");
    print("4. Exit");
    print("Enter your choice: ");

    int choice = int.parse(stdin.readLineSync()!);
    if (choice == 1) {
      checkBalance();
    } else if (choice == 2) {
      deposit();
    } else if (choice == 3) {
      withdraw();
    } else if (choice == 4) {
      return;
    } else {
      print("Invalid Choice!! Please enter the valid choice :(");
      menu();
    }
  }
}

void main() {
  ATMmachine obj = ATMmachine();
  obj.checkPin();
}
