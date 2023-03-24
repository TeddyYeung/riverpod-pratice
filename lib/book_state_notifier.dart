import 'package:flutter_riverpod/flutter_riverpod.dart';

final booksProvider = StateNotifierProvider<BookStateNotifier, List<Book>>((ref) { //제네릭에 관리할 StateNotifier 와 해당 Notifier가 관리하는 값의 타입
  return BookStateNotifier(); //StateNotifier 클래스의 객체를 생성해 return
});
//Rivierpod을 사용해 앱전체에서 데이터를 관리할 수 있는 provider를 생성하는 코드입니다.
// Riverpod은 전역으로 final provider를 생성하여도 아무 문제가 없습니다.
//StateNotifierProvider는 StateNotifier를 관리하는 전용 프로바이더 입니다.
//booksProvider는 앱 어디서든 사용할 수 있는 BookStateNotifier의 인스턴스가 됩니다.


class BookStateNotifier extends StateNotifier<List<Book>> {
  //Book 상태를 관리하는 BookStateNotifier 클래스 생성
  // StateNotifier를 상속받고 제네릭엔 어떠한 상태를 관리할 것인지 적어준다.
  // List형식으로 위에서만든 Book클래스의 인스턴스를 관리할 것 이므로 <List<Book>>
  BookStateNotifier() : super([]); //빈 list를 넣어서 초기화 .

  void addBook(Book newBook) {
    state = [...state, newBook];
    //StateNotifier는 notifier 안에서만 값을 수정할 수 있습니다.
    //state는 StateNorifier가 관리하고 있는 상태값을 의미합니다.
    //즉 , state = List<Book>
  }
//여기서 질문!
  //state는 list를 관리하고 있는데  왜. add 나. remove를 사용해서 값을 수정하지 않는 건가요?
  //=> 이유는 state를 변경하기 위해서 입니다. (불변성에 맞는 구조)
  //StateNorifier의 사용 이유가 state가 변경되면 알려주기 위해서인데
  //.add나 .remove를 사용하면 해당 list객체 안에서 값을 추가하거나 ,
  // 값을 지우기 때문에 state가 변경되지 않습니다.
  // 이러한 이유 때문에 addBook(), removeBook()을 이용해
  // 새로운 list 객체를 넣어서 state가 변경되게 합니다
  void removeBook(Book removeBook) {
    state = state.where((book) => book != removeBook).toList();
  }
}


class Book { //Book 클래스 생성
  final String title;
  final String description;

  Book({required this.title, required this.description});
}