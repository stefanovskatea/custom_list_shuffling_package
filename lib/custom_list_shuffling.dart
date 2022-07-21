import 'package:collection/collection.dart';

extension CustomShuffling<E> on List<E> {
  List<E>? shuffleElements(bool Function(E element) getRandomFlag) {
    if (isEmpty) {
      return this;
    }
    if (hasRandomFlag(getRandomFlag)) {
      List<E> elementsWithRandomFlag = [];
      //find elements to shuffle put them in list
      elementsWithRandomFlag =
          where((element) => getRandomFlag(element) == true).toList();
      //shuffle list of elements with random prop
      elementsWithRandomFlag.shuffle();
      //index that takes care of shuffled elements list
      int helperIndex = 0;
      for (int index = 0; index < length; index++) {
        if (getRandomFlag(this[index]) == true) {
          this[index] = elementsWithRandomFlag[helperIndex];
          helperIndex++;
        }
      }
    }
    return this;
  }

  bool hasRandomFlag(Function(E element) getRandom) {
    return firstWhereOrNull((element) => getRandom(element) == true) != null;
  }
}
