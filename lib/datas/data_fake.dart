import 'package:flutter/material.dart';

class DataQuestion {
  int id;
  String cauHoi;
  List<Map<int, String>> dapAn;
  int dapAnDaChon;
  int dapAnDung;
  DataQuestion(
      {@required this.id,
      @required this.cauHoi,
      @required this.dapAn,
      this.dapAnDaChon,
      this.dapAnDung});
}

final fakeDataQuestion = [
  DataQuestion(
      id: 1,
      cauHoi:
          "The little boy pleaded _____ not to leave him alone in the dark.",
      dapAn: [
        {1: "on his mother"},
        {2: "his mother"},
        {3: "with his mother"},
        {4: "at his mother"}
      ],
      dapAnDaChon: 0,
      dapAnDung: 1),
  DataQuestion(
      id: 2,
      cauHoi:
          " _____, the people who come to this club are in their twenties and thirties.",
      dapAn: [
        {1: "By and large"},
        {2: "Altogether"},
        {3: "To a degree"},
        {4: "Virtually"}
      ],
      dapAnDaChon: 0,
      dapAnDung: 2),
  DataQuestion(
      id: 3,
      cauHoi:
          "The TV station, in _______ to massive popular demand, decided not to discontinue the soap opera.",
      dapAn: [
        {1: "reaction"},
        {2: "response"},
        {3: "answer"},
        {4: "rely"}
      ],
      dapAnDaChon: 0,
      dapAnDung: 3),
  DataQuestion(
      id: 4,
      cauHoi:
          "_______ raiding for camels was a significant part of Bedouin life has been documented in Wilfed Thesiger’s Arabian Sands.",
      dapAn: [
        {1: "That"},
        {2: "Which"},
        {3: "What"},
        {4: "Where"}
      ],
      dapAnDaChon: 0,
      dapAnDung: 4),
  DataQuestion(
      id: 5,
      cauHoi:
          "His emotional problems _______ from the attitudes he encountered as a child, I think.",
      dapAn: [
        {1: "stem"},
        {2: "flourish"},
        {3: "root"},
        {4: "sprout"}
      ],
      dapAnDaChon: 0,
      dapAnDung: 2),
  DataQuestion(
      id: 6,
      cauHoi:
          "Pete was born and brought up in Cornwall and he knows the place like the _________.",
      dapAn: [
        {1: "nose on his face"},
        {2: "back of his hand"},
        {3: "hairs on his head"},
        {4: "teeth of his mouth"}
      ],
      dapAnDaChon: 0,
      dapAnDung: 3),
  DataQuestion(
      id: 7,
      cauHoi:
          "British and Australian people share the same language, but in other respects they are as different as _____.",
      dapAn: [
        {1: "cats and dogs"},
        {2: "salt and pepper"},
        {3: "chalk and cheese"},
        {4: "here and there"}
      ],
      dapAnDaChon: 0,
      dapAnDung: 1)
];
