import '../models/grammar_models.dart';
import 'tenses_data.dart';

const int tensesColor = 0xFF6C63FF;
const int vocabularyColor = 0xFF2196F3;
const int verbsColor = 0xFF9C27B0;
const int partsOfSpeechColor = 0xFF00C853;
const int sentenceColor = 0xFFFF9800;
const int specialColor = 0xFFF44336;
const int idiomsColor = 0xFFE91E63;
const int collocationColor = 0xFF2196F3;
const int wordRootsColor = 0xFF673AB7;

class GrammarData {
  static List<GrammarCategory> get categories => [
    GrammarCategory(
      id: 'tenses',
      name: '16 Tenses',
      description: 'Belajar 16 tense bahasa Inggris',
      icon: '⏰',
      color: tensesColor,
      topics: _tensesTopics,
    ),
    GrammarCategory(
      id: 'vocabulary',
      name: 'Vocabulary',
      description: 'Kosa kata bahasa Inggris lengkap',
      icon: '📚',
      color: vocabularyColor,
      topics: _vocabularyTopics,
    ),
    GrammarCategory(
      id: 'verbs',
      name: 'Verbs',
      description: 'Regular & Irregular Verbs',
      icon: '🔤',
      color: verbsColor,
      topics: _verbsTopics,
    ),
    GrammarCategory(
      id: 'parts_of_speech',
      name: 'Parts of Speech',
      description: 'Jenis-jenis kata dalam bahasa Inggris',
      icon: '📝',
      color: partsOfSpeechColor,
      topics: _partsOfSpeechTopics,
    ),
    GrammarCategory(
      id: 'idioms',
      name: 'Idioms & Phrasal Verbs',
      description: 'Ungkapan dan kata kerja frasal',
      icon: '💬',
      color: idiomsColor,
      topics: _idiomsTopics,
    ),
    GrammarCategory(
      id: 'collocation',
      name: 'Collocations',
      description: 'Kata yang sering muncul bersama',
      icon: '🔗',
      color: collocationColor,
      topics: _collocationTopics,
    ),
    GrammarCategory(
      id: 'word_roots',
      name: 'Word Roots & Etymology',
      description: 'Akar kata dan asal-usul kata',
      icon: '🏛️',
      color: wordRootsColor,
      topics: _wordRootsTopics,
    ),
  ];

  // ==================== 16 TENSES ====================
  // Using standardized tenses data from tenses_data.dart
  static List<GrammarTopic> get _tensesTopics => TensesData.tensesTopics;

  // ==================== VOCABULARY ====================
  static List<GrammarTopic> get _vocabularyTopics => [
    GrammarTopic(
      id: 'daily_activities',
      title: 'Daily Activities',
      description: 'Aktivitas sehari-hari',
      lessons: [
        Lesson(
          id: 'daily_1',
          title: 'Aktivitas Sehari-hari',
          content: 'Daily Activities adalah aktivitas yang dilakukan setiap hari.',
          examples: [
            GrammarExample(english: 'wake up', indonesian: 'bangun tidur'),
            GrammarExample(english: 'brush teeth', indonesian: 'menyikat gigi'),
            GrammarExample(english: 'take a shower', indonesian: 'mandi'),
            GrammarExample(english: 'get dressed', indonesian: 'berpakaian'),
            GrammarExample(english: 'have breakfast', indonesian: 'sarapan'),
            GrammarExample(english: 'go to work', indonesian: 'pergi kerja'),
            GrammarExample(english: 'have lunch', indonesian: 'makan siang'),
            GrammarExample(english: 'come home', indonesian: 'pulang'),
            GrammarExample(english: 'have dinner', indonesian: 'makan malam'),
            GrammarExample(english: 'go to sleep', indonesian: 'tidur'),
          ],
          tips: ['Practice setiap hari!'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'daily_quiz',
          topicId: 'daily_activities',
          title: 'Latihan Daily Activities',
          xpReward: 10,
          questions: [
            QuizQuestion(id: 'daily_q1', type: QuestionType.multipleChoice, question: 'bangun tidur?', options: ['wake up', 'sleep', 'dream', 'rest'], correctAnswer: 'wake up', explanation: 'Wake up = bangun tidur'),
          ],
        ),
      ],
    ),
    GrammarTopic(
      id: 'food_drinks',
      title: 'Food & Drinks',
      description: 'Makanan dan Minuman',
      lessons: [
        Lesson(
          id: 'food_1',
          title: 'Makanan dan Minuman',
          content: 'Food and Drinks adalah makanan dan minuman.',
          examples: [
            GrammarExample(english: 'rice', indonesian: 'nasi'),
            GrammarExample(english: 'bread', indonesian: 'roti'),
            GrammarExample(english: 'egg', indonesian: 'telur'),
            GrammarExample(english: 'chicken', indonesian: 'ayam'),
            GrammarExample(english: 'beef', indonesian: 'daging sapi'),
            GrammarExample(english: 'fish', indonesian: 'ikan'),
            GrammarExample(english: 'vegetables', indonesian: 'sayuran'),
            GrammarExample(english: 'fruit', indonesian: 'buah'),
            GrammarExample(english: 'water', indonesian: 'air'),
            GrammarExample(english: 'coffee', indonesian: 'kopi'),
            GrammarExample(english: 'tea', indonesian: 'teh'),
            GrammarExample(english: 'milk', indonesian: 'susu'),
          ],
          tips: ['Hafalkan dengan benda nyata!'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'food_quiz',
          topicId: 'food_drinks',
          title: 'Latihan Food & Drinks',
          xpReward: 10,
          questions: [
            QuizQuestion(id: 'food_q1', type: QuestionType.multipleChoice, question: 'nasi?', options: ['rice', 'bread', 'noodle', 'cake'], correctAnswer: 'rice', explanation: 'Rice = nasi'),
          ],
        ),
      ],
    ),
    GrammarTopic(
      id: 'family',
      title: 'Family',
      description: 'Keluarga',
      lessons: [
        Lesson(
          id: 'family_1',
          title: 'Kata-Kata Keluarga',
          content: 'Family adalah anggota keluarga.',
          examples: [
            GrammarExample(english: 'father', indonesian: 'ayah'),
            GrammarExample(english: 'mother', indonesian: 'ibu'),
            GrammarExample(english: 'parents', indonesian: 'orang tua'),
            GrammarExample(english: 'brother', indonesian: 'kakak/adik laki-laki'),
            GrammarExample(english: 'sister', indonesian: 'kakak/adik perempuan'),
            GrammarExample(english: 'son', indonesian: 'anak laki-laki'),
            GrammarExample(english: 'daughter', indonesian: 'anak perempuan'),
            GrammarExample(english: 'grandfather', indonesian: 'kakek'),
            GrammarExample(english: 'grandmother', indonesian: 'nenek'),
            GrammarExample(english: 'uncle', indonesian: 'paman/om'),
            GrammarExample(english: 'aunt', indonesian: 'bibi/tante'),
          ],
          tips: ['Kenalkan keluarga dengan bahasa Inggris!'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'family_quiz',
          topicId: 'family',
          title: 'Latihan Family',
          xpReward: 10,
          questions: [
            QuizQuestion(id: 'family_q1', type: QuestionType.multipleChoice, question: 'ayah?', options: ['father', 'mother', 'brother', 'uncle'], correctAnswer: 'father', explanation: 'Father = ayah'),
          ],
        ),
      ],
    ),
    GrammarTopic(
      id: 'emotions',
      title: 'Emotions',
      description: 'Perasaan/Emosi',
      lessons: [
        Lesson(
          id: 'emotions_1',
          title: 'Kata-Kata Perasaan',
          content: 'Emotions adalah perasaan.',
          examples: [
            GrammarExample(english: 'happy', indonesian: 'senang'),
            GrammarExample(english: 'sad', indonesian: 'sedih'),
            GrammarExample(english: 'angry', indonesian: 'marah'),
            GrammarExample(english: 'afraid', indonesian: 'takut'),
            GrammarExample(english: 'tired', indonesian: 'lelah'),
            GrammarExample(english: 'excited', indonesian: 'bersemangat'),
            GrammarExample(english: 'hungry', indonesian: 'lapar'),
            GrammarExample(english: 'thirsty', indonesian: 'haus'),
          ],
          tips: ['Kenalkan perasaan dengan bahasa Inggris!'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'emotions_quiz',
          topicId: 'emotions',
          title: 'Latihan Emotions',
          xpReward: 10,
          questions: [
            QuizQuestion(id: 'emotions_q1', type: QuestionType.multipleChoice, question: 'senang?', options: ['happy', 'sad', 'angry', 'tired'], correctAnswer: 'happy', explanation: 'Happy = senang'),
          ],
        ),
      ],
    ),
    GrammarTopic(
      id: 'places',
      title: 'Places',
      description: 'Tempat-tempat',
      lessons: [
        Lesson(
          id: 'places_1',
          title: 'Nama-Nama Tempat',
          content: 'Places adalah tempat.',
          examples: [
            GrammarExample(english: 'house', indonesian: 'rumah'),
            GrammarExample(english: 'school', indonesian: 'sekolah'),
            GrammarExample(english: 'hospital', indonesian: 'rumah sakit'),
            GrammarExample(english: 'restaurant', indonesian: 'restoran'),
            GrammarExample(english: 'cafe', indonesian: 'kafe'),
            GrammarExample(english: 'park', indonesian: 'taman'),
            GrammarExample(english: 'beach', indonesian: 'pantai'),
            GrammarExample(english: 'library', indonesian: 'perpustakaan'),
            GrammarExample(english: 'bank', indonesian: 'bank'),
            GrammarExample(english: 'airport', indonesian: 'bandara'),
          ],
          tips: ['Hafalkan tempat-tempat umum!'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'places_quiz',
          topicId: 'places',
          title: 'Latihan Places',
          xpReward: 10,
          questions: [
            QuizQuestion(id: 'places_q1', type: QuestionType.multipleChoice, question: 'sekolah?', options: ['school', 'house', 'park', 'bank'], correctAnswer: 'school', explanation: 'School = sekolah'),
          ],
        ),
      ],
    ),
    GrammarTopic(
      id: 'colors',
      title: 'Colors',
      description: 'Warna',
      lessons: [
        Lesson(
          id: 'colors_1',
          title: 'Nama-Nama Warna',
          content: 'Colors adalah warna.',
          examples: [
            GrammarExample(english: 'red', indonesian: 'merah'),
            GrammarExample(english: 'blue', indonesian: 'biru'),
            GrammarExample(english: 'green', indonesian: 'hijau'),
            GrammarExample(english: 'yellow', indonesian: 'kuning'),
            GrammarExample(english: 'orange', indonesian: 'oren'),
            GrammarExample(english: 'purple', indonesian: 'ungu'),
            GrammarExample(english: 'pink', indonesian: 'merah muda'),
            GrammarExample(english: 'black', indonesian: 'hitam'),
            GrammarExample(english: 'white', indonesian: 'putih'),
            GrammarExample(english: 'brown', indonesian: 'coklat'),
          ],
          tips: ['Warna ada di sekitar kita!'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'colors_quiz',
          topicId: 'colors',
          title: 'Latihan Colors',
          xpReward: 10,
          questions: [
            QuizQuestion(id: 'colors_q1', type: QuestionType.multipleChoice, question: 'biru?', options: ['blue', 'red', 'green', 'yellow'], correctAnswer: 'blue', explanation: 'Blue = biru'),
          ],
        ),
      ],
    ),
  ];

  // ==================== VERBS ====================
  static List<GrammarTopic> get _verbsTopics => [
    GrammarTopic(
      id: 'irregular_verbs',
      title: 'Irregular Verbs Penting',
      description: 'Kata kerja tidak beraturan yang wajib dihafal',
      lessons: [
        Lesson(
          id: 'irreg_1',
          title: 'Irregular Verbs (Bagian 1)',
          content: 'Irregular Verbs adalah kata kerja yang tidak beraturan.\n\n1. be = adalah/ada -> was/were/been\n2. have = punya -> had/had\n3. do = lakukan -> did/done\n4. go = pergi -> went/gone\n5. come = datang -> came/come\n6. see = melihat -> saw/seen\n7. take = mengambil -> took/taken\n8. give = memberi -> gave/given\n9. make = membuat -> made/made\n10. say = mengatakan -> said/said',
          examples: [
            GrammarExample(english: 'I went to school yesterday.', indonesian: 'Saya pergi ke sekolah kemarin.'),
            GrammarExample(english: 'She saw a movie.', indonesian: 'Dia melihat film.'),
            GrammarExample(english: 'They gave me a gift.', indonesian: 'Mereka memberiku hadiah.'),
          ],
          tips: ['Hafalkan 20 verb irreguler paling sering!'],
          xpReward: 10,
        ),
        Lesson(
          id: 'irreg_2',
          title: 'Irregular Verbs (Bagian 2)',
          content: 'Lanjutan Irregular Verbs:\n\n11. get = mendapatkan -> got/gotten\n12. know = tahu -> knew/known\n13. think = berpikir -> thought/thought\n14. become = menjadi -> became/become\n15. leave = meninggalkan -> left/left\n16. tell = memberitahu -> told/told\n17. find = menemukan -> found/found\n18. understand = memahami -> understood/understood\n19. hear = mendengar -> heard/heard\n20. read = membaca -> read/read',
          examples: [
            GrammarExample(english: 'I got a new phone.', indonesian: 'Saya mendapat hp baru.'),
            GrammarExample(english: 'She knew the answer.', indonesian: 'Dia tahu jawabannya.'),
          ],
          tips: ['Practice dengan membuat kalimat!'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'irreg_quiz',
          topicId: 'irregular_verbs',
          title: 'Latihan Irregular Verbs',
          xpReward: 15,
          questions: [
            QuizQuestion(id: 'irreg_q1', type: QuestionType.multipleChoice, question: 'go Past Tense = ?', options: ['went', 'gone', 'going', 'goes'], correctAnswer: 'went', explanation: 'Go -> went'),
            QuizQuestion(id: 'irreg_q2', type: QuestionType.multipleChoice, question: 'see Past Tense = ?', options: ['saw', 'seen', 'seeing', 'sees'], correctAnswer: 'saw', explanation: 'See -> saw'),
          ],
        ),
      ],
    ),
    GrammarTopic(
      id: 'regular_verbs',
      title: 'Regular Verbs',
      description: 'Kata kerja beraturan (+ed)',
      lessons: [
        Lesson(
          id: 'reg_1',
          title: 'Cara Membuat Regular Verbs',
          content: 'Regular Verbs adalah kata kerja beraturan.\n\nCaranya: tambahkan -ed\n\n1. Umum: work -> worked\n2. Akhiran -e: love -> loved\n3. Akhiran -y + konsonan: study -> studied',
          examples: [
            GrammarExample(english: 'I worked yesterday.', indonesian: 'Saya bekerja kemarin.'),
            GrammarExample(english: 'She played football.', indonesian: 'Dia bermain sepak bola.'),
            GrammarExample(english: 'They wanted to come.', indonesian: 'Mereka ingin datang.'),
          ],
          tips: ['Reguler verbs tinggal +ed!'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'reg_quiz',
          topicId: 'regular_verbs',
          title: 'Latihan Regular Verbs',
          xpReward: 10,
          questions: [
            QuizQuestion(id: 'reg_q1', type: QuestionType.multipleChoice, question: 'work Past Tense = ?', options: ['worked', 'working', 'works', 'workes'], correctAnswer: 'worked', explanation: 'Work + ed = worked'),
          ],
        ),
      ],
    ),
  ];

  // ==================== PARTS OF SPEECH ====================
  static List<GrammarTopic> get _partsOfSpeechTopics => [
    GrammarTopic(
      id: 'nouns',
      title: 'Noun (Kata Benda)',
      description: 'Nama orang, tempat, atau benda',
      lessons: [
        Lesson(
          id: 'noun_1',
          title: 'Apa itu Noun?',
          content: 'Noun adalah kata yang menamai orang, tempat, atau benda.\n\nContoh: teacher, school, book, happiness',
          examples: [
            GrammarExample(english: 'The teacher is in the classroom.', indonesian: 'Guru ada di kelas.'),
            GrammarExample(english: 'Jakarta is a big city.', indonesian: 'Jakarta adalah kota besar.'),
          ],
          tips: ['Noun = nama sesuatu'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'noun_quiz',
          topicId: 'nouns',
          title: 'Latihan Noun',
          xpReward: 10,
          questions: [
            QuizQuestion(id: 'noun_q1', type: QuestionType.multipleChoice, question: 'guru?', options: ['teacher', 'student', 'doctor', 'friend'], correctAnswer: 'teacher', explanation: 'Teacher = guru'),
          ],
        ),
      ],
    ),
    GrammarTopic(
      id: 'pronouns',
      title: 'Pronoun (Kata Ganti)',
      description: 'Kata yang mengganti noun',
      lessons: [
        Lesson(
          id: 'pron_1',
          title: 'Jenis-Jenis Pronoun',
          content: 'Pronoun adalah kata ganti.\n\nSubject: I, you, he, she, it, we, they\nObject: me, you, him, her, it, us, them\n\nPossessive: my, your, his, her, its, our, their',
          examples: [
            GrammarExample(english: 'She is my sister.', indonesian: 'Dia adalah kakak saya.'),
          ],
          tips: ['Pronoun menggantikan noun'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'pron_quiz',
          topicId: 'pronouns',
          title: 'Latihan Pronoun',
          xpReward: 10,
          questions: [
            QuizQuestion(id: 'pron_q1', type: QuestionType.multipleChoice, question: 'saya (subject)?', options: ['I', 'me', 'my', 'mine'], correctAnswer: 'I', explanation: 'I = saya (subject)'),
          ],
        ),
      ],
    ),
    GrammarTopic(
      id: 'adjectives',
      title: 'Adjective (Kata Sifat)',
      description: 'Kata yang menjelaskan noun',
      lessons: [
        Lesson(
          id: 'adj_1',
          title: 'Apa itu Adjective?',
          content: 'Adjective adalah kata sifat yang menjelaskan noun.\n\nContoh: big house, beautiful girl, red car',
          examples: [
            GrammarExample(english: 'I have a new car.', indonesian: 'Saya punya mobil baru.'),
          ],
          tips: ['Adjective = penjelasan tentang noun'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'adj_quiz',
          topicId: 'adjectives',
          title: 'Latihan Adjective',
          xpReward: 10,
          questions: [
            QuizQuestion(id: 'adj_q1', type: QuestionType.multipleChoice, question: 'bagus?', options: ['good', 'bad', 'big', 'new'], correctAnswer: 'good', explanation: 'Good = bagus'),
          ],
        ),
      ],
    ),
  ];

  // ==================== IDIOMS & PHRASAL VERBS ====================
  static List<GrammarTopic> get _idiomsTopics => [
    GrammarTopic(
      id: 'idioms_intro',
      title: 'Idioms & Phrasal Verbs',
      description: 'Ungkapan dan kata kerja frasal dalam bahasa Inggris',
      lessons: [
        Lesson(
          id: 'idiom_1',
          title: 'Apa itu Idiom?',
          content: 'Idiom adalah ungkapan yang artinya tidak bisa ditebak dari kata-kata individunya.\n\nContoh:\n"Break a leg!" artinya "Semoga berhasil!" (bukan patahkan kaki!)\n\nPhrasal verb adalah kombinasi kata kerja + preposisi/adverb yang punya arti khusus.\n\nContoh:\n"Give up" = menyerah (bukan memberikan ke atas)',
          examples: [
            GrammarExample(english: 'Break a leg!', indonesian: 'Semoga berhasil!'),
            GrammarExample(english: 'Give up', indonesian: 'Menyerah'),
            GrammarExample(english: 'Figure out', indonesian: 'Memahami / mencari tahu'),
          ],
          tips: ['Jangan terjemahkan idiom secara harfiah', 'Phrasal verbs punya arti khusus', 'Banyak latihan untuk familiar'],
          xpReward: 10,
        ),
      ],
      quizzes: [],
    ),
  ];

  // ==================== COLLOCATIONS ====================
  static List<GrammarTopic> get _collocationTopics => [
    GrammarTopic(
      id: 'collocation_intro',
      title: 'Collocations',
      description: 'Kata yang sering muncul bersama dalam bahasa Inggris',
      lessons: [
        Lesson(
          id: 'coll_1',
          title: 'Apa itu Collocation?',
          content: 'Collocation adalah kombinasi kata yang sering muncul bersamaan secara natural.\n\nContoh yang BENAR:\n- "make a decision" (bukan do a decision)\n- "heavy rain" (bukan strong rain)\n- "fast food" (bukan quick food)\n\nMenggunakan collocation yang benar membuat bahasa Inggris kamu terdengar lebih natural.',
          examples: [
            GrammarExample(english: 'make a decision', indonesian: 'membuat keputusan'),
            GrammarExample(english: 'heavy rain', indonesian: 'hujan lebat'),
            GrammarExample(english: 'fast progress', indonesian: 'kemajuan cepat'),
          ],
          tips: ['heavy rain, bukan strong rain', 'make a decision, bukan do a decision', 'catch a cold, bukan make a cold'],
          xpReward: 10,
        ),
      ],
      quizzes: [],
    ),
  ];

  // ==================== WORD ROOTS & ETYMOLOGY ====================
  static List<GrammarTopic> get _wordRootsTopics => [
    GrammarTopic(
      id: 'word_roots_intro',
      title: 'Word Roots & Etymology',
      description: 'Akar kata Latin & Yunani untuk memahami lebih banyak kosakata',
      lessons: [
        Lesson(
          id: 'roots_1',
          title: 'Kenapa Belajar Word Roots?',
          content: 'Dengan mempelajari akar kata, kamu bisa menebak arti ribuan kata baru!\n\nContoh:\n- "tele" = jauh (Greek) → telephone, telescope, television\n- "port" = bawa (Latin) → transport, export, import\n- "bio" = hidup (Greek) → biology, biography\n\nDengan tahu 20-30 roots, kamu bisa memahami ratusan kata baru!',
          examples: [
            GrammarExample(english: 'tele + phone = telephone', indonesian: 'tele (jauh) + phone (suara) = telepon'),
            GrammarExample(english: 'port + able = portable', indonesian: 'port (bawa) + able (dapat) = bisa dibawak'),
            GrammarExample(english: 'bio + logy = biology', indonesian: 'bio (hidup) + logy (ilmu) = ilmu tentang hidup'),
          ],
          tips: ['Cukup tahu 20-30 roots untuk 80% kosakata', 'Latin & Greek roots adalah yang paling umum', 'Biasanya artinya konsisten'],
          xpReward: 10,
        ),
      ],
      quizzes: [],
    ),
  ];

  static int getTotalLessons() {
    int total = 0;
    for (var category in categories) {
      for (var topic in category.topics) {
        total += topic.lessons.length;
      }
    }
    return total;
  }

  static int getTotalQuizzes() {
    int total = 0;
    for (var category in categories) {
      for (var topic in category.topics) {
        total += topic.quizzes.length;
      }
    }
    return total;
  }
}
