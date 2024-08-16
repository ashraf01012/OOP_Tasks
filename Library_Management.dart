class Book {
  String title;
  String author;
  String ISBN;
  int availability;

  Book({
    required this.title,
    required this.author,
    required this.ISBN,
    this.availability = 1,
  });
  Book? borrow() {
    if (this.availability > 0) {
      availability--;
      return this;
    }
    return null;
  }

  bool checkavailability() {
    if (this.availability > 0) {
      availability--;
      return true;
    }
    return false;
  }

  void returnBook() {
    availability++;
  }
}

class Library {
  List<Book> books = [];

  void addBook(Book book) {
    books.add(book);
  }

  List<Book> searchByTitle(String title) {
    return books
        .where((book) => book.title.toUpperCase().contains(title.toUpperCase()))
        .toList();
  }

  List<Book> searchByAuthor(String author) {
    return books
        .where(
            (book) => book.author.toUpperCase().contains(author.toUpperCase()))
        .toList();
  }

  void displayBooks() {
    if (books.isEmpty) {
      print('No books available in the library.');
    } else {
      for (var book in books) {
        print('Title: ${book.title}');
        print('Author: ${book.author}');
        print('Availability: ${book.availability}');
        print('--------------------------------------');
      }
    }
  }
}

void main(List<String> args) {
  Book book1 = Book(
      title: 'To Kill a Mockingbird',
      author: 'Harper Lee',
      ISBN: '978-0-06-112008-4',
      availability: 4);
  Book book2 = Book(
      title: 'Pride and Prejudice',
      author: 'Jane Austen',
      ISBN: '978-0-19-953556-9',
      availability: 2);
  Book book3 = Book(
      title: 'The Great Gatsby',
      author: 'F. Scott Fitzgerald',
      ISBN: ' 978-0-7432-7356-5',
      availability: 1);

  Library library = Library();
  library.addBook(book1);
  library.addBook(book2);
  library.addBook(book3);

  library.displayBooks();

  Book? borrowed = book1.borrow();
  if (borrowed != null) {
    print('The Book \'${borrowed.title}\' successful borrowed ');
    print('');
  } else {
    print('Unsuccessful Borrowed');
    print('');
  }

  List<Book> searchResults = library.searchByTitle('Brave');
  for (var book in searchResults) {
    print(book.author);
  }

  //library.displayBooks();
}
