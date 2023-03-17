/******************************************
 * Kriptografi Klasik
 * Code by Crosbydev | Ristu Aji
 * 
 * 
 * Diselesaikan pada 17 Maret 2023
 ******************************************/

import 'dart:io';

void main() {
  int menu = 0;
  print("===================================");
  print("==== Conventional Cryptography ====");
  print("===================================");

  print("1. Caesar Cipher");
  print("2. Vignere Cipher");
  print("3. Keluar");
  print("");
  stdout.write("silahkan pilih menu: ");
  String pilihan = stdin.readLineSync()!;

  // untuk mengecek apakah inputan berupa angka atau string
  try {
    menu = int.parse(pilihan);
  } catch (e) {
    print('');
    print('Pastikan memilih menu dengan benar!');
    print('');
  }

  if (menu == 1) {
    caesar();
  } else if (menu == 2) {
    vignere();
  } else if (menu == 3) {
    print('Terima Kasih');
    exit(0);
  } else {
    main();
  }
}

void caesar() {
  int pil;

  bool stop = true;

  while (stop) {
    print("====== CAESAR CIPHER ======");
    print("1. Encrypt ");
    print("2. Decrypt ");
    print("3. Kembali ");
    print("");
    stdout.write("pilih Menu: ");
    String choice = stdin.readLineSync()!;

    try {
      pil = int.parse(choice);
    } catch (e) {
      print('option salah!');
      continue;
    }

    switch (pil) {
      case 1:
        {
          print("Encrypt");
          caesarproses(true);
          break;
        }
      case 2:
        {
          print("Decrypt");
          caesarproses(false);
          break;
        }
      case 3:
        {
          stop = false;
          main();
          break;
        }
      default:
        {
          print("option salah!");
        }
    }
  }
}

void caesarproses(bool menu) {
  int k;
  String hasil = "";
  String plaintext;

  stdout.write("Masukkan Pesan: "); //input kata
  plaintext = stdin.readLineSync()!;
  stdout.write("Masukkan Jumlah pergeseran (0-25): "); //input pergeseran
  k = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < plaintext.length; i++) {
    int ch = plaintext
        .codeUnitAt(i); // mengubah character menjadi kode UTF-16 Desimal
    int offset; //variabel untuk nilai awal desimal dari character
    String h;
    if (ch >= 'a'.codeUnitAt(0) && ch <= 'z'.codeUnitAt(0)) {
      offset = 97;
    } else if (ch >= 'A'.codeUnitAt(0) && ch <= 'Z'.codeUnitAt(0)) {
      offset = 65;
    } else if (ch == ' '.codeUnitAt(0)) {
      hasil += " ";
      continue;
    } else {
      print("Input Pesan Salah!!"); // jikalau input pesan bukan alphabet
      break;
    }

    int c;
    if (menu) {
      c = (ch + k - offset) % 26;
    } else {
      c = (ch - k - offset) % 26;
    }
    h = String.fromCharCode(c + offset);
    hasil += h;
  }
  print("Hasil Konversi: $hasil"); // output hasil konversi
  print("");
}

void vignere() {
  int pil;
  bool stop = true;

  while (stop) {
    print("====== VIGNERE CIPHER ======");
    print("1. Encrypt ");
    print("2. Decrypt ");
    print("3. Kembali ");
    print("");
    stdout.write("pilih Menu: ");
    String choice = stdin.readLineSync()!;

    try {
      pil = int.parse(choice);
    } catch (e) {
      print('option salah!');
      continue;
    }

    switch (pil) {
      case 1:
        {
          print("Encrypt");
          stdout.write('masukkan plaintext: ');
          String plaintext = stdin.readLineSync()!.toUpperCase();
          /////////
          stdout.write('masukkan key: ');
          String key = stdin.readLineSync()!.toUpperCase();
          vencrypt(plaintext, key);
          break;
        }
      case 2:
        {
          print("Decrypt");
          stdout.write('masukkan chipertext: ');
          String ciphertext = stdin.readLineSync()!.toUpperCase();
          /////////
          stdout.write('masukkan key: ');
          String key = stdin.readLineSync()!.toUpperCase();
          vdecrypt(ciphertext, key);
          break;
        }
      case 3:
        {
          stop = false;
          main();
          break;
        }
      default:
        {
          print("option salah!");
        }
    }
  }
}

String vencrypt(String plaintext, String key) {
  String ciphertext = '';
  for (int i = 0; i < plaintext.length; i++) {
    int plainChar = plaintext.codeUnitAt(i) - 65;
    int keyChar = key.codeUnitAt(i % key.length) - 65;
    int cipherChar = (plainChar + keyChar) % 26 + 65;
    ciphertext += String.fromCharCode(cipherChar);
  }

  print('ciphertext: ' + ciphertext);
  return ciphertext;
}

String vdecrypt(String ciphertext, String key) {
  String plaintext = '';
  for (int i = 0; i < ciphertext.length; i++) {
    int cipherChar = ciphertext.codeUnitAt(i) - 65;
    int keyChar = key.codeUnitAt(i % key.length) - 65;
    int plainChar = (cipherChar - keyChar + 26) % 26 + 65;
    plaintext += String.fromCharCode(plainChar);
  }
  print('plaintext: ' + plaintext);
  return plaintext;
}
