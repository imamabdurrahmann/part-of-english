class GrammarErrorItem {
  final String id;
  final String incorrect;
  final String correct;
  final String explanation;
  final String category;

  const GrammarErrorItem({
    required this.id,
    required this.incorrect,
    required this.correct,
    required this.explanation,
    required this.category,
  });
}

class GrammarErrorData {
  static const List<GrammarErrorItem> items = [
    // Subject-Verb Agreement
    GrammarErrorItem(
      id: 'ge_001',
      incorrect: 'She don\'t like coffee.',
      correct: 'She doesn\'t like coffee.',
      explanation: 'Subjek singular "she" memerlukan "doesn\'t" (not don\'t). Jangan gunakan don\'t dengan she/he/it.',
      category: 'Subject-Verb Agreement',
    ),
    GrammarErrorItem(
      id: 'ge_002',
      incorrect: 'Each of the students have a notebook.',
      correct: 'Each of the students has a notebook.',
      explanation: '"Each" selalu memerlukan singular verb. Meskipun "students" plural, "each" mengambil singular.',
      category: 'Subject-Verb Agreement',
    ),
    GrammarErrorItem(
      id: 'ge_003',
      incorrect: 'Neither my friends nor I am going.',
      correct: 'Neither my friends nor I am going.',
      explanation: 'Dengan "neither...nor", verb согласnya с последним элементом. "I" adalah последний, jadi "am" benar.',
      category: 'Subject-Verb Agreement',
    ),
    GrammarErrorItem(
      id: 'ge_004',
      incorrect: 'The team are playing well.',
      correct: 'The team is playing well.',
      explanation: '"Team" adalah noun singular collective. Dalam American English, gunakan singular verb.',
      category: 'Subject-Verb Agreement',
    ),
    GrammarErrorItem(
      id: 'ge_005',
      incorrect: 'There is many reasons to study.',
      correct: 'There are many reasons to study.',
      explanation: '"Reasons" adalah plural, jadi gunakan "are" bukan "is".',
      category: 'Subject-Verb Agreement',
    ),

    // Tense Errors
    GrammarErrorItem(
      id: 'ge_006',
      incorrect: 'I have seen him yesterday.',
      correct: 'I saw him yesterday.',
      explanation: '"Yesterday" memerlukan past simple, bukan present perfect.',
      category: 'Tense Errors',
    ),
    GrammarErrorItem(
      id: 'ge_007',
      incorrect: 'She is working here since 2020.',
      correct: 'She has been working here since 2020.',
      explanation: 'Gunakan present perfect continuous (has been working) dengan "since" untuk aksi yang masih berlanjut.',
      category: 'Tense Errors',
    ),
    GrammarErrorItem(
      id: 'ge_008',
      incorrect: 'If I had money, I will buy it.',
      correct: 'If I had money, I would buy it.',
      explanation: 'Conditional type 2 memerlukan past simple di if-clause dan would di main clause.',
      category: 'Tense Errors',
    ),
    GrammarErrorItem(
      id: 'ge_009',
      incorrect: 'I wish I am taller.',
      correct: 'I wish I were taller.',
      explanation: 'Setelah "wish", gunakan past simple untuk keinginan yang tidak realistis. "Were" digunakan untuk semua subjek.',
      category: 'Tense Errors',
    ),
    GrammarErrorItem(
      id: 'ge_010',
      incorrect: 'He has went to school.',
      correct: 'He has gone to school.',
      explanation: '"Has gone" adalah past participle yang benar. "Went" adalah past simple, bukan participle.',
      category: 'Tense Errors',
    ),

    // Articles
    GrammarErrorItem(
      id: 'ge_011',
      incorrect: 'She is a honest girl.',
      correct: 'She is an honest girl.',
      explanation: '"An" digunakan sebelum kata yang dimulai dengan bunyi vokal. "Honest" berbunyi /onest/.',
      category: 'Articles',
    ),
    GrammarErrorItem(
      id: 'ge_012',
      incorrect: 'I need an umbrella because it is raining.',
      correct: 'I need an umbrella because it is raining.',
      explanation: 'Benar. Namun perlu diingat: gunakan "an" untuk bunyi vokal, bukan huruf. "Umbrella" /umbrella/.',
      category: 'Articles',
    ),
    GrammarErrorItem(
      id: 'ge_013',
      incorrect: 'He is the most intelligent student in the class.',
      correct: 'He is the most intelligent student in the class.',
      explanation: 'Benar. Gunakan "the most" untuk superlative degree dengan kata yang lebih dari dua suku.',
      category: 'Articles',
    ),
    GrammarErrorItem(
      id: 'ge_014',
      incorrect: 'I went to hospital yesterday.',
      correct: 'I went to the hospital yesterday.',
      explanation: 'Dalam American English, gunakan article "the" dengan hospital, school, church, prison, dll ketika tujuannya bukan untuk berobat/menetap.',
      category: 'Articles',
    ),
    GrammarErrorItem(
      id: 'ge_015',
      incorrect: 'She is studying for exam.',
      correct: 'She is studying for an exam.',
      explanation: 'Gunakan article "an" sebelum kata yang dimulai dengan bunyi vokal (/e/ dari exam).',
      category: 'Articles',
    ),

    // Preposition
    GrammarErrorItem(
      id: 'ge_016',
      incorrect: 'She arrived in Monday.',
      correct: 'She arrived on Monday.',
      explanation: '"On" digunakan untuk hari dalam seminggu. "On Monday", "on Tuesday", dll.',
      category: 'Preposition',
    ),
    GrammarErrorItem(
      id: 'ge_017',
      incorrect: 'I am good in mathematics.',
      correct: 'I am good at mathematics.',
      explanation: '"Good at" adalah collocation yang benar untuk kemampuan dalam suatu bidang.',
      category: 'Preposition',
    ),
    GrammarErrorItem(
      id: 'ge_018',
      incorrect: 'She got married with a doctor.',
      correct: 'She got married to a doctor.',
      explanation: '"Get married to" adalah collocation yang benar, bukan "with".',
      category: 'Preposition',
    ),
    GrammarErrorItem(
      id: 'ge_019',
      incorrect: 'I will call you in the evening.',
      correct: 'I will call you in the evening.',
      explanation: '"In" digunakan untuk bagian hari (morning, afternoon, evening, night). Tapi untuk waktu spesifik, gunakan "at" (at 5 o\'clock) atau "on" (on Monday).',
      category: 'Preposition',
    ),
    GrammarErrorItem(
      id: 'ge_020',
      incorrect: 'He died from cancer.',
      correct: 'He died of cancer.',
      explanation: '"Die of" digunakan untuk penyakit. "Die from" untuk causes yang lebih umum.',
      category: 'Preposition',
    ),

    // Word Choice
    GrammarErrorItem(
      id: 'ge_021',
      incorrect: 'I am interesting in learning languages.',
      correct: 'I am interested in learning languages.',
      explanation: '"Interested" adalah adjective yang diperlukan untuk menggambarkan perasaan. "Interesting" digunakan untuk menggambarkan benda/orang.',
      category: 'Word Choice',
    ),
    GrammarErrorItem(
      id: 'ge_022',
      incorrect: 'The movie was very frightened.',
      correct: 'The movie was very frightening.',
      explanation: '"Frightening" digunakan untuk sesuatu yang menyebabkan ketakutan. "Frightened" untuk perasaan takut.',
      category: 'Word Choice',
    ),
    GrammarErrorItem(
      id: 'ge_023',
      incorrect: 'She is very clever than her brother.',
      correct: 'She is much cleverer than her brother.',
      explanation: 'Gunakan comparative form dengan "than". Untuk membandingkan, gunakan -er atau "more" + adjective.',
      category: 'Word Choice',
    ),
    GrammarErrorItem(
      id: 'ge_024',
      incorrect: 'I have fewer luggage than you.',
      correct: 'I have less luggage than you.',
      explanation: '"Luggage" adalah uncountable noun, jadi gunakan "less" bukan "fewer".',
      category: 'Word Choice',
    ),
    GrammarErrorItem(
      id: 'ge_025',
      incorrect: 'He is enough old to drive.',
      correct: 'He is old enough to drive.',
      explanation: '"Enough" datang SETELAH adjective. Ketrangan: adjective + enough + to-infinitive.',
      category: 'Word Choice',
    ),

    // Countable/Uncountable
    GrammarErrorItem(
      id: 'ge_026',
      incorrect: 'I need some informations.',
      correct: 'I need some information.',
      explanation: '"Information" adalah uncountable noun. Gunakan "some information" tanpa -s.',
      category: 'Countable/Uncountable',
    ),
    GrammarErrorItem(
      id: 'ge_027',
      incorrect: 'She gave me a good advice.',
      correct: 'She gave me good advice.',
      explanation: '"Advice" adalah uncountable noun. Gunakan "some advice" atau "a piece of advice".',
      category: 'Countable/Uncountable',
    ),
    GrammarErrorItem(
      id: 'ge_028',
      incorrect: 'I have many furnitures.',
      correct: 'I have a lot of furniture.',
      explanation: '"Furniture" adalah uncountable noun. Gunakan "some furniture" atau "a piece of furniture".',
      category: 'Countable/Uncountable',
    ),
    GrammarErrorItem(
      id: 'ge_029',
      incorrect: 'How many money do you have?',
      correct: 'How much money do you have?',
      explanation: '"Money" adalah uncountable noun, jadi gunakan "how much" bukan "how many".',
      category: 'Countable/Uncountable',
    ),
    GrammarErrorItem(
      id: 'ge_030',
      incorrect: 'There are many traffics in this city.',
      correct: 'There is a lot of traffic in this city.',
      explanation: '"Traffic" adalah uncountable noun. Gunakan "a lot of traffic" atau "heavy traffic".',
      category: 'Countable/Uncountable',
    ),

    // Word Order
    GrammarErrorItem(
      id: 'ge_031',
      incorrect: 'She always is happy.',
      correct: 'She is always happy.',
      explanation: 'Adverb of frequency (always, usually, often) datang SETELAH to be atau SEBELUM main verb.',
      category: 'Word Order',
    ),
    GrammarErrorItem(
      id: 'ge_032',
      incorrect: 'I have never seen such a thing.',
      correct: 'I have never seen such a thing.',
      explanation: 'Benar! "Never" sebagai adverb negatif ditempatkan setelah auxiliary.',
      category: 'Word Order',
    ),
    GrammarErrorItem(
      id: 'ge_033',
      incorrect: 'She quickly finished her homework.',
      correct: 'She finished her homework quickly.',
      explanation: 'Untuk verb tunggal, adverb bisa di akhir kalimat. "She finished her homework quickly."',
      category: 'Word Order',
    ),
    GrammarErrorItem(
      id: 'ge_034',
      incorrect: 'He is hardly working lately.',
      correct: 'He is hardly working lately.',
      explanation: '"Hardly" adalah adverb yang berarti "hampir tidak". Untuk kata "keras/rajin", gunakan "hard".',
      category: 'Word Order',
    ),
    GrammarErrorItem(
      id: 'ge_035',
      incorrect: 'I go to the school everyday.',
      correct: 'I go to school everyday.',
      explanation: 'Ketika school, hospital, dll digunakan tanpa article, mereka merujuk pada fungsi umum (belajar, berobat), bukan bangunan spesifik.',
      category: 'Word Order',
    ),

    // Pronoun
    GrammarErrorItem(
      id: 'ge_036',
      incorrect: 'Between you and I, this is wrong.',
      correct: 'Between you and me, this is wrong.',
      explanation: '"Between" memerlukan objek pronoun (me, him, her). "I" adalah subject pronoun.',
      category: 'Pronoun',
    ),
    GrammarErrorItem(
      id: 'ge_037',
      incorrect: 'Me and my friend went to the cinema.',
      correct: 'My friend and I went to the cinema.',
      explanation: 'Letakkan orang lain terlebih dahulu. Gunakan "I" bukan "me" sebagai subject.',
      category: 'Pronoun',
    ),
    GrammarErrorItem(
      id: 'ge_038',
      incorrect: 'Who do you think is calling?',
      correct: 'Who do you think is calling?',
      explanation: '"Who" adalah subject dalam clause "who is calling", jadi tidak memerlukan "does".',
      category: 'Pronoun',
    ),
    GrammarErrorItem(
      id: 'ge_039',
      incorrect: 'The book which I read it was interesting.',
      correct: 'The book which I read was interesting.',
      explanation: 'Jangan ulangi object dalam relative clause. "Which I read" sudah cukup, tidak perlu "it".',
      category: 'Pronoun',
    ),
    GrammarErrorItem(
      id: 'ge_040',
      incorrect: 'His is a new car.',
      correct: 'His car is new. / That is his car.',
      explanation: '"His" sebagai possessive pronoun tidak memerlukan noun setelahnya. Gunakan "His car" atau kalimat lain.',
      category: 'Pronoun',
    ),

    // Conjunction
    GrammarErrorItem(
      id: 'ge_041',
      incorrect: 'I didn\'t go because I was sick.',
      correct: 'I didn\'t go because I was sick. (The comma is optional here)',
      explanation: 'Benar. "Because" memerlukan negative clause. Jika maksudnya "saya tidak pergi karena sakit", kalimat ini benar.',
      category: 'Conjunction',
    ),
    GrammarErrorItem(
      id: 'ge_042',
      incorrect: 'Neither the teacher nor the students were present.',
      correct: 'Neither the teacher nor the students were present.',
      explanation: 'Dengan "neither...nor", verb согласnya с последним элементом. "Students" plural, jadi "were" benar.',
      category: 'Conjunction',
    ),
    GrammarErrorItem(
      id: 'ge_043',
      incorrect: 'I would like to go but I am busy.',
      correct: 'I would like to go but I am busy.',
      explanation: 'Benar! "But" digunakan sebagai coordinating conjunction untuk menunjukkan kontras.',
      category: 'Conjunction',
    ),
    GrammarErrorItem(
      id: 'ge_044',
      incorrect: 'Although it was raining, but we went out.',
      correct: 'Although it was raining, we went out.',
      explanation: 'Jangan gunakan "although" dan "but" bersama-sama. Pilih salah satu.',
      category: 'Conjunction',
    ),
    GrammarErrorItem(
      id: 'ge_045',
      incorrect: 'I will come if you will call me.',
      correct: 'I will come if you call me.',
      explanation: 'Dalam if-clause tipe 1, jangan gunakan "will". Gunakan present simple meskipun main clause menggunakan future.',
      category: 'Conjunction',
    ),
  ];
}
