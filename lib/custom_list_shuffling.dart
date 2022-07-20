import 'package:collection/collection.dart';

extension CustomShuffling<elementToShuffleType>
on List<elementToShuffleType> {
  List<elementToShuffleType>? shuffleElements(
      bool Function(elementToShuffleType element) getRandom) {
    if (isEmpty) {
      return this;
    }
    if (hasRandomFlag(getRandom)) {
      List<elementToShuffleType> answersWithRandomFlag = [];
      //find elements to shuffle put them in list
      answersWithRandomFlag =
          where((element) => getRandom(element) == true).toList();
      //shuffle list of elements with random prop
      answersWithRandomFlag.shuffle();
      //index that takes care of shuffled elements list
      int helperIndex = 0;
      for (int index = 0; index < length; index++) {
        if (getRandom(this[index]) == true) {
          this[index] = answersWithRandomFlag[helperIndex];
          helperIndex++;
        }
      }
    }
    return this;
  }

  bool hasRandomFlag(Function(elementToShuffleType element) getRandom) {
    return firstWhereOrNull((element) => getRandom(element) == true) != null;
  }
}