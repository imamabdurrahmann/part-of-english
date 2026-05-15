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
          xpReward: 20,
          questions: [
            QuizQuestion(id: 'daily_q1', type: QuestionType.multipleChoice, question: '"bangun tidur" dalam bahasa Inggris?', options: ['wake up', 'sleep', 'dream', 'rest'], correctAnswer: 'wake up', explanation: 'Wake up = bangun tidur'),
            QuizQuestion(id: 'daily_q2', type: QuestionType.multipleChoice, question: '"menyikat gigi" dalam bahasa Inggris?', options: ['brush teeth', 'wash face', 'take a shower', 'get dressed'], correctAnswer: 'brush teeth', explanation: 'Brush teeth = menyikat gigi'),
            QuizQuestion(id: 'daily_q3', type: QuestionType.multipleChoice, question: '"mandi" dalam bahasa Inggris?', options: ['take a shower', 'wash hands', 'brush teeth', 'get dressed'], correctAnswer: 'take a shower', explanation: 'Take a shower = mandi'),
            QuizQuestion(id: 'daily_q4', type: QuestionType.multipleChoice, question: '"sarapan" dalam bahasa Inggris?', options: ['have breakfast', 'have lunch', 'have dinner', 'eat snack'], correctAnswer: 'have breakfast', explanation: 'Have breakfast = sarapan'),
            QuizQuestion(id: 'daily_q5', type: QuestionType.multipleChoice, question: '"tidur" dalam bahasa Inggris?', options: ['go to sleep', 'wake up', 'take a nap', 'rest'], correctAnswer: 'go to sleep', explanation: 'Go to sleep = tidur'),
            QuizQuestion(id: 'daily_q6', type: QuestionType.multipleChoice, question: '"pergi kerja" dalam bahasa Inggris?', options: ['go to work', 'come home', 'leave house', 'go to school'], correctAnswer: 'go to work', explanation: 'Go to work = pergi kerja'),
            QuizQuestion(id: 'daily_q7', type: QuestionType.multipleChoice, question: '"pulang" dalam bahasa Inggris?', options: ['come home', 'go home', 'leave', 'stay'], correctAnswer: 'come home', explanation: 'Come home = pulang ke rumah'),
            QuizQuestion(id: 'daily_q8', type: QuestionType.multipleChoice, question: '"makan siang" dalam bahasa Inggris?', options: ['have lunch', 'have breakfast', 'have dinner', 'eat snack'], correctAnswer: 'have lunch', explanation: 'Have lunch = makan siang'),
            QuizQuestion(id: 'daily_q9', type: QuestionType.multipleChoice, question: '"berpakaian" dalam bahasa Inggris?', options: ['get dressed', 'take off', 'wear', 'dress up'], correctAnswer: 'get dressed', explanation: 'Get dressed = berpakaian'),
            QuizQuestion(id: 'daily_q10', type: QuestionType.multipleChoice, question: '"makan malam" dalam bahasa Inggris?', options: ['have dinner', 'have lunch', 'have breakfast', 'eat food'], correctAnswer: 'have dinner', explanation: 'Have dinner = makan malam'),
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
          xpReward: 20,
          questions: [
            QuizQuestion(id: 'food_q1', type: QuestionType.multipleChoice, question: '"nasi" dalam bahasa Inggris?', options: ['rice', 'bread', 'noodle', 'cake'], correctAnswer: 'rice', explanation: 'Rice = nasi'),
            QuizQuestion(id: 'food_q2', type: QuestionType.multipleChoice, question: '"roti" dalam bahasa Inggris?', options: ['bread', 'rice', 'cake', 'cookie'], correctAnswer: 'bread', explanation: 'Bread = roti'),
            QuizQuestion(id: 'food_q3', type: QuestionType.multipleChoice, question: '"telur" dalam bahasa Inggris?', options: ['egg', 'meat', 'fish', 'chicken'], correctAnswer: 'egg', explanation: 'Egg = telur'),
            QuizQuestion(id: 'food_q4', type: QuestionType.multipleChoice, question: '"ayam" dalam bahasa Inggris?', options: ['chicken', 'beef', 'fish', 'pork'], correctAnswer: 'chicken', explanation: 'Chicken = ayam'),
            QuizQuestion(id: 'food_q5', type: QuestionType.multipleChoice, question: '"ikan" dalam bahasa Inggris?', options: ['fish', 'meat', 'chicken', 'beef'], correctAnswer: 'fish', explanation: 'Fish = ikan'),
            QuizQuestion(id: 'food_q6', type: QuestionType.multipleChoice, question: '"sayuran" dalam bahasa Inggris?', options: ['vegetables', 'fruits', 'meat', 'rice'], correctAnswer: 'vegetables', explanation: 'Vegetables = sayuran'),
            QuizQuestion(id: 'food_q7', type: QuestionType.multipleChoice, question: '"buah" dalam bahasa Inggris?', options: ['fruit', 'vegetable', 'food', 'meal'], correctAnswer: 'fruit', explanation: 'Fruit = buah'),
            QuizQuestion(id: 'food_q8', type: QuestionType.multipleChoice, question: '"kopi" dalam bahasa Inggris?', options: ['coffee', 'tea', 'milk', 'juice'], correctAnswer: 'coffee', explanation: 'Coffee = kopi'),
            QuizQuestion(id: 'food_q9', type: QuestionType.multipleChoice, question: '"teh" dalam bahasa Inggris?', options: ['tea', 'coffee', 'milk', 'water'], correctAnswer: 'tea', explanation: 'Tea = teh'),
            QuizQuestion(id: 'food_q10', type: QuestionType.multipleChoice, question: '"susu" dalam bahasa Inggris?', options: ['milk', 'water', 'juice', 'soda'], correctAnswer: 'milk', explanation: 'Milk = susu'),
          ],
        ),
      ],
    ),
    GrammarTopic(
      id: 'technology',
      title: 'Technology',
      description: 'Kata-kata teknologi',
      lessons: [
        Lesson(
          id: 'tech_1',
          title: 'Kata-Kata Teknologi',
          content: 'Technology vocabulary untuk era digital.',
          examples: [
            GrammarExample(english: 'computer', indonesian: 'komputer'),
            GrammarExample(english: 'laptop', indonesian: 'laptop'),
            GrammarExample(english: 'smartphone', indonesian: 'ponsel pintar'),
            GrammarExample(english: 'internet', indonesian: 'internet'),
            GrammarExample(english: 'website', indonesian: 'situs web'),
            GrammarExample(english: 'application', indonesian: 'aplikasi'),
            GrammarExample(english: 'software', indonesian: 'perangkat lunak'),
            GrammarExample(english: 'hardware', indonesian: 'perangkat keras'),
            GrammarExample(english: 'data', indonesian: 'data'),
            GrammarExample(english: 'password', indonesian: 'kata sandi'),
          ],
          tips: ['Technology sangat penting di era digital!'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'tech_quiz',
          topicId: 'technology',
          title: 'Latihan Technology',
          xpReward: 20,
          questions: [
            QuizQuestion(id: 'tech_q1', type: QuestionType.multipleChoice, question: '"komputer" dalam bahasa Inggris?', options: ['computer', 'laptop', 'monitor', 'keyboard'], correctAnswer: 'computer', explanation: 'Computer = komputer'),
            QuizQuestion(id: 'tech_q2', type: QuestionType.multipleChoice, question: '"internet" dalam bahasa Inggris?', options: ['internet', 'intranet', 'network', 'web'], correctAnswer: 'internet', explanation: 'Internet = internet'),
            QuizQuestion(id: 'tech_q3', type: QuestionType.multipleChoice, question: '"aplikasi" dalam bahasa Inggris?', options: ['application', 'program', 'software', 'system'], correctAnswer: 'application', explanation: 'Application = aplikasi (app)'),
            QuizQuestion(id: 'tech_q4', type: QuestionType.multipleChoice, question: '"data" dalam bahasa Inggris?', options: ['data', 'information', 'files', 'memory'], correctAnswer: 'data', explanation: 'Data = data'),
            QuizQuestion(id: 'tech_q5', type: QuestionType.multipleChoice, question: '"kata sandi" dalam bahasa Inggris?', options: ['password', 'username', 'login', 'account'], correctAnswer: 'password', explanation: 'Password = kata sandi'),
            QuizQuestion(id: 'tech_q6', type: QuestionType.multipleChoice, question: '"laptop" dalam bahasa Inggris?', options: ['laptop', 'notebook', 'computer', 'pc'], correctAnswer: 'laptop', explanation: 'Laptop = laptop'),
            QuizQuestion(id: 'tech_q7', type: QuestionType.multipleChoice, question: '"ponsel pintar" dalam bahasa Inggris?', options: ['smartphone', 'cellphone', 'mobile phone', 'phone'], correctAnswer: 'smartphone', explanation: 'Smartphone = ponsel pintar'),
            QuizQuestion(id: 'tech_q8', type: QuestionType.multipleChoice, question: '"situs web" dalam bahasa Inggris?', options: ['website', 'webpage', 'web', 'site'], correctAnswer: 'website', explanation: 'Website = situs web'),
            QuizQuestion(id: 'tech_q9', type: QuestionType.multipleChoice, question: '"perangkat lunak" dalam bahasa Inggris?', options: ['software', 'hardware', 'system', 'program'], correctAnswer: 'software', explanation: 'Software = perangkat lunak'),
            QuizQuestion(id: 'tech_q10', type: QuestionType.multipleChoice, question: '"perangkat keras" dalam bahasa Inggris?', options: ['hardware', 'software', 'system', 'device'], correctAnswer: 'hardware', explanation: 'Hardware = perangkat keras'),
          ],
        ),
      ],
    ),
    GrammarTopic(
      id: 'travel',
      title: 'Travel & Transportation',
      description: 'Kata-kata perjalanan dan transportasi',
      lessons: [
        Lesson(
          id: 'travel_1',
          title: 'Kata-Kata Perjalanan',
          content: 'Vocabulary untuk traveling dan transportation.',
          examples: [
            GrammarExample(english: 'airport', indonesian: 'bandara'),
            GrammarExample(english: 'airplane', indonesian: 'pesawat'),
            GrammarExample(english: 'train', indonesian: 'kereta'),
            GrammarExample(english: 'bus', indonesian: 'bis'),
            GrammarExample(english: 'taxi', indonesian: 'taksi'),
            GrammarExample(english: 'hotel', indonesian: 'hotel'),
            GrammarExample(english: 'passport', indonesian: 'paspor'),
            GrammarExample(english: 'ticket', indonesian: 'tiket'),
            GrammarExample(english: 'luggage', indonesian: 'koper'),
            GrammarExample(english: 'destination', indonesian: 'tujuan'),
          ],
          tips: ['Hafalkan sebelum bepergian!'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'travel_quiz',
          topicId: 'travel',
          title: 'Latihan Travel',
          xpReward: 20,
          questions: [
            QuizQuestion(id: 'travel_q1', type: QuestionType.multipleChoice, question: '"bandara" dalam bahasa Inggris?', options: ['airport', 'station', 'port', 'harbor'], correctAnswer: 'airport', explanation: 'Airport = bandara'),
            QuizQuestion(id: 'travel_q2', type: QuestionType.multipleChoice, question: '"pesawat" dalam bahasa Inggris?', options: ['airplane', 'ship', 'train', 'bus'], correctAnswer: 'airplane', explanation: 'Airplane = pesawat'),
            QuizQuestion(id: 'travel_q3', type: QuestionType.multipleChoice, question: '"kereta" dalam bahasa Inggris?', options: ['train', 'bus', 'car', 'plane'], correctAnswer: 'train', explanation: 'Train = kereta'),
            QuizQuestion(id: 'travel_q4', type: QuestionType.multipleChoice, question: '"bis" dalam bahasa Inggris?', options: ['bus', 'car', 'taxi', 'train'], correctAnswer: 'bus', explanation: 'Bus = bis'),
            QuizQuestion(id: 'travel_q5', type: QuestionType.multipleChoice, question: '"taksi" dalam bahasa Inggris?', options: ['taxi', 'cab', 'car', 'bus'], correctAnswer: 'taxi', explanation: 'Taxi = taksi'),
            QuizQuestion(id: 'travel_q6', type: QuestionType.multipleChoice, question: '"hotel" dalam bahasa Inggris?', options: ['hotel', 'inn', 'motel', 'lodge'], correctAnswer: 'hotel', explanation: 'Hotel = hotel'),
            QuizQuestion(id: 'travel_q7', type: QuestionType.multipleChoice, question: '"paspor" dalam bahasa Inggris?', options: ['passport', 'visa', 'ticket', 'ID'], correctAnswer: 'passport', explanation: 'Passport = paspor'),
            QuizQuestion(id: 'travel_q8', type: QuestionType.multipleChoice, question: '"tiket" dalam bahasa Inggris?', options: ['ticket', 'pass', 'card', 'visa'], correctAnswer: 'ticket', explanation: 'Ticket = tiket'),
            QuizQuestion(id: 'travel_q9', type: QuestionType.multipleChoice, question: '"koper" dalam bahasa Inggris?', options: ['luggage', 'bag', 'backpack', 'suitcase'], correctAnswer: 'luggage', explanation: 'Luggage = koper/bagasi'),
            QuizQuestion(id: 'travel_q10', type: QuestionType.multipleChoice, question: '"tujuan" dalam bahasa Inggris?', options: ['destination', 'origin', 'location', 'place'], correctAnswer: 'destination', explanation: 'Destination = tujuan'),
          ],
        ),
      ],
    ),
    GrammarTopic(
      id: 'body_parts',
      title: 'Body Parts',
      description: 'Bagian-bagian tubuh',
      lessons: [
        Lesson(
          id: 'body_1',
          title: 'Bagian Tubuh',
          content: 'Body parts vocabulary.',
          examples: [
            GrammarExample(english: 'head', indonesian: 'kepala'),
            GrammarExample(english: 'face', indonesian: 'wajah'),
            GrammarExample(english: 'eye', indonesian: 'mata'),
            GrammarExample(english: 'nose', indonesian: 'hidung'),
            GrammarExample(english: 'mouth', indonesian: 'mulut'),
            GrammarExample(english: 'ear', indonesian: 'telinga'),
            GrammarExample(english: 'hand', indonesian: 'tangan'),
            GrammarExample(english: 'foot', indonesian: 'kaki'),
            GrammarExample(english: 'arm', indonesian: 'lengan'),
            GrammarExample(english: 'leg', indonesian: 'kaki (paha)'),
          ],
          tips: ['Hafalkan dengan menunjukkan tubuhmu!'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'body_quiz',
          topicId: 'body_parts',
          title: 'Latihan Body Parts',
          xpReward: 20,
          questions: [
            QuizQuestion(id: 'body_q1', type: QuestionType.multipleChoice, question: '"kepala" dalam bahasa Inggris?', options: ['head', 'face', 'neck', 'hair'], correctAnswer: 'head', explanation: 'Head = kepala'),
            QuizQuestion(id: 'body_q2', type: QuestionType.multipleChoice, question: '"wajah" dalam bahasa Inggris?', options: ['face', 'head', 'eye', 'mouth'], correctAnswer: 'face', explanation: 'Face = wajah'),
            QuizQuestion(id: 'body_q3', type: QuestionType.multipleChoice, question: '"mata" dalam bahasa Inggris?', options: ['eye', 'eyes', 'face', 'nose'], correctAnswer: 'eye', explanation: 'Eye = mata'),
            QuizQuestion(id: 'body_q4', type: QuestionType.multipleChoice, question: '"hidung" dalam bahasa Inggris?', options: ['nose', 'mouth', 'ear', 'face'], correctAnswer: 'nose', explanation: 'Nose = hidung'),
            QuizQuestion(id: 'body_q5', type: QuestionType.multipleChoice, question: '"mulut" dalam bahasa Inggris?', options: ['mouth', 'nose', 'ear', 'teeth'], correctAnswer: 'mouth', explanation: 'Mouth = mulut'),
            QuizQuestion(id: 'body_q6', type: QuestionType.multipleChoice, question: '"telinga" dalam bahasa Inggris?', options: ['ear', 'nose', 'eye', 'face'], correctAnswer: 'ear', explanation: 'Ear = telinga'),
            QuizQuestion(id: 'body_q7', type: QuestionType.multipleChoice, question: '"tangan" dalam bahasa Inggris?', options: ['hand', 'arm', 'finger', 'palm'], correctAnswer: 'hand', explanation: 'Hand = tangan'),
            QuizQuestion(id: 'body_q8', type: QuestionType.multipleChoice, question: '"kaki" dalam bahasa Inggris?', options: ['foot', 'leg', 'ankle', 'toe'], correctAnswer: 'foot', explanation: 'Foot = kaki'),
            QuizQuestion(id: 'body_q9', type: QuestionType.multipleChoice, question: '"lengan" dalam bahasa Inggris?', options: ['arm', 'hand', 'elbow', 'wrist'], correctAnswer: 'arm', explanation: 'Arm = lengan'),
            QuizQuestion(id: 'body_q10', type: QuestionType.multipleChoice, question: '"jantung" dalam bahasa Inggris?', options: ['heart', 'lung', 'liver', 'kidney'], correctAnswer: 'heart', explanation: 'Heart = jantung'),
          ],
        ),
      ],
    ),
    GrammarTopic(
      id: 'animals',
      title: 'Animals',
      description: 'Nama-nama hewan',
      lessons: [
        Lesson(
          id: 'animals_1',
          title: 'Nama-Nama Hewan',
          content: 'Animals vocabulary.',
          examples: [
            GrammarExample(english: 'dog', indonesian: 'anjing'),
            GrammarExample(english: 'cat', indonesian: 'kucing'),
            GrammarExample(english: 'bird', indonesian: 'burung'),
            GrammarExample(english: 'fish', indonesian: 'ikan'),
            GrammarExample(english: 'horse', indonesian: 'kuda'),
            GrammarExample(english: 'cow', indonesian: 'sapi'),
            GrammarExample(english: 'chicken', indonesian: 'ayam'),
            GrammarExample(english: 'elephant', indonesian: 'gajah'),
            GrammarExample(english: 'lion', indonesian: 'singa'),
            GrammarExample(english: 'snake', indonesian: 'ular'),
          ],
          tips: ['Hafalkan dengan gambar!'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'animals_quiz',
          topicId: 'animals',
          title: 'Latihan Animals',
          xpReward: 20,
          questions: [
            QuizQuestion(id: 'animal_q1', type: QuestionType.multipleChoice, question: '"anjing" dalam bahasa Inggris?', options: ['dog', 'cat', 'bird', 'fish'], correctAnswer: 'dog', explanation: 'Dog = anjing'),
            QuizQuestion(id: 'animal_q2', type: QuestionType.multipleChoice, question: '"kucing" dalam bahasa Inggris?', options: ['cat', 'dog', 'rabbit', 'mouse'], correctAnswer: 'cat', explanation: 'Cat = kucing'),
            QuizQuestion(id: 'animal_q3', type: QuestionType.multipleChoice, question: '"burung" dalam bahasa Inggris?', options: ['bird', 'fish', 'animal', 'wing'], correctAnswer: 'bird', explanation: 'Bird = burung'),
            QuizQuestion(id: 'animal_q4', type: QuestionType.multipleChoice, question: '"kuda" dalam bahasa Inggris?', options: ['horse', 'cow', 'goat', 'sheep'], correctAnswer: 'horse', explanation: 'Horse = kuda'),
            QuizQuestion(id: 'animal_q5', type: QuestionType.multipleChoice, question: '"sapi" dalam bahasa Inggris?', options: ['cow', 'horse', 'goat', 'buffalo'], correctAnswer: 'cow', explanation: 'Cow = sapi'),
            QuizQuestion(id: 'animal_q6', type: QuestionType.multipleChoice, question: '"gajah" dalam bahasa Inggris?', options: ['elephant', 'rhino', 'hippo', 'giraffe'], correctAnswer: 'elephant', explanation: 'Elephant = gajah'),
            QuizQuestion(id: 'animal_q7', type: QuestionType.multipleChoice, question: '"singa" dalam bahasa Inggris?', options: ['lion', 'tiger', 'leopard', 'panther'], correctAnswer: 'lion', explanation: 'Lion = singa'),
            QuizQuestion(id: 'animal_q8', type: QuestionType.multipleChoice, question: '"ular" dalam bahasa Inggris?', options: ['snake', 'worm', 'lizard', 'frog'], correctAnswer: 'snake', explanation: 'Snake = ular'),
            QuizQuestion(id: 'animal_q9', type: QuestionType.multipleChoice, question: '"ikan" dalam bahasa Inggris?', options: ['fish', 'shark', 'whale', 'dolphin'], correctAnswer: 'fish', explanation: 'Fish = ikan'),
            QuizQuestion(id: 'animal_q10', type: QuestionType.multipleChoice, question: '"kupu-kupu" dalam bahasa Inggris?', options: ['butterfly', 'moth', 'bee', 'fly'], correctAnswer: 'butterfly', explanation: 'Butterfly = kupu-kupu'),
          ],
        ),
      ],
    ),
    GrammarTopic(
      id: 'weather',
      title: 'Weather',
      description: 'Cuaca dan iklim',
      lessons: [
        Lesson(
          id: 'weather_1',
          title: 'Kata-Kata Cuaca',
          content: 'Weather vocabulary.',
          examples: [
            GrammarExample(english: 'sunny', indonesian: 'cerah'),
            GrammarExample(english: 'cloudy', indonesian: 'berawan'),
            GrammarExample(english: 'rainy', indonesian: 'hujan'),
            GrammarExample(english: 'windy', indonesian: 'berangin'),
            GrammarExample(english: 'snowy', indonesian: 'bersalju'),
            GrammarExample(english: 'stormy', indonesian: 'badai'),
            GrammarExample(english: 'hot', indonesian: 'panas'),
            GrammarExample(english: 'cold', indonesian: 'dingin'),
            GrammarExample(english: 'warm', indonesian: 'hangat'),
            GrammarExample(english: 'cool', indonesian: 'sejuk'),
          ],
          tips: ['Weather talk di small talk!'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'weather_quiz',
          topicId: 'weather',
          title: 'Latihan Weather',
          xpReward: 20,
          questions: [
            QuizQuestion(id: 'weather_q1', type: QuestionType.multipleChoice, question: '"cerah" dalam bahasa Inggris?', options: ['sunny', 'cloudy', 'rainy', 'windy'], correctAnswer: 'sunny', explanation: 'Sunny = cerah'),
            QuizQuestion(id: 'weather_q2', type: QuestionType.multipleChoice, question: '"berawan" dalam bahasa Inggris?', options: ['cloudy', 'sunny', 'rainy', 'foggy'], correctAnswer: 'cloudy', explanation: 'Cloudy = berawan'),
            QuizQuestion(id: 'weather_q3', type: QuestionType.multipleChoice, question: '"hujan" dalam bahasa Inggris?', options: ['rainy', 'sunny', 'cloudy', 'dry'], correctAnswer: 'rainy', explanation: 'Rainy = hujan'),
            QuizQuestion(id: 'weather_q4', type: QuestionType.multipleChoice, question: '"berangin" dalam bahasa Inggris?', options: ['windy', 'breezy', 'stormy', 'calm'], correctAnswer: 'windy', explanation: 'Windy = berangin'),
            QuizQuestion(id: 'weather_q5', type: QuestionType.multipleChoice, question: '"panas" dalam bahasa Inggris?', options: ['hot', 'warm', 'cool', 'cold'], correctAnswer: 'hot', explanation: 'Hot = panas'),
            QuizQuestion(id: 'weather_q6', type: QuestionType.multipleChoice, question: '"dingin" dalam bahasa Inggris?', options: ['cold', 'cool', 'hot', 'warm'], correctAnswer: 'cold', explanation: 'Cold = dingin'),
            QuizQuestion(id: 'weather_q7', type: QuestionType.multipleChoice, question: '"hangat" dalam bahasa Inggris?', options: ['warm', 'hot', 'cool', 'cold'], correctAnswer: 'warm', explanation: 'Warm = hangat'),
            QuizQuestion(id: 'weather_q8', type: QuestionType.multipleChoice, question: '"sejuk" dalam bahasa Inggris?', options: ['cool', 'cold', 'warm', 'hot'], correctAnswer: 'cool', explanation: 'Cool = sejuk'),
            QuizQuestion(id: 'weather_q9', type: QuestionType.multipleChoice, question: '"badai" dalam bahasa Inggris?', options: ['stormy', 'rainy', 'windy', 'thunder'], correctAnswer: 'stormy', explanation: 'Stormy = badai'),
            QuizQuestion(id: 'weather_q10', type: QuestionType.multipleChoice, question: '"bersalju" dalam bahasa Inggris?', options: ['snowy', 'rainy', 'frosty', 'icy'], correctAnswer: 'snowy', explanation: 'Snowy = bersalju'),
          ],
        ),
      ],
    ),
    GrammarTopic(
      id: 'sports',
      title: 'Sports',
      description: 'Olahraga',
      lessons: [
        Lesson(
          id: 'sports_1',
          title: 'Nama-Nama Olahraga',
          content: 'Sports vocabulary.',
          examples: [
            GrammarExample(english: 'football', indonesian: 'sepak bola'),
            GrammarExample(english: 'basketball', indonesian: 'basket'),
            GrammarExample(english: 'volleyball', indonesian: 'voli'),
            GrammarExample(english: 'tennis', indonesian: 'tenis'),
            GrammarExample(english: 'swimming', indonesian: 'renang'),
            GrammarExample(english: 'running', indonesian: 'lari'),
            GrammarExample(english: 'cycling', indonesian: 'bersepeda'),
            GrammarExample(english: 'badminton', indonesian: 'bulu tangkis'),
            GrammarExample(english: 'boxing', indonesian: 'tinju'),
            GrammarExample(english: 'golf', indonesian: 'golf'),
          ],
          tips: ['Sports = great untuk conversation!'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'sports_quiz',
          topicId: 'sports',
          title: 'Latihan Sports',
          xpReward: 20,
          questions: [
            QuizQuestion(id: 'sport_q1', type: QuestionType.multipleChoice, question: '"sepak bola" dalam bahasa Inggris?', options: ['football', 'soccer', 'ball', 'goal'], correctAnswer: 'football', explanation: 'Football = sepak bola'),
            QuizQuestion(id: 'sport_q2', type: QuestionType.multipleChoice, question: '"basket" dalam bahasa Inggris?', options: ['basketball', 'volleyball', 'tennis', 'baseball'], correctAnswer: 'basketball', explanation: 'Basketball = basket'),
            QuizQuestion(id: 'sport_q3', type: QuestionType.multipleChoice, question: '"renang" dalam bahasa Inggris?', options: ['swimming', 'diving', 'waterpolo', 'rowing'], correctAnswer: 'swimming', explanation: 'Swimming = renang'),
            QuizQuestion(id: 'sport_q4', type: QuestionType.multipleChoice, question: '"lari" dalam bahasa Inggris?', options: ['running', 'jogging', 'walking', 'sprinting'], correctAnswer: 'running', explanation: 'Running = berlari'),
            QuizQuestion(id: 'sport_q5', type: QuestionType.multipleChoice, question: '"tenis" dalam bahasa Inggris?', options: ['tennis', 'table tennis', 'badminton', 'squash'], correctAnswer: 'tennis', explanation: 'Tennis = tenis'),
            QuizQuestion(id: 'sport_q6', type: QuestionType.multipleChoice, question: '"voli" dalam bahasa Inggris?', options: ['volleyball', 'basketball', 'handball', 'netball'], correctAnswer: 'volleyball', explanation: 'Volleyball = voli'),
            QuizQuestion(id: 'sport_q7', type: QuestionType.multipleChoice, question: '"bersepeda" dalam bahasa Inggris?', options: ['cycling', 'biking', 'riding', 'running'], correctAnswer: 'cycling', explanation: 'Cycling = bersepeda'),
            QuizQuestion(id: 'sport_q8', type: QuestionType.multipleChoice, question: '"tinju" dalam bahasa Inggris?', options: ['boxing', 'fighting', 'martial arts', 'wrestling'], correctAnswer: 'boxing', explanation: 'Boxing = tinju'),
            QuizQuestion(id: 'sport_q9', type: QuestionType.multipleChoice, question: '"bulu tangkis" dalam bahasa Inggris?', options: ['badminton', 'tennis', 'squash', 'ping pong'], correctAnswer: 'badminton', explanation: 'Badminton = bulu tangkis'),
            QuizQuestion(id: 'sport_q10', type: QuestionType.multipleChoice, question: '"golf" dalam bahasa Inggris?', options: ['golf', 'mini golf', 'putting', 'caddie'], correctAnswer: 'golf', explanation: 'Golf = golf'),
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
          xpReward: 20,
          questions: [
            QuizQuestion(id: 'family_q1', type: QuestionType.multipleChoice, question: '"ayah" dalam bahasa Inggris?', options: ['father', 'mother', 'brother', 'uncle'], correctAnswer: 'father', explanation: 'Father = ayah'),
            QuizQuestion(id: 'family_q2', type: QuestionType.multipleChoice, question: '"ibu" dalam bahasa Inggris?', options: ['mother', 'father', 'sister', 'aunt'], correctAnswer: 'mother', explanation: 'Mother = ibu'),
            QuizQuestion(id: 'family_q3', type: QuestionType.multipleChoice, question: '"orang tua" dalam bahasa Inggris?', options: ['parents', 'parent', 'father mother', 'family'], correctAnswer: 'parents', explanation: 'Parents = orang tua (plural)'),
            QuizQuestion(id: 'family_q4', type: QuestionType.multipleChoice, question: '"kakak/adik laki-laki" dalam bahasa Inggris?', options: ['brother', 'sister', 'cousin', 'uncle'], correctAnswer: 'brother', explanation: 'Brother = kakak/adik laki-laki'),
            QuizQuestion(id: 'family_q5', type: QuestionType.multipleChoice, question: '"kakak/adik perempuan" dalam bahasa Inggris?', options: ['sister', 'brother', 'cousin', 'aunt'], correctAnswer: 'sister', explanation: 'Sister = kakak/adik perempuan'),
            QuizQuestion(id: 'family_q6', type: QuestionType.multipleChoice, question: '"anak laki-laki" dalam bahasa Inggris?', options: ['son', 'daughter', 'child', 'boy'], correctAnswer: 'son', explanation: 'Son = anak laki-laki'),
            QuizQuestion(id: 'family_q7', type: QuestionType.multipleChoice, question: '"anak perempuan" dalam bahasa Inggris?', options: ['daughter', 'son', 'child', 'girl'], correctAnswer: 'daughter', explanation: 'Daughter = anak perempuan'),
            QuizQuestion(id: 'family_q8', type: QuestionType.multipleChoice, question: '"kakek" dalam bahasa Inggris?', options: ['grandfather', 'grandmother', 'uncle', 'father'], correctAnswer: 'grandfather', explanation: 'Grandfather = kakek'),
            QuizQuestion(id: 'family_q9', type: QuestionType.multipleChoice, question: '"nenek" dalam bahasa Inggris?', options: ['grandmother', 'grandfather', 'aunt', 'mother'], correctAnswer: 'grandmother', explanation: 'Grandmother = nenek'),
            QuizQuestion(id: 'family_q10', type: QuestionType.multipleChoice, question: '"paman" dalam bahasa Inggris?', options: ['uncle', 'father', 'brother', 'cousin'], correctAnswer: 'uncle', explanation: 'Uncle = paman/om'),
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
          xpReward: 20,
          questions: [
            QuizQuestion(id: 'emotions_q1', type: QuestionType.multipleChoice, question: '"senang" dalam bahasa Inggris?', options: ['happy', 'sad', 'angry', 'tired'], correctAnswer: 'happy', explanation: 'Happy = senang'),
            QuizQuestion(id: 'emotions_q2', type: QuestionType.multipleChoice, question: '"sedih" dalam bahasa Inggris?', options: ['sad', 'happy', 'angry', 'scared'], correctAnswer: 'sad', explanation: 'Sad = sedih'),
            QuizQuestion(id: 'emotions_q3', type: QuestionType.multipleChoice, question: '"marah" dalam bahasa Inggris?', options: ['angry', 'sad', 'happy', 'tired'], correctAnswer: 'angry', explanation: 'Angry = marah'),
            QuizQuestion(id: 'emotions_q4', type: QuestionType.multipleChoice, question: '"takut" dalam bahasa Inggris?', options: ['afraid', 'angry', 'happy', 'sad'], correctAnswer: 'afraid', explanation: 'Afraid = takut'),
            QuizQuestion(id: 'emotions_q5', type: QuestionType.multipleChoice, question: '"lelah" dalam bahasa Inggris?', options: ['tired', 'sleepy', 'hungry', 'bored'], correctAnswer: 'tired', explanation: 'Tired = lelah'),
            QuizQuestion(id: 'emotions_q6', type: QuestionType.multipleChoice, question: '"bersemangat" dalam bahasa Inggris?', options: ['excited', 'happy', 'tired', 'bored'], correctAnswer: 'excited', explanation: 'Excited = bersemangat'),
            QuizQuestion(id: 'emotions_q7', type: QuestionType.multipleChoice, question: '"lapar" dalam bahasa Inggris?', options: ['hungry', 'thirsty', 'tired', 'bored'], correctAnswer: 'hungry', explanation: 'Hungry = lapar'),
            QuizQuestion(id: 'emotions_q8', type: QuestionType.multipleChoice, question: '"haus" dalam bahasa Inggris?', options: ['thirsty', 'hungry', 'tired', 'sleepy'], correctAnswer: 'thirsty', explanation: 'Thirsty = haus'),
            QuizQuestion(id: 'emotions_q9', type: QuestionType.multipleChoice, question: '"kesal" dalam bahasa Inggris?', options: ['annoyed', 'angry', 'sad', 'happy'], correctAnswer: 'annoyed', explanation: 'Annoyed = kesal'),
            QuizQuestion(id: 'emotions_q10', type: QuestionType.multipleChoice, question: '"bingung" dalam bahasa Inggris?', options: ['confused', 'worried', 'scared', 'tired'], correctAnswer: 'confused', explanation: 'Confused = bingung'),
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
          xpReward: 20,
          questions: [
            QuizQuestion(id: 'places_q1', type: QuestionType.multipleChoice, question: '"sekolah" dalam bahasa Inggris?', options: ['school', 'house', 'park', 'bank'], correctAnswer: 'school', explanation: 'School = sekolah'),
            QuizQuestion(id: 'places_q2', type: QuestionType.multipleChoice, question: '"rumah" dalam bahasa Inggris?', options: ['house', 'home', 'building', 'room'], correctAnswer: 'house', explanation: 'House = rumah (bangunan)'),
            QuizQuestion(id: 'places_q3', type: QuestionType.multipleChoice, question: '"rumah sakit" dalam bahasa Inggris?', options: ['hospital', 'clinic', 'pharmacy', 'doctor'], correctAnswer: 'hospital', explanation: 'Hospital = rumah sakit'),
            QuizQuestion(id: 'places_q4', type: QuestionType.multipleChoice, question: '"restoran" dalam bahasa Inggris?', options: ['restaurant', 'cafe', 'hotel', 'bar'], correctAnswer: 'restaurant', explanation: 'Restaurant = restoran'),
            QuizQuestion(id: 'places_q5', type: QuestionType.multipleChoice, question: '"kafe" dalam bahasa Inggris?', options: ['cafe', 'coffee shop', 'restaurant', 'bar'], correctAnswer: 'cafe', explanation: 'Cafe = kafe'),
            QuizQuestion(id: 'places_q6', type: QuestionType.multipleChoice, question: '"taman" dalam bahasa Inggris?', options: ['park', 'garden', 'yard', 'field'], correctAnswer: 'park', explanation: 'Park = taman umum'),
            QuizQuestion(id: 'places_q7', type: QuestionType.multipleChoice, question: '"pantai" dalam bahasa Inggris?', options: ['beach', 'sea', 'ocean', 'lake'], correctAnswer: 'beach', explanation: 'Beach = pantai'),
            QuizQuestion(id: 'places_q8', type: QuestionType.multipleChoice, question: '"perpustakaan" dalam bahasa Inggris?', options: ['library', 'bookstore', 'school', 'museum'], correctAnswer: 'library', explanation: 'Library = perpustakaan'),
            QuizQuestion(id: 'places_q9', type: QuestionType.multipleChoice, question: '"bank" dalam bahasa Inggris?', options: ['bank', 'office', 'store', 'mall'], correctAnswer: 'bank', explanation: 'Bank = bank'),
            QuizQuestion(id: 'places_q10', type: QuestionType.multipleChoice, question: '"bandara" dalam bahasa Inggris?', options: ['airport', 'station', 'port', 'harbor'], correctAnswer: 'airport', explanation: 'Airport = bandara'),
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
          xpReward: 20,
          questions: [
            QuizQuestion(id: 'colors_q1', type: QuestionType.multipleChoice, question: '"biru" dalam bahasa Inggris?', options: ['blue', 'red', 'green', 'yellow'], correctAnswer: 'blue', explanation: 'Blue = biru'),
            QuizQuestion(id: 'colors_q2', type: QuestionType.multipleChoice, question: '"merah" dalam bahasa Inggris?', options: ['red', 'pink', 'orange', 'purple'], correctAnswer: 'red', explanation: 'Red = merah'),
            QuizQuestion(id: 'colors_q3', type: QuestionType.multipleChoice, question: '"hijau" dalam bahasa Inggris?', options: ['green', 'blue', 'yellow', 'brown'], correctAnswer: 'green', explanation: 'Green = hijau'),
            QuizQuestion(id: 'colors_q4', type: QuestionType.multipleChoice, question: '"kuning" dalam bahasa Inggris?', options: ['yellow', 'orange', 'green', 'gold'], correctAnswer: 'yellow', explanation: 'Yellow = kuning'),
            QuizQuestion(id: 'colors_q5', type: QuestionType.multipleChoice, question: '"oren" dalam bahasa Inggris?', options: ['orange', 'yellow', 'red', 'brown'], correctAnswer: 'orange', explanation: 'Orange = oren'),
            QuizQuestion(id: 'colors_q6', type: QuestionType.multipleChoice, question: '"ungu" dalam bahasa Inggris?', options: ['purple', 'violet', 'pink', 'blue'], correctAnswer: 'purple', explanation: 'Purple = ungu'),
            QuizQuestion(id: 'colors_q7', type: QuestionType.multipleChoice, question: '"merah muda" dalam bahasa Inggris?', options: ['pink', 'red', 'purple', 'rose'], correctAnswer: 'pink', explanation: 'Pink = merah muda'),
            QuizQuestion(id: 'colors_q8', type: QuestionType.multipleChoice, question: '"hitam" dalam bahasa Inggris?', options: ['black', 'dark', 'gray', 'brown'], correctAnswer: 'black', explanation: 'Black = hitam'),
            QuizQuestion(id: 'colors_q9', type: QuestionType.multipleChoice, question: '"putih" dalam bahasa Inggris?', options: ['white', 'light', 'gray', 'cream'], correctAnswer: 'white', explanation: 'White = putih'),
            QuizQuestion(id: 'colors_q10', type: QuestionType.multipleChoice, question: '"coklat" dalam bahasa Inggris?', options: ['brown', 'dark', 'chocolate', 'tan'], correctAnswer: 'brown', explanation: 'Brown = coklat'),
          ],
        ),
      ],
    ),
    GrammarTopic(
      id: 'professions',
      title: 'Professions',
      description: 'Pekerjaan dan profesi',
      lessons: [
        Lesson(
          id: 'prof_1',
          title: 'Nama-Nama Profesi',
          content: 'Professions vocabulary.',
          examples: [
            GrammarExample(english: 'doctor', indonesian: 'dokter'),
            GrammarExample(english: 'teacher', indonesian: 'guru'),
            GrammarExample(english: 'engineer', indonesian: 'insinyur'),
            GrammarExample(english: 'lawyer', indonesian: 'pengacara'),
            GrammarExample(english: 'nurse', indonesian: 'perawat'),
            GrammarExample(english: 'pilot', indonesian: 'pilot'),
            GrammarExample(english: 'chef', indonesian: 'koki'),
            GrammarExample(english: 'farmer', indonesian: 'petani'),
            GrammarExample(english: 'driver', indonesian: 'sopir'),
            GrammarExample(english: 'scientist', indonesian: 'ilmuan'),
          ],
          tips: ['Kenalkan profesi dengan bahasa Inggris!'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'prof_quiz',
          topicId: 'professions',
          title: 'Latihan Professions',
          xpReward: 20,
          questions: [
            QuizQuestion(id: 'prof_q1', type: QuestionType.multipleChoice, question: '"dokter" dalam bahasa Inggris?', options: ['doctor', 'nurse', 'patient', 'medic'], correctAnswer: 'doctor', explanation: 'Doctor = dokter'),
            QuizQuestion(id: 'prof_q2', type: QuestionType.multipleChoice, question: '"guru" dalam bahasa Inggris?', options: ['teacher', 'student', 'professor', 'instructor'], correctAnswer: 'teacher', explanation: 'Teacher = guru'),
            QuizQuestion(id: 'prof_q3', type: QuestionType.multipleChoice, question: '"insinyur" dalam bahasa Inggris?', options: ['engineer', 'architect', 'designer', 'builder'], correctAnswer: 'engineer', explanation: 'Engineer = insinyur'),
            QuizQuestion(id: 'prof_q4', type: QuestionType.multipleChoice, question: '"pengacara" dalam bahasa Inggris?', options: ['lawyer', 'judge', 'attorney', 'counsel'], correctAnswer: 'lawyer', explanation: 'Lawyer = pengacara'),
            QuizQuestion(id: 'prof_q5', type: QuestionType.multipleChoice, question: '"perawat" dalam bahasa Inggris?', options: ['nurse', 'doctor', 'patient', 'midwife'], correctAnswer: 'nurse', explanation: 'Nurse = perawat'),
            QuizQuestion(id: 'prof_q6', type: QuestionType.multipleChoice, question: '"pilot" dalam bahasa Inggris?', options: ['pilot', 'captain', 'driver', 'astronaut'], correctAnswer: 'pilot', explanation: 'Pilot = pilot'),
            QuizQuestion(id: 'prof_q7', type: QuestionType.multipleChoice, question: '"koki" dalam bahasa Inggris?', options: ['chef', 'cook', 'baker', 'caterer'], correctAnswer: 'chef', explanation: 'Chef = koki (profesional)'),
            QuizQuestion(id: 'prof_q8', type: QuestionType.multipleChoice, question: '"petani" dalam bahasa Inggris?', options: ['farmer', 'gardener', 'worker', 'owner'], correctAnswer: 'farmer', explanation: 'Farmer = petani'),
            QuizQuestion(id: 'prof_q9', type: QuestionType.multipleChoice, question: '"sopir" dalam bahasa Inggris?', options: ['driver', 'pilot', 'conductor', 'rider'], correctAnswer: 'driver', explanation: 'Driver = sopir'),
            QuizQuestion(id: 'prof_q10', type: QuestionType.multipleChoice, question: '"ilmuan" dalam bahasa Inggris?', options: ['scientist', 'researcher', 'inventor', 'professor'], correctAnswer: 'scientist', explanation: 'Scientist = ilmuwan'),
          ],
        ),
      ],
    ),
    GrammarTopic(
      id: 'shapes_numbers',
      title: 'Shapes & Numbers',
      description: 'Bentuk dan angka',
      lessons: [
        Lesson(
          id: 'shapes_1',
          title: 'Bentuk dan Angka',
          content: 'Shapes and numbers vocabulary.',
          examples: [
            GrammarExample(english: 'circle', indonesian: 'lingkaran'),
            GrammarExample(english: 'square', indonesian: 'persegi'),
            GrammarExample(english: 'triangle', indonesian: 'segitiga'),
            GrammarExample(english: 'rectangle', indonesian: 'persegi panjang'),
            GrammarExample(english: 'one', indonesian: 'satu'),
            GrammarExample(english: 'two', indonesian: 'dua'),
            GrammarExample(english: 'three', indonesian: 'tiga'),
            GrammarExample(english: 'ten', indonesian: 'sepuluh'),
            GrammarExample(english: 'hundred', indonesian: 'seratus'),
            GrammarExample(english: 'thousand', indonesian: 'seribu'),
          ],
          tips: ['Shapes dan numbers di everywhere!'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'shapes_quiz',
          topicId: 'shapes_numbers',
          title: 'Latihan Shapes & Numbers',
          xpReward: 20,
          questions: [
            QuizQuestion(id: 'shape_q1', type: QuestionType.multipleChoice, question: '"lingkaran" dalam bahasa Inggris?', options: ['circle', 'round', 'ball', 'sphere'], correctAnswer: 'circle', explanation: 'Circle = lingkaran'),
            QuizQuestion(id: 'shape_q2', type: QuestionType.multipleChoice, question: '"persegi" dalam bahasa Inggris?', options: ['square', 'cube', 'box', 'rectangle'], correctAnswer: 'square', explanation: 'Square = persegi'),
            QuizQuestion(id: 'shape_q3', type: QuestionType.multipleChoice, question: '"segitiga" dalam bahasa Inggris?', options: ['triangle', 'pyramid', 'cone', 'delta'], correctAnswer: 'triangle', explanation: 'Triangle = segitiga'),
            QuizQuestion(id: 'shape_q4', type: QuestionType.multipleChoice, question: '"satu" dalam bahasa Inggris?', options: ['one', 'once', 'first', 'single'], correctAnswer: 'one', explanation: 'One = satu'),
            QuizQuestion(id: 'shape_q5', type: QuestionType.multipleChoice, question: '"dua" dalam bahasa Inggris?', options: ['two', 'twice', 'second', 'double'], correctAnswer: 'two', explanation: 'Two = dua'),
            QuizQuestion(id: 'shape_q6', type: QuestionType.multipleChoice, question: '"tiga" dalam bahasa Inggris?', options: ['three', 'third', 'thrice', 'triple'], correctAnswer: 'three', explanation: 'Three = tiga'),
            QuizQuestion(id: 'shape_q7', type: QuestionType.multipleChoice, question: '"sepuluh" dalam bahasa Inggris?', options: ['ten', 'tenth', 'tieth', 'teen'], correctAnswer: 'ten', explanation: 'Ten = sepuluh'),
            QuizQuestion(id: 'shape_q8', type: QuestionType.multipleChoice, question: '"seratus" dalam bahasa Inggris?', options: ['hundred', 'thousand', 'million', 'billion'], correctAnswer: 'hundred', explanation: 'Hundred = seratus'),
            QuizQuestion(id: 'shape_q9', type: QuestionType.multipleChoice, question: '"seribu" dalam bahasa Inggris?', options: ['thousand', 'hundred', 'million', 'billion'], correctAnswer: 'thousand', explanation: 'Thousand = seribu'),
            QuizQuestion(id: 'shape_q10', type: QuestionType.multipleChoice, question: '"persegi panjang" dalam bahasa Inggris?', options: ['rectangle', 'square', 'parallelogram', 'oval'], correctAnswer: 'rectangle', explanation: 'Rectangle = persegi panjang'),
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
        Lesson(
          id: 'irreg_3',
          title: 'Irregular Verbs (Bagian 3)',
          content: '''**Irregular Verbs Lanjutan:**

21. write = menulis -> wrote/written
22. run = lari -> ran/run
23. eat = makan -> ate/eaten
24. drink = minum -> drank/drunk
25. speak = berbicara -> spoke/spoken
26. sleep = tidur -> slept/slept
27. buy = membeli -> bought/bought
28. sell = menjual -> sold/sold
29. send = mengirim -> sent/sent
30. bring = membawa -> brought/brought''',
          examples: [
            GrammarExample(english: 'I wrote a letter yesterday.', indonesian: 'Saya menulis surat kemarin.'),
            GrammarExample(english: 'He ran five kilometers.', indonesian: 'Dia berlari 5 kilometer.'),
          ],
          tips: ['Buat kalimat sendiri dengan setiap verb!'],
          xpReward: 10,
        ),
        Lesson(
          id: 'irreg_4',
          title: 'Irregular Verbs (Bagian 4)',
          content: '''**Irregular Verbs Lanjutan:**

31. pay = membayar -> paid/paid
32. sing = menyanyi -> sang/sung
33. draw = menggambar -> drew/drawn
34. fly = terbang -> flew/flown
35. grow = tumbuh -> grew/grown
36. know = tahu -> knew/known
37. fall = jatuh -> fell/fallen
38. break = memecahkan -> broke/broken
39. choose = memilih -> chose/chosen
40. hide = bersembunyi -> hid/hidden''',
          examples: [
            GrammarExample(english: 'She drew a beautiful picture.', indonesian: 'Dia menggambar gambar yang indah.'),
            GrammarExample(english: 'The bird flew away.', indonesian: 'Burung itu terbang pergi.'),
          ],
          tips: ['Practice setiap hari 5 verb!'],
          xpReward: 10,
        ),
        Lesson(
          id: 'irreg_5',
          title: 'Irregular Verbs (Bagian 5)',
          content: '''**Irregular Verbs Lanjutan:**

41. drive = mengendarai -> drove/driven
42. wear = memakai -> wore/worn
43. ride = naik -> rode/ridden
44. hide = sembunyi -> hid/hidden
45. win = menang -> won/won
46. lose = kalah -> lost/lost
47. cost = berharga -> cost/cost
48. cut = memotong -> cut/cut
49. hit = memukul -> hit/hit
50. let = membiarkan -> let/let''',
          examples: [
            GrammarExample(english: 'I drove to work yesterday.', indonesian: 'Saya mengendarai mobil ke kerja kemarin.'),
            GrammarExample(english: 'They lost the game.', indonesian: 'Mereka kalah dalam permainan.'),
          ],
          tips: ['Verbs dengan pola yang sama = lebih mudah dihafal!'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'irreg_quiz',
          topicId: 'irregular_verbs',
          title: 'Latihan Irregular Verbs 1',
          xpReward: 20,
          questions: [
            QuizQuestion(id: 'irreg_q1', type: QuestionType.multipleChoice, question: 'go Past Tense = ?', options: ['went', 'gone', 'going', 'goes'], correctAnswer: 'went', explanation: 'Go -> went (irregular)'),
            QuizQuestion(id: 'irreg_q2', type: QuestionType.multipleChoice, question: 'see Past Tense = ?', options: ['saw', 'seen', 'seeing', 'sees'], correctAnswer: 'saw', explanation: 'See -> saw (irregular)'),
            QuizQuestion(id: 'irreg_q3', type: QuestionType.multipleChoice, question: 'write Past Participle = ?', options: ['written', 'wrote', 'writen', 'writing'], correctAnswer: 'written', explanation: 'Write -> wrote -> written'),
            QuizQuestion(id: 'irreg_q4', type: QuestionType.multipleChoice, question: 'eat Past Tense = ?', options: ['ate', 'eaten', 'eated', 'eating'], correctAnswer: 'ate', explanation: 'Eat -> ate (irregular)'),
            QuizQuestion(id: 'irreg_q5', type: QuestionType.multipleChoice, question: 'speak Past Participle = ?', options: ['spoken', 'spoke', 'speaken', 'speaking'], correctAnswer: 'spoken', explanation: 'Speak -> spoke -> spoken'),
            QuizQuestion(id: 'irreg_q6', type: QuestionType.multipleChoice, question: 'buy Past Tense = ?', options: ['bought', 'buyed', 'boughten', 'buying'], correctAnswer: 'bought', explanation: 'Buy -> bought (irregular)'),
            QuizQuestion(id: 'irreg_q7', type: QuestionType.multipleChoice, question: 'drink Past Participle = ?', options: ['drunk', 'drank', 'drinked', 'drink'], correctAnswer: 'drunk', explanation: 'Drink -> drank -> drunk'),
            QuizQuestion(id: 'irreg_q8', type: QuestionType.multipleChoice, question: 'take Past Tense = ?', options: ['took', 'taken', 'taked', 'takes'], correctAnswer: 'took', explanation: 'Take -> took (irregular)'),
            QuizQuestion(id: 'irreg_q9', type: QuestionType.multipleChoice, question: 'write Past Tense = ?', options: ['wrote', 'written', 'writed', 'writes'], correctAnswer: 'wrote', explanation: 'Write -> wrote (irregular)'),
            QuizQuestion(id: 'irreg_q10', type: QuestionType.multipleChoice, question: 'fly Past Participle = ?', options: ['flown', 'flew', 'flyed', 'flying'], correctAnswer: 'flown', explanation: 'Fly -> flew -> flown'),
          ],
        ),
        Quiz(
          id: 'irreg_quiz2',
          topicId: 'irregular_verbs',
          title: 'Latihan Irregular Verbs 2',
          xpReward: 20,
          questions: [
            QuizQuestion(id: 'irreg2_q1', type: QuestionType.multipleChoice, question: 'run Past Tense = ?', options: ['ran', 'run', 'runned', 'running'], correctAnswer: 'ran', explanation: 'Run -> ran (irregular)'),
            QuizQuestion(id: 'irreg2_q2', type: QuestionType.multipleChoice, question: 'give Past Participle = ?', options: ['given', 'gave', 'gived', 'gives'], correctAnswer: 'given', explanation: 'Give -> gave -> given'),
            QuizQuestion(id: 'irreg2_q3', type: QuestionType.multipleChoice, question: 'draw Past Tense = ?', options: ['drew', 'drawn', 'drawed', 'drawing'], correctAnswer: 'drew', explanation: 'Draw -> drew (irregular)'),
            QuizQuestion(id: 'irreg2_q4', type: QuestionType.multipleChoice, question: 'sing Past Participle = ?', options: ['sung', 'sang', 'singed', 'sings'], correctAnswer: 'sung', explanation: 'Sing -> sang -> sung'),
            QuizQuestion(id: 'irreg2_q5', type: QuestionType.multipleChoice, question: 'become Past Tense = ?', options: ['became', 'become', 'becoming', 'becomed'], correctAnswer: 'became', explanation: 'Become -> became (irregular)'),
            QuizQuestion(id: 'irreg2_q6', type: QuestionType.multipleChoice, question: 'break Past Participle = ?', options: ['broken', 'broke', 'breaken', 'breaks'], correctAnswer: 'broken', explanation: 'Break -> broke -> broken'),
            QuizQuestion(id: 'irreg2_q7', type: QuestionType.multipleChoice, question: 'choose Past Tense = ?', options: ['chose', 'chosen', 'choosed', 'chooses'], correctAnswer: 'chose', explanation: 'Choose -> chose (irregular)'),
            QuizQuestion(id: 'irreg2_q8', type: QuestionType.multipleChoice, question: 'drive Past Participle = ?', options: ['driven', 'drove', 'drived', 'drives'], correctAnswer: 'driven', explanation: 'Drive -> drove -> driven'),
            QuizQuestion(id: 'irreg2_q9', type: QuestionType.multipleChoice, question: 'fall Past Tense = ?', options: ['fell', 'fallen', 'falled', 'falls'], correctAnswer: 'fell', explanation: 'Fall -> fell (irregular)'),
            QuizQuestion(id: 'irreg2_q10', type: QuestionType.multipleChoice, question: 'win Past Participle = ?', options: ['won', 'win', 'winned', 'winning'], correctAnswer: 'won', explanation: 'Win -> won (same form)'),
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
          content: '''**Regular Verbs adalah kata kerja beraturan.**

Caranya: tambahkan -ed

**Aturan:**
1. Umum: work → worked
2. Akhiran -e: love → loved
3. Akhiran -y + konsonan: study → studied
4. Konsonan akhir ganda: stop → stopped''',
          examples: [
            GrammarExample(english: 'I worked yesterday.', indonesian: 'Saya bekerja kemarin.'),
            GrammarExample(english: 'She played football.', indonesian: 'Dia bermain sepak bola.'),
            GrammarExample(english: 'They wanted to come.', indonesian: 'Mereka ingin datang.'),
          ],
          tips: ['Reguler verbs tinggal +ed!'],
          xpReward: 10,
        ),
        Lesson(
          id: 'reg_2',
          title: 'Aturan Verb-ing',
          content: '''**Membuat Present Continuous (-ing):**

1. Umum: tambah -ing
   → work → working, play → playing

2. Akhiran -e: hilangkan e + ing
   → make → making, write → writing

3. Konsonan akhir ganda: + ing
   → stop → stopping, run → running

4. Akhiran -ie: ie → y + ing
   → die → dying, lie → lying''',
          examples: [
            GrammarExample(english: 'I am working now.', indonesian: 'Saya sedang bekerja.'),
            GrammarExample(english: 'She is making dinner.', indonesian: 'Dia sedang membuat makan malam.'),
          ],
          tips: ['e + ing = making (bukan makeing)'],
          xpReward: 10,
        ),
        Lesson(
          id: 'reg_3',
          title: 'Past Tense Regular Verbs',
          content: '''**Latihan Past Tense Regular:**

1. watch → watched
   → I watched TV last night.

2. dance → danced
   → She danced beautifully.

3. stop → stopped
   → The car stopped suddenly.

4. study → studied
   → They studied for the exam.

5. move → moved
   → We moved to Jakarta last year.

**Pengecekan:**
- Akhiran -s/-x/-ch/-sh: + es
  → watch → watched (sudah benar)
  → fix → fixed
- Konsonan + y: y → ied
  → study → studied''',
          examples: [
            GrammarExample(english: 'I cooked dinner yesterday.', indonesian: 'Saya memasak makan malam kemarin.'),
            GrammarExample(english: 'She visited her grandmother.', indonesian: 'Dia mengunjungi neneknya.'),
          ],
          tips: ['Practice setiap hari dengan kalimat sendiri!'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'reg_quiz',
          topicId: 'regular_verbs',
          title: 'Latihan Regular Verbs',
          xpReward: 20,
          questions: [
            QuizQuestion(id: 'reg_q1', type: QuestionType.multipleChoice, question: 'work Past Tense = ?', options: ['worked', 'working', 'works', 'workes'], correctAnswer: 'worked', explanation: 'Work + ed = worked'),
            QuizQuestion(id: 'reg_q2', type: QuestionType.multipleChoice, question: 'play Past Tense = ?', options: ['played', 'playd', 'playing', 'playes'], correctAnswer: 'played', explanation: 'Play + ed = played'),
            QuizQuestion(id: 'reg_q3', type: QuestionType.multipleChoice, question: 'study Past Tense = ?', options: ['studied', 'studyd', 'studying', 'studyed'], correctAnswer: 'studied', explanation: 'Study → studied (y + konsonan = ied)'),
            QuizQuestion(id: 'reg_q4', type: QuestionType.multipleChoice, question: 'stop Past Tense = ?', options: ['stopped', 'stopped', 'stoped', 'stopping'], correctAnswer: 'stopped', explanation: 'Stop → stopped (konsonan ganda + ed)'),
            QuizQuestion(id: 'reg_q5', type: QuestionType.multipleChoice, question: 'love Past Tense = ?', options: ['loved', 'loveed', 'loving', 'loved'], correctAnswer: 'loved', explanation: 'Love + d = loved (akhiran e)'),
            QuizQuestion(id: 'reg_q6', type: QuestionType.multipleChoice, question: 'make Present Continuous = ?', options: ['making', 'makeing', 'maked', 'makes'], correctAnswer: 'making', explanation: 'Make → making (hilangkah e + ing)'),
            QuizQuestion(id: 'reg_q7', type: QuestionType.multipleChoice, question: 'fix Past Tense = ?', options: ['fixed', 'fixd', 'fixt', 'fixing'], correctAnswer: 'fixed', explanation: 'Fix + ed = fixed'),
            QuizQuestion(id: 'reg_q8', type: QuestionType.multipleChoice, question: 'dance Past Tense = ?', options: ['danced', 'dancd', 'danceed', 'danced'], correctAnswer: 'danced', explanation: 'Dance + d = danced (akhiran e)'),
            QuizQuestion(id: 'reg_q9', type: QuestionType.multipleChoice, question: 'watch -ing = ?', options: ['watching', 'watcheing', 'watching', 'watch'], correctAnswer: 'watching', explanation: 'Watch + ing = watching'),
            QuizQuestion(id: 'reg_q10', type: QuestionType.multipleChoice, question: 'try Past Tense = ?', options: ['tried', 'tryed', 'tries', 'trying'], correctAnswer: 'tried', explanation: 'Try → tried (y + konsonan = ied)'),
          ],
        ),
      ],
    ),
    // ========== NEW: MODAL VERBS ==========
    GrammarTopic(
      id: 'modal_verbs',
      title: 'Modal Verbs',
      description: 'Kata kerja bantu modal (can, could, may, might, will, would, shall, should, must)',
      lessons: [
        Lesson(
          id: 'modal_1',
          title: 'Apa itu Modal Verbs?',
          content: '''**Modal Verbs adalah kata kerja bantu yang mengubah arti kata kerja utama.**

**Daftar Modal Verbs:**
1. **Can** = bisa/mampu
2. **Could** = bisa (lampau) / bisa (sopan)
3. **May** = mungkin/boleh
4. **Might** = mungkin
5. **Will** = akan
6. **Would** = akan (lampau) / akan (sopan)
7. **Shall** = akan (formal)
8. **Should** = seharusnya
9. **Must** = harus

**Ciri-ciri Modal:**
- Tidak berubah bentuk (tidak ada -s, -ed)
- Followed by bare infinitive (V1 tanpa to)
- Menambahkan arti: kemungkinan, kemampuan, kewajiban''',
          examples: [
            GrammarExample(english: 'I can swim.', indonesian: 'Saya bisa berenang.'),
            GrammarExample(english: 'You should study harder.', indonesian: 'Kamu seharusnya belajar lebih keras.'),
          ],
          tips: ['Modal + V1 (tanpa to)', 'Can = kemampuan', 'Must/Should = kewajiban'],
          xpReward: 10,
        ),
        Lesson(
          id: 'modal_2',
          title: 'Can, Could, May, Might',
          content: '''**Ability (Kemampuan):**
- **Can** = sekarang bisa
  → I can speak English.
- **Could** = dulu bisa
  → I could swim when I was 5.

**Possibility (Kemungkinan):**
- **Can** = bisa jadi
  → That can be true.
- **May** = mungkin (lebih formal)
  → It may rain tomorrow.
- **Might** = mungkin (ketidakpastian tinggi)
  → She might be at home.

**Permission (Izin):**
- **Can** = boleh (informal)
  → Can I go now?
- **May** = boleh (formal)
  → May I use your phone?''',
          examples: [
            GrammarExample(english: 'Could you help me?', indonesian: 'Bisakah kamu membantuku?'),
            GrammarExample(english: 'It might rain later.', indonesian: 'Mungkin nanti hujan.'),
          ],
          tips: ['Could lebih sopan dari can', 'Might lebih tidak pasti dari may'],
          xpReward: 10,
        ),
        Lesson(
          id: 'modal_3',
          title: 'Will, Would, Shall, Should',
          content: '''**Will:**
- Future tense → I will call you.
- Promise → I will help you.
- Willingness → I will do it.

**Would:**
- Past dari will → She said she would come.
- Polite request → Would you like some tea?
- Conditional → If I had money, I would travel.

**Should:**
- Saran/rekomendasi
  → You should see a doctor.
- Ekspektasi
  → She should be here by now.

**Shall:**
- Formal/spesisif
  → Shall we dance?
- Formal offer
  → Shall I help you?''',
          examples: [
            GrammarExample(english: 'Would you like some coffee?', indonesian: 'Mau kopi? (sopan)'),
            GrammarExample(english: 'You should try this restaurant.', indonesian: 'Kamu seharusnya coba restoran ini.'),
          ],
          tips: ['Would = will di masa lampau / sopan', 'Should = seharusnya'],
          xpReward: 10,
        ),
        Lesson(
          id: 'modal_4',
          title: 'Must, Have to, Need to',
          content: '''**Must vs Have to:**

**Must:**
- Kewajiban internal (dari dalam diri)
  → I must quit smoking. (saya YAKIN harus berhenti)
- Larangan absolut
  → You must not smoke here. (dilarang keras)

**Have to:**
- Kewajiban eksternal (dari luar)
  → I have to go to work. (harus karena pekerjaan)
- routine
  → I have to wake up early every day.

**Must NOT vs Do not have to:**
- Must NOT = dilarang
  → You must not tell lies.
- Do not have to = tidak perlu
  → You do not have to come early.

**Had to** = harus di masa lampau
→ I had to study hard to pass the exam.''',
          examples: [
            GrammarExample(english: 'You must be quiet in the library.', indonesian: 'Kamu harus diam di perpustakaan.'),
            GrammarExample(english: 'I have to finish this today.', indonesian: 'Saya harus menyelesaikan ini hari ini.'),
          ],
          tips: ['Must = harus (internal)', 'Have to = harus (eksternal)'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'modal_quiz',
          topicId: 'modal_verbs',
          title: 'Latihan Modal Verbs',
          xpReward: 25,
          questions: [
            QuizQuestion(id: 'modal_q1', type: QuestionType.multipleChoice, question: '"Saya bisa berenang."', options: ['I can swim', 'I could swim', 'I must swim', 'I should swim'], correctAnswer: 'I can swim', explanation: 'Can = kemampuan sekarang'),
            QuizQuestion(id: 'modal_q2', type: QuestionType.multipleChoice, question: '"Kamu ___ seharusnya istirahat."', options: ['should', 'can', 'will', 'would'], correctAnswer: 'should', explanation: 'Should = seharusnya'),
            QuizQuestion(id: 'modal_q3', type: QuestionType.multipleChoice, question: '"___ I help you?" (sangat sopan)', options: ['May', 'Can', 'Will', 'Must'], correctAnswer: 'May', explanation: 'May = paling sopan untuk menawarkan bantuan'),
            QuizQuestion(id: 'modal_q4', type: QuestionType.multipleChoice, question: '"It ___ rain today." (mungkin)', options: ['might', 'must', 'should', 'will'], correctAnswer: 'might', explanation: 'Might = kemungkinan rendah'),
            QuizQuestion(id: 'modal_q5', type: QuestionType.multipleChoice, question: '"You ___ not smoke here." (dilarang)', options: ['must', 'can', 'may', 'could'], correctAnswer: 'must', explanation: 'Must not = dilarang keras'),
            QuizQuestion(id: 'modal_q6', type: QuestionType.multipleChoice, question: 'I ___ go to school. (harus karena aturan)', options: ['have to', 'must', 'can', 'should'], correctAnswer: 'have to', explanation: 'Have to = kewajiban eksternal'),
            QuizQuestion(id: 'modal_q7', type: QuestionType.multipleChoice, question: '"___ you like some tea?" (sopan)', options: ['Would', 'Can', 'Will', 'Must'], correctAnswer: 'Would', explanation: 'Would you like = sangat sopan'),
            QuizQuestion(id: 'modal_q8', type: QuestionType.multipleChoice, question: 'She ___ swim when she was young.', options: ['could', 'can', 'must', 'should'], correctAnswer: 'could', explanation: 'Could = kemampuan di masa lampau'),
            QuizQuestion(id: 'modal_q9', type: QuestionType.multipleChoice, question: 'You ___ study harder. (saran)', options: ['should', 'must', 'can', 'will'], correctAnswer: 'should', explanation: 'Should = saran/rekomendasi'),
            QuizQuestion(id: 'modal_q10', type: QuestionType.multipleChoice, question: 'I ___ finish this by tomorrow. (harus)', options: ['must', 'can', 'may', 'might'], correctAnswer: 'must', explanation: 'Must = kewajiban kuat'),
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
        Lesson(
          id: 'noun_2',
          title: 'Jenis-Jenis Noun',
          content: '''**Jenis-Jenis Noun:**

1. **Common Noun** - kata umum
   → dog, city, book, teacher

2. **Proper Noun** - kata khusus (huruf kapital)
   → Indonesia, Monday, John

3. **Countable Noun** - bisa dihitung
   → apple, car, student

4. **Uncountable Noun** - tidak bisa dihitung
   → water, rice, information

5. **Collective Noun** - kata kelompok
   → team, family, crowd''',
          examples: [
            GrammarExample(english: 'The team is playing well.', indonesian: 'Tim sedang bermain dengan baik.'),
            GrammarExample(english: 'She lives in Indonesia.', indonesian: 'Dia tinggal di Indonesia.'),
          ],
          tips: ['Proper noun selalu huruf kapital', 'Uncountable noun pakai singular verb'],
          xpReward: 10,
        ),
        Lesson(
          id: 'noun_3',
          title: 'Singular & Plural',
          content: '''**Membuat Plural Noun:**

1. Umum: tambah -s
   → cat → cats, dog → dogs

2. Akhiran -s, -x, -z, -ch, -sh: tambah -es
   → box → boxes, watch → watches

3. Akhiran -y + konsonan: -y → -ies
   → baby → babies, city → cities

4. Akhiran -f/-fe: -f → -ves
   → knife → knives, life → lives

5. Irregular:
   → man → men, woman → women
   → child → children, tooth → teeth
   → fish → fish (same)''',
          examples: [
            GrammarExample(english: 'I have three cats.', indonesian: 'Saya punya tiga kucing.'),
            GrammarExample(english: 'The children are playing.', indonesian: 'Anak-anak sedang bermain.'),
          ],
          tips: ['Practice plural forms yang irregular!', 'Mouse → mice, foot → feet'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'noun_quiz',
          topicId: 'nouns',
          title: 'Latihan Noun',
          xpReward: 20,
          questions: [
            QuizQuestion(id: 'noun_q1', type: QuestionType.multipleChoice, question: '"guru" dalam bahasa Inggris?', options: ['teacher', 'student', 'doctor', 'friend'], correctAnswer: 'teacher', explanation: 'Teacher = guru'),
            QuizQuestion(id: 'noun_q2', type: QuestionType.multipleChoice, question: 'Plural dari "child" adalah...', options: ['children', 'childs', 'childes', 'childrens'], correctAnswer: 'children', explanation: 'Child → children (irregular plural)'),
            QuizQuestion(id: 'noun_q3', type: QuestionType.multipleChoice, question: '"Jakarta" adalah...', options: ['Proper Noun', 'Common Noun', 'Collective Noun', 'Abstract Noun'], correctAnswer: 'Proper Noun', explanation: 'Proper noun selalu huruf kapital (nama tempat/orang)'),
            QuizQuestion(id: 'noun_q4', type: QuestionType.multipleChoice, question: 'Plural dari "box" adalah...', options: ['boxes', 'boxs', 'boxies', 'bozes'], correctAnswer: 'boxes', explanation: 'Box → boxes (tambah -es)'),
            QuizQuestion(id: 'noun_q5', type: QuestionType.multipleChoice, question: '"water" adalah...', options: ['Uncountable Noun', 'Countable Noun', 'Proper Noun', 'Collective Noun'], correctAnswer: 'Uncountable Noun', explanation: 'Water tidak bisa dihitung secara langsung'),
            QuizQuestion(id: 'noun_q6', type: QuestionType.multipleChoice, question: 'Plural dari "city" adalah...', options: ['cities', 'citys', 'cityes', 'cities'], correctAnswer: 'cities', explanation: 'City → cities (y + konsonan = ies)'),
            QuizQuestion(id: 'noun_q7', type: QuestionType.multipleChoice, question: '"family" adalah...', options: ['Collective Noun', 'Proper Noun', 'Common Noun', 'Abstract Noun'], correctAnswer: 'Collective Noun', explanation: 'Family = kata kelompok'),
            QuizQuestion(id: 'noun_q8', type: QuestionType.multipleChoice, question: 'Plural dari "knife" adalah...', options: ['knives', 'knifes', 'knifees', 'knifves'], correctAnswer: 'knives', explanation: 'Knife → knives (f → ves)'),
            QuizQuestion(id: 'noun_q9', type: QuestionType.multipleChoice, question: '"happiness" adalah...', options: ['Abstract Noun', 'Common Noun', 'Countable Noun', 'Proper Noun'], correctAnswer: 'Abstract Noun', explanation: 'Happiness = perasaan/konsep (tidak bisa dilihat)'),
            QuizQuestion(id: 'noun_q10', type: QuestionType.multipleChoice, question: '"men" adalah plural dari...', options: ['man', 'men tidak punya singular', 'mann', 'min'], correctAnswer: 'man', explanation: 'Man → men (irregular plural)'),
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
          content: '''**Pronoun adalah kata ganti.**

**1. Subject Pronouns (Kata Ganti Subjek)**
I, you, he, she, it, we, they

**2. Object Pronouns (Kata Ganti Objek)**
me, you, him, her, it, us, them

**3. Possessive Adjectives (Kata Kepemilikan)**
my, your, his, her, its, our, their

**4. Possessive Pronouns (Kata Ganti Kepemilikan)**
mine, yours, his, hers, ours, theirs

**5. Reflexive Pronouns (Kata Ganti Diri)**
myself, yourself, himself, herself, itself, ourselves, themselves''',
          examples: [
            GrammarExample(english: 'She is my sister.', indonesian: 'Dia adalah kakak saya.'),
            GrammarExample(english: 'The book is hers.', indonesian: 'Buku itu miliknya.'),
          ],
          tips: ['Subject pronoun = melakukan aksi', 'Object pronoun = menerima aksi'],
          xpReward: 10,
        ),
        Lesson(
          id: 'pron_2',
          title: 'Demonstrative Pronouns',
          content: '''**Demonstrative Pronouns (This, That, These, Those)**

**This** = ini (dekat speaker)
→ This is my book.

**That** = itu (jauh dari speaker)
→ That is her car.

**These** = ini-ini (plural, dekat)
→ These are my friends.

**Those** = itu-itu (plural, jauh)
→ Those are their houses.''',
          examples: [
            GrammarExample(english: 'This is delicious.', indonesian: 'Ini enak.'),
            GrammarExample(english: 'Those are expensive.', indonesian: 'Itu-itu mahal.'),
          ],
          tips: ['This/These = dekat', 'That/Those = jauh'],
          xpReward: 10,
        ),
        Lesson(
          id: 'pron_3',
          title: 'Relative Pronouns',
          content: '''**Relative Pronouns (Kata Ganti Hubungan)**

**Who** = untuk orang (subjek)
→ The student who studies hard will pass.

**Whom** = untuk orang (objek)
→ The teacher whom we respect is kind.

**Which** = untuk benda/hewan
→ The book which I read is interesting.

**That** = untuk orang, benda, hewan
→ The movie that we watched was great.

**Whose** = menunjukkan kepemilikan
→ The girl whose bag is lost is crying.''',
          examples: [
            GrammarExample(english: 'The man who called is my uncle.', indonesian: 'Pria yang menelepon adalah paman saya.'),
            GrammarExample(english: 'The car which is red belongs to John.', indonesian: 'Mobil yang merah itu milik John.'),
          ],
          tips: ['Who/Which/That = yang dalam bahasa Indonesia'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'pron_quiz',
          topicId: 'pronouns',
          title: 'Latihan Pronoun',
          xpReward: 20,
          questions: [
            QuizQuestion(id: 'pron_q1', type: QuestionType.multipleChoice, question: '"saya" sebagai subjek adalah...', options: ['I', 'me', 'my', 'mine'], correctAnswer: 'I', explanation: 'I = saya (subject pronoun)'),
            QuizQuestion(id: 'pron_q2', type: QuestionType.multipleChoice, question: 'Object pronoun untuk "they" adalah...', options: ['them', 'they', 'their', 'theirs'], correctAnswer: 'them', explanation: 'They → them (object)'),
            QuizQuestion(id: 'pron_q3', type: QuestionType.multipleChoice, question: '"This" digunakan untuk...', options: ['benda yang dekat', 'benda yang jauh', 'orang', 'tempat'], correctAnswer: 'benda yang dekat', explanation: 'This = ini (dekat speaker)'),
            QuizQuestion(id: 'pron_q4', type: QuestionType.multipleChoice, question: 'Possessive pronoun dari "I" adalah...', options: ['mine', 'my', 'me', 'myself'], correctAnswer: 'mine', explanation: 'I → my/mine'),
            QuizQuestion(id: 'pron_q5', type: QuestionType.multipleChoice, question: 'Relative pronoun untuk benda adalah...', options: ['which', 'who', 'whom', 'whose'], correctAnswer: 'which', explanation: 'Which = untuk benda/hewan'),
            QuizQuestion(id: 'pron_q6', type: QuestionType.multipleChoice, question: '"The book is ___." (milik saya)', options: ['mine', 'my', 'me', 'myself'], correctAnswer: 'mine', explanation: 'Mine = kata ganti kepemilikan'),
            QuizQuestion(id: 'pron_q7', type: QuestionType.multipleChoice, question: 'Reflexive pronoun untuk "she" adalah...', options: ['herself', 'her', 'hers', 'she'], correctAnswer: 'herself', explanation: 'She → herself'),
            QuizQuestion(id: 'pron_q8', type: QuestionType.multipleChoice, question: '"Those" adalah plural dari...', options: ['that', 'this', 'these', 'it'], correctAnswer: 'that', explanation: 'Those = plural dari that'),
            QuizQuestion(id: 'pron_q9', type: QuestionType.multipleChoice, question: 'Possessive adjective untuk "we" adalah...', options: ['our', 'ours', 'we', 'us'], correctAnswer: 'our', explanation: 'We → our'),
            QuizQuestion(id: 'pron_q10', type: QuestionType.multipleChoice, question: '"The boy ___ parents are rich."', options: ['whose', 'who', 'which', 'that'], correctAnswer: 'whose', explanation: 'Whose menunjukkan kepemilikan (parents)'),
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
          content: '''**Adjective adalah kata sifat yang menjelaskan noun.**

**Fungsi:**
1. Menjelaskan kualitas → big house, beautiful girl
2. Menjelaskan ukuran → tall building, small cat
3. Menjelaskan warna → red car, blue sky
4. Menjelaskan asal → Indonesian food, Japanese car
5. Menjelaskan bahan → wooden table, cotton shirt''',
          examples: [
            GrammarExample(english: 'I have a new car.', indonesian: 'Saya punya mobil baru.'),
            GrammarExample(english: 'She is a beautiful girl.', indonesian: 'Dia adalah gadis cantik.'),
          ],
          tips: ['Adjective biasanya sebelum noun', 'Adjective tidak berubah bentuk untuk plural'],
          xpReward: 10,
        ),
        Lesson(
          id: 'adj_2',
          title: 'Degree of Comparison',
          content: '''**Tiga Tingkat Perbandingan:**

**1. Positive Degree (Induk)**
→ She is tall.

**2. Comparative Degree (Anak)**
→ She is taller than her sister.
   → RULES:
   - Umum: +er / more
   - Short adj: +er (tall → taller)
   - Long adj (2+ syll): more + adj (beautiful → more beautiful)

**3. Superlative Degree (Cucu)**
→ She is the tallest in the class.
   → Rules:
   - Short adj: +est / most
   - Short adj: the + adj + est (tall → the tallest)
   - Long adj: the most + adj (beautiful → the most beautiful)''',
          examples: [
            GrammarExample(english: 'This book is more interesting than that one.', indonesian: 'Buku ini lebih menarik dari pada itu.'),
            GrammarExample(english: 'Mount Everest is the highest mountain.', indonesian: 'Gunung Everest adalah gunung tertinggi.'),
          ],
          tips: ['Er/est untuk kata pendek', 'More/most untuk kata panjang'],
          xpReward: 10,
        ),
        Lesson(
          id: 'adj_3',
          title: 'Irregular Adjectives',
          content: '''**Kata Sifat Tidak Beraturan:**

**Good → Better → Best**
→ This is good. This is better. This is the best.

**Bad → Worse → Worst**
→ The food is bad. The food is worse. The food is the worst.

**Little → Less → Least**
→ He has little money. He has less money. He has the least money.

**Much/Many → More → Most**
→ I have many friends. I have more friends. I have the most friends.

**Far → Farther/Further → Farthest/Furthest**
→ The store is far. The store is farther. The store is the farthest.''',
          examples: [
            GrammarExample(english: 'This is the best movie ever.', indonesian: 'Ini adalah film terbaik sepanjang masa.'),
            GrammarExample(english: 'His health is getting worse.', indonesian: 'Kesehatannya semakin buruk.'),
          ],
          tips: ['Hafalkan 5 irregular comparisons ini!'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'adj_quiz',
          topicId: 'adjectives',
          title: 'Latihan Adjective',
          xpReward: 20,
          questions: [
            QuizQuestion(id: 'adj_q1', type: QuestionType.multipleChoice, question: '"bagus" dalam bahasa Inggris?', options: ['good', 'bad', 'big', 'new'], correctAnswer: 'good', explanation: 'Good = bagus'),
            QuizQuestion(id: 'adj_q2', type: QuestionType.multipleChoice, question: 'Comparative dari "tall" adalah...', options: ['taller', 'tallest', 'more tall', 'tallier'], correctAnswer: 'taller', explanation: 'Tall + er = taller'),
            QuizQuestion(id: 'adj_q3', type: QuestionType.multipleChoice, question: 'Superlative dari "beautiful" adalah...', options: ['most beautiful', 'beautifulest', 'more beautiful', 'beautifullest'], correctAnswer: 'most beautiful', explanation: 'Long adjective: most + beautiful'),
            QuizQuestion(id: 'adj_q4', type: QuestionType.multipleChoice, question: '"This is the ___ movie I have ever seen."', options: ['best', 'better', 'good', 'bestest'], correctAnswer: 'best', explanation: 'Superlative dari good = best'),
            QuizQuestion(id: 'adj_q5', type: QuestionType.multipleChoice, question: 'Comparative dari "good" adalah...', options: ['better', 'gooder', 'more good', 'best'], correctAnswer: 'better', explanation: 'Good → better (irregular)'),
            QuizQuestion(id: 'adj_q6', type: QuestionType.multipleChoice, question: 'Comparative dari "big" adalah...', options: ['bigger', 'biggest', 'more big', 'biggest'], correctAnswer: 'bigger', explanation: 'Big + ger = bigger'),
            QuizQuestion(id: 'adj_q7', type: QuestionType.multipleChoice, question: '"She is ___ than her sister."', options: ['taller', 'tallest', 'tall', 'more tall'], correctAnswer: 'taller', explanation: 'Comparative butuh "than"'),
            QuizQuestion(id: 'adj_q8', type: QuestionType.multipleChoice, question: 'Superlative dari "bad" adalah...', options: ['worst', 'baddest', 'more bad', 'badest'], correctAnswer: 'worst', explanation: 'Bad → worse → worst (irregular)'),
            QuizQuestion(id: 'adj_q9', type: QuestionType.multipleChoice, question: 'Di mana posisi adjective yang benar?', options: ['before noun', 'after noun', 'before verb', 'after verb'], correctAnswer: 'before noun', explanation: 'Adjective biasanya di depan noun'),
            QuizQuestion(id: 'adj_q10', type: QuestionType.multipleChoice, question: '"expensive" termasuk kata...', options: ['long adjective', 'short adjective', 'adverb', 'verb'], correctAnswer: 'long adjective', explanation: 'expensive (3 syllabus) butuh "more/most"'),
          ],
        ),
      ],
    ),
    // ========== NEW: ADVERBS ==========
    GrammarTopic(
      id: 'adverbs',
      title: 'Adverb (Kata Keterangan)',
      description: 'Kata yang menjelaskan verb, adjective, atau adverb lain',
      lessons: [
        Lesson(
          id: 'adv_1',
          title: 'Apa itu Adverb?',
          content: '''**Adverb adalah kata yang memberikan informasi tambahan tentang verb, adjective, atau adverb lain.**

**Jenis-Jenis Adverb:**

**1. Adverb of Manner** (cara)
→ She sings beautifully. (bagaimana?)

**2. Adverb of Time** (waktu)
→ I will call you tomorrow. (kapan?)

**3. Adverb of Place** (tempat)
→ The kids are playing outside. (di mana?)

**4. Adverb of Frequency** (frekuensi)
→ I always drink coffee. (seberapa sering?)

**5. Adverb of Degree** (derajat)
→ She is very beautiful. (seberapa?)''',
          examples: [
            GrammarExample(english: 'He runs quickly.', indonesian: 'Dia berlari dengan cepat.'),
            GrammarExample(english: 'I usually wake up at 6 AM.', indonesian: 'Saya biasanya bangun jam 6 pagi.'),
          ],
          tips: ['Banyak adverb berakhiran -ly', 'Adverb usually modifies verbs'],
          xpReward: 10,
        ),
        Lesson(
          id: 'adv_2',
          title: 'Adverb vs Adjective',
          content: '''**Perbedaan Adverb dan Adjective:**

**Adjective** → menjelaskan noun
→ She is a **careful** driver.
→ The movie was **boring**.

**Adverb** → menjelaskan verb/adjective/other adverb
→ She drives **carefully**. (how does she drive?)
→ The movie was **boringly** slow.

**Rumus转换:**
- Short adj: adj + ly → quick → quickly
- End with -y: y → i + ly → easy → easily
- End with -le: e → ly → simple → simply''',
          examples: [
            GrammarExample(english: 'He is a quick learner. (adj)', indonesian: 'Dia pelajar yang cepat.'),
            GrammarExample(english: 'He learns quickly. (adv)', indonesian: 'Dia belajar dengan cepat.'),
          ],
          tips: ['He is quick = adjective (diagonal is)', 'He runs quickly = adverb (melihat runs)'],
          xpReward: 10,
        ),
        Lesson(
          id: 'adv_3',
          title: 'Degree Adverbs',
          content: '''**Degree Adverbs (Kata Keterangan Drajat):**

**Very** → sangat (positif)
→ She is very beautiful.

**Too** → terlalu (negative connotation)
→ The coffee is too hot.

**Enough** → cukup
→ She is tall enough to play basketball.

**So** → sangat (menunjukkan akibat)
→ He was so tired that he fell asleep.

**Extremely / Absolutely / Terribly** → sangat (intensitas tinggi)
→ The food is extremely delicious.''',
          examples: [
            GrammarExample(english: 'This is too expensive for me.', indonesian: 'Ini terlalu mahal untuk saya.'),
            GrammarExample(english: 'She is not old enough to vote.', indonesian: 'Dia belum cukup umur untuk memilih.'),
          ],
          tips: ['Too = terlalu (negatif)', 'Very = sangat (positif)', 'Enough = cukup (di akhir)'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'adv_quiz',
          topicId: 'adverbs',
          title: 'Latihan Adverb',
          xpReward: 20,
          questions: [
            QuizQuestion(id: 'adv_q1', type: QuestionType.multipleChoice, question: '"She sings ___" - bagaimana dia bernyanyi?', options: ['beautifully', 'beautiful', 'beauty', 'beautifuly'], correctAnswer: 'beautifully', explanation: 'Sing adalah verb, butuh adverb (beautifully)'),
            QuizQuestion(id: 'adv_q2', type: QuestionType.multipleChoice, question: 'Adverb dari "quick" adalah...', options: ['quickly', 'quick', 'quickness', 'quickly'], correctAnswer: 'quickly', explanation: 'Quick + ly = quickly'),
            QuizQuestion(id: 'adv_q3', type: QuestionType.multipleChoice, question: '"___" termasuk adverb of... untuk "I always drink coffee"=', options: ['frequency', 'time', 'place', 'manner'], correctAnswer: 'frequency', explanation: 'Always = seberapa sering (frequency)'),
            QuizQuestion(id: 'adv_q4', type: QuestionType.multipleChoice, question: '"The coffee is ___ hot."', options: ['too', 'very', 'enough', 'so'], correctAnswer: 'too', explanation: 'Too hot = terlalu panas (negatif)'),
            QuizQuestion(id: 'adv_q5', type: QuestionType.multipleChoice, question: 'Adverb dari "easy" adalah...', options: ['easily', 'easyly', 'easyer', 'easy'], correctAnswer: 'easily', explanation: 'Easy → easy + ily = easily'),
            QuizQuestion(id: 'adv_q6', type: QuestionType.multipleChoice, question: '"Tomorrow" adalah adverb of...', options: ['time', 'place', 'manner', 'frequency'], correctAnswer: 'time', explanation: 'Tomorrow = kapan (time)'),
            QuizQuestion(id: 'adv_q7', type: QuestionType.multipleChoice, question: '"Outside" adalah adverb of...', options: ['place', 'time', 'manner', 'frequency'], correctAnswer: 'place', explanation: 'Outside = di mana (place)'),
            QuizQuestion(id: 'adv_q8', type: QuestionType.multipleChoice, question: '"He is tall ___" (cukup tinggi untuk main basket)', options: ['enough', 'too', 'very', 'so'], correctAnswer: 'enough', explanation: 'Enough selalu di akhir kalimat'),
            QuizQuestion(id: 'adv_q9', type: QuestionType.multipleChoice, question: '"She is a beautiful singer." beautiful adalah...', options: ['adjective', 'adverb', 'noun', 'verb'], correctAnswer: 'adjective', explanation: 'Beautiful di depan noun = adjective'),
            QuizQuestion(id: 'adv_q10', type: QuestionType.multipleChoice, question: '"He runs ___" - bagaimana dia berlari?', options: ['fast', 'fastly', 'fastest', 'fastly'], correctAnswer: 'fast', explanation: 'Fast adalah adverb unik (tidak berubah bentuk)'),
          ],
        ),
      ],
    ),
    // ========== NEW: PREPOSITIONS ==========
    GrammarTopic(
      id: 'prepositions',
      title: 'Preposition (Kata Depan)',
      description: 'Kata yang menunjukkan hubungan antara noun dengan kata lain',
      lessons: [
        Lesson(
          id: 'prep_1',
          title: 'Preposition of Place',
          content: '''**Preposition of Place (Tempat):**

**In** → di dalam (ruang/tempat tertutup)
→ in the room, in Indonesia, in the box

**On** → di atas (permukaan)
→ on the table, on the wall, on the floor

**At** → di titik spesifik
→ at school, at home, at the door

**Other Place Prepositions:**
- under (di bawah) → under the table
- over (di atas) → over the bridge
- in front of (di depan) → in front of the school
- behind (di belakang) → behind the door
- between (di antara) → between two trees
- next to (di samping) → next to the hospital
- inside (di dalam) → inside the car
- outside (di luar) → outside the house''',
          examples: [
            GrammarExample(english: 'The book is on the table.', indonesian: 'Buku itu di atas meja.'),
            GrammarExample(english: 'She lives in Jakarta.', indonesian: 'Dia tinggal di Jakarta.'),
          ],
          tips: ['In = di dalam (container)', 'On = di atas (surface)', 'At = di titik spesifik'],
          xpReward: 10,
        ),
        Lesson(
          id: 'prep_2',
          title: 'Preposition of Time',
          content: '''**Preposition of Time (Waktu):**

**At** → titik waktu spesifik
→ at 7 o'clock, at noon, at midnight, at night, at the weekend

**On** → hari/tanggal
→ on Monday, on July 15th, on Saturday morning, on my birthday

**In** → periode waktu lebih besar
→ in the morning, in the afternoon, in the evening
→ in January, in 2024, in summer
→ in two hours, in the future

**For** → durasi
→ for two hours, for a week, for three days

**Since** → dari kapan (titik awal)
→ since 2020, since yesterday, since morning''',
          examples: [
            GrammarExample(english: 'I will see you at 3 PM.', indonesian: 'Saya akan bertemuimu jam 3 sore.'),
            GrammarExample(english: 'She was born in 2000.', indonesian: 'Dia lahir tahun 2000.'),
          ],
          tips: ['At + waktu spesifik', 'On + hari/tanggal', 'In + periode waktu'],
          xpReward: 10,
        ),
        Lesson(
          id: 'prep_3',
          title: 'Preposition of Movement',
          content: '''**Preposition of Movement (Gerakan):**

**To** → ke arah
→ go to school, walk to the park

**Into** → masuk ke dalam
→ come into the room, jump into the water

**Out of** → keluar dari
→ run out of the building

**Through** → melalui
→ drive through the tunnel

**Across** → melintasi (permukaan)
→ swim across the river

**Along** → sepanjang
→ walk along the beach

**Around** → mengelilingi
→ travel around the world

**Towards** → menuju
→ walk towards the school''',
          examples: [
            GrammarExample(english: 'I am going to the airport.', indonesian: 'Saya akan ke bandara.'),
            GrammarExample(english: 'The bird flew across the sky.', indonesian: 'Burung terbang melintasi langit.'),
          ],
          tips: ['Movement = ke mana arahnya', 'Gunakan to untuk tujuan umum'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'prep_quiz',
          topicId: 'prepositions',
          title: 'Latihan Preposition',
          xpReward: 20,
          questions: [
            QuizQuestion(id: 'prep_q1', type: QuestionType.multipleChoice, question: '"She lives ___ Jakarta."', options: ['in', 'on', 'at', 'to'], correctAnswer: 'in', explanation: 'In untuk kota/negara = di'),
            QuizQuestion(id: 'prep_q2', type: QuestionType.multipleChoice, question: '"The book is ___ the table."', options: ['on', 'in', 'at', 'under'], correctAnswer: 'on', explanation: 'On = di atas permukaan'),
            QuizQuestion(id: 'prep_q3', type: QuestionType.multipleChoice, question: '"I will meet you ___ 3 PM."', options: ['at', 'in', 'on', 'by'], correctAnswer: 'at', explanation: 'At + waktu spesifik'),
            QuizQuestion(id: 'prep_q4', type: QuestionType.multipleChoice, question: '"She was born ___ 1995."', options: ['in', 'on', 'at', 'since'], correctAnswer: 'in', explanation: 'In + tahun = di tahun'),
            QuizQuestion(id: 'prep_q5', type: QuestionType.multipleChoice, question: '"The cat is ___ the table."', options: ['under', 'in', 'on', 'at'], correctAnswer: 'under', explanation: 'Under = di bawah'),
            QuizQuestion(id: 'prep_q6', type: QuestionType.multipleChoice, question: '"I have been here ___ 2020."', options: ['since', 'for', 'in', 'at'], correctAnswer: 'since', explanation: 'Since = dari kapan (titik awal)'),
            QuizQuestion(id: 'prep_q7', type: QuestionType.multipleChoice, question: '"Go ___ bed!"', options: ['to', 'in', 'at', 'on'], correctAnswer: 'to', explanation: 'Go to bed = tidur'),
            QuizQuestion(id: 'prep_q8', type: QuestionType.multipleChoice, question: '"___ Saturday, I will rest."', options: ['On', 'In', 'At', 'By'], correctAnswer: 'On', explanation: 'On + hari = hari Sabtu'),
            QuizQuestion(id: 'prep_q9', type: QuestionType.multipleChoice, question: '"The school is ___ the park."', options: ['next to', 'under', 'in', 'at'], correctAnswer: 'next to', explanation: 'Next to = di samping'),
            QuizQuestion(id: 'prep_q10', type: QuestionType.multipleChoice, question: '"I waited ___ 2 hours."', options: ['for', 'since', 'in', 'at'], correctAnswer: 'for', explanation: 'For = durasi (selama)'),
          ],
        ),
      ],
    ),
    // ========== NEW: CONJUNCTIONS ==========
    GrammarTopic(
      id: 'conjunctions',
      title: 'Conjunction (Kata Hubung)',
      description: 'Kata yang menghubungkan kata, frasa, atau klausa',
      lessons: [
        Lesson(
          id: 'conj_1',
          title: 'Coordinating Conjunctions',
          content: '''**Coordinating Conjunctions (Hubungan Setara)**

FANBOYS - 7 kata hubung:
- **F**or (karena - alasan)
- **A**nd (dan)
- **N**or (juga tidak)
- **B**ut (tetapi)
- **O**r (atau)
- **Y**et (namun)
- **S**o (jadi/maka)

**Penggunaan:**
→ I wanted to go out **and** she wanted to stay.
→ You can study **or** you can watch TV.
→ He is smart **but** lazy.
→ It was raining **so** we stayed home.''',
          examples: [
            GrammarExample(english: 'I like coffee and tea.', indonesian: 'Saya suka kopi dan teh.'),
            GrammarExample(english: 'Study hard or you will fail.', indonesian: 'Belajar keras atau kamu akan gagal.'),
          ],
          tips: ['FANBOYS = For, And, Nor, But, Or, Yet, So', 'Menghubungkan dua kalimat setara'],
          xpReward: 10,
        ),
        Lesson(
          id: 'conj_2',
          title: 'Subordinating Conjunctions',
          content: '''**Subordinating Conjunctions (Hubungan Tidak Setara)**

**Waktu:**
- when (ketika), while (selama), before (sebelum)
- after (sesudah), since (sejak), until (sampai)
- as soon as (segera setelah)

**Alasan:**
- because (karena), since (karena), as (sejak)
- because of (karena), due to (disebabkan)

**Syarat:**
- if (jika), unless (jika tidak), provided that (asalkan)

**Kontevesi:**
- although (meskipun), though (meskipun)
- even though (meskipun), while (sementara)
- whereas (sedangkan), whether (apakah)''',
          examples: [
            GrammarExample(english: 'I will call you when I arrive.', indonesian: 'Saya akan menelepon ketika saya tiba.'),
            GrammarExample(english: 'Because it rained, I stayed home.', indonesian: 'Karena hujan, saya tinggal di rumah.'),
          ],
          tips: ['Subordinating conjunction memulai klausa tidak setara', 'Biasanya diikuti coma jika di awal kalimat'],
          xpReward: 10,
        ),
        Lesson(
          id: 'conj_3',
          title: 'Correlative Conjunctions',
          content: '''**Correlative Conjunctions (Kata Hubung Pasangan)**

**both...and** (keduanya...dan)
→ Both John and Mary are coming.

**either...or** (either...atau)
→ You can either call or text me.

**neither...nor** (tidak keduanya...maupun)
→ Neither John nor Mary was there.

**not only...but also** (tidak hanya...tetapi juga)
→ Not only is it cheap, but also it is good.

**whether...or** (apakah...atau)
→ Whether you win or lose, I am proud of you.

**the more...the more** (semakin...semakin)
→ The more you study, the more you learn.''',
          examples: [
            GrammarExample(english: 'Both coffee and tea are good for you.', indonesian: 'Baik kopi maupun teh baik untukmu.'),
            GrammarExample(english: 'Either you come now or you stay forever.', indonesian: 'Entah kamu datang sekarang atau tinggal selamanya.'),
          ],
          tips: ['Correlative = pasangan kata hubung', 'Gunakan pola yang benar'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'conj_quiz',
          topicId: 'conjunctions',
          title: 'Latihan Conjunction',
          xpReward: 20,
          questions: [
            QuizQuestion(id: 'conj_q1', type: QuestionType.multipleChoice, question: '"She is rich ___ kind."', options: ['and', 'but', 'or', 'so'], correctAnswer: 'and', explanation: 'And = dan (menambahkan)'),
            QuizQuestion(id: 'conj_q2', type: QuestionType.multipleChoice, question: '"I stayed home ___ it was raining."', options: ['because', 'and', 'or', 'but'], correctAnswer: 'because', explanation: 'Because = karena (penyebab)'),
            QuizQuestion(id: 'conj_q3', type: QuestionType.multipleChoice, question: '"Study hard ___ you will fail."', options: ['or', 'and', 'but', 'so'], correctAnswer: 'or', explanation: 'Or = atau (pilihan)'),
            QuizQuestion(id: 'conj_q4', type: QuestionType.multipleChoice, question: '"___ John ___ Mary are coming."', options: ['Both/and', 'Either/or', 'Neither/nor', 'Whether/or'], correctAnswer: 'Both/and', explanation: 'Both...and = keduanya'),
            QuizQuestion(id: 'conj_q5', type: QuestionType.multipleChoice, question: '"I will wait ___ you come back."', options: ['until', 'and', 'but', 'or'], correctAnswer: 'until', explanation: 'Until = sampai'),
            QuizQuestion(id: 'conj_q6', type: QuestionType.multipleChoice, question: '"He is smart, ___ he is lazy."', options: ['but', 'and', 'or', 'so'], correctAnswer: 'but', explanation: 'But = tetapi (kontras)'),
            QuizQuestion(id: 'conj_q7', type: QuestionType.multipleChoice, question: '"___ you study, you will learn."', options: ['The more', 'Because', 'If', 'When'], correctAnswer: 'The more', explanation: 'The more...the more = semakin...semakin'),
            QuizQuestion(id: 'conj_q8', type: QuestionType.multipleChoice, question: '"___ it was raining, we went out."', options: ['Although', 'And', 'Or', 'So'], correctAnswer: 'Although', explanation: 'Although = meskipun (tidak dilanjutkan hasil)'),
            QuizQuestion(id: 'conj_q9', type: QuestionType.multipleChoice, question: '"You can have tea ___ coffee."', options: ['or', 'and', 'but', 'so'], correctAnswer: 'or', explanation: 'Or = atau (pilihan)'),
            QuizQuestion(id: 'conj_q10', type: QuestionType.multipleChoice, question: '"___ he is old, he runs fast."', options: ['Although', 'And', 'Or', 'So'], correctAnswer: 'Although', explanation: 'Although = meskipun'),
          ],
        ),
      ],
    ),
    // ========== NEW: INTERJECTIONS ==========
    GrammarTopic(
      id: 'interjections',
      title: 'Interjection (Kata Seru)',
      description: 'Kata yang mengekspresikan emosi',
      lessons: [
        Lesson(
          id: 'interj_1',
          title: 'Apa itu Interjection?',
          content: '''**Interjection adalah kata atau frasa yang mengekspresikan emosi spontan.**

**Jenis Emosi dan Contoh:**

**K الإيجاب (Positive):**
- Great! = Hebat!
- Wonderful! =luar biasa!
- Awesome! = keren!
- Fantastic! = fantastis!
- Yay! = hore!

**النفي (Negative):**
- Oh no! = Astaga!
- Oops! = Ups!
- Alas! = aduh!
- Darn! = sialan!
- Yikes! = aduh!

**المفاجأة (Surprise):**
- Wow! = wah!
- Oh! = oh!
- Eh? = eh?
- What! = apa!
- No way! = tidak mungkin!''',
          examples: [
            GrammarExample(english: 'Wow! That is amazing!', indonesian: 'Wah! Itu luar biasa!'),
            GrammarExample(english: 'Oops! I made a mistake.', indonesian: 'Ups! Saya membuat kesalahan.'),
          ],
          tips: ['Interjection biasanya di awal kalimat', 'Gunakan tanda seru (!) atau tanya (?)'],
          xpReward: 10,
        ),
        Lesson(
          id: 'interj_2',
          title: 'Interjections dalam Percakapan',
          content: '''**Penggunaan Interjection dalam Situasi:**

**Menyapa:**
- Hi! / Hey! = Hai!
- Hello! = Halo!
- Yo! = Yo!

**Menyetujui:**
- Yes! / Yeah! = Ya!
- Sure! = Tentu!
- Absolutely! = Tentu saja!

**Menolak:**
- No! = Tidak!
- Nope! = Tidak!
- Nah! = NDak!

**Meminta perhatian:**
- Psst! = Psst!
- Hey! = Hei!
- Look! = Lihat!

**Menunjukkan pemahaman:**
- Oh! = Oh! (oh iya!)
- I see! = Aku mengerti!
- Gotcha! = Paham!''',
          examples: [
            GrammarExample(english: 'Hey! Nice to meet you!', indonesian: 'Hai! Senang bertemu denganmu!'),
            GrammarExample(english: 'Gotcha! I understand now.', indonesian: 'Paham! Aku mengerti sekarang.'),
          ],
          tips: ['Interjection membuat percakapan lebih natural', 'Jangan terlalu banyak menggunakan interjection di tulisan formal'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'interj_quiz',
          topicId: 'interjections',
          title: 'Latihan Interjection',
          xpReward: 15,
          questions: [
            QuizQuestion(id: 'interj_q1', type: QuestionType.multipleChoice, question: '"___! That is great news!"', options: ['Wow', 'No', 'But', 'Because'], correctAnswer: 'Wow', explanation: 'Wow! = ekspresi kagum/kesenangan'),
            QuizQuestion(id: 'interj_q2', type: QuestionType.multipleChoice, question: '"___! I dropped my phone!"', options: ['Oops', 'Great', 'Yay', 'Hello'], correctAnswer: 'Oops', explanation: 'Oops! = ekspresi kesalahan'),
            QuizQuestion(id: 'interj_q3', type: QuestionType.multipleChoice, question: '"___! We won the game!"', options: ['Yay', 'Alas', 'Oops', 'Nah'], correctAnswer: 'Yay', explanation: 'Yay! = ekspresi kebahagiaan'),
            QuizQuestion(id: 'interj_q4', type: QuestionType.multipleChoice, question: 'Interjection biasanya diikuti tanda...', options: ['! atau ?', '. atau ,', ': atau ;', 'tidak ada'], correctAnswer: '! atau ?', explanation: 'Interjection menggunakan ! atau ?'),
            QuizQuestion(id: 'interj_q5', type: QuestionType.multipleChoice, question: '"___! That is terrible!"', options: ['Alas', 'Hey', 'Yo', 'Hi'], correctAnswer: 'Alas', explanation: 'Alas! = ekspresi kesedihan/kecewa'),
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
