// ==================== IDIOMS & PHRASAL VERBS DATA ====================

class IdiomData {
  static List<IdiomCategory> get categories => [
    // ===== PHRASAL VERBS - COMMON =====
    IdiomCategory(
      name: 'Phrasal Verbs - Common',
      icon: '🔥',
      color: 0xFFE91E63,
      items: _commonPhrasalVerbs,
    ),
    // ===== PHRASAL VERBS - GET =====
    IdiomCategory(
      name: 'Phrasal Verbs - GET',
      icon: '📥',
      color: 0xFF9C27B0,
      items: _getPhrasalVerbs,
    ),
    // ===== PHRASAL VERBS - TAKE =====
    IdiomCategory(
      name: 'Phrasal Verbs - TAKE',
      icon: '📤',
      color: 0xFF673AB7,
      items: _takePhrasalVerbs,
    ),
    // ===== PHRASAL VERBS - MAKE =====
    IdiomCategory(
      name: 'Phrasal Verbs - MAKE',
      icon: '🔨',
      color: 0xFF3F51B5,
      items: _makePhrasalVerbs,
    ),
    // ===== PHRASAL VERBS - BREAK =====
    IdiomCategory(
      name: 'Phrasal Verbs - BREAK',
      icon: '💥',
      color: 0xFF2196F3,
      items: _breakPhrasalVerbs,
    ),
    // ===== PHRASAL VERBS - TURN =====
    IdiomCategory(
      name: 'Phrasal Verbs - TURN',
      icon: '🔄',
      color: 0xFF00BCD4,
      items: _turnPhrasalVerbs,
    ),
    // ===== PHRASAL VERBS - CALL =====
    IdiomCategory(
      name: 'Phrasal Verbs - CALL',
      icon: '📞',
      color: 0xFF009688,
      items: _callPhrasalVerbs,
    ),
    // ===== PHRASAL VERBS - GIVE =====
    IdiomCategory(
      name: 'Phrasal Verbs - GIVE',
      icon: '🎁',
      color: 0xFF4CAF50,
      items: _givePhrasalVerbs,
    ),
    // ===== PHRASAL VERBS - LOOK =====
    IdiomCategory(
      name: 'Phrasal Verbs - LOOK',
      icon: '👀',
      color: 0xFF8BC34A,
      items: _lookPhrasalVerbs,
    ),
    // ===== PHRASAL VERBS - PUT =====
    IdiomCategory(
      name: 'Phrasal Verbs - PUT',
      icon: '📌',
      color: 0xFFCDDC39,
      items: _putPhrasalVerbs,
    ),
    // ===== PHRASAL VERBS - GO =====
    IdiomCategory(
      name: 'Phrasal Verbs - GO',
      icon: '🚶',
      color: 0xFFFFEB3B,
      items: _goPhrasalVerbs,
    ),
    // ===== PHRASAL VERBS - COME =====
    IdiomCategory(
      name: 'Phrasal Verbs - COME',
      icon: '🏃',
      color: 0xFFFFC107,
      items: _comePhrasalVerbs,
    ),
    // ===== PHRASAL VERBS - CARRY =====
    IdiomCategory(
      name: 'Phrasal Verbs - CARRY',
      icon: '👜',
      color: 0xFFFF9800,
      items: _carryPhrasalVerbs,
    ),
    // ===== PHRASAL VERBS - SET =====
    IdiomCategory(
      name: 'Phrasal Verbs - SET',
      icon: '⚙️',
      color: 0xFFFF5722,
      items: _setPhrasalVerbs,
    ),
    // ===== PHRASAL VERBS - HOLD =====
    IdiomCategory(
      name: 'Phrasal Verbs - HOLD',
      icon: '🤲',
      color: 0xFF795548,
      items: _holdPhrasalVerbs,
    ),
    // ===== PHRASAL VERBS - BRING =====
    IdiomCategory(
      name: 'Phrasal Verbs - BRING',
      icon: '📦',
      color: 0xFF9E9E9E,
      items: _bringPhrasalVerbs,
    ),
    // ===== PHRASAL VERBS - FALL =====
    IdiomCategory(
      name: 'Phrasal Verbs - FALL',
      icon: '🍂',
      color: 0xFF607D8B,
      items: _fallPhrasalVerbs,
    ),
    // ===== PHRASAL VERBS - CUT =====
    IdiomCategory(
      name: 'Phrasal Verbs - CUT',
      icon: '✂️',
      color: 0xFFF44336,
      items: _cutPhrasalVerbs,
    ),
    // ===== PHRASAL VERBS - RUN =====
    IdiomCategory(
      name: 'Phrasal Verbs - RUN',
      icon: '🏃',
      color: 0xFFE91E63,
      items: _runPhrasalVerbs,
    ),
    // ===== PHRASAL VERBS - PASS =====
    IdiomCategory(
      name: 'Phrasal Verbs - PASS',
      icon: '🏁',
      color: 0xFF9C27B0,
      items: _passPhrasalVerbs,
    ),
    // ===== PHRASAL VERBS - LAY =====
    IdiomCategory(
      name: 'Phrasal Verbs - LAY',
      icon: '🛏️',
      color: 0xFF3F51B5,
      items: _layPhrasalVerbs,
    ),
    // ===== PHRASAL VERBS - SHOW =====
    IdiomCategory(
      name: 'Phrasal Verbs - SHOW',
      icon: '📺',
      color: 0xFF2196F3,
      items: _showPhrasalVerbs,
    ),
    // ===== PHRASAL VERBS - STAND =====
    IdiomCategory(
      name: 'Phrasal Verbs - STAND',
      icon: '🧍',
      color: 0xFF00BCD4,
      items: _standPhrasalVerbs,
    ),
    // ===== PHRASAL VERBS - SPEAK =====
    IdiomCategory(
      name: 'Phrasal Verbs - SPEAK',
      icon: '💬',
      color: 0xFF009688,
      items: _speakPhrasalVerbs,
    ),
    // ===== PHRASAL VERBS - WORK =====
    IdiomCategory(
      name: 'Phrasal Verbs - WORK',
      icon: '💼',
      color: 0xFF4CAF50,
      items: _workPhrasalVerbs,
    ),
    // ===== IDIOMS - MONEY =====
    IdiomCategory(
      name: 'Idioms - Money & Finance',
      icon: '💰',
      color: 0xFF8BC34A,
      items: _moneyIdioms,
    ),
    // ===== IDIOMS - TIME =====
    IdiomCategory(
      name: 'Idioms - Time',
      icon: '⏰',
      color: 0xFFFFEB3B,
      items: _timeIdioms,
    ),
    // ===== IDIOMS - LIFE =====
    IdiomCategory(
      name: 'Idioms - Life & Death',
      icon: '🌱',
      color: 0xFFFF9800,
      items: _lifeIdioms,
    ),
    // ===== IDIOMS - EMOTION =====
    IdiomCategory(
      name: 'Idioms - Emotions',
      icon: '❤️',
      color: 0xFFFF5722,
      items: _emotionIdioms,
    ),
    // ===== IDIOMS - SUCCESS =====
    IdiomCategory(
      name: 'Idioms - Success & Failure',
      icon: '🏆',
      color: 0xFFFFC107,
      items: _successIdioms,
    ),
    // ===== IDIOMS - TRAVEL =====
    IdiomCategory(
      name: 'Idioms - Travel & Directions',
      icon: '✈️',
      color: 0xFF03A9F4,
      items: _travelIdioms,
    ),
    // ===== IDIOMS - HEALTH =====
    IdiomCategory(
      name: 'Idioms - Health',
      icon: '🏥',
      color: 0xFFF44336,
      items: _healthIdioms,
    ),
    // ===== IDIOMS - WEATHER =====
    IdiomCategory(
      name: 'Idioms - Weather',
      icon: '☀️',
      color: 0xFF00BCD4,
      items: _weatherIdioms,
    ),
    // ===== IDIOMS - ANIMALS =====
    IdiomCategory(
      name: 'Idioms - Animals',
      icon: '🐾',
      color: 0xFF795548,
      items: _animalIdioms,
    ),
    // ===== IDIOMS - FOOD =====
    IdiomCategory(
      name: 'Idioms - Food & Eating',
      icon: '🍽️',
      color: 0xFFE91E63,
      items: _foodIdioms,
    ),
    // ===== IDIOMS - WORK =====
    IdiomCategory(
      name: 'Idioms - Work & Business',
      icon: '💼',
      color: 0xFF9C27B0,
      items: _workIdioms,
    ),
    // ===== IDIOMS - EDUCATION =====
    IdiomCategory(
      name: 'Idioms - Education',
      icon: '📚',
      color: 0xFF673AB7,
      items: _educationIdioms,
    ),
    // ===== IDIOMS - RELATIONSHIPS =====
    IdiomCategory(
      name: 'Idioms - Relationships',
      icon: '💑',
      color: 0xFF3F51B5,
      items: _relationshipIdioms,
    ),
    // ===== IDIOMS - LUCK =====
    IdiomCategory(
      name: 'Idioms - Luck & Chance',
      icon: '🍀',
      color: 0xFF4CAF50,
      items: _luckIdioms,
    ),
    // ===== IDIOMS - EFFORT =====
    IdiomCategory(
      name: 'Idioms - Effort & Difficulty',
      icon: '💪',
      color: 0xFFFF5722,
      items: _effortIdioms,
    ),
    // ===== IDIOMS - COMMUNICATION =====
    IdiomCategory(
      name: 'Idioms - Communication',
      icon: '📣',
      color: 0xFF00BCD4,
      items: _communicationIdioms,
    ),
    // ===== IDIOMS - CLOTHING =====
    IdiomCategory(
      name: 'Idioms - Clothing',
      icon: '👔',
      color: 0xFF795548,
      items: _clothingIdioms,
    ),
    // ===== IDIOMS - SPORTS =====
    IdiomCategory(
      name: 'Idioms - Sports',
      icon: '⚽',
      color: 0xFF4CAF50,
      items: _sportsIdioms,
    ),
  ];
}

// ==================== DATA ====================

// COMMON PHRASAL VERBS
const List<IdiomItem> _commonPhrasalVerbs = [
  IdiomItem(phrase: 'figure out', meaning: 'memahami, mencari tahu', example: 'I need to figure out how to solve this problem.', exampleId: 'Saya perlu mencari tahu bagaimana menyelesaikan masalah ini.'),
  IdiomItem(phrase: 'find out', meaning: 'mencari tahu', example: 'Can you find out when the train leaves?', exampleId: 'Bisa kamu cari tahu kapan kereta berangkat?'),
  IdiomItem(phrase: 'come across', meaning: 'bertemu secara kebetulan', example: 'I came across an old photo of us.', exampleId: 'Saya menemukan foto lama kita.'),
  IdiomItem(phrase: 'run into', meaning: 'bertemu secara kebetulan', example: 'I ran into my teacher at the mall.', exampleId: 'Saya bertemu guru saya di mall.'),
  IdiomItem(phrase: 'catch up', meaning: 'mengejar ketertinggalan', example: 'I need to catch up on my homework.', exampleId: 'Saya perlu mengejar tugas yang tertinggal.'),
  IdiomItem(phrase: 'deal with', meaning: 'menangani, menghadapi', example: 'This problem is hard to deal with.', exampleId: 'Masalah ini sulit untuk ditangani.'),
  IdiomItem(phrase: 'come up with', meaning: 'memikirkan, menghasilkan ide', example: 'She came up with a great idea.', exampleId: 'Dia memiliki ide yang bagus.'),
  IdiomItem(phrase: 'get along with', meaning: 'bertoleransi, rukun dengan', example: 'I get along well with my colleagues.', exampleId: 'Saya rukun dengan rekan-rekan saya.'),
  IdiomItem(phrase: 'put off', meaning: 'menunda', example: 'Do not put off your work.', exampleId: 'Jangan menunda pekerjaanmu.'),
  IdiomItem(phrase: 'pick up', meaning: 'mengambil, menjemput', example: 'I will pick you up at the airport.', exampleId: 'Saya akan menjemputmu di bandara.'),
  IdiomItem(phrase: 'drop off', meaning: 'menggugurkan, mengantarkan', example: 'I dropped off the kids at school.', exampleId: 'Saya mengantar anak-anak ke sekolah.'),
  IdiomItem(phrase: 'take off', meaning: 'melepas, lepas landas', example: 'Please take off your shoes.', exampleId: 'Tolong lepas sepatumu.'),
  IdiomItem(phrase: 'try on', meaning: 'mencoba (pakaian)', example: 'Can I try on this dress?', exampleId: 'Bisa saya coba gaun ini?'),
  IdiomItem(phrase: 'turn down', meaning: 'menolak, menurunkan', example: 'She turned down the job offer.', exampleId: 'Dia menolak tawaran pekerjaan itu.'),
  IdiomItem(phrase: 'turn up', meaning: 'muncul, menaikkan', example: 'He finally turned up at the party.', exampleId: 'Dia akhirnya muncul di pesta.'),
  IdiomItem(phrase: 'show up', meaning: 'muncul, hadir', example: 'Please show up on time.', exampleId: 'Tolong hadir tepat waktu.'),
  IdiomItem(phrase: 'wake up', meaning: 'bangun', example: 'I wake up at 6 AM every day.', exampleId: 'Saya bangun jam 6 pagi setiap hari.'),
  IdiomItem(phrase: 'stand up', meaning: 'berdiri', example: 'Please stand up when the teacher enters.', exampleId: 'Tolong berdiri ketika guru masuk.'),
  IdiomItem(phrase: 'grow up', meaning: 'tumbuh dewasa', example: 'I want to be a doctor when I grow up.', exampleId: 'Saya ingin menjadi dokter ketika dewasa nanti.'),
  IdiomItem(phrase: 'cheer up', meaning: 'menggembirakan', example: 'Cheer up! Everything will be fine.', exampleId: 'Semangat! Semuanya akan baik-baik saja.'),
  IdiomItem(phrase: 'break down', meaning: 'mogok, pecah menangis', example: 'The car broke down on the highway.', exampleId: 'Mobil mogok di jalan tol.'),
  IdiomItem(phrase: 'break up', meaning: 'berpisah, putus hubungan', example: 'They broke up after two years.', exampleId: 'Mereka putus setelah dua tahun.'),
  IdiomItem(phrase: 'make up', meaning: 'memeriksa kembali, mendamaikan', example: 'Let us make up and be friends again.', exampleId: 'Mari kita berbaikan dan berteman lagi.'),
  IdiomItem(phrase: 'give up', meaning: 'menyerah', example: 'Never give up on your dreams.', exampleId: 'Jangan pernah menyerah pada mimpimu.'),
  IdiomItem(phrase: 'look up', meaning: 'mencari (di kamus)', example: 'Look up the word in the dictionary.', exampleId: 'Cari kata itu di kamus.'),
  IdiomItem(phrase: 'clean up', meaning: 'membersihkan', example: 'Please clean up your room.', exampleId: 'Tolong bersihkan kamarmu.'),
  IdiomItem(phrase: 'set up', meaning: 'mempersiapkan, membuat akun', example: 'I set up a new bank account.', exampleId: 'Saya membuat rekening bank baru.'),
  IdiomItem(phrase: 'sign up', meaning: 'mendaftar', example: 'Sign up for the course before it is full.', exampleId: 'Daftar kursus sebelum penuh.'),
  IdiomItem(phrase: 'fill out', meaning: 'mengisi formulir', example: 'Please fill out this application form.', exampleId: 'Tolong isi formulir aplikasi ini.'),
  IdiomItem(phrase: 'hand in', meaning: 'mengumpulkan tugas', example: 'Hand in your homework tomorrow.', exampleId: 'Kumpulkan tugasmu besok.'),
  IdiomItem(phrase: 'think over', meaning: 'memikirkan matang-matang', example: 'I need to think over this decision.', exampleId: 'Saya perlu memikirkan keputusan ini dengan matang.'),
  IdiomItem(phrase: 'point out', meaning: 'memperhatikan, menunjukkan', example: 'Can you point out the mistake?', exampleId: 'Bisa kamu tunjukkan kesalahannya?'),
  IdiomItem(phrase: 'carry out', meaning: 'melaksanakan', example: 'We need to carry out the plan.', exampleId: 'Kita perlu melaksanakan rencana ini.'),
  IdiomItem(phrase: 'come true', meaning: 'menjadi kenyataan', example: 'My dream finally came true.', exampleId: 'Mimpiku akhirnya menjadi kenyataan.'),
  IdiomItem(phrase: 'end up', meaning: 'akhirnya (terjadi)', example: 'He ended up as a CEO.', exampleId: 'Dia akhirnya menjadi CEO.'),
  IdiomItem(phrase: 'get over', meaning: 'sembuh dari, melewati', example: 'I cannot get over my ex.', exampleId: 'Saya tidak bisa move on dari mantan saya.'),
  IdiomItem(phrase: 'keep up with', meaning: 'mengejar跟上', example: 'I cannot keep up with my classmates.', exampleId: 'Saya tidak bisa mengejar teman sekelas.'),
  IdiomItem(phrase: 'look forward to', meaning: 'menunggu dengan senang hati', example: 'I look forward to meeting you.', exampleId: 'Saya menantikan pertemuan denganmu.'),
  IdiomItem(phrase: 'run out of', meaning: 'kehabisan', example: 'We ran out of milk.', exampleId: 'Kami kehabisan susu.'),
  IdiomItem(phrase: 'take care of', meaning: 'menjaga, merawat', example: 'Please take care of my cat.', exampleId: 'Tolong jaga kucing saya.'),
  IdiomItem(phrase: 'count on', meaning: 'mengandalkan', example: 'I can count on you.', exampleId: 'Saya bisa mengandalkanmu.'),
  IdiomItem(phrase: 'get rid of', meaning: 'membuang, menyingkirkan', example: 'I need to get rid of old clothes.', exampleId: 'Saya perlu membuang baju lama.'),
  IdiomItem(phrase: 'look after', meaning: 'menjaga, merawat', example: 'She looks after her grandmother.', exampleId: 'Dia merawat neneknya.'),
  IdiomItem(phrase: 'take advantage of', meaning: 'memanfaatkan', example: 'Take advantage of this opportunity.', exampleId: 'Manfaatkan kesempatan ini.'),
  IdiomItem(phrase: 'take part in', meaning: 'berpartisipasi dalam', example: 'She took part in the competition.', exampleId: 'Dia berpartisipasi dalam kompetisi itu.'),
  IdiomItem(phrase: 'wait for', meaning: 'menunggu', example: 'I am waiting for the bus.', exampleId: 'Saya sedang menunggu bus.'),
  IdiomItem(phrase: 'belong to', meaning: 'milik', example: 'This book belongs to me.', exampleId: 'Buku ini milik saya.'),
  IdiomItem(phrase: 'agree with', meaning: 'setuju dengan', example: 'I agree with your opinion.', exampleId: 'Saya setuju dengan pendapatmu.'),
  IdiomItem(phrase: 'depend on', meaning: 'bergantung pada', example: 'It depends on the weather.', exampleId: 'Itu tergantung cuaca.'),
  IdiomItem(phrase: 'listen to', meaning: 'mendengarkan', example: 'Listen to the teacher carefully.', exampleId: 'Dengarkan guru dengan saksama.'),
];

// GET PHRASAL VERBS
const List<IdiomItem> _getPhrasalVerbs = [
  IdiomItem(phrase: 'get up', meaning: 'bangun (dari tempat tidur)', example: 'I get up at 5 AM every morning.', exampleId: 'Saya bangun jam 5 pagi setiap hari.'),
  IdiomItem(phrase: 'get away', meaning: 'pergi berlibur, melarikan diri', example: 'We need to get away from the city.', exampleId: 'Kita perlu pergi dari kota.'),
  IdiomItem(phrase: 'get back', meaning: 'kembali', example: 'When will you get back home?', exampleId: 'Kapan kamu kembali ke rumah?'),
  IdiomItem(phrase: 'get behind', meaning: 'tertinggal', example: 'I got behind in my studies.', exampleId: 'Saya tertinggal dalam belajar.'),
  IdiomItem(phrase: 'get by', meaning: 'bertahan hidup,勉强过得去', example: 'It is hard to get by on a low salary.', exampleId: 'Sulit bertahan hidup dengan gaji kecil.'),
  IdiomItem(phrase: 'get in', meaning: 'masuk (kendaraan)', example: 'Get in the car quickly.', exampleId: 'Masuk mobil dengan cepat.'),
  IdiomItem(phrase: 'get off', meaning: 'turun (kendaraan)', example: 'Get off at the next stop.', exampleId: 'Turun di halte berikutnya.'),
  IdiomItem(phrase: 'get on', meaning: 'naik (kendaraan)', example: 'Get on the bus at the station.', exampleId: 'Naik bus di stasiun.'),
  IdiomItem(phrase: 'get out', meaning: 'keluar', example: 'Get out of the room immediately.', exampleId: 'Keluar dari ruangan sekarang.'),
  IdiomItem(phrase: 'get over', meaning: 'sembuh, melewati', example: 'She got over her illness.', exampleId: 'Dia sembuh dari sakitnya.'),
  IdiomItem(phrase: 'get through', meaning: 'menyelesaikan, melewati', example: 'I need to get through this exam.', exampleId: 'Saya perlu menyelesaikan ujian ini.'),
  IdiomItem(phrase: 'get together', meaning: 'kumpul bersama', example: 'Let us get together this weekend.', exampleId: 'Mari kumpul weekend ini.'),
  IdiomItem(phrase: 'get used to', meaning: 'terbiasa dengan', example: 'I cannot get used to the cold weather.', exampleId: 'Saya tidak bisa terbiasa dengan cuaca dingin.'),
  IdiomItem(phrase: 'get rid of', meaning: 'membuang, menyingkirkan', example: 'Get rid of all the junk.', exampleId: 'Buang semua sampah.'),
  IdiomItem(phrase: 'get along', meaning: 'rukun, harmonis', example: 'They do not get along well.', exampleId: 'Mereka tidak rukun.'),
  IdiomItem(phrase: 'get down', meaning: 'turun, mencatat', example: 'Get down to business.', exampleId: 'Mari fokus ke bisnis.'),
  IdiomItem(phrase: 'get into', meaning: 'masuk ke, terlibat', example: 'He got into trouble at school.', exampleId: 'Dia terlibat masalah di sekolah.'),
  IdiomItem(phrase: 'get out of', meaning: 'keluar dari, menghindari', example: 'Get out of my way!', exampleId: 'Keling dari jalanku!'),
  IdiomItem(phrase: 'get around', meaning: 'keliling, menyebar', example: 'It is easy to get around the city.', exampleId: 'Mudah keliling kota ini.'),
  IdiomItem(phrase: 'get across', meaning: 'menyampaikan, melewati', example: 'I cannot get my point across.', exampleId: 'Saya tidak bisa menyampaikan poin saya.'),
];

// TAKE PHRASAL VERBS
const List<IdiomItem> _takePhrasalVerbs = [
  IdiomItem(phrase: 'take off', meaning: 'melepas, lepas landas', example: 'Take off your coat.', exampleId: 'Lepas jaketmu.'),
  IdiomItem(phrase: 'take up', meaning: 'memulai hobi, mengambil', example: 'I took up painting last year.', exampleId: 'Saya mulai belajar melukis tahun lalu.'),
  IdiomItem(phrase: 'take in', meaning: 'memahami, memasukkan', example: 'I need time to take in the information.', exampleId: 'Saya butuh waktu untuk memahami informasi ini.'),
  IdiomItem(phrase: 'take out', meaning: 'mengeluarkan, mencopot', example: 'Take out the trash please.', exampleId: 'Tolong keluarkan sampah.'),
  IdiomItem(phrase: 'take on', meaning: 'menerima pekerjaan', example: 'She took on extra work.', exampleId: 'Dia menerima pekerjaan tambahan.'),
  IdiomItem(phrase: 'take over', meaning: 'mengambil alih', example: 'He took over the company.', exampleId: 'Dia mengambil alih perusahaan.'),
  IdiomItem(phrase: 'take back', meaning: 'menarik kembali', example: 'I take back what I said.', exampleId: 'Saya menarik kembali kata-kata saya.'),
  IdiomItem(phrase: 'take down', meaning: 'mencatat, merobohkan', example: 'Take down the notes.', exampleId: 'Catat Notesnya.'),
  IdiomItem(phrase: 'take after', meaning: 'menyerupai (orang tua)', example: 'She takes after her mother.', exampleId: 'Dia mirip ibunya.'),
  IdiomItem(phrase: 'take from', meaning: 'mengambil dari', example: 'Do not take money from strangers.', exampleId: 'Jangan ambil uang dari orang asing.'),
  IdiomItem(phrase: 'take to', meaning: 'suka pada, mulai', example: 'He took to learning English quickly.', exampleId: 'Dia langsung suka belajar Inggris.'),
  IdiomItem(phrase: 'take apart', meaning: 'membongkar', example: 'Take apart the machine.', exampleId: 'Bongkar mesinnya.'),
  IdiomItem(phrase: 'take away', meaning: 'membawa pergi, mengambil', example: 'The teacher took away my phone.', exampleId: 'Guru mengambil telepon saya.'),
  IdiomItem(phrase: 'take part', meaning: 'berpartisipasi', example: 'Take part in the event.', exampleId: 'Berpartisipasi dalam acara ini.'),
  IdiomItem(phrase: 'take it easy', meaning: 'santai saja', example: 'Take it easy, you have time.', exampleId: 'Santai saja, kamu punya waktu.'),
];

// MAKE PHRASAL VERBS
const List<IdiomItem> _makePhrasalVerbs = [
  IdiomItem(phrase: 'make up', meaning: 'memeriksa kembali, mendamaikan', example: 'Let us make up and be friends.', exampleId: 'Mari berbaikan dan berteman.'),
  IdiomItem(phrase: 'make out', meaning: 'membaca, mengerti', example: 'I cannot make out his handwriting.', exampleId: 'Saya tidak bisa membaca tulisannya.'),
  IdiomItem(phrase: 'make over', meaning: 'merenovasi, make over', example: 'They made over the entire house.', exampleId: 'Mereka merenovasi seluruh rumah.'),
  IdiomItem(phrase: 'make for', meaning: 'menuju ke', example: 'We made for the exit.', exampleId: 'Kami menuju ke pintu keluar.'),
  IdiomItem(phrase: 'make off', meaning: 'pergi diam-diam', example: 'The thief made off with the money.', exampleId: 'Pencuri pergi dengan uang itu.'),
  IdiomItem(phrase: 'make off with', meaning: 'membawa kabur', example: 'He made off with the prize.', exampleId: 'Dia membawa kabur hadiahnya.'),
  IdiomItem(phrase: 'make away with', meaning: 'membawa kabur', example: 'They made away with the stolen goods.', exampleId: 'Mereka membawa kabur barang curian.'),
  IdiomItem(phrase: 'make do', meaning: '勉强应付', example: 'We have to make do with what we have.', exampleId: 'Kita harus勉强应付 dengan yang kita punya.'),
  IdiomItem(phrase: 'make away', meaning: 'pergi dengan cepat', example: 'They made away before the police came.', exampleId: 'Mereka pergi sebelum polisi datang.'),
  IdiomItem(phrase: 'make against', meaning: 'bertentangan dengan', example: 'This makes against our plan.', exampleId: 'Ini bertentangan dengan rencana kita.'),
  IdiomItem(phrase: 'make at', meaning: 'menyerang', example: 'The dog made at the stranger.', exampleId: 'Anjing itu menyerang orang asing.'),
];

// BREAK PHRASAL VERBS
const List<IdiomItem> _breakPhrasalVerbs = [
  IdiomItem(phrase: 'break down', meaning: 'mogok, pecah menangis', example: 'My car broke down on the way.', exampleId: 'Mobil saya mogok di jalan.'),
  IdiomItem(phrase: 'break up', meaning: 'berpisah, putus', example: 'They broke up last month.', exampleId: 'Mereka putus bulan lalu.'),
  IdiomItem(phrase: 'break in', meaning: 'membobol, menyela', example: 'Someone broke in last night.', exampleId: 'Seseorang membobol masuk semalam.'),
  IdiomItem(phrase: 'break into', meaning: 'membobol masuk', example: 'Thieves broke into the bank.', exampleId: 'Pencuri membobol bank.'),
  IdiomItem(phrase: 'break out', meaning: 'pecah (perang, penyakit)', example: 'War broke out in the country.', exampleId: 'Perang pecah di negara itu.'),
  IdiomItem(phrase: 'break through', meaning: 'menembus', example: 'Scientists broke through in research.', exampleId: 'Ilmuwan menembus dalam riset.'),
  IdiomItem(phrase: 'break away', meaning: 'melarikan diri', example: 'The horse broke away from its owner.', exampleId: 'Kuda itu lari dari pemiliknya.'),
  IdiomItem(phrase: 'break off', meaning: 'memutus, patah', example: 'The branch broke off the tree.', exampleId: 'Cabang itu patah dari pohon.'),
  IdiomItem(phrase: 'break out of', meaning: 'kabur dari', example: 'The prisoner broke out of jail.', exampleId: 'Tahanan itu kabur dari penjara.'),
  IdiomItem(phrase: 'break with', meaning: 'putus dengan', example: 'She broke with her old friends.', exampleId: 'Dia putus dengan teman lamanya.'),
  IdiomItem(phrase: 'break in on', meaning: 'menyela, mengganggu', example: 'Do not break in on my conversation.', exampleId: 'Jangan menyela percakapanku.'),
];

// TURN PHRASAL VERBS
const List<IdiomItem> _turnPhrasalVerbs = [
  IdiomItem(phrase: 'turn down', meaning: 'menolak, menurunkan', example: 'She turned down the job offer.', exampleId: 'Dia menolak tawaran pekerjaan.'),
  IdiomItem(phrase: 'turn up', meaning: 'muncul, menaikkan', example: 'He turned up late to the meeting.', exampleId: 'Dia datang terlambat ke pertemuan.'),
  IdiomItem(phrase: 'turn on', meaning: 'menyalakan', example: 'Please turn on the lights.', exampleId: 'Tolong nyalakan lampu.'),
  IdiomItem(phrase: 'turn off', meaning: 'mematikan', example: 'Turn off the TV before sleeping.', exampleId: 'Matikan TV sebelum tidur.'),
  IdiomItem(phrase: 'turn into', meaning: 'menjadi', example: 'The caterpillar turned into a butterfly.', exampleId: 'Ulat itu menjadi kupu-kupu.'),
  IdiomItem(phrase: 'turn out', meaning: 'ternyata, mematikan', example: 'It turned out to be a great day.', exampleId: 'Ternyata hari yang bagus.'),
  IdiomItem(phrase: 'turn over', meaning: 'membalik', example: 'Turn over the page.', exampleId: 'Balik halamannya.'),
  IdiomItem(phrase: 'turn around', meaning: 'berbalik, memperbaiki', example: 'The company turned around quickly.', exampleId: 'Perusahaan itu berbaikan dengan cepat.'),
  IdiomItem(phrase: 'turn back', meaning: 'kembali, mundur', example: 'There is no turning back now.', exampleId: 'Tidak ada jalan kembali sekarang.'),
  IdiomItem(phrase: 'turn away', meaning: 'menolak masuk', example: 'They turned away the visitors.', exampleId: 'Mereka menolak pengunjung.'),
  IdiomItem(phrase: 'turn to', meaning: 'berpaling ke, minta bantuan', example: 'I turned to my parents for advice.', exampleId: 'Saya minta saran orang tua.'),
  IdiomItem(phrase: 'turn against', meaning: 'memusuhi', example: 'He turned against his best friend.', exampleId: 'Dia memusuhi sahabatnya.'),
  IdiomItem(phrase: 'turn in', meaning: 'menyerahkan, tidur', example: 'Turn in your homework on time.', exampleId: 'Serahkan tugas tepat waktu.'),
  IdiomItem(phrase: 'turn out for', meaning: 'datang untuk', example: 'Many people turned out for the event.', exampleId: 'Banyak orang datang untuk acara itu.'),
];

// CALL PHRASAL VERBS
const List<IdiomItem> _callPhrasalVerbs = [
  IdiomItem(phrase: 'call back', meaning: 'menelepon kembali', example: 'I will call you back later.', exampleId: 'Saya akan menelepon kembali nanti.'),
  IdiomItem(phrase: 'call up', meaning: 'menelepon', example: 'Call me up when you arrive.', exampleId: 'Telepon saya ketika kamu tiba.'),
  IdiomItem(phrase: 'call off', meaning: 'membatalkan', example: 'They called off the meeting.', exampleId: 'Mereka membatalkan pertemuan.'),
  IdiomItem(phrase: 'call on', meaning: 'mengunjungi, meminta', example: 'The teacher called on me to answer.', exampleId: 'Guru meminta saya untuk menjawab.'),
  IdiomItem(phrase: 'call in', meaning: 'memanggil', example: 'Call in a specialist.', exampleId: 'Panggil spesialis.'),
  IdiomItem(phrase: 'call for', meaning: 'meminta, membutuhkan', example: 'This calls for a celebration!', exampleId: 'Ini butuh perayaan!'),
  IdiomItem(phrase: 'call out', meaning: 'berteriak, mengecam', example: 'She called out his name.', exampleId: 'Dia berteriak memanggil namanya.'),
  IdiomItem(phrase: 'call at', meaning: 'mengunjungi (tempat)', example: 'We called at the hospital yesterday.', exampleId: 'Kami mengunjungi rumah sakit kemarin.'),
  IdiomItem(phrase: 'call over', meaning: 'memanggil mendekat', example: 'Call over the next patient.', exampleId: 'Panggil pasien berikutnya.'),
  IdiomItem(phrase: 'call round', meaning: 'singgah', example: 'I will call round this evening.', exampleId: 'Saya akan singgah sore ini.'),
  IdiomItem(phrase: 'call upon', meaning: 'memohon, mengandalkan', example: 'We call upon your support.', exampleId: 'Kami memohon dukunganmu.'),
];

// GIVE PHRASAL VERBS
const List<IdiomItem> _givePhrasalVerbs = [
  IdiomItem(phrase: 'give up', meaning: 'menyerah', example: 'Do not give up easily.', exampleId: 'Jangan menyerah dengan mudah.'),
  IdiomItem(phrase: 'give in', meaning: 'menyerah, menyerahkn', example: 'I finally gave in to his request.', exampleId: 'Saya akhirnya menuruti permintaannya.'),
  IdiomItem(phrase: 'give away', meaning: 'memberikan gratis, membocorkan', example: 'They gave away free samples.', exampleId: 'Mereka memberikan sampel gratis.'),
  IdiomItem(phrase: 'give out', meaning: 'membagikan, kehabisan', example: 'The teacher gave out the papers.', exampleId: 'Guru membagikan kertas ujian.'),
  IdiomItem(phrase: 'give back', meaning: 'mengembalikan', example: 'Give back the book to the library.', exampleId: 'Kembalikan buku ke perpustakaan.'),
  IdiomItem(phrase: 'give over', meaning: 'memberhentikan, menyerahkan', example: 'Give over that argument.', exampleId: 'Hentikan argumen itu.'),
  IdiomItem(phrase: 'give off', meaning: 'mengeluarkan (bau, cahaya)', example: 'The flowers give off a nice smell.', exampleId: 'Bunga itu mengeluarkan bau harum.'),
  IdiomItem(phrase: 'give out', meaning: 'habis, kehabisan', example: 'My patience gave out.', exampleId: 'Kesabaran saya habis.'),
  IdiomItem(phrase: 'give onto', meaning: 'menghadap ke', example: 'The door gives onto the garden.', exampleId: 'Pintu itu menghadap ke taman.'),
];

// LOOK PHRASAL VERBS
const List<IdiomItem> _lookPhrasalVerbs = [
  IdiomItem(phrase: 'look after', meaning: 'menjaga, merawat', example: 'Please look after my dog.', exampleId: 'Tolong jaga anjing saya.'),
  IdiomItem(phrase: 'look at', meaning: 'melihat, mempertimbangkan', example: 'Look at the bright side.', exampleId: 'Lihat sisi positifnya.'),
  IdiomItem(phrase: 'look for', meaning: 'mencari', example: 'I am looking for my keys.', exampleId: 'Saya sedang mencari kunci saya.'),
  IdiomItem(phrase: 'look forward to', meaning: 'menantikan', example: 'I look forward to your reply.', exampleId: 'Saya menantikan balasanmu.'),
  IdiomItem(phrase: 'look into', meaning: 'menyelidiki', example: 'We will look into the matter.', exampleId: 'Kami akan menyelidiki masalah ini.'),
  IdiomItem(phrase: 'look over', meaning: 'memeriksa', example: 'Can you look over my essay?', exampleId: 'Bisa kamu periksa esai saya?'),
  IdiomItem(phrase: 'look up', meaning: 'mencari (kamus)', example: 'Look up the word in the dictionary.', exampleId: 'Cari kata itu di kamus.'),
  IdiomItem(phrase: 'look down on', meaning: 'meremehkan', example: 'Do not look down on others.', exampleId: 'Jangan meremehkan orang lain.'),
  IdiomItem(phrase: 'look up to', meaning: 'mengagumi', example: 'She looks up to her mother.', exampleId: 'Dia mengagumi ibunya.'),
  IdiomItem(phrase: 'look out', meaning: 'hati-hati', example: 'Look out! There is a car coming!', exampleId: 'Hati-hati! Ada mobil datang!'),
  IdiomItem(phrase: 'look through', meaning: 'melihat sekilas', example: 'Look through the documents.', exampleId: 'Lihat sekilas dokumen-dokumen.'),
  IdiomItem(phrase: 'look around', meaning: 'melihat-lihat', example: 'Let us look around the mall.', exampleId: 'Mari lihat-lihat di mall.'),
  IdiomItem(phrase: 'look back', meaning: 'menoleh, mengingat', example: 'Do not look back on the past.', exampleId: 'Jangan mengingat masa lalu.'),
  IdiomItem(phrase: 'look in on', meaning: 'menengok', example: 'I will look in on you tomorrow.', exampleId: 'Saya akan menengokmu besok.'),
];

// PUT PHRASAL VERBS
const List<IdiomItem> _putPhrasalVerbs = [
  IdiomItem(phrase: 'put up', meaning: 'memasang, tinggal bersama', example: 'We put up a new poster.', exampleId: 'Kami memasang poster baru.'),
  IdiomItem(phrase: 'put off', meaning: 'menunda', example: 'Do not put off your work.', exampleId: 'Jangan menunda pekerjaanmu.'),
  IdiomItem(phrase: 'put on', meaning: 'memakai', example: 'Put on your coat before going out.', exampleId: 'Pakai jaketmu sebelum keluar.'),
  IdiomItem(phrase: 'put out', meaning: 'mematikan, mengeluarkan', example: 'Put out the cigarette.', exampleId: 'Padamkan rokok itu.'),
  IdiomItem(phrase: 'put away', meaning: 'menyimpan', example: 'Put away your toys.', exampleId: 'Simpan mainanmu.'),
  IdiomItem(phrase: 'put back', meaning: 'mengembalikan', example: 'Put the book back on the shelf.', exampleId: 'Kembalikan buku ke rak.'),
  IdiomItem(phrase: 'put down', meaning: 'meletakkan, merendahkan', example: 'Put down the gun!', exampleId: 'Letakkan senjatanya!'),
  IdiomItem(phrase: 'put up with', meaning: 'menahan, menerima', example: 'I cannot put up with this noise.', exampleId: 'Saya tidak tahan dengan kebisingan ini.'),
  IdiomItem(phrase: 'put forward', meaning: 'mengusulkan', example: 'Put forward your suggestion.', exampleId: 'Keluarkan usulmu.'),
  IdiomItem(phrase: 'put across', meaning: 'menyampaikan', example: 'He put his ideas across clearly.', exampleId: 'Dia menyampaikan idenya dengan jelas.'),
  IdiomItem(phrase: 'put aside', meaning: 'memesukkan, menyimpan', example: 'Put aside some money each month.', exampleId: 'Simpan sebagian uang setiap bulan.'),
  IdiomItem(phrase: 'put in', meaning: 'memasukkan, menginvestasikan', example: 'Put in your application.', exampleId: 'Masukkan lamaranmu.'),
  IdiomItem(phrase: 'put over', meaning: 'menyampaikan', example: 'He put over his point effectively.', exampleId: 'Dia menyampaikan poinya dengan efektif.'),
];

// GO PHRASAL VERBS
const List<IdiomItem> _goPhrasalVerbs = [
  IdiomItem(phrase: 'go on', meaning: 'terjadi, berlanjut', example: 'What is going on here?', exampleId: 'Apa yang terjadi di sini?'),
  IdiomItem(phrase: 'go through', meaning: 'melewati, memeriksa', example: 'Go through the document carefully.', exampleId: 'Periksa dokumennya dengan saksama.'),
  IdiomItem(phrase: 'go ahead', meaning: 'melanjutkan, silakan', example: 'Go ahead with your plan.', exampleId: 'Lanjutkan rencanamu.'),
  IdiomItem(phrase: 'go along', meaning: 'berkendara bersama', example: 'I will go along with you.', exampleId: 'Saya akan ikut denganmu.'),
  IdiomItem(phrase: 'go away', meaning: 'pergi', example: 'Go away and leave me alone.', exampleId: 'Pergi dan biarkan aku sendiri.'),
  IdiomItem(phrase: 'go back', meaning: 'kembali', example: 'Let us go back home.', exampleId: 'Mari pulang.'),
  IdiomItem(phrase: 'go over', meaning: 'memeriksa ulang', example: 'Go over your answers.', exampleId: 'Periksa ulang jawabanmu.'),
  IdiomItem(phrase: 'go up', meaning: 'naik', example: 'Prices are going up.', exampleId: 'Harga-harga naik.'),
  IdiomItem(phrase: 'go down', meaning: 'turun', example: 'The sun is going down.', exampleId: 'Matahari terbenam.'),
  IdiomItem(phrase: 'go off', meaning: 'meledak, berbunyi', example: 'The alarm went off at 6 AM.', exampleId: 'Alarm berbunyi jam 6 pagi.'),
  IdiomItem(phrase: 'go out', meaning: 'keluar, padam', example: 'The lights went out during the storm.', exampleId: 'Lampu padam saat badai.'),
  IdiomItem(phrase: 'go in for', meaning: 'menyukai, participate', example: 'She goes in for sports.', exampleId: 'Dia menyukai olahraga.'),
  IdiomItem(phrase: 'go into', meaning: 'memasuki, membahas', example: 'We do not have time to go into details.', exampleId: 'Kita tidak punya waktu membahas detail.'),
  IdiomItem(phrase: 'go without', meaning: 'tanpa', example: 'I will go without lunch today.', exampleId: 'Saya akan skip makan siang hari ini.'),
  IdiomItem(phrase: 'go with', meaning: 'cocok dengan', example: 'This tie goes well with your shirt.', exampleId: 'Dasi ini cocok dengan bajumu.'),
  IdiomItem(phrase: 'go after', meaning: 'mengejar', example: 'Go after your dreams.', exampleId: 'Kejar mimpimu.'),
  IdiomItem(phrase: 'go against', meaning: 'melawan', example: 'It goes against my principles.', exampleId: 'Itu bertentangan dengan prinsipku.'),
];

// COME PHRASAL VERBS
const List<IdiomItem> _comePhrasalVerbs = [
  IdiomItem(phrase: 'come across', meaning: 'bertemu kebetulan', example: 'I came across an old friend.', exampleId: 'Saya bertemu teman lama secara kebetulan.'),
  IdiomItem(phrase: 'come up', meaning: 'muncul, terjadi', example: 'Something came up at work.', exampleId: 'Ada sesuatu yang terjadi di tempat kerja.'),
  IdiomItem(phrase: 'come in', meaning: 'masuk', example: 'Come in, please.', exampleId: 'Silakan masuk.'),
  IdiomItem(phrase: 'come out', meaning: 'keluar, terbit', example: 'The book will come out next month.', exampleId: 'Buku itu akan terbit bulan depan.'),
  IdiomItem(phrase: 'come back', meaning: 'kembali', example: 'I will come back soon.', exampleId: 'Saya akan segera kembali.'),
  IdiomItem(phrase: 'come on', meaning: 'ayo, pergi', example: 'Come on, we are late!', exampleId: 'Ayo, kita terlambat!'),
  IdiomItem(phrase: 'come down', meaning: 'turun, jatuh', example: 'The rain is coming down heavily.', exampleId: 'Hujan turun dengan lebat.'),
  IdiomItem(phrase: 'come over', meaning: 'datang (ke tempat)', example: 'Come over to my house tonight.', exampleId: 'Datang ke rumahku malam ini.'),
  IdiomItem(phrase: 'come up with', meaning: 'memikirkan', example: 'She came up with a brilliant idea.', exampleId: 'Dia punya ide brilian.'),
  IdiomItem(phrase: 'come true', meaning: 'menjadi kenyataan', example: 'His dream came true.', exampleId: 'Mimpinya menjadi kenyataan.'),
  IdiomItem(phrase: 'come about', meaning: 'terjadi', example: 'How did this come about?', exampleId: 'Bagaimana ini bisa terjadi?'),
  IdiomItem(phrase: 'come along', meaning: 'ikut, berkembang', example: 'How is your project coming along?', exampleId: 'Bagaimana progress proyekmu?'),
  IdiomItem(phrase: 'come around', meaning: 'datang, sadar', example: 'He finally came around to our idea.', exampleId: 'Dia akhirnya menerima ide kita.'),
  IdiomItem(phrase: 'come by', meaning: 'mampir, mendapat', example: 'I came by this vintage book.', exampleId: 'Saya mendapatkan buku antik ini.'),
  IdiomItem(phrase: 'come off', meaning: 'lepas, berhasil', example: 'The button came off my shirt.', exampleId: 'Kancing baju saya lepas.'),
  IdiomItem(phrase: 'come to', meaning: 'sadar, total', example: 'She came to after the accident.', exampleId: 'Dia sadar setelah kecelakaan.'),
  IdiomItem(phrase: 'come under', meaning: 'dikenai, di bawah', example: 'The city came under attack.', exampleId: 'Kota itu diserang.'),
];

// CARRY PHRASAL VERBS
const List<IdiomItem> _carryPhrasalVerbs = [
  IdiomItem(phrase: 'carry on', meaning: 'melanjutkan', example: 'Carry on with your work.', exampleId: 'Lanjutkan pekerjaanmu.'),
  IdiomItem(phrase: 'carry out', meaning: 'melaksanakan', example: 'We need to carry out this plan.', exampleId: 'Kita perlu melaksanakan rencana ini.'),
  IdiomItem(phrase: 'carry over', meaning: 'membawa ke periode berikutnya', example: 'The items will carry over to next year.', exampleId: 'Barang-barang akan dibawa ke tahun depan.'),
  IdiomItem(phrase: 'carry through', meaning: 'menyelesaikan', example: 'Carry the project through to completion.', exampleId: 'Selesaikan proyek sampai selesai.'),
  IdiomItem(phrase: 'carry off', meaning: 'membawa pergi, berhasil', example: 'She carried off the award gracefully.', exampleId: 'Dia memenangkan penghargaan dengan anggun.'),
  IdiomItem(phrase: 'carry forward', meaning: 'membawa maju', example: 'Let us carry forward this momentum.', exampleId: 'Mari kita bawa momentum ini maju.'),
  IdiomItem(phrase: 'carry away', meaning: 'membawa pergi, terbawa', example: 'Do not get carried away with emotions.', exampleId: 'Jangan terbawa emosi.'),
];

// SET PHRASAL VERBS
const List<IdiomItem> _setPhrasalVerbs = [
  IdiomItem(phrase: 'set up', meaning: 'mempersiapkan, membuat', example: 'I set up a new business.', exampleId: 'Saya memulai bisnis baru.'),
  IdiomItem(phrase: 'set off', meaning: 'berangkat, memicu', example: 'We set off early in the morning.', exampleId: 'Kami berangkat pagi-pagi.'),
  IdiomItem(phrase: 'set out', meaning: 'berangkat, memulai', example: 'Set out on your journey.', exampleId: 'Mulai perjalananmu.'),
  IdiomItem(phrase: 'set back', meaning: 'menunda, menghambat', example: 'The rain set back our plans.', exampleId: 'Hujan menghambat rencana kita.'),
  IdiomItem(phrase: 'set aside', meaning: 'memesukkan, mengabaikan', example: 'Set aside some money for emergencies.', exampleId: 'Sisihkan uang untuk darurat.'),
  IdiomItem(phrase: 'set down', meaning: 'meletakkan, menulis', example: 'Set down your thoughts on paper.', exampleId: 'Tuliskan pikiranmu di kertas.'),
  IdiomItem(phrase: 'set in', meaning: 'datang, dimulai', example: 'Winter is setting in.', exampleId: 'Musim dingin dimulai.'),
  IdiomItem(phrase: 'set forth', meaning: 'mengemukakan', example: 'Set forth your arguments.', exampleId: 'Kemukakan argumenmu.'),
  IdiomItem(phrase: 'set upon', meaning: 'menyerang', example: 'They were set upon by bandits.', exampleId: 'Mereka diserang oleh bandit.'),
];

// HOLD PHRASAL VERBS
const List<IdiomItem> _holdPhrasalVerbs = [
  IdiomItem(phrase: 'hold on', meaning: 'tunggu, bertahan', example: 'Hold on, I will be right back.', exampleId: 'Tunggu, saya akan segera kembali.'),
  IdiomItem(phrase: 'hold up', meaning: 'menaikkan, menghambat', example: 'The traffic held us up.', exampleId: 'Kemacetan menghambat kita.'),
  IdiomItem(phrase: 'hold back', meaning: 'menahan, menutupi', example: 'Hold back your emotions.', exampleId: 'Tahan emosimu.'),
  IdiomItem(phrase: 'hold out', meaning: 'menawarkan, bertahan', example: 'Hold out your hand.', exampleId: 'Ulurkan tanganmu.'),
  IdiomItem(phrase: 'hold off', meaning: 'menunda', example: 'Hold off making a decision.', exampleId: 'Tunda membuat keputusan.'),
  IdiomItem(phrase: 'hold in', meaning: 'menahan', example: 'Hold in your stomach.', exampleId: 'Tahan perutmu.'),
  IdiomItem(phrase: 'hold over', meaning: 'menunda ke lain waktu', example: 'The meeting was held over to next week.', exampleId: 'Rapat ditunda ke minggu depan.'),
  IdiomItem(phrase: 'hold with', meaning: 'setuju dengan', example: 'I do not hold with this idea.', exampleId: 'Saya tidak setuju dengan ide ini.'),
  IdiomItem(phrase: 'hold against', meaning: 'menyalahkan', example: 'Do not hold it against him.', exampleId: 'Jangan menyalahkannya.'),
  IdiomItem(phrase: 'hold forth', meaning: 'berbicara panjang', example: 'He held forth on the topic for hours.', exampleId: 'Dia berbicara panjang lebar tentang topik itu.'),
];

// BRING PHRASAL VERBS
const List<IdiomItem> _bringPhrasalVerbs = [
  IdiomItem(phrase: 'bring up', meaning: 'membesarkan, menyebutkan', example: 'She brought up three children alone.', exampleId: 'Dia membesarkan tiga anak sendirian.'),
  IdiomItem(phrase: 'bring about', meaning: 'menyebabkan', example: 'Technology brought about many changes.', exampleId: 'Teknologi menyebabkan banyak perubahan.'),
  IdiomItem(phrase: 'bring forward', meaning: 'mengajukan, mempercepat', example: 'Bring forward your proposal.', exampleId: 'Ajukan proposalsmu.'),
  IdiomItem(phrase: 'bring back', meaning: 'mengembalikan, mengingatkan', example: 'This song brings back memories.', exampleId: 'Lagu ini mengingatkanku pada kenangan.'),
  IdiomItem(phrase: 'bring out', meaning: 'mengeluarkan', example: 'The company will bring out a new product.', exampleId: 'Perusahaan akan mengeluarkan produk baru.'),
  IdiomItem(phrase: 'bring in', meaning: 'mendatangkan, memperkenalkan', example: 'The new policy brought in more revenue.', exampleId: 'Kebijakan baru mendatangkan lebih banyak pendapatan.'),
  IdiomItem(phrase: 'bring together', meaning: 'menyatukan', example: 'This event brought us together.', exampleId: 'Acara ini menyatukan kita.'),
  IdiomItem(phrase: 'bring down', meaning: 'menurunkan, menjatuhkan', example: 'We need to bring down the costs.', exampleId: 'Kita perlu menurunkan biaya.'),
  IdiomItem(phrase: 'bring off', meaning: 'berhasil melakukan', example: 'She brought off the impossible task.', exampleId: 'Dia berhasil melakukan tugas yang tidak mungkin.'),
  IdiomItem(phrase: 'bring round', meaning: 'meyakinkan, memulihkan', example: 'The fresh air brought him round.', exampleId: 'Udara segar memulihkannya.'),
  IdiomItem(phrase: 'bring to', meaning: 'membawa ke, sadar', example: 'The medicine brought her to better health.', exampleId: 'Obat itu memulihkan kesehatannya.'),
];

// FALL PHRASAL VERBS
const List<IdiomItem> _fallPhrasalVerbs = [
  IdiomItem(phrase: 'fall out', meaning: 'pertengkaran, rontok', example: 'They fell out over money.', exampleId: 'Mereka bertengkar soal uang.'),
  IdiomItem(phrase: 'fall back on', meaning: 'berpaling ke (pilihan terakhir)', example: 'I have savings to fall back on.', exampleId: 'Saya punya tabungan untuk berjaga-jaga.'),
  IdiomItem(phrase: 'fall behind', meaning: 'tertinggal', example: 'He fell behind in his classes.', exampleId: 'Dia tertinggal di kelasnya.'),
  IdiomItem(phrase: 'fall for', meaning: 'jatuh cinta', example: 'She fell for him immediately.', exampleId: 'Dia langsung jatuh cinta padanya.'),
  IdiomItem(phrase: 'fall through', meaning: 'gagal, tidak jadi', example: 'The plan fell through.', exampleId: 'Rencana itu gagal.'),
  IdiomItem(phrase: 'fall in with', meaning: 'bergaul dengan, setuju', example: 'He fell in with the wrong crowd.', exampleId: 'Dia bergaul dengan orang-orang yang salah.'),
  IdiomItem(phrase: 'fall over', meaning: 'jatuh, tersandung', example: 'She fell over the carpet.', exampleId: 'Dia tersandung karpet.'),
  IdiomItem(phrase: 'fall back', meaning: 'mundur, kembali', example: 'The army fell back to the hills.', exampleId: 'Pasukan mundur ke bukit.'),
  IdiomItem(phrase: 'fall upon', meaning: 'menyerang, menemukan', example: 'The villagers fell upon the intruder.', exampleId: 'Warga menyerang penyusup.'),
  IdiomItem(phrase: 'fall to', meaning: 'jatuh ke, dimulai', example: 'The task fell to me to complete.', exampleId: 'Tugas itu jatuh kepada saya untuk diselesaikan.'),
];

// CUT PHRASAL VERBS
const List<IdiomItem> _cutPhrasalVerbs = [
  IdiomItem(phrase: 'cut off', meaning: 'memutuskan, memotong', example: 'The phone was cut off.', exampleId: 'Telepon diputuskan.'),
  IdiomItem(phrase: 'cut down', meaning: 'menebang, mengurangi', example: 'We need to cut down on expenses.', exampleId: 'Kita perlu mengurangi pengeluaran.'),
  IdiomItem(phrase: 'cut out', meaning: 'memotong, menghentikan', example: 'Cut out the nonsense!', exampleId: 'Hentikan omong kosong!'),
  IdiomItem(phrase: 'cut in', meaning: 'menyela, memotong masuk', example: 'Do not cut in on the conversation.', exampleId: 'Jangan menyela percakapan.'),
  IdiomItem(phrase: 'cut up', meaning: 'memotong kecil, memukul', example: 'The vegetables were cut up finely.', exampleId: 'Sayuran dipotong kecil-kecil.'),
  IdiomItem(phrase: 'cut back', meaning: 'mengurangi', example: 'The company cut back on staff.', exampleId: 'Perusahaan mengurangi karyawan.'),
  IdiomItem(phrase: 'cut across', meaning: 'menyeberangi, melampaui', example: 'This issue cuts across all departments.', exampleId: 'Masalah ini melanda semua departemen.'),
  IdiomItem(phrase: 'cut away', meaning: 'memotong pergi', example: 'Cut away the dead branches.', exampleId: 'Potong cabang yang mati.'),
  IdiomItem(phrase: 'cut through', meaning: 'menembus', example: 'The knife cut through the rope.', exampleId: 'Pisau itu menembus tali.'),
];

// RUN PHRASAL VERBS
const List<IdiomItem> _runPhrasalVerbs = [
  IdiomItem(phrase: 'run into', meaning: 'bertemu kebetulan, menabrak', example: 'I ran into my old teacher yesterday.', exampleId: 'Saya bertemu guru lama kemarin.'),
  IdiomItem(phrase: 'run out', meaning: 'kehabisan', example: 'We ran out of time.', exampleId: 'Kita kehabisan waktu.'),
  IdiomItem(phrase: 'run across', meaning: 'menemui, berlari menyeberang', example: 'I ran across an interesting article.', exampleId: 'Saya menemukan artikel menarik.'),
  IdiomItem(phrase: 'run away', meaning: 'lari dari, kabur', example: 'The child ran away from home.', exampleId: 'Anak itu kabur dari rumah.'),
  IdiomItem(phrase: 'run through', meaning: 'memeriksa, menjalankan', example: 'Let us run through the plan again.', exampleId: 'Mari periksa rencana lagi.'),
  IdiomItem(phrase: 'run over', meaning: 'menabrak, melampaui', example: 'The car ran over the dog.', exampleId: 'Mobil itu menabrak anjing.'),
  IdiomItem(phrase: 'run off', meaning: 'lari pergi, kabur', example: 'The thief ran off with the money.', exampleId: 'Pencuri itu kabur dengan uang.'),
  IdiomItem(phrase: 'run up', meaning: 'menumpuk, berlari naik', example: 'He ran up a huge debt.', exampleId: 'Dia menumpuk hutang besar.'),
  IdiomItem(phrase: 'run down', meaning: 'menabrak, merendahkan', example: 'The driver ran down the pedestrian.', exampleId: 'Pengemudi itu menabrak pejalan kaki.'),
  IdiomItem(phrase: 'run after', meaning: 'mengejar', example: 'Why are you running after him?', exampleId: 'Kenapa kamu mengejarnya?'),
  IdiomItem(phrase: 'run along', meaning: 'pergi', example: 'Run along now, it is getting late.', exampleId: 'Pergi sekarang, sudah mulai gelap.'),
  IdiomItem(phrase: 'run out of', meaning: 'kehabisan', example: 'We are running out of supplies.', exampleId: 'Kita kehabisan perbekalan.'),
  IdiomItem(phrase: 'run in', meaning: 'mengunjungi, menangkap', example: 'The police ran in the suspect.', exampleId: 'Polisi menangkap tersangka.'),
];

// PASS PHRASAL VERBS
const List<IdiomItem> _passPhrasalVerbs = [
  IdiomItem(phrase: 'pass out', meaning: 'pingsan, membagikan', example: 'He passed out from the heat.', exampleId: 'Dia pingsan karena kepanasan.'),
  IdiomItem(phrase: 'pass away', meaning: 'meninggal dunia', example: 'His grandfather passed away last year.', exampleId: 'Kakeknya meninggal tahun lalu.'),
  IdiomItem(phrase: 'pass over', meaning: 'melewati, mengabaikan', example: 'They passed over his application.', exampleId: 'Mereka mengabaikan lamarannya.'),
  IdiomItem(phrase: 'pass up', meaning: 'melewatkan, menolak', example: 'Do not pass up this opportunity.', exampleId: 'Jangan lewatkan kesempatan ini.'),
  IdiomItem(phrase: 'pass on', meaning: 'meneruskan, meninggal', example: 'Pass on the message to him.', exampleId: 'Sampaikan pesannya kepadanya.'),
  IdiomItem(phrase: 'pass through', meaning: 'melewati', example: 'We passed through the town.', exampleId: 'Kita melewati kota itu.'),
  IdiomItem(phrase: 'pass by', meaning: 'lewat', example: 'Time passed by quickly.', exampleId: 'Waktu berlalu dengan cepat.'),
  IdiomItem(phrase: 'pass off', meaning: 'terjadi, menyamar', example: 'The event passed off without incident.', exampleId: 'Acara berlangsung tanpa insiden.'),
  IdiomItem(phrase: 'pass down', meaning: 'mewariskan', example: 'This tradition is passed down from generation to generation.', exampleId: 'Tradisi ini diwariskan turun-temurun.'),
  IdiomItem(phrase: 'pass for', meaning: 'disangka, dianggap', example: 'He passes for an expert.', exampleId: 'Dia dianggap seorang ahli.'),
];

// LAY PHRASAL VERBS
const List<IdiomItem> _layPhrasalVerbs = [
  IdiomItem(phrase: 'lay off', meaning: 'memutuskan hubungan kerja', example: 'The company laid off 100 workers.', exampleId: 'Perusahaan memberhentikan 100 pekerja.'),
  IdiomItem(phrase: 'lay out', meaning: 'menyebarkan, merancang', example: 'Lay out all the documents.', exampleId: 'Sebarkan semua dokumen.'),
  IdiomItem(phrase: 'lay down', meaning: 'meletakkan, menetapkan', example: 'Lay down your weapons!', exampleId: 'Letakkan senjatamu!'),
  IdiomItem(phrase: 'lay up', meaning: 'menyimpan, opname', example: 'He was laid up with a broken leg.', exampleId: 'Dia opname karena patah kaki.'),
  IdiomItem(phrase: 'lay in', meaning: 'menyimpan, menimbun', example: 'Lay in supplies for winter.', exampleId: 'Simpan perbekalan untuk musim dingin.'),
  IdiomItem(phrase: 'lay on', meaning: 'menyediakan,施加', example: 'Lay on the charm!', exampleId: 'Tunjukkan pesonamu!'),
  IdiomItem(phrase: 'lay over', meaning: 'berhenti sebentar', example: 'We laid over in Singapore.', exampleId: 'Kami berhenti sebentar di Singapura.'),
  IdiomItem(phrase: 'lay to rest', meaning: 'mengubur, mengakhiri', example: 'They laid the dispute to rest.', exampleId: 'Mereka mengakhiri perselisihan itu.'),
];

// SHOW PHRASAL VERBS
const List<IdiomItem> _showPhrasalVerbs = [
  IdiomItem(phrase: 'show off', meaning: 'pamer', example: 'He always shows off his wealth.', exampleId: 'Dia selalu memamerkan kekayaannya.'),
  IdiomItem(phrase: 'show up', meaning: 'muncul, hadir', example: 'He did not show up for the meeting.', exampleId: 'Dia tidak hadir di pertemuan.'),
  IdiomItem(phrase: 'show around', meaning: 'memperkenalkan keliling', example: 'Let me show you around the office.', exampleId: 'Izinkan saya menunjukkan kantor ini.'),
  IdiomItem(phrase: 'show in', meaning: 'memperkenalkan masuk', example: 'Show the guests in, please.', exampleId: 'Perkenalkan tamu masuk, tolong.'),
  IdiomItem(phrase: 'show out', meaning: 'mengantarkan keluar', example: 'Show them out when they leave.', exampleId: 'Antar mereka keluar ketika pergi.'),
  IdiomItem(phrase: 'show forth', meaning: 'menunjukkan', example: 'The evidence shows forth the truth.', exampleId: 'Bukti menunjukkan kebenaran.'),
  IdiomItem(phrase: 'show over', meaning: 'memperkenalkan, zeigen', example: 'Let me show you over the house.', exampleId: 'Izinkan saya menunjukkan rumah ini.'),
];

// STAND PHRASAL VERBS
const List<IdiomItem> _standPhrasalVerbs = [
  IdiomItem(phrase: 'stand by', meaning: 'mendukung, standby', example: 'I will stand by you no matter what.', exampleId: 'Saya akan mendukungmu apapun yang terjadi.'),
  IdiomItem(phrase: 'stand up', meaning: 'berdiri', example: 'Stand up for your rights!', exampleId: 'Berdiri untuk hakmu!'),
  IdiomItem(phrase: 'stand out', meaning: 'menonjol', example: 'Her talent really stands out.', exampleId: 'Bakatnya benar-benar menonjol.'),
  IdiomItem(phrase: 'stand for', meaning: 'berarti, mendukung', example: 'What does this abbreviation stand for?', exampleId: 'Apa singkatan ini berarti?'),
  IdiomItem(phrase: 'stand up for', meaning: 'membela', example: 'Stand up for what you believe in.', exampleId: 'Bela apa yang kamu yakini.'),
  IdiomItem(phrase: 'stand in', meaning: 'menggantikan', example: 'I will stand in for him today.', exampleId: 'Saya akan menggantikannya hari ini.'),
  IdiomItem(phrase: 'stand down', meaning: 'mundur, menurunkan', example: 'He decided to stand down from his position.', exampleId: 'Dia memutuskan mundur dari jabatannya.'),
  IdiomItem(phrase: 'stand against', meaning: 'melawan', example: 'Stand against injustice!', exampleId: 'Lawan ketidakadilan!'),
  IdiomItem(phrase: 'stand apart', meaning: 'berbeda, menonjol', example: 'His work stands apart from the rest.', exampleId: 'Pekerjaannya berbeda dari yang lain.'),
  IdiomItem(phrase: 'stand with', meaning: 'berdampingan dengan', example: 'I stand with you in this matter.', exampleId: 'Saya berdampingan denganmu dalam masalah ini.'),
];

// SPEAK PHRASAL VERBS
const List<IdiomItem> _speakPhrasalVerbs = [
  IdiomItem(phrase: 'speak up', meaning: 'berbicara keras, berpendapat', example: 'Speak up, I cannot hear you.', exampleId: 'Berbicara lebih keras, saya tidak bisa mendengar.'),
  IdiomItem(phrase: 'speak out', meaning: 'berbicara terang, menyuarakan', example: 'Speak out against corruption!', exampleId: 'Suarakan penolakan terhadap korupsi!'),
  IdiomItem(phrase: 'speak to', meaning: 'berbicara dengan, menegur', example: 'I need to speak to the manager.', exampleId: 'Saya perlu bicara dengan manajer.'),
  IdiomItem(phrase: 'speak for', meaning: 'mewakili, berbicara untuk', example: 'I can only speak for myself.', exampleId: 'Saya hanya bisa berbicara untuk diri saya.'),
  IdiomItem(phrase: 'speak of', meaning: 'membicarakan', example: 'The results speak for themselves.', exampleId: 'Hasilnya berbicara sendiri.'),
  IdiomItem(phrase: 'speak well of', meaning: 'berbicara baik tentang', example: 'Everyone speaks well of her.', exampleId: 'Semua orang berbicara baik tentang dia.'),
  IdiomItem(phrase: 'speak ill of', meaning: 'memicarakan buruk', example: 'Do not speak ill of others.', exampleId: 'Jangan membicarakanburuk orang lain.'),
];

// WORK PHRASAL VERBS
const List<IdiomItem> _workPhrasalVerbs = [
  IdiomItem(phrase: 'work out', meaning: 'berolahraga, memecahkan', example: 'I work out at the gym every morning.', exampleId: 'Saya olahraga di gym setiap pagi.'),
  IdiomItem(phrase: 'work on', meaning: 'bekerja pada', example: 'I am working on a new project.', exampleId: 'Saya sedang mengerjakan proyek baru.'),
  IdiomItem(phrase: 'work up', meaning: 'membangkitkan, meningkatkan', example: 'I cannot work up any enthusiasm.', exampleId: 'Saya tidak bisa membangun semangat.'),
  IdiomItem(phrase: 'work through', meaning: 'memecahkan, melewati', example: 'Work through your problems step by step.', exampleId: 'Pecahkan masalahmu langkah demi langkah.'),
  IdiomItem(phrase: 'work off', meaning: 'menghilangkan, melunasi', example: 'Work off your debt by working extra hours.', exampleId: 'Lunasi hutangmu dengan kerja lembur.'),
  IdiomItem(phrase: 'work over', meaning: 'memeriksa, memeriksa ulang', example: 'The mechanic worked over the entire engine.', exampleId: 'Montir memeriksa seluruh mesin.'),
  IdiomItem(phrase: 'work towards', meaning: 'berusaha mencapai', example: 'We are working towards a better future.', exampleId: 'Kita berusaha mencapai masa depan yang lebih baik.'),
];

// ==================== IDIOMS DATA ====================

// MONEY & FINANCE IDIOMS
const List<IdiomItem> _moneyIdioms = [
  IdiomItem(phrase: 'break the bank', meaning: 'menghabiskan semua uang', example: 'A new car would break the bank.', exampleId: 'Mobil baru akan menghabiskan semua uang.'),
  IdiomItem(phrase: 'cost an arm and a leg', meaning: 'sangat mahal', example: 'This designer bag costs an arm and a leg.', exampleId: 'Tas designer ini sangat mahal.'),
  IdiomItem(phrase: 'a penny for your thoughts', meaning: 'apa yang kamu pikirkan?', example: 'A penny for your thoughts, you look worried.', exampleId: 'Apa yang kamu pikirkan? Kamu terlihat khawatir.'),
  IdiomItem(phrase: 'in the red', meaning: 'berhutang, defisit', example: 'The company has been in the red for months.', exampleId: 'Perusahaan itu sudah defisit selama berbulan-bulan.'),
  IdiomItem(phrase: 'in the black', meaning: 'untung, surplus', example: 'Our business is finally in the black.', exampleId: 'Bisnis kita akhirnya untung.'),
  IdiomItem(phrase: 'tighten one\'s belt', meaning: 'menghemat', example: 'We need to tighten our belts during this crisis.', exampleId: 'Kita perlu hemat selama krisis ini.'),
  IdiomItem(phrase: 'fork out', meaning: 'membayar dengan Reluctant', example: 'I had to fork out 500 dollars for repairs.', exampleId: 'Saya harus membayar 500 dolar untuk perbaikan.'),
  IdiomItem(phrase: 'pocket change', meaning: 'uang receh', example: 'I only have pocket change left.', exampleId: 'Saya hanya punya uang receh.'),
  IdiomItem(phrase: 'born with a silver spoon', meaning: 'lahir dari keluarga kaya', example: 'He was born with a silver spoon in his mouth.', exampleId: 'Dia lahir dari keluarga kaya.'),
  IdiomItem(phrase: 'money doesn\'t grow on trees', meaning: 'uang tidak mudah didapat', example: 'Remember, money does not grow on trees.', exampleId: 'Ingat, uang tidak mudah didapat.'),
  IdiomItem(phrase: 'save for a rainy day', meaning: 'menabung untuk mendesak', example: 'Always save for a rainy day.', exampleId: 'Selalu menabung untuk mendesak.'),
  IdiomItem(phrase: 'money talks', meaning: 'uang bicara', example: 'In this business, money talks.', exampleId: 'Di bisnis ini, uang bicara.'),
  IdiomItem(phrase: 'chip in', meaning: 'berkontribusi uang', example: 'Everyone chipped in for the gift.', exampleId: 'Semua berkontribusi untuk hadiah.'),
  IdiomItem(phrase: 'put your money where your mouth is', meaning: 'buktikan dengan tindakan', example: 'Put your money where your mouth is!', exampleId: 'Buktikan dengan tindakan!'),
  IdiomItem(phrase: 'rich as Croesus', meaning: 'sangat kaya', example: 'He is rich as Croesus after winning the lottery.', exampleId: 'Dia sangat kaya setelah memenangkan lotre.'),
  IdiomItem(phrase: 'pay through the nose', meaning: 'membayar sangat mahal', example: 'Tourists often pay through the nose here.', exampleId: 'Turis sering membayar sangat mahal di sini.'),
  IdiomItem(phrase: 'rob Peter to pay Paul', meaning: 'meminjam dari satu untuk bayar lain', example: 'This loan is like robbing Peter to pay Paul.', exampleId: 'Pinjaman ini seperti ambil dari satu untuk bayar yang lain.'),
  IdiomItem(phrase: 'roll in it', meaning: 'sangat kaya', example: 'They must be rolling in it.', exampleId: 'Mereka pasti sangat kaya.'),
  IdiomItem(phrase: 'see money and disappear', meaning: 'langsung pergi setelah dapat uang', example: 'After winning, he saw money and disappeared.', exampleId: 'Setelah menang, dia langsung pergi.'),
  IdiomItem(phrase: 'splurge', meaning: 'berbelanja besar-besaran', example: 'I want to splurge on a new phone.', exampleId: 'Saya ingin belanja besar untuk hp baru.'),
];

// TIME IDIOMS
const List<IdiomItem> _timeIdioms = [
  IdiomItem(phrase: 'time flies', meaning: 'waktu berlalu cepat', example: 'Time flies when you are having fun.', exampleId: 'Waktu berlalu cepat saat kamu senang.'),
  IdiomItem(phrase: 'kill time', meaning: 'membuang waktu', example: 'I was killing time at the airport.', exampleId: 'Saya sedang menunggu di bandara.'),
  IdiomItem(phrase: 'once in a blue moon', meaning: 'jarang sekali', example: 'He only calls once in a blue moon.', exampleId: 'Dia hanya menelepon jarang sekali.'),
  IdiomItem(phrase: 'at the eleventh hour', meaning: 'di waktu terakhir', example: 'The deal was closed at the eleventh hour.', exampleId: 'Kesepakatan ditutup di waktu terakhir.'),
  IdiomItem(phrase: 'the time is ripe', meaning: 'waktunya sudah tepat', example: 'The time is ripe to start a new business.', exampleId: 'Waktunya sudah tepat untuk mulai bisnis baru.'),
  IdiomItem(phrase: 'behind the times', meaning: 'usang, kuno', example: 'This technology is behind the times.', exampleId: 'Teknologi ini sudah usang.'),
  IdiomItem(phrase: 'time and again', meaning: 'berkali-kali', example: 'I have told you time and again.', exampleId: 'Saya sudah bilang berkali-kali.'),
  IdiomItem(phrase: 'about time', meaning: 'akhirnya', example: 'It is about time you arrived!', exampleId: 'Akhirnya kamu tiba!'),
  IdiomItem(phrase: 'all the time', meaning: 'selalu', example: 'He complains all the time.', exampleId: 'Dia selalu抱怨.'),
  IdiomItem(phrase: 'have time to kill', meaning: 'banyak waktu luang', example: 'I have some time to kill before my flight.', exampleId: 'Saya punya waktu luang sebelum penerbangan.'),
  IdiomItem(phrase: 'on time', meaning: 'tepat waktu', example: 'The train arrived on time.', exampleId: 'Kereta tiba tepat waktu.'),
  IdiomItem(phrase: 'in no time', meaning: 'sangat cepat', example: 'We finished the work in no time.', exampleId: 'Kami selesai pekerjaan dengan sangat cepat.'),
  IdiomItem(phrase: 'in time', meaning: 'tepat waktu, akhirnya', example: 'We arrived in time for the show.', exampleId: 'Kami tiba tepat waktu untuk pertunjukan.'),
  IdiomItem(phrase: 'from time to time', meaning: 'terkadang', example: 'I visit my grandmother from time to time.', exampleId: 'Saya visitar nenek kadang-kadang.'),
  IdiomItem(phrase: 'for the time being', meaning: 'untuk sementara', example: 'I am staying here for the time being.', exampleId: 'Saya tinggal di sini untuk sementara.'),
  IdiomItem(phrase: 'keep time', meaning: 'tepat waktu', example: 'My watch does not keep good time.', exampleId: 'Jam saya tidak tepat.'),
  IdiomItem(phrase: 'make time', meaning: 'menyisihkan waktu', example: 'I will make time to meet you.', exampleId: 'Saya akan menyisihkan waktu untuk bertemu.'),
  IdiomItem(phrase: 'over time', meaning: 'lembur, seiring waktu', example: 'Over time, things will get better.', exampleId: 'Seiring waktu, keadaan akan membaik.'),
  IdiomItem(phrase: 'time is of the essence', meaning: 'waktu sangat penting', example: 'Time is of the essence in this project.', exampleId: 'Waktu sangat penting dalam proyek ini.'),
  IdiomItem(phrase: 'wear out welcome', meaning: 'bertandang terlalu sering', example: 'Do not wear out your welcome.', exampleId: 'Jangan bertandang terlalu sering.'),
];

// LIFE & DEATH IDIOMS
const List<IdiomItem> _lifeIdioms = [
  IdiomItem(phrase: 'at death\'s door', meaning: 'hampir meninggal', example: 'He looked like he was at death\'s door.', exampleId: 'Dia terlihat seperti akan meninggal.'),
  IdiomItem(phrase: 'between life and death', meaning: 'di antara hidup dan mati', example: 'The patient is between life and death.', exampleId: 'Pasien ada di antara hidup dan mati.'),
  IdiomItem(phrase: 'cost someone their life', meaning: 'mengorbankan nyawa', example: 'The accident cost him his life.', exampleId: 'Kecelakaan itu merenggut nyawanya.'),
  IdiomItem(phrase: 'depart this life', meaning: 'meninggal dunia', example: 'She departed this life peacefully.', exampleId: 'Dia meninggal dunia dengan tenang.'),
  IdiomItem(phrase: 'get a life', meaning: 'lakukan hal yang lebih baik', example: 'Just get a life and stop complaining!', exampleId: 'Lakukan hal yang lebih baik dan berhenti抱怨!'),
  IdiomItem(phrase: 'life and death', meaning: 'sangat penting', example: 'This is a matter of life and death.', exampleId: 'Ini adalah masalah hidup dan mati.'),
  IdiomItem(phrase: 'life goes on', meaning: 'hidup berlanjut', example: 'Life goes on, no matter what.', exampleId: 'Hidup berlanjut, apapun yang terjadi.'),
  IdiomItem(phrase: 'life in the fast lane', meaning: 'hidup serba cepat', example: 'She enjoys life in the fast lane.', exampleId: 'Dia menikmati hidup serba cepat.'),
  IdiomItem(phrase: 'life of the party', meaning: 'pusat perhatian', example: 'He is always the life of the party.', exampleId: 'Dia selalu menjadi pusat perhatian di pesta.'),
  IdiomItem(phrase: 'matter of life and death', meaning: 'hal yang sangat serius', example: 'This is a matter of life and death.', exampleId: 'Ini adalah hal yang sangat serius.'),
  IdiomItem(phrase: 'one shot at life', meaning: 'sekali kesempatan', example: 'You only have one shot at life.', exampleId: 'Kamu hanya punya sekali kesempatan dalam hidup.'),
  IdiomItem(phrase: 'take one\'s life', meaning: 'membunuh', example: 'He tried to take his own life.', exampleId: 'Dia mencoba bunuh diri.'),
  IdiomItem(phrase: 'the life of Riley', meaning: 'hidup mewah', example: 'He lives the life of Riley.', exampleId: 'Dia hidup mewah.'),
  IdiomItem(phrase: 'to the life', meaning: 'sangat mirip', example: 'She described the event to the life.', exampleId: 'Dia menggambarkan peristiwa itu dengan sangat mirip.'),
  IdiomItem(phrase: 'come to life', meaning: 'menjadi hidup', example: 'The story came to life in the movie.', exampleId: 'Cerita itu menjadi hidup di film.'),
  IdiomItem(phrase: 'for life', meaning: 'seumur hidup', example: 'They became friends for life.', exampleId: 'Mereka menjadi teman seumur hidup.'),
  IdiomItem(phrase: 'have the time of your life', meaning: 'senang sekali', example: 'I had the time of my life at the party.', exampleId: 'Saya sangat senang di pesta itu.'),
  IdiomItem(phrase: 'lay down one\'s life', meaning: 'berkorban untuk', example: 'He laid down his life for his country.', exampleId: 'Dia berkorban untuk negaranya.'),
  IdiomItem(phrase: 'take your life in your hands', meaning: 'berbahaya', example: 'Driving without a seatbelt takes your life in your hands.', exampleId: 'Berkendara tanpa sabuk pengaman sangat berbahaya.'),
];

// EMOTIONS IDIOMS
const List<IdiomItem> _emotionIdioms = [
  IdiomItem(phrase: 'over the moon', meaning: 'sangat bahagia', example: 'She was over the moon about her promotion.', exampleId: 'Dia sangat bahagia dengan promosiya.'),
  IdiomItem(phrase: 'on cloud nine', meaning: 'sangat bahagia', example: 'He is on cloud nine after winning.', exampleId: 'Dia sangat bahagia setelah menang.'),
  IdiomItem(phrase: 'break one\'s heart', meaning: 'menyakiti hati', example: 'It breaks my heart to see you sad.', exampleId: 'Hatiku sakit melihatmu sedih.'),
  IdiomItem(phrase: 'burst into tears', meaning: 'menangis tiba-tiba', example: 'She burst into tears when she heard the news.', exampleId: 'Dia menangis tiba-tiba mendengar berita itu.'),
  IdiomItem(phrase: 'cry over spilled milk', meaning: 'menyesali yang sudah terjadi', example: 'Do not cry over spilled milk.', exampleId: 'Jangan menyesali yang sudah terjadi.'),
  IdiomItem(phrase: 'down in the dumps', meaning: 'sedih, murung', example: 'He has been down in the dumps lately.', exampleId: 'Dia sudah murung akhir-akhir ini.'),
  IdiomItem(phrase: 'on top of the world', meaning: 'merasa hebat', example: 'I feel on top of the world today.', exampleId: 'Saya merasa hebat hari ini.'),
  IdiomItem(phrase: 'tickled pink', meaning: 'sangat senang', example: 'She was tickled pink by the gift.', exampleId: 'Dia sangat senang dengan hadiah itu.'),
  IdiomItem(phrase: 'heart in one\'s mouth', meaning: 'sangat tegang', example: 'My heart was in my mouth during the exam.', exampleId: 'Saya sangat tegang saat ujian.'),
  IdiomItem(phrase: 'keep your chin up', meaning: 'tetap semangat', example: 'Keep your chin up, things will get better.', exampleId: 'Tetap semangat, keadaan akan membaik.'),
  IdiomItem(phrase: 'let off steam', meaning: 'melampiaskan emosi', example: 'He needs to let off some steam.', exampleId: 'Dia perlu melampiaskan emosi.'),
  IdiomItem(phrase: 'lose heart', meaning: 'kehilangan semangat', example: 'Do not lose heart, you can do it!', exampleId: 'Jangan kehilangan semangat, kamu bisa!'),
  IdiomItem(phrase: 'out of sorts', meaning: 'marah, tidak nyaman', example: 'I am feeling out of sorts today.', exampleId: 'Saya merasa tidak nyaman hari ini.'),
  IdiomItem(phrase: 'pull at one\'s heartstrings', meaning: 'menyentuh hati', example: 'The movie pulled at my heartstrings.', exampleId: 'Film itu menyentuh hatiku.'),
  IdiomItem(phrase: 'shed tears', meaning: 'menangis', example: 'She shed tears of joy.', exampleId: 'Dia menangis bahagia.'),
  IdiomItem(phrase: 'sick as a parrot', meaning: 'kecewa', example: 'I was sick as a parrot when I failed the test.', exampleId: 'Saya sangat kecewa saat gagal ujian.'),
  IdiomItem(phrase: 'sick to one\'s stomach', meaning: 'mual, tidak suka', example: 'I was sick to my stomach with worry.', exampleId: 'Saya merasa mual karena khawatir.'),
  IdiomItem(phrase: 'snap out of it', meaning: 'ubah perasaan', example: 'Snap out of it and be positive!', exampleId: 'Ubah perasaanmu dan jadi positif!'),
  IdiomItem(phrase: 'wear your heart on your sleeve', meaning: 'terbuka perasaan', example: 'She wears her heart on her sleeve.', exampleId: 'Dia terbuka tentang perasaannya.'),
  IdiomItem(phrase: 'hit the roof', meaning: 'sangat marah', example: 'My dad hit the roof when he saw the bill.', exampleId: 'Ayahku sangat marah melihat tagihan itu.'),
];

// SUCCESS & FAILURE IDIOMS
const List<IdiomItem> _successIdioms = [
  IdiomItem(phrase: 'break a leg', meaning: 'semoga berhasil!', example: 'Break a leg in your performance!', exampleId: 'Semoga berhasil di pentasmu!'),
  IdiomItem(phrase: 'rise and shine', meaning: 'bangun dan bersinar', example: 'Rise and shine! It is a new day!', exampleId: 'Bangun dan bersinar! Hari baru!'),
  IdiomItem(phrase: 'hit the jackpot', meaning: 'mendapat keberuntungan besar', example: 'We hit the jackpot with this deal.', exampleId: 'Kami mendapat keberuntungan besar dalam kesepakatan ini.'),
  IdiomItem(phrase: 'crown one\'s efforts', meaning: 'memahkotai usaha', example: 'The award crowned his efforts.', exampleId: 'Penghargaan itu memahkotai usahanya.'),
  IdiomItem(phrase: 'dream come true', meaning: 'impian menjadi kenyataan', example: 'Winning the championship was a dream come true.', exampleId: 'Memenangkan kejuaraan adalah impian yang menjadi kenyataan.'),
  IdiomItem(phrase: 'fall flat', meaning: 'gagal total', example: 'His joke fell flat.', exampleId: 'Olokannya gagal total.'),
  IdiomItem(phrase: 'go places', meaning: 'akan sukses', example: 'That young man is going places.', exampleId: 'Pria muda itu akan sukses.'),
  IdiomItem(phrase: 'make a go of it', meaning: 'berusaha berhasil', example: 'Let us make a go of this business.', exampleId: 'Mari kita coba bisnis ini berhasil.'),
  IdiomItem(phrase: 'make it big', meaning: 'berhasil besar', example: 'She made it big in Hollywood.', exampleId: 'Dia berhasil besar di Hollywood.'),
  IdiomItem(phrase: 'on the road to success', meaning: 'di jalan sukses', example: 'He is on the road to success.', exampleId: 'Dia di jalan sukses.'),
  IdiomItem(phrase: 'pull it off', meaning: 'berhasil melakukan', example: 'No one thought he could do it, but he pulled it off.', exampleId: 'Tidak ada yang menyangka dia bisa, tapi dia berhasil.'),
  IdiomItem(phrase: 'the sky is the limit', meaning: 'tanpa batas', example: 'With your talent, the sky is the limit.', exampleId: 'Dengan bakatmu, tidak ada batas.'),
  IdiomItem(phrase: 'turn over a new leaf', meaning: 'mulai baru', example: 'He decided to turn over a new leaf.', exampleId: 'Dia memutuskan untuk mulai hidup baru.'),
  IdiomItem(phrase: 'win the day', meaning: 'sukses', example: 'Our team won the day.', exampleId: 'Tim kita sukses.'),
  IdiomItem(phrase: 'win hands down', meaning: 'sukses mudah', example: 'She won the competition hands down.', exampleId: 'Dia menang kompetisi dengan mudah.'),
  IdiomItem(phrase: 'go to one\'s head', meaning: 'sombong', example: 'Success went to his head.', exampleId: 'Keberhasilan membuatnya sombong.'),
  IdiomItem(phrase: 'learn the ropes', meaning: 'belajar dasar', example: 'It took her months to learn the ropes.', exampleId: 'Dia butuh berbulan-bulan untuk belajar dasar.'),
  IdiomItem(phrase: 'lose the plot', meaning: 'kehilangan arah', example: 'When stressed, he loses the plot.', exampleId: 'Saat stres, dia kehilangan arah.'),
  IdiomItem(phrase: 'miss the boat', meaning: 'terlambat', example: 'If you do not apply now, you will miss the boat.', exampleId: 'Jika tidak apply sekarang, kamu akan terlewat.'),
  IdiomItem(phrase: 'not give up', meaning: 'tidak menyerah', example: 'Never give up on your dreams.', exampleId: 'Jangan pernah menyerah pada mimpimu.'),
];

// TRAVEL & DIRECTIONS IDIOMS
const List<IdiomItem> _travelIdioms = [
  IdiomItem(phrase: 'back and forth', meaning: 'pulang pergi', example: 'The shuttle runs back and forth.', exampleId: 'Shuttle berjalan pulang pergi.'),
  IdiomItem(phrase: 'backseat driver', meaning: 'perNAH ikut campur', example: 'Stop being a backseat driver!', exampleId: 'Berhenti ikut campur!'),
  IdiomItem(phrase: 'by the way', meaning: 'omong-omong', example: 'By the way, did you finish the report?', exampleId: 'Omong-omong, apakah kamu selesai laporan?'),
  IdiomItem(phrase: 'come and go', meaning: 'datang dan pergi', example: 'Fashion trends come and go.', exampleId: 'Tren fashion datang dan pergi.'),
  IdiomItem(phrase: 'cover ground', meaning: 'menempuh jarak', example: 'We covered a lot of ground today.', exampleId: 'Kita menempuh jarak yang jauh hari ini.'),
  IdiomItem(phrase: 'get around', meaning: 'keliling, menyebar', example: 'It is easy to get around the city.', exampleId: 'Mudah keliling kota ini.'),
  IdiomItem(phrase: 'get lost', meaning: 'tersesat', example: 'Do not get lost in the forest.', exampleId: 'Jangan tersesat di hutan.'),
  IdiomItem(phrase: 'head over heels', meaning: 'terbalik, jatuh cinta', example: 'He fell head over heels for her.', exampleId: 'Dia jatuh cinta padanya.'),
  IdiomItem(phrase: 'hit the road', meaning: 'berangkat', example: 'It is time to hit the road.', exampleId: 'Waktunya berangkat.'),
  IdiomItem(phrase: 'in the middle of nowhere', meaning: 'di tempat terpencil', example: 'The village is in the middle of nowhere.', exampleId: 'Desa itu di tempat terpencil.'),
  IdiomItem(phrase: 'just around the corner', meaning: 'dekat sekali', example: 'Success is just around the corner.', exampleId: 'Sukses sudah sangat dekat.'),
  IdiomItem(phrase: 'off the beaten track', meaning: 'tidak umum, terpencil', example: 'They found an off the beaten track restaurant.', exampleId: 'Mereka menemukan restoran yang tidak umum.'),
  IdiomItem(phrase: 'on the way', meaning: 'dalam perjalanan', example: 'I am on the way to the station.', exampleId: 'Saya dalam perjalanan ke stasiun.'),
  IdiomItem(phrase: 'out of the way', meaning: 'tidak mengganggu', example: 'Get out of the way!', exampleId: 'Keling dari jalan!'),
  IdiomItem(phrase: 'stop over', meaning: 'berhenti sebentar', example: 'We will stop over in Singapore.', exampleId: 'Kita akan berhenti sebentar di Singapura.'),
  IdiomItem(phrase: 'the wrong way', meaning: 'arah yang salah', example: 'You are going the wrong way!', exampleId: 'Kamu salah arah!'),
  IdiomItem(phrase: 'up and running', meaning: 'beroperasi', example: 'The new system is up and running.', exampleId: 'Sistem baru sudah beroperasi.'),
  IdiomItem(phrase: 'upside down', meaning: 'terbalik', example: 'The car was turned upside down.', exampleId: 'Mobil itu terbalik.'),
  IdiomItem(phrase: 'wrong turn', meaning: 'belok salah', example: 'We took a wrong turn.', exampleId: 'Kita belok salah.'),
  IdiomItem(phrase: 'around the world', meaning: 'keliling dunia', example: 'She dreamed of traveling around the world.', exampleId: 'Dia bermimpi keliling dunia.'),
];

// HEALTH IDIOMS
const List<IdiomItem> _healthIdioms = [
  IdiomItem(phrase: 'as fit as a fiddle', meaning: 'sehat bugar', example: 'My grandmother is as fit as a fiddle.', exampleId: 'Nenekku sehat bugar.'),
  IdiomItem(phrase: 'feel under the weather', meaning: 'tidak sehat', example: 'I am feeling under the weather today.', exampleId: 'Saya merasa tidak sehat hari ini.'),
  IdiomItem(phrase: 'get over an illness', meaning: 'sembuh dari sakit', example: 'She finally got over her illness.', exampleId: 'Dia akhirnya sembuh dari sakitnya.'),
  IdiomItem(phrase: 'in good health', meaning: 'sehat', example: 'My parents are in good health.', exampleId: 'Orang tua saya sehat.'),
  IdiomItem(phrase: 'in the pink', meaning: 'sangat sehat', example: 'He looks in the pink of health.', exampleId: 'Dia terlihat sangat sehat.'),
  IdiomItem(phrase: 'on the mend', meaning: 'membaik', example: 'My cold is on the mend.', exampleId: 'Flu saya mulai membaik.'),
  IdiomItem(phrase: 'out of sorts', meaning: 'tidak sehat', example: 'I am feeling out of sorts.', exampleId: 'Saya merasa tidak enak badan.'),
  IdiomItem(phrase: 'pale as a ghost', meaning: 'sangat pucat', example: 'He looked pale as a ghost.', exampleId: 'Dia terlihat sangat pucat.'),
  IdiomItem(phrase: 'rough around the edges', meaning: 'kurang sehat', example: 'He is looking a bit rough around the edges.', exampleId: 'Dia terlihat kurang sehat.'),
  IdiomItem(phrase: 'sick as a dog', meaning: 'sangat sakit', example: 'I was sick as a dog after the food.', exampleId: 'Saya sangat sakit setelah memakan itu.'),
  IdiomItem(phrase: 'sleep it off', meaning: 'tidur sampai sembuh', example: 'Just sleep it off and you will feel better.', exampleId: 'Tidur saja dan kamu akan merasa lebih baik.'),
  IdiomItem(phrase: 'under the weather', meaning: 'tidak sehat', example: 'She has been under the weather all week.', exampleId: 'Dia tidak sehat sepanjang minggu.'),
  IdiomItem(phrase: 'well in the bone', meaning: 'sehat secara umum', example: 'Health is in the bone for her family.', exampleId: 'Kesehatan ada di keluarga kami.'),
  IdiomItem(phrase: 'bounce back', meaning: 'sembuh dengan cepat', example: 'She bounced back quickly from her surgery.', exampleId: 'Dia sembuh dengan cepat dari operasinya.'),
  IdiomItem(phrase: 'broken health', meaning: 'kesehatan buruk', example: 'His broken health worried his family.', exampleId: 'Kesehatan buruknya mengkhawatirkan keluarganya.'),
  IdiomItem(phrase: 'good for what ails you', meaning: 'baik untuk kesehatan', example: 'Chicken soup is good for what ails you.', exampleId: 'Sup ayam baik untuk kesehatan.'),
  IdiomItem(phrase: 'hale and hearty', meaning: 'sehat dan kuat', example: 'Despite his age, he is hale and hearty.', exampleId: 'Meskipun tua, dia sehat dan kuat.'),
  IdiomItem(phrase: 'in fine fettle', meaning: 'sehat bugar', example: 'The horse is in fine fettle for the race.', exampleId: 'Kuda itu bugar untuk balap.'),
  IdiomItem(phrase: 'not a well person', meaning: 'orang sakit', example: 'He has been not a well person for years.', exampleId: 'Dia sudah sakit selama bertahun-tahun.'),
  IdiomItem(phrase: 'right as rain', meaning: 'sembuh, baik', example: 'A good night\'s sleep will make you right as rain.', exampleId: 'Tidur yang cukup akan membuatmu sembuh.'),
];

// WEATHER IDIOMS
const List<IdiomItem> _weatherIdioms = [
  IdiomItem(phrase: 'a storm in a teacup', meaning: 'masalah kecil yang dibesar-besarkan', example: 'Their argument was just a storm in a teacup.', exampleId: 'Pertengkaran mereka hanya masalah kecil.'),
  IdiomItem(phrase: 'rain cats and dogs', meaning: 'hujan sangat lebat', example: 'It rained cats and dogs last night.', exampleId: 'Hujan sangat lebat semalam.'),
  IdiomItem(phrase: 'save it for a rainy day', meaning: 'menabung untuk mendesak', example: 'Put some money aside for a rainy day.', exampleId: 'Sisihkan uang untuk hari yang sulit.'),
  IdiomItem(phrase: 'under the weather', meaning: 'tidak sehat', example: 'I am feeling under the weather.', exampleId: 'Saya merasa tidak sehat.'),
  IdiomItem(phrase: 'weather the storm', meaning: 'bertahan dalam kesulitan', example: 'We will weather the storm together.', exampleId: 'Kita akan bertahan bersama dalam kesulitan.'),
  IdiomItem(phrase: 'after the storm comes the calm', meaning: 'setelah kesulitan ada ketenangan', example: 'Remember, after the storm comes the calm.', exampleId: 'Ingat, setelah kesulitan ada ketenangan.'),
  IdiomItem(phrase: 'chase rainbows', meaning: 'bermimpi tidak realistis', example: 'Stop chasing rainbows and be realistic.', exampleId: 'Berhenti bermimpi tidak realistis.'),
  IdiomItem(phrase: 'come rain or shine', meaning: 'apatah pun keadaannya', example: 'I will be there come rain or shine.', exampleId: 'Saya akan ada di sana apatah pun keadaannya.'),
  IdiomItem(phrase: 'every cloud has a silver lining', meaning: 'setiap kesulitan ada manfaatnya', example: 'Every cloud has a silver lining.', exampleId: 'Setiap kesulitan ada manfaatnya.'),
  IdiomItem(phrase: 'head in the clouds', meaning: 'tidak fokus, melamun', example: 'His head is always in the clouds.', exampleId: 'Dia selalu melamun.'),
  IdiomItem(phrase: 'in the eye of the storm', meaning: 'di pusat masalah', example: 'She found herself in the eye of the storm.', exampleId: 'Dia ada di pusat masalah.'),
  IdiomItem(phrase: 'it never rains but it pours', meaning: 'satu masalah Followed by more', example: 'It never rains but it pours in my life.', exampleId: 'Masalah selalu bertubi-tubi dalam hidupku.'),
  IdiomItem(phrase: 'let it rain', meaning: 'biarkan terjadi', example: 'Let it rain, we have umbrellas.', exampleId: 'Biarkan hujan, kita punya payung.'),
  IdiomItem(phrase: 'make it rain', meaning: 'berbanyak mengeluarkan uang', example: 'He likes to make it rain at clubs.', exampleId: 'Dia sukaroyally mengeluarkan uang di klub.'),
  IdiomItem(phrase: 'on cloud nine', meaning: 'sangat bahagia', example: 'She has been on cloud nine since the news.', exampleId: 'Dia sangat bahagia sejak berita itu.'),
  IdiomItem(phrase: 'rain on someone\'s parade', meaning: 'menghancurkan suasana', example: 'Do not rain on my parade!', exampleId: 'Jangan menghancurkan suasana kotaku!'),
  IdiomItem(phrase: 'rain or shine', meaning: 'dalam keadaan apapun', example: 'The event will happen rain or shine.', exampleId: 'Acara akan diadakan dalam keadaan apapun.'),
  IdiomItem(phrase: 'snowed under', meaning: 'sangat sibuk', example: 'I am snowed under with work.', exampleId: 'Saya sangat sibuk dengan pekerjaan.'),
  IdiomItem(phrase: 'storm in a teacup', meaning: 'masalah remeh', example: 'This controversy is just a storm in a teacup.', exampleId: 'Kontroversi ini hanya masalah remeh.'),
  IdiomItem(phrase: 'take a rain check', meaning: 'menunda', example: 'Can I take a rain check on that?', exampleId: 'Bisa saya tunda?'),
];

// ANIMAL IDIOMS
const List<IdiomItem> _animalIdioms = [
  IdiomItem(phrase: 'a bird in the hand', meaning: 'yang sudah dimiliki', example: 'A bird in the hand is worth two in the bush.', exampleId: 'Yang sudah dimiliki lebih baik daripada yang belum.'),
  IdiomItem(phrase: 'a piece of cake', meaning: 'sangat mudah', example: 'The test was a piece of cake.', exampleId: 'Ujian itu sangat mudah.'),
  IdiomItem(phrase: 'the early bird catches the worm', meaning: 'yang duluan lebih baik', example: 'Wake up early, the early bird catches the worm.', exampleId: 'Bangun pagi, yang duluan lebih baik.'),
  IdiomItem(phrase: 'let the cat out of the bag', meaning: 'membocorkan rahasia', example: 'I accidentally let the cat out of the bag.', exampleId: 'Saya tidak sengaja membocorkan rahasia.'),
  IdiomItem(phrase: 'like a fish out of water', meaning: 'merasa tidak nyaman', example: 'I felt like a fish out of water at the party.', exampleId: 'Saya merasa tidak nyaman di pesta itu.'),
  IdiomItem(phrase: 'the rat race', meaning: 'persaingan hidup', example: 'Everyone is caught up in the rat race.', exampleId: 'Semua terjebak dalam persaingan hidup.'),
  IdiomItem(phrase: 'wild goose chase', meaning: 'perburuan sia-sia', example: 'The investigation was a wild goose chase.', exampleId: 'Penyelidikan itu sia-sia.'),
  IdiomItem(phrase: 'beating around the bush', meaning: 'tidak langsung ke inti', example: 'Stop beating around the bush and tell me!', exampleId: 'Berhenti berbelit-belit dan katakan!'),
  IdiomItem(phrase: 'a different kettle of fish', meaning: 'hal yang berbeda', example: 'This problem is a different kettle of fish.', exampleId: 'Masalah ini berbeda.'),
  IdiomItem(phrase: 'a fly on the wall', meaning: 'pengamat diam-diam', example: 'I wish I was a fly on the wall.', exampleId: 'Saya berharap bisa melihat secara diam-diam.'),
  IdiomItem(phrase: 'a sitting duck', meaning: 'target mudah', example: 'Without protection, they were a sitting duck.', exampleId: 'Tanpa perlindungan, mereka adalah target mudah.'),
  IdiomItem(phrase: 'ants in your pants', meaning: 'tidak bisa diam', example: 'He has ants in his pants today.', exampleId: 'Dia tidak bisa diam hari ini.'),
  IdiomItem(phrase: 'bird\'s eye view', meaning: 'pandangan dari atas', example: 'From the top, we had a bird\'s eye view of the city.', exampleId: 'Dari atas, kita punya pemandangan kota.'),
  IdiomItem(phrase: 'crocodile tears', meaning: 'air mata palsu', example: 'His apology was just crocodile tears.', exampleId: 'Permintaannya maaf hanya air mata palsu.'),
  IdiomItem(phrase: 'dog eat dog', meaning: 'sangat kompetitif', example: 'It is a dog eat dog world out there.', exampleId: 'Dunia ini sangat kompetitif.'),
  IdiomItem(phrase: 'eagle eye', meaning: 'penglihatan tajam', example: 'She has an eagle eye for details.', exampleId: 'Dia punya penglihatan tajam untuk detail.'),
  IdiomItem(phrase: 'fish for compliments', meaning: 'minta dipuji', example: 'He is always fishing for compliments.', exampleId: 'Dia selalu minta dipuji.'),
  IdiomItem(phrase: 'get your goat', meaning: 'menjengkelkan', example: 'That noise really gets my goat.', exampleId: 'Kebisingan itu benar-benar menjengkelkan.'),
  IdiomItem(phrase: 'hold your horses', meaning: 'tunggu dulu', example: 'Hold your horses, we need to think!', exampleId: 'Tunggu dulu, kita perlu berpikir!'),
  IdiomItem(phrase: 'horse around', meaning: 'bermain kasar', example: 'The boys were horsing around in the yard.', exampleId: 'Anak-anak itu bermain kasar di halaman.'),
];

// FOOD & EATING IDIOMS
const List<IdiomItem> _foodIdioms = [
  IdiomItem(phrase: 'a piece of cake', meaning: 'sangat mudah', example: 'The exam was a piece of cake.', exampleId: 'Ujian itu sangat mudah.'),
  IdiomItem(phrase: 'spill the beans', meaning: 'membocorkan rahasia', example: 'Who spilled the beans about the surprise?', exampleId: 'Siapa yang membocorkan rahasia tentang kejutan?'),
  IdiomItem(phrase: 'bring home the bacon', meaning: 'mencari nafkah', example: 'He works hard to bring home the bacon.', exampleId: 'Dia bekerja keras untuk mencari nafkah.'),
  IdiomItem(phrase: 'cakewalk', meaning: 'sangat mudah', example: 'The job was a cakewalk for him.', exampleId: 'Pekerjaan itu sangat mudah baginya.'),
  IdiomItem(phrase: 'couch potato', meaning: 'orang yang tidak aktif', example: 'He is a couch potato who watches TV all day.', exampleId: 'Dia pemalas yang menonton TV seharian.'),
  IdiomItem(phrase: 'fish out of water', meaning: 'tidak di lingkungan sendiri', example: 'I felt like a fish out of water at the formal dinner.', exampleId: 'Saya merasa tidak nyaman di acara formal itu.'),
  IdiomItem(phrase: 'in a nutshell', meaning: 'dalam singkat', example: 'To put it in a nutshell, we failed.', exampleId: 'Singkatnya, kita gagal.'),
  IdiomItem(phrase: 'nutshell', meaning: 'ringkasan', example: 'Can you give me the answer in a nutshell?', exampleId: 'Bisakah kamu berikan jawabannya secara singkat?'),
  IdiomItem(phrase: 'peanut', meaning: 'sedikit sekali (uang)', example: 'That salary is just peanuts.', exampleId: 'Gaji itu hanya sedikit sekali.'),
  IdiomItem(phrase: 'pot calling the kettle black', meaning: 'menyalahkan orang lain padahal diri sendiri', example: 'He criticized her, which is the pot calling the kettle black.', exampleId: 'Dia mencelanya, tapi sebenarnya dia juga sama.'),
  IdiomItem(phrase: 'take with a grain of salt', meaning: 'tidak percaya sepenuhnya', example: 'You should take his promises with a grain of salt.', exampleId: 'Kamu tidak boleh percaya sepenuhnya pada janjinya.'),
  IdiomItem(phrase: 'the apple of my eye', meaning: 'orang yang sangat dicintai', example: 'My daughter is the apple of my eye.', exampleId: 'Putri saya adalah segala-galanya bagi saya.'),
  IdiomItem(phrase: 'the Big Apple', meaning: 'New York City', example: 'I want to visit the Big Apple someday.', exampleId: 'Saya ingin kunjungi New York suatu saat.'),
  IdiomItem(phrase: 'the best thing since sliced bread', meaning: 'sesuatu yang hebat', example: 'This app is the best thing since sliced bread.', exampleId: 'Aplikasi ini sangat hebat.'),
  IdiomItem(phrase: 'top banana', meaning: 'orang paling penting', example: 'He is the top banana in this company.', exampleId: 'Dia orang paling penting di perusahaan ini.'),
  IdiomItem(phrase: 'bread and butter', meaning: 'penghasilan utama', example: 'Teaching is my bread and butter.', exampleId: 'Mengajar adalah sumber penghasilan utama saya.'),
  IdiomItem(phrase: 'butterflies in stomach', meaning: 'sangat gugup', example: 'I had butterflies in my stomach before the interview.', exampleId: 'Saya sangat gugup sebelum wawancara.'),
  IdiomItem(phrase: 'cannot make an omelet without breaking eggs', meaning: 'untuk sukses perlu pengorbanan', example: 'You cannot make an omelet without breaking eggs.', exampleId: 'Untuk sukses perlu pengorbanan.'),
  IdiomItem(phrase: 'cry over spilled milk', meaning: 'menyesali yang sudah terjadi', example: 'There is no point crying over spilled milk.', exampleId: 'Tidak ada gunanya menyesali yang sudah terjadi.'),
  IdiomItem(phrase: 'easy as pie', meaning: 'sangat mudah', example: 'The recipe is easy as pie.', exampleId: 'Resepnya sangat mudah.'),
];

// WORK & BUSINESS IDIOMS
const List<IdiomItem> _workIdioms = [
  IdiomItem(phrase: 'bite the bullet', meaning: 'menghadapi dengan berani', example: 'You have to bite the bullet and tell the truth.', exampleId: 'Kamu harus menghadapi kenyataan dan bicara jujur.'),
  IdiomItem(phrase: 'burn the midnight oil', meaning: 'bekerja lembur', example: 'She burned the midnight oil to finish the project.', exampleId: 'Dia kerja lembur untuk menyelesaikan proyek.'),
  IdiomItem(phrase: 'climb the ladder', meaning: 'naik jabatan', example: 'He is climbing the ladder of success.', exampleId: 'Dia naik jabatan.'),
  IdiomItem(phrase: 'face the music', meaning: 'menghadapi konsekuensi', example: 'It is time to face the music.', exampleId: 'Saat nya menghadapi konsekuensi.'),
  IdiomItem(phrase: 'get down to business', meaning: 'mulai bekerja serius', example: 'Let us get down to business.', exampleId: 'Mari kita mulai bekerja.'),
  IdiomItem(phrase: 'give someone a hand', meaning: 'membantu', example: 'Can you give me a hand with this?', exampleId: 'Bisakah kamu bantu saya dengan ini?'),
  IdiomItem(phrase: 'go the extra mile', meaning: 'berusaha lebih keras', example: 'Always go the extra mile for customers.', exampleId: 'Selalu berusaha lebih keras untuk pelanggan.'),
  IdiomItem(phrase: 'hit the nail on the head', meaning: 'tepat sekali', example: 'You hit the nail on the head with that answer.', exampleId: 'Jawabanmu sangat tepat.'),
  IdiomItem(phrase: 'in the bag', meaning: 'sudah pasti berhasil', example: 'The deal is in the bag.', exampleId: 'Kesepakatan itu sudah di tangan.'),
  IdiomItem(phrase: 'keep your nose to the grindstone', meaning: 'rajin bekerja', example: 'Keep your nose to the grindstone and you will succeed.', exampleId: 'Tetap rajin bekerja dan kamu akan sukses.'),
  IdiomItem(phrase: 'let go', meaning: 'memberhentikan', example: 'The company had to let go of some employees.', exampleId: 'Perusahaan harus memberhentikan beberapa karyawan.'),
  IdiomItem(phrase: 'make ends meet', meaning: 'cukup uang untuk hidup', example: 'It is hard to make ends meet on a minimum wage.', exampleId: 'Sulit hidup dengan gaji minimum.'),
  IdiomItem(phrase: 'on the ball', meaning: 'awas, cepat tanggap', example: 'She is always on the ball at work.', exampleId: 'Dia selalu cepat tanggap di tempat kerja.'),
  IdiomItem(phrase: 'pull your weight', meaning: 'berusaha sebaik mungkin', example: 'Everyone needs to pull their weight.', exampleId: 'Semua orang harus berusaha sebaik mungkin.'),
  IdiomItem(phrase: 'step up', meaning: 'berpartisipasi lebih', example: 'It is time to step up and take responsibility.', exampleId: 'Saat nya untuk ambil tanggung jawab lebih.'),
  IdiomItem(phrase: 'take the bull by the horns', meaning: 'menghadapi masalah langsung', example: 'You need to take the bull by the horns.', exampleId: 'Kamu perlu hadapi masalah langsung.'),
  IdiomItem(phrase: 'up to par', meaning: 'standar yang diharapkan', example: 'His work is not up to par.', exampleId: 'Pekerjaannya tidak sesuai standar.'),
  IdiomItem(phrase: 'well done', meaning: 'pekerjaan bagus', example: 'Well done! You exceeded expectations.', exampleId: 'Bagus! Kamu melebihi ekspektasi.'),
  IdiomItem(phrase: 'work like a charm', meaning: 'berhasil sempurna', example: 'The solution worked like a charm.', exampleId: 'Solusi itu berhasil sempurna.'),
  IdiomItem(phrase: 'zero in on', meaning: 'fokus pada', example: 'Let us zero in on the main problem.', exampleId: 'Mari fokus pada masalah utama.'),
];

// EDUCATION IDIOMS
const List<IdiomItem> _educationIdioms = [
  IdiomItem(phrase: 'learn by heart', meaning: 'menghafal', example: 'Students need to learn this poem by heart.', exampleId: 'Siswa perlu hafal puisi ini.'),
  IdiomItem(phrase: 'learn the ropes', meaning: 'belajar dasar', example: 'It takes time to learn the ropes.', exampleId: 'Butuh waktu untuk belajar dasar.'),
  IdiomItem(phrase: 'read between the lines', meaning: 'memahami makna tersembunyi', example: 'You need to read between the lines.', exampleId: 'Kamu perlu memahami makna tersembunyi.'),
  IdiomItem(phrase: 'the three R\'s', meaning: 'membaca, menulis, berhitung', example: 'Education focuses on the three R\'s.', exampleId: 'Pendidikan fokus pada kemampuan dasar.'),
  IdiomItem(phrase: 'hit the books', meaning: 'belajar keras', example: 'I need to hit the books for the exam.', exampleId: 'Saya perlu belajar keras untuk ujian.'),
  IdiomItem(phrase: 'book smart', meaning: 'pintar secara teori', example: 'He is book smart but lacks street smarts.', exampleId: 'Dia pintar teori tapi kurang praktis.'),
  IdiomItem(phrase: 'cram for an exam', meaning: 'belajar mati-matian sebelum ujian', example: 'I had to cram for the exam.', exampleId: 'Saya harus belajar mati-matian untuk ujian.'),
  IdiomItem(phrase: 'draw a blank', meaning: 'tidak ingat', example: 'I drew a blank during the test.', exampleId: 'Saya tidak ingat saat ujian.'),
  IdiomItem(phrase: 'fresh out of school', meaning: 'baru lulus', example: 'He is fresh out of school and eager to work.', exampleId: 'Dia baru lulus dan bersemangat kerja.'),
  IdiomItem(phrase: 'get an education', meaning: 'mendapat pendidikan', example: 'Every child deserves to get an education.', exampleId: 'Setiap anak layak mendapat pendidikan.'),
  IdiomItem(phrase: 'know something inside out', meaning: 'menguasai sepenuhnya', example: 'She knows the subject inside out.', exampleId: 'Dia menguasai subjek sepenuhnya.'),
  IdiomItem(phrase: 'learn something the hard way', meaning: 'belajar dari kesalahan', example: 'I learned the hard way.', exampleId: 'Saya belajar dari kesalahan sendiri.'),
  IdiomItem(phrase: 'pick up quickly', meaning: 'belajar dengan cepat', example: 'She picks up languages quickly.', exampleId: 'Dia cepat belajar bahasa.'),
  IdiomItem(phrase: 'school of hard knocks', meaning: 'pelajaran dari pengalaman hidup', example: 'He learned from the school of hard knocks.', exampleId: 'Dia belajar dari pengalaman hidup.'),
  IdiomItem(phrase: 'slack off', meaning: 'malas, tidak serius', example: 'Do not slack off in school.', exampleId: 'Jangan mal-mal di sekolah.'),
  IdiomItem(phrase: 'study hall', meaning: 'waktu belajar mandiri', example: 'I have study hall in the afternoon.', exampleId: 'Saya punya waktu belajar mandiri di sore hari.'),
  IdiomItem(phrase: 'the grade', meaning: 'hasil yang diharapkan', example: 'She always makes the grade.', exampleId: 'Dia selalu mendapat hasil bagus.'),
  IdiomItem(phrase: 'think outside the box', meaning: 'berpikir kreatif', example: 'You need to think outside the box.', exampleId: 'Kamu perlu berpikir kreatif.'),
  IdiomItem(phrase: 'write on the wall', meaning: 'tanda-tanda kegagalan', example: 'The signs were written on the wall.', exampleId: 'Tanda-tanda kegagalan sudah jelas.'),
  IdiomItem(phrase: 'roll with the punches', meaning: 'menyesuaikan diri', example: 'You have to learn to roll with the punches.', exampleId: 'Kamu perlu belajar menyesuaikan diri.'),
];

// RELATIONSHIPS IDIOMS
const List<IdiomItem> _relationshipIdioms = [
  IdiomItem(phrase: 'fall head over heels', meaning: 'jatuh cinta dalam', example: 'They fell head over heels for each other.', exampleId: 'Mereka saling jatuh cinta dalam.'),
  IdiomItem(phrase: 'puppy love', meaning: 'cinta anak-anak', example: 'It was just puppy love at first sight.', exampleId: 'Itu hanya cinta anak-anak.'),
  IdiomItem(phrase: 'soul mate', meaning: 'jodoh', example: 'I believe she is my soul mate.', exampleId: 'Saya yakin dia jodoh saya.'),
  IdiomItem(phrase: 'tie the knot', meaning: 'menikah', example: 'They decided to tie the knot last year.', exampleId: 'Mereka menikah tahun lalu.'),
  IdiomItem(phrase: 'get on like a house on fire', meaning: 'langsung akrab', example: 'The two kids got on like a house on fire.', exampleId: 'Dua anak itu langsung akrab.'),
  IdiomItem(phrase: 'have a lot on your plate', meaning: 'banyak hal untuk dipikirkan', example: 'She has a lot on her plate with three kids.', exampleId: 'Dia punya banyak hal untuk dipikirkan dengan tiga anak.'),
  IdiomItem(phrase: 'in someone\'s good books', meaning: 'disukai oleh seseorang', example: 'I want to be in my boss\'s good books.', exampleId: 'Saya ingin disukai oleh atasan.'),
  IdiomItem(phrase: 'keep in touch', meaning: 'tetap komunikasi', example: 'Let us keep in touch after graduation.', exampleId: 'Tetap komunikasi setelah lulus.'),
  IdiomItem(phrase: 'lose touch', meaning: 'kehilangan komunikasi', example: 'I lost touch with my college friends.', exampleId: 'Saya kehilangan komunikasi dengan teman kuliah.'),
  IdiomItem(phrase: 'make it official', meaning: 'menyatakan hubungan secara resmi', example: 'They decided to make it official and get married.', exampleId: 'Mereka memutuskan untuk menikah.'),
  IdiomItem(phrase: 'on the rocks', meaning: 'hubungan bermasalah', example: 'Their marriage is on the rocks.', exampleId: 'Pernikahan mereka bermasalah.'),
  IdiomItem(phrase: 'play the field', meaning: 'tidak serius dengan satu orang', example: 'He is still playing the field.', exampleId: 'Dia belum serius dengan satu orang.'),
  IdiomItem(phrase: 'pop the question', meaning: 'melamar', example: 'He finally popped the question!', exampleId: 'Dia akhirnya melamar!'),
  IdiomItem(phrase: 'see eye to eye', meaning: 'sepemikiran', example: 'We do not see eye to eye on this issue.', exampleId: 'Kita tidak sepemikiran tentang masalah ini.'),
  IdiomItem(phrase: 'terms of endearment', meaning: 'sebutan sayang', example: 'They use terms of endearment with each other.', exampleId: 'Mereka saling memanggil dengan sayang.'),
  IdiomItem(phrase: 'the bonding experience', meaning: 'pengalaman mempererat hubungan', example: 'Traveling together was a bonding experience.', exampleId: 'Berkunjung bersama mempererat hubungan.'),
  IdiomItem(phrase: 'through thick and thin', meaning: 'dalam suka maupun duka', example: 'We will be friends through thick and thin.', exampleId: 'Kita akan berteman dalam suka maupun duka.'),
  IdiomItem(phrase: 'trust someone implicitly', meaning: 'benar-benar percaya', example: 'I trust her implicitly.', exampleId: 'Saya benar-benar percaya padanya.'),
  IdiomItem(phrase: 'with open arms', meaning: 'dengan senang hati', example: 'They welcomed us with open arms.', exampleId: 'Mereka menyambut kami dengan senang hati.'),
  IdiomItem(phrase: 'love is blind', meaning: 'cinta membuat buta', example: 'Love is blind, they say.', exampleId: 'Kata orang, cinta membuat buta.'),
];

// LUCK & CHANCE IDIOMS
const List<IdiomItem> _luckIdioms = [
  IdiomItem(phrase: ' beginner\'s luck', meaning: 'keberuntungan pemula', example: 'It was just beginner\'s luck that I won.', exampleId: 'Hanya keberuntungan pemula saya menang.'),
  IdiomItem(phrase: 'by chance', meaning: 'secara kebetulan', example: 'I met her by chance at the mall.', exampleId: 'Saya bertemu dia secara kebetulan di mall.'),
  IdiomItem(phrase: 'cheat death', meaning: 'selamat dari kematian', example: 'He cheated death in the accident.', exampleId: 'Dia selamat dari kematian dalam kecelakaan.'),
  IdiomItem(phrase: 'down on your luck', meaning: 'sial, tidak beruntung', example: 'He has been down on his luck lately.', exampleId: 'Dia sedang tidak beruntung akhir-akhir ini.'),
  IdiomItem(phrase: 'due for a change of luck', meaning: 'waktunya dapat keberuntungan', example: 'I feel like I am due for a change of luck.', exampleId: 'Saya merasa waktunya dapat keberuntungan.'),
  IdiomItem(phrase: 'even the odds', meaning: 'menyeimbangkan kesempatan', example: 'Let me even the odds for you.', exampleId: 'Izinkan saya menyeimbangkan kesempatanmu.'),
  IdiomItem(phrase: 'fat chance', meaning: 'kemungkinan kecil', example: 'Fat chance of that happening!', exampleId: 'Kemungkinan kecil itu terjadi!'),
  IdiomItem(phrase: 'game of chance', meaning: 'permainan untung-untungan', example: 'Poker is a game of chance and skill.', exampleId: 'Poker adalah permainan untung-untungan dan keterampilan.'),
  IdiomItem(phrase: 'hard luck', meaning: 'nasib buruk', example: 'Hard luck stories do not impress me.', exampleId: 'Cerita nasib buruk tidak membuat saya terkesan.'),
  IdiomItem(phrase: 'in luck', meaning: 'beruntung', example: 'We were in luck, the store was still open.', exampleId: 'Kita beruntung, toko masih buka.'),
  IdiomItem(phrase: 'luck of the draw', meaning: 'undi, keberuntungan', example: 'It is the luck of the draw who wins.', exampleId: 'Ini soal keberuntungan siapa yang menang.'),
  IdiomItem(phrase: 'luck out', meaning: 'sangat beruntung', example: 'I really lucked out getting this job.', exampleId: 'Saya sangat beruntung dapat pekerjaan ini.'),
  IdiomItem(phrase: 'push one\'s luck', meaning: 'berani ambil risiko', example: 'Do not push your luck too far.', exampleId: 'Jangan terlalu berani ambil risiko.'),
  IdiomItem(phrase: 'stroke of luck', meaning: 'keberuntungan tiba-tiba', example: 'By a stroke of luck, I found my lost keys.', exampleId: 'Secara tiba-tiba beruntung, saya menemukan kunci yang hilang.'),
  IdiomItem(phrase: 'tempt fate', meaning: 'membawa malapetaka', example: 'Do not tempt fate by being reckless.', exampleId: 'Jangan bawa malapetaka dengan ceroboh.'),
  IdiomItem(phrase: 'the luck of the Irish', meaning: 'keberuntungan besar', example: 'He has the luck of the Irish.', exampleId: 'Dia punya keberuntungan besar.'),
  IdiomItem(phrase: 'touch luck', meaning: 'tidak beruntung', example: 'I have been out of luck lately.', exampleId: 'Saya sedang tidak beruntung akhir-akhir ini.'),
  IdiomItem(phrase: 'worse luck', meaning: 'sial', example: 'I tried again, and worse luck, I failed again.', exampleId: 'Saya coba lagi, dan sial, gagal lagi.'),
  IdiomItem(phrase: 'you never know', meaning: 'tidak ada yang tahu', example: 'You never know, it might work out!', exampleId: 'Tidak ada yang tahu, mungkin berhasil!'),
];

// EFFORT & DIFFICULTY IDIOMS
const List<IdiomItem> _effortIdioms = [
  IdiomItem(phrase: 'a hard nut to crack', meaning: 'hal yang sulit', example: 'That problem is a hard nut to crack.', exampleId: 'Masalah itu sulit dipecahkan.'),
  IdiomItem(phrase: 'blood, sweat, and tears', meaning: 'pengorbanan besar', example: 'It was all blood, sweat, and tears to finish.', exampleId: 'Itu semua butuh pengorbanan besar untuk selesai.'),
  IdiomItem(phrase: 'break the ice', meaning: 'memecahkan keheningan', example: 'He told a joke to break the ice.', exampleId: 'Dia menceritakan lelucon untuk memecahkan keheningan.'),
  IdiomItem(phrase: 'dead end', meaning: 'jalan buntu', example: 'The project reached a dead end.', exampleId: 'Proyek itu mencapai jalan buntu.'),
  IdiomItem(phrase: 'devil\'s advocate', meaning: 'bermain melawan', example: 'Let me play devil\'s advocate here.', exampleId: 'Izinkan saya menjadi penentang di sini.'),
  IdiomItem(phrase: 'downhill all the way', meaning: 'mudah sekali', example: 'After that, it was downhill all the way.', exampleId: 'Setelah itu, semuanya mudah.'),
  IdiomItem(phrase: 'easier said than done', meaning: 'lebih mudah diucapkan daripada dilakukan', example: 'Losing weight is easier said than done.', exampleId: 'Menurunkan berat badan lebih mudah diucapkan daripada dilakukan.'),
  IdiomItem(phrase: 'feather in your cap', meaning: 'prestise', example: 'Winning the award was a feather in his cap.', exampleId: 'Memenangkan penghargaan adalah sebuah prestise.'),
  IdiomItem(phrase: 'fight tooth and nail', meaning: 'berjuang keras', example: 'I will fight tooth and nail for this.', exampleId: 'Saya akan berjuang keras untuk ini.'),
  IdiomItem(phrase: 'get your act together', meaning: 'berbaiki', example: 'You need to get your act together.', exampleId: 'Kamu perlu berbaiki.'),
  IdiomItem(phrase: 'go out of one\'s way', meaning: 'berusaha keras', example: 'She went out of her way to help me.', exampleId: 'Dia berusaha keras membantu saya.'),
  IdiomItem(phrase: 'hanging by a thread', meaning: 'di ambang kegagalan', example: 'The project is hanging by a thread.', exampleId: 'Proyek itu di ambang kegagalan.'),
  IdiomItem(phrase: 'hit or miss', meaning: 'tidak tentu hasilnya', example: 'The service is hit or miss here.', exampleId: 'Pelayanannya tidak menentu di sini.'),
  IdiomItem(phrase: 'in deep water', meaning: 'dalam kesulitan', example: 'He got himself in deep water.', exampleId: 'Dia masuk ke dalam kesulitan.'),
  IdiomItem(phrase: 'in over your head', meaning: 'di luar kemampuan', example: 'I am in over my head with this project.', exampleId: 'Proyek ini di luar kemampuan saya.'),
  IdiomItem(phrase: 'no easy feat', meaning: 'tidak mudah', example: 'Building a business from scratch is no easy feat.', exampleId: 'Memulai bisnis dari nol tidak mudah.'),
  IdiomItem(phrase: 'on thin ice', meaning: 'berbahaya', example: 'He is on thin ice after being late again.', exampleId: 'Dia dalam posisi berbahaya setelah terlambat lagi.'),
  IdiomItem(phrase: 'out of the woods', meaning: 'keluar dari kesulitan', example: 'We are not out of the woods yet.', exampleId: 'Kita belum keluar dari kesulitan.'),
  IdiomItem(phrase: 'uphill battle', meaning: 'pertarungan berat', example: 'It is an uphill battle to win the election.', exampleId: 'Ini pertarungan berat untuk memenangkan pemilu.'),
  IdiomItem(phrase: 'walk on eggshells', meaning: 'berhati-hati', example: 'I have to walk on eggshells around him.', exampleId: 'Saya harus berhati-hati di sekitarnya.'),
];

// COMMUNICATION IDIOMS
const List<IdiomItem> _communicationIdioms = [
  IdiomItem(phrase: 'beat around the bush', meaning: 'berbelit-belit', example: 'Stop beating around the bush and tell me!', exampleId: 'Berhenti berbelit-belit dan katakan!'),
  IdiomItem(phrase: 'bite off more than you can chew', meaning: 'ambil kerjaan terlalu banyak', example: 'I bit off more than I could chew with three jobs.', exampleId: 'Saya mengambil terlalu banyak dengan tiga pekerjaan.'),
  IdiomItem(phrase: 'cut to the chase', meaning: 'langsung ke inti', example: 'Let us cut to the chase.', exampleId: 'Mari langsung ke inti.'),
  IdiomItem(phrase: 'get a word in edgeways', meaning: 'berkomentar', example: 'He talks so much, I cannot get a word in edgeways.', exampleId: 'Dia terlalu banyak bicara, saya tidak bisa berkomentar.'),
  IdiomItem(phrase: 'go in one ear and out the other', meaning: 'tidak didengarkan', example: 'My advice goes in one ear and out the other.', exampleId: 'Nasihatku tidak didengarkan.'),
  IdiomItem(phrase: 'have a word', meaning: 'bicara sebentar', example: 'Can I have a word with you?', exampleId: 'Bisa saya bicara sebentar denganmu?'),
  IdiomItem(phrase: 'in no uncertain terms', meaning: 'dengan tegas', example: 'He told her in no uncertain terms to stop.', exampleId: 'Dia mengatakan dengan tegas untuk berhenti.'),
  IdiomItem(phrase: 'keep your word', meaning: 'tepat janji', example: 'I always keep my word.', exampleId: 'Saya selalu tepat janji.'),
  IdiomItem(phrase: 'mince your words', meaning: 'berbicara tidak langsung', example: 'She did not mince her words.', exampleId: 'Dia berbicara dengan terus terang.'),
  IdiomItem(phrase: 'off the top of my head', meaning: 'dari pikiran', example: 'Off the top of my head, I think it is 50 dollars.', exampleId: 'Dari pikiran saya, saya pikir itu 50 dolar.'),
  IdiomItem(phrase: 'on the tip of my tongue', meaning: 'hampir ingat', example: 'The name is on the tip of my tongue.', exampleId: 'Namanya hampir ingat.'),
  IdiomItem(phrase: 'say it like it is', meaning: 'berbicara apa adanya', example: 'He always says it like it is.', exampleId: 'Dia selalu bicara apa adanya.'),
  IdiomItem(phrase: 'spill the beans', meaning: 'membocorkan rahasia', example: 'Who spilled the beans about the surprise party?', exampleId: 'Siapa yang membocorkan rahasia pesta kejutan?'),
  IdiomItem(phrase: 'speak of the devil', meaning: 'kebetulan menyebut seseorang', example: 'Speak of the devil, here he comes!', exampleId: 'Sedang membahas kamu, dia datang!'),
  IdiomItem(phrase: 'sugarcoat', meaning: 'memperindah kenyataan', example: 'Do not sugarcoat the bad news.', exampleId: 'Jangan memperindah berita buruk.'),
  IdiomItem(phrase: 'talk over someone\'s head', meaning: 'bicara terlalu sulit', example: 'Do not talk over their heads with technical terms.', exampleId: 'Jangan gunakan istilah teknis yang sulit.'),
  IdiomItem(phrase: 'the penny dropped', meaning: 'baru paham', example: 'Finally, the penny dropped.', exampleId: 'Akhirnya, saya baru paham.'),
  IdiomItem(phrase: 'to make a long story short', meaning: 'singkat cerita', example: 'To make a long story short, we failed.', exampleId: 'Singkat cerita, kita gagal.'),
  IdiomItem(phrase: 'word of mouth', meaning: 'dari mulut ke mulut', example: 'The restaurant became famous by word of mouth.', exampleId: 'Restoran itu terkenal dari mulut ke mulut.'),
  IdiomItem(phrase: 'you said it', meaning: 'aku setuju', example: 'You said it, partner!', exampleId: 'Aku setuju, Partner!'),
];

// CLOTHING IDIOMS
const List<IdiomItem> _clothingIdioms = [
  IdiomItem(phrase: 'born with a silver spoon in your mouth', meaning: 'lahir dari keluarga kaya', example: 'He was born with a silver spoon in his mouth.', exampleId: 'Dia lahir dari keluarga kaya.'),
  IdiomItem(phrase: 'by the skin of your teeth', meaning: 'hampir tidak', example: 'I passed the exam by the skin of my teeth.', exampleId: 'Saya hampir tidak lulus ujian.'),
  IdiomItem(phrase: 'keep your shirt on', meaning: 'tenang', example: 'Keep your shirt on, everything will be fine.', exampleId: 'Tetap tenang, semuanya akan baik-baik saja.'),
  IdiomItem(phrase: 'lose the thread', meaning: 'kehilangan alur', example: 'I lost the thread of the conversation.', exampleId: 'Saya kehilangan alur percakapan.'),
  IdiomItem(phrase: 'put your thinking cap on', meaning: 'berpikir keras', example: 'Put your thinking cap on and solve this.', exampleId: 'Berpikir keras dan selesaikan ini.'),
  IdiomItem(phrase: 'roll up your sleeves', meaning: 'bersiap bekerja keras', example: 'It is time to roll up your sleeves.', exampleId: 'Waktunya bekerja keras.'),
  IdiomItem(phrase: 'save for a rainy day', meaning: 'menabung untuk mendesak', example: 'Put some money aside for a rainy day.', exampleId: 'Simpan uang untuk hari yang sulit.'),
  IdiomItem(phrase: 'shirt and tie', meaning: 'pakaian formal', example: 'He always wears a shirt and tie to work.', exampleId: 'Dia selalu pakai kemeja dan dasi untuk kerja.'),
  IdiomItem(phrase: 'storm in a teacup', meaning: 'masalah remeh', example: 'Do not make a storm in a teacup.', exampleId: 'Jangan membesar-besarkan masalah.'),
  IdiomItem(phrase: 'tear your hair out', meaning: 'frustrasi', example: 'I am tearing my hair out over this problem.', exampleId: 'Saya frustrasi dengan masalah ini.'),
  IdiomItem(phrase: 'wear the pants', meaning: 'berkuasa', example: 'She wears the pants in the family.', exampleId: 'Dia yang berkuasa dalam keluarga.'),
  IdiomItem(phrase: 'wear your heart on your sleeve', meaning: 'terbuka perasaan', example: 'He wears his heart on his sleeve.', exampleId: 'Dia terbuka tentang perasaannya.'),
  IdiomItem(phrase: 'wearing thin', meaning: 'menipis, habis kesabaran', example: 'My patience is wearing thin.', exampleId: 'Kesabaran saya menipis.'),
  IdiomItem(phrase: 'button your lip', meaning: 'diam', example: 'Button your lip and listen!', exampleId: 'Diam dan dengarkan!'),
  IdiomItem(phrase: 'fit like a glove', meaning: 'sangat cocok', example: 'The new dress fits like a glove.', exampleId: 'Gaun baru itu sangat cocok.'),
];

// SPORTS IDIOMS
const List<IdiomItem> _sportsIdioms = [
  IdiomItem(phrase: 'at the top of your game', meaning: 'paling terbaik', example: 'She is at the top of her game now.', exampleId: 'Dia sedang di puncak performanya.'),
  IdiomItem(phrase: 'below the belt', meaning: 'tidak adil', example: 'That comment was below the belt.', exampleId: 'Komentar itu tidak adil.'),
  IdiomItem(phrase: 'drop the ball', meaning: 'melakukan kesalahan', example: 'I really dropped the ball on that one.', exampleId: 'Saya benar-benar salah dalam hal ini.'),
  IdiomItem(phrase: 'get the ball rolling', meaning: 'memulai', example: 'Let us get the ball rolling on this project.', exampleId: 'Mari mulai proyek ini.'),
  IdiomItem(phrase: 'go the extra mile', meaning: 'berusaha lebih', example: 'She always goes the extra mile.', exampleId: 'Dia selalu berusaha lebih.'),
  IdiomItem(phrase: 'hit it out of the park', meaning: 'sangat berhasil', example: 'The team hit it out of the park!', exampleId: 'Tim itu sangat berhasil!'),
  IdiomItem(phrase: 'keep your eye on the ball', meaning: 'tetap fokus', example: 'Keep your eye on the ball during the exam.', exampleId: 'Tetap fokus saat ujian.'),
  IdiomItem(phrase: 'on the ball', meaning: 'awas, cepat tanggap', example: 'You need to stay on the ball.', exampleId: 'Kamu perlu tetap waspada.'),
  IdiomItem(phrase: 'out of bounds', meaning: 'di luar batas', example: 'That topic is out of bounds.', exampleId: 'Topik itu di luar batas.'),
  IdiomItem(phrase: 'par for the course', meaning: 'normal, sudah expected', example: 'Failures are par for the course.', exampleId: 'Kegagalan adalah hal yang normal.'),
  IdiomItem(phrase: 'play ball', meaning: 'bekerja sama', example: 'The company needs to play ball with regulators.', exampleId: 'Perusahaan perlu bekerja sama dengan regulator.'),
  IdiomItem(phrase: 'point blank', meaning: 'terus terang', example: 'He told me point blank that I was wrong.', exampleId: 'Dia bilang terus terang bahwa saya salah.'),
  IdiomItem(phrase: 'step up to the plate', meaning: 'mengambil tanggung jawab', example: 'It is time to step up to the plate.', exampleId: 'Waktunya mengambil tanggung jawab.'),
  IdiomItem(phrase: 'take it to the next level', meaning: 'menaikkan level', example: 'We need to take it to the next level.', exampleId: 'Kita perlu naik ke level berikutnya.'),
  IdiomItem(phrase: 'the ball is in your court', meaning: 'giliranmu', example: 'The ball is in your court now.', exampleId: 'Sekarang giliranmu.'),
  IdiomItem(phrase: 'throw a curveball', meaning: 'menambahkan komplikasi', example: 'Life threw a curveball at us.', exampleId: 'Hidup menambahkan komplikasi untuk kita.'),
  IdiomItem(phrase: 'up to par', meaning: 'sesuai standar', example: 'My performance was not up to par.', exampleId: 'Performaku tidak sesuai standar.'),
  IdiomItem(phrase: 'win hands down', meaning: 'menang mudah', example: 'She won the competition hands down.', exampleId: 'Dia memenangkan kompetisi dengan mudah.'),
  IdiomItem(phrase: 'zero sum game', meaning: 'satu pihak untung, satu pihak rugi', example: 'Business is not a zero sum game.', exampleId: 'Bisnis bukan permainan di mana satu pihak untung.'),
];

// ===== MODEL CLASS =====
class IdiomCategory {
  final String name;
  final String icon;
  final int color;
  final List<IdiomItem> items;

  const IdiomCategory({
    required this.name,
    required this.icon,
    required this.color,
    required this.items,
  });
}

class IdiomItem {
  final String phrase;
  final String meaning;
  final String example;
  final String exampleId;

  const IdiomItem({
    required this.phrase,
    required this.meaning,
    required this.example,
    required this.exampleId,
  });
}
