import '../models/grammar_models.dart';

// Lazy loaded vocabulary chunks
// Use VocabularyLoader to access these

export 'vocabulary_loader.dart';

class VocabularyChunk1 {
  static List<VocabularyCategory> get categories => [
    VocabularyCategory(
      name: 'Everyday Objects',
      words: _everydayObjects,
    ),
    VocabularyCategory(
      name: 'Numbers & Math',
      words: _numbersMath,
    ),
    VocabularyCategory(
      name: 'Time & Dates',
      words: _timeDates,
    ),
    VocabularyCategory(
      name: 'Colors',
      words: _colors,
    ),
  ];

  static List<VocabularyWord> get _everydayObjects => [
    VocabularyWord(english: 'book', indonesian: 'buku', example: 'I read a book every night.', simpleExample: 'I read a book.', complexExample: 'The student reads an English book in the library every morning.'),
    VocabularyWord(english: 'pen', indonesian: 'pena', example: 'Please sign with this pen.', simpleExample: 'I use a pen.', complexExample: 'The teacher gives a pen to the new student in the classroom.'),
    VocabularyWord(english: 'pencil', indonesian: 'pensil', example: 'Write with a pencil.', simpleExample: 'I write with pencil.', complexExample: 'The artist draws a beautiful picture with a pencil every day.'),
    VocabularyWord(english: 'paper', indonesian: 'kertas', example: 'Give me some paper.', simpleExample: 'I need paper.', complexExample: 'The secretary prints the important document on yellow paper every morning.'),
    VocabularyWord(english: 'notebook', indonesian: 'buku catatan', example: 'I write in my notebook.', simpleExample: 'I write in notebook.', complexExample: 'The student keeps important notes in a notebook for every exam.'),
    VocabularyWord(english: 'bag', indonesian: 'tas', example: 'This bag is heavy.', simpleExample: 'I carry a bag.', complexExample: 'The traveler packs clothes, books, and water in a big bag for the journey.'),
    VocabularyWord(english: 'phone', indonesian: 'hp', example: 'My phone is ringing.', simpleExample: 'I call with phone.', complexExample: 'The businessman sends an important email from his phone every morning.'),
    VocabularyWord(english: 'watch', indonesian: 'jam tangan', example: 'What time is it on your watch?', simpleExample: 'I wear a watch.', complexExample: 'The doctor checks the patient heartbeat with a watch during every examination.'),
    VocabularyWord(english: 'key', indonesian: 'kunci', example: 'Where are my keys?', simpleExample: 'I need a key.', complexExample: 'The security guard gives the office key to the manager every morning.'),
    VocabularyWord(english: 'money', indonesian: 'uang', example: 'I need more money.', simpleExample: 'I earn money.', complexExample: 'The company pays the employee a salary of money every month.'),
    VocabularyWord(english: 'wallet', indonesian: 'dompet', example: 'Put it in your wallet.', simpleExample: 'I keep money in wallet.', complexExample: 'The customer puts his credit card inside the wallet before shopping.'),
  ];

  static List<VocabularyWord> get _numbersMath => [
    VocabularyWord(english: 'one', indonesian: 'satu', example: 'One plus one equals two.', simpleExample: 'I have one apple.', complexExample: 'The teacher gives one book to each student in the class every morning.'),
    VocabularyWord(english: 'two', indonesian: 'dua', example: 'Two is an even number.', simpleExample: 'I see two birds.', complexExample: 'The twins wear two identical dresses to the party every weekend.'),
    VocabularyWord(english: 'three', indonesian: 'tiga', example: 'Three is odd.', simpleExample: 'She counts three.', complexExample: 'The chef adds three spoons of sugar to the cake mixture every time.'),
    VocabularyWord(english: 'four', indonesian: 'empat', example: 'Four seasons.', simpleExample: 'I have four friends.', complexExample: 'The calendar shows four different seasons in one year around the world.'),
    VocabularyWord(english: 'five', indonesian: 'lima', example: 'Five fingers.', simpleExample: 'I show five fingers.', complexExample: 'The musician plays five different songs on the guitar during every concert.'),
    VocabularyWord(english: 'ten', indonesian: 'sepuluh', example: 'Ten is a decade.', simpleExample: 'I count to ten.', complexExample: 'The company celebrates ten years of success in business every December.'),
    VocabularyWord(english: 'hundred', indonesian: 'seratus', example: 'A hundred days.', simpleExample: 'I count a hundred.', complexExample: 'The project takes a hundred days to complete for the construction team every time.'),
    VocabularyWord(english: 'thousand', indonesian: 'seribu', example: 'A thousand times.', simpleExample: 'I repeat a thousand times.', complexExample: 'The author writes a thousand words every day for his new novel publication.'),
  ];

  static List<VocabularyWord> get _timeDates => [
    VocabularyWord(english: 'day', indonesian: 'hari', example: 'One day at a time.'),
    VocabularyWord(english: 'week', indonesian: 'minggu', example: 'One week later.'),
    VocabularyWord(english: 'month', indonesian: 'bulan', example: 'This month.'),
    VocabularyWord(english: 'year', indonesian: 'tahun', example: 'Happy new year.'),
    VocabularyWord(english: 'today', indonesian: 'hari ini', example: 'Today is Monday.'),
    VocabularyWord(english: 'yesterday', indonesian: 'kemarin', example: 'Yesterday was Sunday.'),
    VocabularyWord(english: 'tomorrow', indonesian: 'besok', example: 'Tomorrow is Tuesday.'),
    VocabularyWord(english: 'morning', indonesian: 'pagi', example: 'Good morning.'),
    VocabularyWord(english: 'night', indonesian: 'malam', example: 'Good night.'),
  ];

  static List<VocabularyWord> get _colors => [
    VocabularyWord(english: 'red', indonesian: 'merah', example: 'Red is color.', simpleExample: 'I see a red car.', complexExample: 'The teacher marks the correct answers with a red pen on every student paper.'),
    VocabularyWord(english: 'blue', indonesian: 'biru', example: 'Blue sky.', simpleExample: 'The sky is blue.', complexExample: 'The ocean shows blue waves for swimmers to enjoy at the beach every summer.'),
    VocabularyWord(english: 'green', indonesian: 'hijau', example: 'Green grass.', simpleExample: 'The grass is green.', complexExample: 'The gardener waters the green plants in the garden every morning for growth.'),
    VocabularyWord(english: 'yellow', indonesian: 'kuning', example: 'Yellow sun.', simpleExample: 'The sun is yellow.', complexExample: 'The banana turns yellow when it ripens for customers to buy at the market.'),
    VocabularyWord(english: 'white', indonesian: 'putih', example: 'White snow.', simpleExample: 'She wears a white dress.', complexExample: 'The doctor wears a white coat at the hospital to treat every patient every day.'),
    VocabularyWord(english: 'black', indonesian: 'hitam', example: 'Black night.', simpleExample: 'I wear black shoes.', complexExample: 'The artist paints the canvas with black color for the dramatic effect every time.'),
  ];
}
