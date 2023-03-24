import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/book_add_screen.dart';
import 'package:riverpod_test/book_state_notifier.dart';
import 'package:riverpod_test/book_widget.dart';

class BookScreen extends ConsumerWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookList = ref.watch(booksProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("책 소개"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            bookList.isEmpty
                ? Text("소개할 책이 없습니다.")
                : Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onDoubleTap: (){
                      ref.read(booksProvider.notifier).removeBook(bookList[index]);
                    },
                    child: BookWidget(
                        title: bookList[index].title,
                        description: bookList[index].description),
                  );
                },
                itemCount: bookList.length,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BookAddScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              child: const Text("책 추가 페이지 이동"),
            ),
          ],
        ),
      ),
    );
  }
}