import '../models/grammar_models.dart';

// Colors for tenses category
const int tensesColor = 0xFF6C63FF;

/// Complete 16 Tenses Data (Ruangguru Standard)
/// Order: Simple Present → Present Perfect → Present Perfect Continuous →
///        Simple Past → Past Perfect → Past Perfect Continuous →
///        Simple Future → Future Perfect → Future Perfect Continuous →
///        Simple Past Future → Past Future Perfect → Past Future Perfect Continuous
/// Each tense has examples in interleaved order: +, -, ?
/// Renamed: "Simple Present" (was Present Simple), "Simple Past" (was Past Simple),
/// "Simple Future" (was Future Simple Will), "Simple Past Future" (was Would),
/// "Past Future Continuous" (was Would Be)
class TensesData {
  static final List<GrammarTopic> tensesTopics = [
    // ============================================================
    // GROUP 1: PRESENT TENSES
    // ============================================================

    // 1. SIMPLE PRESENT TENSE
    GrammarTopic(
      id: 'simple_present',
      title: 'Simple Present Tense',
      description: 'Fakta, kebiasaan, kejadian rutin',
      lessons: [
        Lesson(
          id: 'sp_1',
          title: 'Rumus & Pengertian',
          content: '''**Simple Present Tense** digunakan untuk mengungkapkan fakta, menceritakan suatu kejadian, atau kebiasaan yang terjadi di masa sekarang.

**Rumus Simple Present Tense:**
- Kalimat Positif: Subject + V1 (base form)
- Kalimat Negatif: Subject + do/does + not + V1
- Kalimat Tanya (Interogatif): Do/Does + Subject + V1?

**Kegunaan:**
1. Menyatakan kebiasaan (habitual actions)
2. Menyatakan fakta umum (general truths)
3. Menyatakan kejadian rutin
4. Menyatakan situasi permanen''',
          examples: [
            GrammarExample(english: 'She reads the book.', indonesian: 'Dia membaca buku.', sentenceType: SentenceType.positive),
            GrammarExample(english: 'She does not read the book.', indonesian: 'Dia tidak membaca buku.', sentenceType: SentenceType.negative),
            GrammarExample(english: 'Does she read the book?', indonesian: 'Apakah dia membaca buku?', sentenceType: SentenceType.interrogative),
          ],
          tips: [
            'Gunakan Verb (s/es) untuk he/she/it',
            'do not = don\'t / does not = doesn\'t',
          ],
          xpReward: 10,
        ),
        Lesson(
          id: 'sp_2',
          title: 'Aturan Verb -s/-es',
          content: '''**Aturan Penambahan -s/-es:**

1. Umum: tambah -s
   → works, plays, reads, goes

2. Akhiran -s, -ss, -sh, -ch, -x, -z: tambah -es
   → watches, fixes, kisses, teaches, boxes

3. Akhiran -y + konsonan: -y → -ies
   → studies, tries, flies, cries

4. Akhiran -y + vokal: tambah -s
   → plays, says, stays, enjoys

**Special Verbs:**
- have → has
- go → goes''',
          examples: [
            GrammarExample(english: 'She reads the book every day.', indonesian: 'Dia membaca buku setiap hari.', sentenceType: SentenceType.positive),
            GrammarExample(english: 'She does not read the book on Sunday.', indonesian: 'Dia tidak membaca buku hari Minggu.', sentenceType: SentenceType.negative),
            GrammarExample(english: 'Does she read the book every day?', indonesian: 'Apakah dia membaca buku setiap hari?', sentenceType: SentenceType.interrogative),
          ],
          tips: [
            'Ingat: He/She/It + s/es',
            'Contoh: watch → watches, try → tries, play → plays',
          ],
          xpReward: 10,
        ),
        Lesson(
          id: 'sp_3',
          title: 'Wh- Questions',
          content: '''**Wh- Questions dengan Simple Present:**

- What do you do? = Apa pekerjaanmu?
- Where does she read? = Di mana dia membaca?
- When do they read? = Kapan mereka membaca?
- Why do you read? = Mengapa kamu membaca?
- Who does he meet? = Siapa yang dia temui?
- How often do you read? = Seberapa sering kamu membaca?''',
          examples: [
            GrammarExample(english: 'What do you read every night?', indonesian: 'Apa yang kamu baca setiap malam?', sentenceType: SentenceType.positive),
            GrammarExample(english: 'I do not read novels.', indonesian: 'Saya tidak membaca novel.', sentenceType: SentenceType.negative),
            GrammarExample(english: 'How many books do you read?', indonesian: 'Berapa banyak buku yang kamu baca?', sentenceType: SentenceType.interrogative),
          ],
          tips: [
            'Wh- Questions: What, Where, When, Why, Who, How',
            'Gunakan does untuk he/she/it',
          ],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'sp_quiz',
          topicId: 'simple_present',
          title: 'Simple Present Test',
          xpReward: 20,
          questions: [
            QuizQuestion(
              id: 'sp_q1',
              type: QuestionType.multipleChoice,
              question: 'She ___ the book every morning.',
              options: ['reads', 'read', 'reading', 'readed'],
              correctAnswer: 'reads',
              explanation: 'She/He/It + Verb + s (Present Simple)',
            ),
            QuizQuestion(
              id: 'sp_q2',
              type: QuestionType.fillInBlank,
              question: 'I ___ (not/read) the newspaper.',
              options: ['do not read', 'does not read', 'not read', 'am not reading'],
              correctAnswer: 'do not read',
              explanation: 'I/You/We/They + don\'t + Verb (base)',
            ),
            QuizQuestion(
              id: 'sp_q3',
              type: QuestionType.trueFalse,
              question: '"He goes to school" adalah Simple Present Tense.',
              options: ['True', 'False'],
              correctAnswer: 'True',
              explanation: 'He goes = Present Simple (+s untuk he)',
            ),
            QuizQuestion(
              id: 'sp_q4',
              type: QuestionType.multipleChoice,
              question: '___ you ___ (read) English?',
              options: ['Do/read', 'Does/read', 'Is/read', 'Are/read'],
              correctAnswer: 'Do/read',
              explanation: 'You + Do + read (verb base)',
            ),
            QuizQuestion(
              id: 'sp_q5',
              type: QuestionType.multipleChoice,
              question: 'She ___ to music every day.',
              options: ['listen', 'listens', 'listening', 'listened'],
              correctAnswer: 'listens',
              explanation: 'She + listens (verb + s)',
            ),
          ],
        ),
      ],
    ),

    // 2. PRESENT CONTINUOUS TENSE
    GrammarTopic(
      id: 'present_continuous',
      title: 'Present Continuous Tense',
      description: 'Kejadian sedang berlangsung saat ini',
      lessons: [
        Lesson(
          id: 'prc_1',
          title: 'Rumus & Pengertian',
          content: '''**Present Continuous Tense** digunakan untuk menceritakan kejadian yang sedang berlangsung sekarang ketika kamu berbicara. Tense ini juga bisa digunakan untuk menceritakan rencana di masa depan.

Pada tense ini, terdapat perubahan bentuk verb yaitu diberi penambahan -ing pada akhirnya. Salah satu kata keterangan waktu yang banyak digunakan dalam tense ini adalah *now* yang menandakan bahwa waktu kejadian tersebut berlangsung adalah sekarang.

**Rumus Present Continuous Tense:**
- Kalimat Positif: Subject + am/is/are + V-ing
- Kalimat Negatif: Subject + am/is/are + not + V-ing
- Kalimat Tanya (Interogatif): Am/Is/Are + Subject + V-ing?

**Kegunaan:**
1. Kejadian yang sedang berlangsung saat ini (actions happening now)
2. Situasi sementara (temporary situations)
3. Rencana masa depan (future arrangements)
4. Perilaku yang menjengkelkan (always + continuous)''',
          examples: [
            GrammarExample(english: 'She is reading the book now.', indonesian: 'Dia sedang membaca buku sekarang.', sentenceType: SentenceType.positive),
            GrammarExample(english: 'She is not reading the book now.', indonesian: 'Dia tidak sedang membaca buku sekarang.', sentenceType: SentenceType.negative),
            GrammarExample(english: 'Is she reading the book now?', indonesian: 'Apakah dia sedang membaca buku sekarang?', sentenceType: SentenceType.interrogative),
          ],
          tips: [
            'am → I',
            'is → he/she/it',
            'are → you/we/they',
          ],
          xpReward: 10,
        ),
        Lesson(
          id: 'prc_2',
          title: 'Aturan Verb-ing',
          content: '''**Cara Membentuk Verb-ing:**

1. Umum: tambah -ing
   → read → reading
   → play → playing
   → write → writing

2. Akhiran -e: hilangkan -e, tambah -ing
   → make → making
   → write → writing
   → take → taking

3. Konsonan + -y: tambah -ing
   → study → studying
   → cry → crying

4. Akhiran -ie: -ie → -ying
   → die → dying
   → lie → lying

5. Satu vokal + satu konsonan (akhir): doble konsonan
   → run → running
   → sit → sitting
   → swim → swimming''',
          examples: [
            GrammarExample(english: 'She is reading a book now.', indonesian: 'Dia sedang membaca buku sekarang.', sentenceType: SentenceType.positive),
            GrammarExample(english: 'She is not reading the book now.', indonesian: 'Dia tidak sedang membaca buku sekarang.', sentenceType: SentenceType.negative),
            GrammarExample(english: 'Is she reading the book now?', indonesian: 'Apakah dia sedang membaca buku sekarang?', sentenceType: SentenceType.interrogative),
          ],
          tips: [
            'Verb + ing = sedang melakukan',
            'e + ing =去掉e + ing (make → making)',
          ],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'prc_quiz',
          topicId: 'present_continuous',
          title: 'Present Continuous Test',
          xpReward: 20,
          questions: [
            QuizQuestion(
              id: 'prc_q1',
              type: QuestionType.multipleChoice,
              question: 'I ___ (read) the book now.',
              options: ['am reading', 'is reading', 'are reading', 'reading'],
              correctAnswer: 'am reading',
              explanation: 'I + am + reading',
            ),
            QuizQuestion(
              id: 'prc_q2',
              type: QuestionType.trueFalse,
              question: '"They are studying" = mereka sedang belajar.',
              options: ['True', 'False'],
              correctAnswer: 'True',
              explanation: 'Present Continuous = sedang',
            ),
          ],
        ),
      ],
    ),

    // 3. PRESENT PERFECT TENSE (NEW - WAS MISSING)
    GrammarTopic(
      id: 'present_perfect',
      title: 'Present Perfect Tense',
      description: 'Kejadian sudah terjadi dengan dampak saat ini',
      lessons: [
        Lesson(
          id: 'pp_1',
          title: 'Rumus & Pengertian',
          content: '''**Present Perfect Tense** digunakan untuk menceritakan suatu tindakan atau aksi yang sedang berjalan atau baru saja selesai. Tense ini cenderung memberi penekanan pada dampak dari suatu aksi yang sudah selesai dilakukan, dimana dampak tersebut harus masih bisa dirasakan sampai saat ini.

**Rumus Present Perfect Tense:**
- Kalimat Positif: Subject + have/has + V3 (past participle)
- Kalimat Negatif: Subject + have/has + not + V3
- Kalimat Tanya (Interogatif): Have/Has + Subject + V3?

**Kegunaan:**
1. Menyatakan tindakan yang baru saja selesai
2. Menyatakan pengalaman hidup (experience)
3. Menyatakan hasil yang masih dirasakan sampai saat ini
4. Menyatakan tindakan yang berlanjut sampai sekarang

**Penting:** Jangan gunakan yesterday, last week, in 2020!''',
          examples: [
            GrammarExample(english: 'She has read the book.', indonesian: 'Dia sudah membaca buku.', sentenceType: SentenceType.positive),
            GrammarExample(english: 'She has not read the book yet.', indonesian: 'Dia belum membaca buku tersebut.', sentenceType: SentenceType.negative),
            GrammarExample(english: 'Has she read the book?', indonesian: 'Apakah dia sudah membaca buku?', sentenceType: SentenceType.interrogative),
          ],
          tips: [
            'has → he/she/it',
            'have → I/you/we/they',
            'have/has + V3 = sudah',
          ],
          xpReward: 10,
        ),
        Lesson(
          id: 'pp_2',
          title: 'Kata Kunci Present Perfect',
          content: '''**Kata Kunci Present Perfect:**

**Experience:** ever, never, before, once, twice, several times
- Have you ever read this book?
- I have never read a novel.

**Recently:** just, already, yet, recently
- I have just finished reading.
- She has already read the book.
- Has he finished yet?

**Duration:** for, since, how long
- I have lived here for 10 years.
- How long have you known her?

**TIDAK boleh:**
- yesterday (Past Simple)
- last week (Past Simple)
- in 2020 (Past Simple)''',
          examples: [
            GrammarExample(english: 'I have already read three books this month.', indonesian: 'Saya sudah membaca tiga buku bulan ini.', sentenceType: SentenceType.positive),
            GrammarExample(english: 'I have not read that book before.', indonesian: 'Saya belum pernah membaca buku itu sebelumnya.', sentenceType: SentenceType.negative),
            GrammarExample(english: 'Have you ever read this novel?', indonesian: 'Apakah kamu pernah membaca novel ini?', sentenceType: SentenceType.interrogative),
          ],
          tips: [
            'yet biasanya di akhir kalimat negatif/tanyaan',
            'already biasanya sebelum V3',
            'for + periode / since + titik waktu',
          ],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'pp_quiz',
          topicId: 'present_perfect',
          title: 'Present Perfect Test',
          xpReward: 20,
          questions: [
            QuizQuestion(
              id: 'pp_q1',
              type: QuestionType.multipleChoice,
              question: 'She ___ (read) the book twice.',
              options: ['has read', 'have read', 'had read', 'has reading'],
              correctAnswer: 'has read',
              explanation: 'She + has + read (V3)',
            ),
            QuizQuestion(
              id: 'pp_q2',
              type: QuestionType.fillInBlank,
              question: 'Have you ever ___ (read) this book?',
              options: ['read', 'reads', 'reading', 'readed'],
              correctAnswer: 'read',
              explanation: 'have + ever + read (V3)',
            ),
          ],
        ),
      ],
    ),

    // 4. PRESENT PERFECT CONTINUOUS TENSE (NEW - WAS MISSING)
    GrammarTopic(
      id: 'present_perfect_continuous',
      title: 'Present Perfect Continuous',
      description: 'Aksi sudah dimulai dan masih berlanjut',
      lessons: [
        Lesson(
          id: 'ppc_1',
          title: 'Rumus & Pengertian',
          content: '''**Present Perfect Continuous Tense** digunakan untuk menunjukkan suatu aksi yang sudah selesai dilakukan pada suatu titik di masa lampau dan masih berlanjut sampai saat ini. Pada tense ini, terdapat keterangan waktu yang menandakan durasi terjadinya aksi yang sudah selesai dilakukan tersebut.

**Rumus Present Perfect Continuous Tense:**
- Kalimat Positif: Subject + have/has + been + V-ing
- Kalimat Negatif: Subject + have/has + not + been + V-ing
- Kalimat Tanya (Interogatif): Have/Has + Subject + been + V-ing?

**Kegunaan:**
1. Menyatakan aksi yang sudah dimulai dan masih berlanjut sampai saat ini
2. Menyatakan durasi terjadinya suatu tindakan
3. Menyatakan situasi sementara dengan bukti (efek yang terlihat)

**have/has + been = sudah berlangsung''',
          examples: [
            GrammarExample(english: 'She has been reading the book for two hours.', indonesian: 'Dia sudah membaca buku selama dua jam.', sentenceType: SentenceType.positive),
            GrammarExample(english: 'She has not been reading the book long.', indonesian: 'Dia belum lama membaca buku tersebut.', sentenceType: SentenceType.negative),
            GrammarExample(english: 'How long has she been reading?', indonesian: 'Berapa lama dia sudah membaca?', sentenceType: SentenceType.interrogative),
          ],
          tips: [
            'for + periode waktu (for 2 hours)',
            'since + titik waktu (since morning)',
            'Lihat efek = Continuous (keringat, lelah)',
          ],
          xpReward: 10,
        ),
        Lesson(
          id: 'ppc_2',
          title: 'Present Perfect vs Continuous',
          content: '''**Perbedaan Present Perfect dan Present Perfect Continuous:**

| Present Perfect | Present Perfect Continuous |
|----------------|--------------------------|
| Fokus pada hasil | Fokus pada proses |
| I have written 3 letters. | I have been writing. |
| (3 surat selesai) | (sedang menulis) |

**Present Perfect Continuous:**
- She is tired. She has been running. (bukti: lelah, berkeringat)
- The wall is wet. I have been painting. (efek visible)

**Present Perfect:**
- I have painted the wall. (hasil: dinding sudah dicat)''',
          examples: [
            GrammarExample(english: 'I have been reading since morning.', indonesian: 'Saya sudah membaca sejak pagi.', sentenceType: SentenceType.positive),
            GrammarExample(english: 'I have not been reading long.', indonesian: 'Saya belum lama membaca.', sentenceType: SentenceType.negative),
            GrammarExample(english: 'Have you been reading all day?', indonesian: 'Apakah kamu sudah membaca sepanjang hari?', sentenceType: SentenceType.interrogative),
          ],
          tips: [
            'Lihat efek/foto = Continuous',
            'Lihat hasil/jumlah = Perfect',
          ],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'ppc_quiz',
          topicId: 'present_perfect_continuous',
          title: 'Present Perfect Continuous Test',
          xpReward: 20,
          questions: [
            QuizQuestion(
              id: 'ppc_q1',
              type: QuestionType.multipleChoice,
              question: 'She ___ (read) for four hours.',
              options: ['has been reading', 'have been reading', 'has reading', 'had been reading'],
              correctAnswer: 'has been reading',
              explanation: 'has been + reading (verb-ing)',
            ),
          ],
        ),
      ],
    ),

    // ============================================================
    // GROUP 2: PAST TENSES
    // ============================================================

    // 5. SIMPLE PAST TENSE
    GrammarTopic(
      id: 'simple_past',
      title: 'Simple Past Tense',
      description: 'Kejadian selesai di masa lampau',
      lessons: [
        Lesson(
          id: 'smp_1',
          title: 'Rumus & Pengertian',
          content: '''**Simple Past Tense** digunakan untuk menceritakan suatu kejadian, kebiasaan, fakta, atau situasi yang terjadi di masa lampau. Tense ini menggunakan kata kerja bentuk kedua (verb 2 atau V2) yakni kata kerja bentuk lampau.

Jika menggunakan kata keterangan waktu, maka yang digunakan adalah kata keterangan waktu yang menjelaskan masa lampau, seperti *yesterday*, *last year*, *three weeks ago*, dan sebagainya.

**Rumus Simple Past Tense:**
- Kalimat Positif: Subject + V2 (past form)
- Kalimat Negatif: Subject + did + not + V1
- Kalimat Tanya (Interogatif): Did + Subject + V1?

**Kegunaan:**
1. Menyatakan kejadian di masa lampau yang sudah selesai
2. Menyatakan kebiasaan di masa lampau
3. Menyatakan fakta di masa lampau
4. Menyatakan situasi di masa lampau

**Kata Kunci:** yesterday, last week, ago, in 2020''',
          examples: [
            GrammarExample(english: 'She read the book yesterday.', indonesian: 'Dia membaca buku kemarin.', sentenceType: SentenceType.positive),
            GrammarExample(english: 'She did not read the book yesterday.', indonesian: 'Dia tidak membaca buku kemarin.', sentenceType: SentenceType.negative),
            GrammarExample(english: 'Did she read the book yesterday?', indonesian: 'Apakah dia membaca buku kemarin?', sentenceType: SentenceType.interrogative),
          ],
          tips: [
            'Yesterday, last week, ago = Simple Past',
            'didnt + verb dasar (tanpa -ed)',
          ],
          xpReward: 10,
        ),
        Lesson(
          id: 'smp_2',
          title: 'Regular & Irregular Verbs',
          content: '''**Regular Verbs:** tambah -ed
- work → worked
- play → played
- want → wanted

**Irregular Verbs:** harus dihafal
- go → went
- eat → ate
- see → saw
- come → came
- take → took
- write → wrote
- read → read
- become → became''',
          examples: [
            GrammarExample(english: 'She read the novel last night.', indonesian: 'Dia membaca novel tadi malam.', sentenceType: SentenceType.positive),
            GrammarExample(english: 'She did not read the magazine.', indonesian: 'Dia tidak membaca majalah.', sentenceType: SentenceType.negative),
            GrammarExample(english: 'Did she read the newspaper?', indonesian: 'Apakah dia membaca koran?', sentenceType: SentenceType.interrogative),
          ],
          tips: [
            'Hafalkan 100 verb irregular yang sering',
            'catatan: read = /red/ di Simple Past',
          ],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'smp_quiz',
          topicId: 'simple_past',
          title: 'Simple Past Test',
          xpReward: 20,
          questions: [
            QuizQuestion(
              id: 'smp_q1',
              type: QuestionType.multipleChoice,
              question: 'She ___ to the library yesterday.',
              options: ['go', 'goes', 'went', 'going'],
              correctAnswer: 'went',
              explanation: 'go → went (Irregular)',
            ),
            QuizQuestion(
              id: 'smp_q2',
              type: QuestionType.fillInBlank,
              question: 'I ___ (not/see) the movie.',
              options: ['did not see', 'did not saw', 'not see', 'didnt saw'],
              correctAnswer: 'did not see',
              explanation: 'Did + not + verb (base)',
            ),
          ],
        ),
      ],
    ),

    // 6. PAST CONTINUOUS TENSE
    GrammarTopic(
      id: 'past_continuous',
      title: 'Past Continuous Tense',
      description: 'Aksi sedang berlangsung di masa lalu',
      lessons: [
        Lesson(
          id: 'pc_1',
          title: 'Rumus & Pengertian',
          content: '''**Past Continuous Tense** digunakan untuk menceritakan kejadian yang sedang terjadi di masa lampau. Tense ini juga bisa digunakan untuk menceritakan dua kejadian yang sedang terjadi di masa lampau. Jadi, ada dua aktivitas yang terjadi di waktu bersamaan.

**Rumus Past Continuous Tense:**
- Kalimat Positif: Subject + was/were + V-ing
- Kalimat Negatif: Subject + was/were + not + V-ing
- Kalimat Tanya (Interogatif): Was/Were + Subject + V-ing?

**Kegunaan:**
1. Menyatakan kejadian yang sedang terjadi di masa lampau
2. Menyatakan dua aktivitas yang terjadi bersamaan
3. Menyatakan tindakan latar belakang
4. Menyatakan tindakan yang terganggu (interrupted)

**Contoh dua aktivitas:**
- Kalimat Positif: She was reading the book when I arrived.
- Kalimat Negatif: She wasn't reading the book when I arrived.
- Kalimat Tanya: Was she reading the book when I arrived?''',
          examples: [
            GrammarExample(english: 'She was reading when the phone rang.', indonesian: 'Dia sedang membaca saat telepon berdering.', sentenceType: SentenceType.positive),
            GrammarExample(english: 'She was not reading when I came.', indonesian: 'Dia tidak sedang membaca saat saya datang.', sentenceType: SentenceType.negative),
            GrammarExample(english: 'Was she reading at 8 PM?', indonesian: 'Apakah dia sedang membaca jam 8 malam?', sentenceType: SentenceType.interrogative),
          ],
          tips: [
            'was → I/he/she/it',
            'were → you/we/they',
          ],
          xpReward: 10,
        ),
        Lesson(
          id: 'pc_2',
          title: 'Past Continuous + Past Simple',
          content: '''**Pola Combined:**

**Past Continuous + when + Past Simple:**
- I was reading when she called. (membaca = background, called = interrupt)
- They were reading when it rained.

**While + Past Continuous:**
- While I was reading, my brother was playing games.

**Perbedaan:**
| Continuous | Simple |
|------------|--------|
| Sedang berlangsung | Selesai/terputus |
| Background | Interrupt |''',
          examples: [
            GrammarExample(english: 'She was reading when the teacher came.', indonesian: 'Dia sedang membaca saat guru datang.', sentenceType: SentenceType.positive),
            GrammarExample(english: 'She was not reading when I entered.', indonesian: 'Dia tidak sedang membaca saat saya masuk.', sentenceType: SentenceType.negative),
            GrammarExample(english: 'Were you reading when the bell rang?', indonesian: 'Apakah kamu sedang membaca saat bel berbunyi?', sentenceType: SentenceType.interrogative),
          ],
          tips: [
            'when = Past Simple (interrupt/terputus)',
            'while = Past Continuous (background/latar)',
          ],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'pc_quiz',
          topicId: 'past_continuous',
          title: 'Past Continuous Test',
          xpReward: 20,
          questions: [
            QuizQuestion(
              id: 'pc_q1',
              type: QuestionType.multipleChoice,
              question: 'I ___ (read) when the alarm rang.',
              options: ['was reading', 'were reading', 'am reading', 'reading'],
              correctAnswer: 'was reading',
              explanation: 'I + was + reading',
            ),
          ],
        ),
      ],
    ),

    // 7. PAST PERFECT TENSE
    GrammarTopic(
      id: 'past_perfect',
      title: 'Past Perfect Tense',
      description: 'Kejadian lebih dulu sebelum waktu tertentu',
      lessons: [
        Lesson(
          id: 'pd_1',
          title: 'Rumus & Pengertian',
          content: '''**Past Perfect Tense** digunakan untuk menyatakan suatu kejadian yang terjadi sebelum waktu tertentu di masa lampau. Tense ini lebih memberi penekanan pada fakta bahwa sesuatu tersebut sudah terjadi, bukan memberi penekanan pada durasinya.

**Rumus Past Perfect Tense:**
- Kalimat Positif: Subject + had + V3 (past participle)
- Kalimat Negatif: Subject + had + not + V3
- Kalimat Tanya (Interogatif): Had + Subject + V3?

**Kegunaan:**
1. Menyatakan kejadian yang terjadi lebih dulu di masa lampau
2. Menyatakan tindakan sebelum tindakan lain
3. Menyatakan keinginan yang tidak terpenuhi

**had = sudah (lebih dulu)**''',
          examples: [
            GrammarExample(english: 'She had read the book before I arrived.', indonesian: 'Dia sudah membaca buku sebelum saya tiba.', sentenceType: SentenceType.positive),
            GrammarExample(english: 'She had not read the book before the exam.', indonesian: 'Dia belum membaca buku sebelum ujian.', sentenceType: SentenceType.negative),
            GrammarExample(english: 'Had she read the book before the class?', indonesian: 'Apakah dia sudah membaca buku sebelum kelas?', sentenceType: SentenceType.interrogative),
          ],
          tips: [
            'Gunakan had untuk SEMUA subject',
            'Past Perfect = aksi pertama (lebih dulu)',
          ],
          xpReward: 10,
        ),
        Lesson(
          id: 'pd_2',
          title: 'Past Perfect vs Past Simple',
          content: '''**Pola:**
- Past Perfect + before + Past Simple
- Past Simple + after + Past Perfect
- By the time + Past Simple + Past Perfect

**Contoh:**
- I had finished eating before he arrived.
- After she had left, I started working.
- By the time we arrived, the movie had started.

**Aturan:**
Past Perfect = aksi pertama (lebih dulu)
Past Simple = aksi kedua (setelahnya)''',
          examples: [
            GrammarExample(english: 'I had read the book before the discussion.', indonesian: 'Saya sudah membaca buku sebelum diskusi.', sentenceType: SentenceType.positive),
            GrammarExample(english: 'I had not read the chapter before class.', indonesian: 'Saya belum membaca bab sebelum kelas.', sentenceType: SentenceType.negative),
            GrammarExample(english: 'Had you read the assignment before the lecture?', indonesian: 'Apakah kamu sudah membaca tugas sebelum kuliah?', sentenceType: SentenceType.interrogative),
          ],
          tips: [
            'Past Perfect diikuti Past Simple',
            'before/after/by the time = kata penghubung',
          ],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'pd_quiz',
          topicId: 'past_perfect',
          title: 'Past Perfect Test',
          xpReward: 20,
          questions: [
            QuizQuestion(
              id: 'pd_q1',
              type: QuestionType.multipleChoice,
              question: 'She ___ (finish) before I called.',
              options: ['had finished', 'has finished', 'finished', 'was finishing'],
              correctAnswer: 'had finished',
              explanation: 'had + finished (V3)',
            ),
          ],
        ),
      ],
    ),

    // 8. PAST PERFECT CONTINUOUS TENSE
    GrammarTopic(
      id: 'past_perfect_continuous',
      title: 'Past Perfect Continuous',
      description: 'Aksi berlanjut sebelum kejadian lain',
      lessons: [
        Lesson(
          id: 'ppc_1',
          title: 'Rumus & Pengertian',
          content: '''**Past Perfect Continuous Tense** digunakan untuk menceritakan sesuatu yang terjadi di masa lalu dan sudah selesai pada titik waktu tertentu di masa lalu. Tense ini lebih memberi penekanan pada durasi terjadinya sesuatu.

**Rumus Past Perfect Continuous Tense:**
- Kalimat Positif: Subject + had + been + V-ing
- Kalimat Negatif: Subject + had + not + been + V-ing
- Kalimat Tanya (Interogatif): Had + Subject + been + V-ing?

**Kegunaan:**
1. Menyatakan durasi kegiatan sebelum kejadian lain di masa lampau
2. Menyatakan alasan di masa lalu (cause in the past)
3. Menyatakan kegiatan yang sudah selesai pada titik waktu tertentu di masa lalu

**had + been = sudah berlangsung + -ing''',
          examples: [
            GrammarExample(english: 'She had been reading for two hours when I came.', indonesian: 'Dia sudah membaca selama dua jam saat saya datang.', sentenceType: SentenceType.positive),
            GrammarExample(english: 'She had not been reading long when he arrived.', indonesian: 'Dia belum lama membaca saat dia tiba.', sentenceType: SentenceType.negative),
            GrammarExample(english: 'How long had she been reading when you arrived?', indonesian: 'Berapa lama dia sudah membaca saat kamu tiba?', sentenceType: SentenceType.interrogative),
          ],
          tips: [
            'Biasanya digunakan dengan when/because',
            'had been + verb-ing = sudah sedang',
          ],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'ppc_quiz',
          topicId: 'past_perfect_continuous',
          title: 'Past Perfect Continuous Test',
          xpReward: 20,
          questions: [
            QuizQuestion(
              id: 'ppc_q1',
              type: QuestionType.multipleChoice,
              question: 'She ___ (read) for two hours when the rain started.',
              options: ['had been reading', 'has been reading', 'was reading', 'had read'],
              correctAnswer: 'had been reading',
              explanation: 'had been + reading',
            ),
          ],
        ),
      ],
    ),

    // ============================================================
    // GROUP 3: FUTURE TENSES
    // ============================================================

    // 9. SIMPLE FUTURE TENSE
    GrammarTopic(
      id: 'simple_future',
      title: 'Simple Future Tense',
      description: 'Rencana, prediksi, keputusan spontan',
      lessons: [
        Lesson(
          id: 'sf_1',
          title: 'Rumus & Pengertian',
          content: '''**Simple Future Tense** digunakan untuk menceritakan suatu kejadian yang akan terjadi di masa yang akan datang. Tense ini juga bisa digunakan untuk menceritakan keputusan di masa depan yang spontan atau mengekspresikan prediksi yang berhubungan dengan waktu yang akan datang.

**Rumus Simple Future Tense:**
- Kalimat Positif: Subject + will + V1
- Kalimat Negatif: Subject + will + not + V1
- Kalimat Tanya (Interogatif): Will + Subject + V1?

**Kegunaan:**
1. Menyatakan rencana atau kejadian yang akan terjadi di masa depan
2. Menyatakan keputusan spontan (spontaneous decisions)
3. Menyatakan prediksi atau dugaan
4. Menyatakan janji atau tawaran

**will = akan
wont = will not**''',
          examples: [
            GrammarExample(english: 'She will read the book tomorrow.', indonesian: 'Dia akan membaca buku besok.', sentenceType: SentenceType.positive),
            GrammarExample(english: 'She will not read the book tonight.', indonesian: 'Dia tidak akan membaca buku malam ini.', sentenceType: SentenceType.negative),
            GrammarExample(english: 'Will she read the book tomorrow?', indonesian: 'Apakah dia akan membaca buku besok?', sentenceType: SentenceType.interrogative),
          ],
          tips: [
            'will = akan',
            'will not = wont = tidak akan',
          ],
          xpReward: 10,
        ),
        Lesson(
          id: 'sf_2',
          title: 'Will vs Be Going To',
          content: '''**WILL:**
- Spontaneous decision: I'll read this book! ( baru decide)
- Prediction: I think it will rain.
- Promise: I will always read your work.
- Offer: I'll read it for you.

**BE GOING TO:**
- Planned intention: I'm going to read this book next week.
- Evidence: Look! That book is going to fall!
- Previous plan: I'm going to read my grandmother tomorrow.

**Beda:**
| Will | Be Going To |
|------|-------------|
| Spontaneous | Planned |
| No evidence | With evidence |
| Sudden decision | Already decided |''',
          examples: [
            GrammarExample(english: 'I will read this book tonight.', indonesian: 'Saya akan membaca buku ini malam ini.', sentenceType: SentenceType.positive),
            GrammarExample(english: 'I will not read that novel.', indonesian: 'Saya tidak akan membaca novel itu.', sentenceType: SentenceType.negative),
            GrammarExample(english: 'Will you read the assignment tonight?', indonesian: 'Apakah kamu akan membaca tugas malam ini?', sentenceType: SentenceType.interrogative),
          ],
          tips: [
            'Spontaneous = will',
            'Plan = going to',
          ],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'sf_quiz',
          topicId: 'simple_future',
          title: 'Simple Future Test',
          xpReward: 20,
          questions: [
            QuizQuestion(
              id: 'sf_q1',
              type: QuestionType.multipleChoice,
              question: 'I ___ (read) the book tomorrow.',
              options: ['will read', 'am going to read', 'read', 'reading'],
              correctAnswer: 'will read',
              explanation: 'will + verb',
            ),
          ],
        ),
      ],
    ),

    // 10. FUTURE CONTINUOUS TENSE
    GrammarTopic(
      id: 'future_continuous',
      title: 'Future Continuous',
      description: 'Aksi akan sedang seringkian di masa depan',
      lessons: [
        Lesson(
          id: 'fc_1',
          title: 'Rumus & Pengertian',
          content: '''**Future Continuous Tense** digunakan untuk menceritakan suatu kejadian yang pasti akan terjadi di masa depan atau dalam waktu dekat. Tense ini bisa digunakan saat ingin menyatakan rencana atau aktivitas yang sudah pasti akan dilakukan di masa mendatang.

**Rumus:**
- Kalimat Positif: Subject + will + be + V-ing
- Kalimat Negatif: Subject + will + not + be + V-ing
- Kalimat Tanya (Interogatif): Will + Subject + be + V-ing?

**Kegunaan:**
1. Menyatakan kejadian yang akan sedang seringkian di waktu tertentu di masa depan
2. Scheduled events - Acara terjadwal
3. Polite inquiries - Pertanyaan sopan tentang rencana

**will be + verb-ing = akan sedang''',
          examples: [
            GrammarExample(english: 'She will be reading at 8 PM tomorrow.', indonesian: 'Dia akan sedang membaca jam 8 malam besok.', sentenceType: SentenceType.positive),
            GrammarExample(english: 'She will not be reading when you call.', indonesian: 'Dia tidak akan sedang membaca saat kamu menelepon.', sentenceType: SentenceType.negative),
            GrammarExample(english: 'Will she be reading at 8 PM?', indonesian: 'Apakah dia akan sedang membaca jam 8 malam?', sentenceType: SentenceType.interrogative),
          ],
          tips: [
            'Untuk waktu spesifik di masa depan',
            'will be + verb-ing = akan sedang',
          ],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'fc_quiz',
          topicId: 'future_continuous',
          title: 'Future Continuous Test',
          xpReward: 20,
          questions: [
            QuizQuestion(
              id: 'fc_q1',
              type: QuestionType.multipleChoice,
              question: 'At 8 PM, I ___ (read) the book.',
              options: ['will be reading', 'will read', 'am reading', 'read'],
              correctAnswer: 'will be reading',
              explanation: 'will be + verb-ing',
            ),
          ],
        ),
      ],
    ),

    // 11. FUTURE PERFECT TENSE
    GrammarTopic(
      id: 'future_perfect',
      title: 'Future Perfect Tense',
      description: 'Aksi akan sudah selesai pada waktu tertentu',
      lessons: [
        Lesson(
          id: 'fp_1',
          title: 'Rumus & Pengertian',
          content: '''**Future Perfect Tense** digunakan untuk mengungkapkan bahwa ada suatu aksi yang akan dilakukan dan diselesaikan pada waktu tertentu di masa depan. Tense ini bisa digunakan saat ingin menunjukkan kehendak yang berhubungan dengan masa depan.

**Rumus:**
- Kalimat Positif: Subject + will + have + V3 (past participle)
- Kalimat Negatif: Subject + will + not + have + V3
- Kalimat Tanya (Interogatif): Will + Subject + have + V3?

**Kegunaan:**
1. Completed action - Tindakan selesai sebelum waktu tertentu
2. By the time - Sebelum/sesudah waktu tertentu

**will have = akan sudah''',
          examples: [
            GrammarExample(english: 'She will have read the book by tomorrow.', indonesian: 'Dia akan sudah membaca buku sebelum besok.', sentenceType: SentenceType.positive),
            GrammarExample(english: 'She will not have read the book by Monday.', indonesian: 'Dia belum akan membaca buku sebelum Senin.', sentenceType: SentenceType.negative),
            GrammarExample(english: 'Will she have read the book by Friday?', indonesian: 'Apakah dia akan sudah membaca buku sebelum Jumat?', sentenceType: SentenceType.interrogative),
          ],
          tips: [
            'by + waktu = sebelum waktu itu',
            'will have + V3 = akan sudah',
          ],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'fp_quiz',
          topicId: 'future_perfect',
          title: 'Future Perfect Test',
          xpReward: 20,
          questions: [
            QuizQuestion(
              id: 'fp_q1',
              type: QuestionType.multipleChoice,
              question: 'I ___ (finish) the book by tomorrow.',
              options: ['will have finished', 'have finished', 'will finish', 'finished'],
              correctAnswer: 'will have finished',
              explanation: 'will have + V3',
            ),
          ],
        ),
      ],
    ),

    // 12. FUTURE PERFECT CONTINUOUS TENSE
    GrammarTopic(
      id: 'future_perfect_continuous',
      title: 'Future Perfect Continuous',
      description: 'Durasi aksi hingga waktu tertentu di masa depan',
      lessons: [
        Lesson(
          id: 'fpc_1',
          title: 'Rumus & Pengertian',
          content: '''**Future Perfect Continuous Tense** digunakan untuk mengungkapkan suatu gambaran aksi yang akan berlanjut sampai titik waktu tertentu di masa depan. Dalam hal ini, aksi tersebut bisa saja dimulai pada masa lalu, sekarang, atau di masa depan dan diperkirakan akan berlanjut.

**Rumus:**
- ✓ Positif: Subject + will + have + been + Verb-ing
- ✗ Negatif: Subject + will + not + have + been + Verb-ing
- ? Interogatif: Will + Subject + have + been + Verb-ing?

**Kegunaan:**
1. Menyatakan aksi yang akan berlanjut sampai titik waktu tertentu di masa depan
2. Menyatakan durasi terjadinya suatu aksi

**will have been = akan sudah berlangsung + -ing''',
          examples: [
            GrammarExample(english: 'By next month, she will have been reading for one year.', indonesian: 'Sebelum bulan depan, dia akan sudah membaca selama satu tahun.', sentenceType: SentenceType.positive),
            GrammarExample(english: 'She will not have been reading long when you arrive.', indonesian: 'Dia belum akan lama membaca saat kamu tiba.', sentenceType: SentenceType.negative),
            GrammarExample(english: 'How long will she have been reading by then?', indonesian: 'Berapa lama dia akan sudah membaca saat itu?', sentenceType: SentenceType.interrogative),
          ],
          tips: [
            'Jarang digunakan dalam percakapan sehari-hari',
            'for + periode waktu',
          ],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'fpc_quiz',
          topicId: 'future_perfect_continuous',
          title: 'Future Perfect Continuous Test',
          xpReward: 20,
          questions: [
            QuizQuestion(
              id: 'fpc_q1',
              type: QuestionType.multipleChoice,
              question: 'By next year, she ___ (read) for 5 years.',
              options: ['will have been reading', 'will have read', 'will be reading', 'will reading'],
              correctAnswer: 'will have been reading',
              explanation: 'will have been + verb-ing',
            ),
          ],
        ),
      ],
    ),

    // ============================================================
    // GROUP 4: PAST FUTURE TENSES
    // ============================================================

    // 13. SIMPLE PAST FUTURE TENSE (Would)
    GrammarTopic(
      id: 'simple_past_future',
      title: 'Simple Past Future',
      description: 'Rencana dari sudut pandang masa lalu',
      lessons: [
        Lesson(
          id: 'spf_1',
          title: 'Rumus & Pengertian',
          content: '''**Simple Past Future Tense** atau Simple Future in the Past digunakan untuk membentuk kalimat tentang masa depan dari sudut pandang masa lalu. Tense ini digunakan untuk menyatakan tindakan yang akan dilakukan, membuat prediksi, atau membuat janji di masa depan pada saat berada di masa lalu. Biasanya, tense ini ditemukan dalam kalimat yang tidak langsung atau reported speech.

**Rumus:**
- Kalimat Positif: Subject + would + V1
- Kalimat Negatif: Subject + would + not + V1
- Kalimat Tanya (Interogatif): Would + Subject + V1?

**Kegunaan:**
1. Menyatakan tindakan yang akan dilakukan di masa lalu
2. Menyatakan prediksi atau janji dari sudut pandang masa lalu
3. Menyatakan permintaan sopan
4. Menyatakan kalimat tidak langsung (reported speech)

**would = akan (dari sudut pandang masa lalu)**''',
          examples: [
            GrammarExample(english: 'She said she would read the book.', indonesian: 'Dia bilang dia akan membaca buku.', sentenceType: SentenceType.positive),
            GrammarExample(english: 'She said she would not read the book.', indonesian: 'Dia bilang dia tidak akan membaca buku.', sentenceType: SentenceType.negative),
            GrammarExample(english: 'Would she read the book tomorrow?', indonesian: 'Apakah dia akan membaca buku besok?', sentenceType: SentenceType.interrogative),
          ],
          tips: [
            'Would = will di masa lalu',
            'Digunakan setelah said/told/thought',
          ],
          xpReward: 10,
        ),
        Lesson(
          id: 'spf_2',
          title: 'Would - Polite Requests',
          content: '''**Would untuk Permintaan Sopan:**

- Would you like some tea?
- Would you help me please?
- I would love to come.
- Would you mind opening the door?

**Polite vs Will:**
| Will | Would |
|------|-------|
| Langsung | Sopan |
| I will help you. | I would help you. (lebih sopan) |

**Conditional uses:**
- If I had money, I would buy a book.
- I would read if I had time.''',
          examples: [
            GrammarExample(english: 'Would you read this letter for me?', indonesian: 'Apakah kamu mau membaca surat ini untuk saya?', sentenceType: SentenceType.positive),
            GrammarExample(english: 'I would not read that document.', indonesian: 'Saya tidak akan membaca dokumen itu.', sentenceType: SentenceType.negative),
            GrammarExample(english: 'Would you like to read this book?', indonesian: 'Apakah kamu mau membaca buku ini?', sentenceType: SentenceType.interrogative),
          ],
          tips: [
            'Would lebih sopan dari will',
            'Would you like... = permintaan sangat sopan',
          ],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'spf_quiz',
          topicId: 'simple_past_future',
          title: 'Simple Past Future Test',
          xpReward: 20,
          questions: [
            QuizQuestion(
              id: 'spf_q1',
              type: QuestionType.multipleChoice,
              question: '___ you like some coffee?',
              options: ['Would', 'Will', 'Can', 'Do'],
              correctAnswer: 'Would',
              explanation: 'Would untuk permintaan sopan',
            ),
          ],
        ),
      ],
    ),

    // 14. PAST FUTURE CONTINUOUS TENSE (Would Be)
    GrammarTopic(
      id: 'past_future_continuous',
      title: 'Past Future Continuous',
      description: 'Aksi akan sedang seringkian (dari masa lalu)',
      lessons: [
        Lesson(
          id: 'pfc_1',
          title: 'Rumus & Pengertian',
          content: '''**Past Future Continuous Tense** atau Future Continuous in the Past digunakan untuk menunjukkan suatu peristiwa yang akan terjadi di masa lalu. Namun, peristiwa yang ada di cerita tersebut tidak dapat menjadi nyata karena satu dan lain hal yang terjadi di masa lalu.

**Rumus:**
- ✓ Positif: Subject + would + be + Verb-ing
- ✗ Negatif: Subject + would + not + be + Verb-ing
- ? Interogatif: Would + Subject + be + Verb-ing?

**Kegunaan:**
1. Future continuous in past - Akan sedang dari masa lalu
2. Imagining ongoing actions - Membayangkan aksi yang sedang seringkian
3. Polite refusals - Penolakan sopan

**would be + verb-ing = akan sedang (dari masa lalu)**''',
          examples: [
            GrammarExample(english: 'She said she would be reading at 8 PM.', indonesian: 'Dia bilang dia akan sedang membaca jam 8 malam.', sentenceType: SentenceType.positive),
            GrammarExample(english: 'She said she would not be reading when you called.', indonesian: 'Dia bilang dia tidak akan sedang membaca saat kamu menelepon.', sentenceType: SentenceType.negative),
            GrammarExample(english: 'Would she be reading at this time?', indonesian: 'Apakah dia akan sedang membaca saat ini?', sentenceType: SentenceType.interrogative),
          ],
          tips: [
            'would be + verb-ing = akan sedang',
            'Digunakan dalam imagined scenarios',
          ],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'pfc_quiz',
          topicId: 'past_future_continuous',
          title: 'Past Future Continuous Test',
          xpReward: 20,
          questions: [
            QuizQuestion(
              id: 'pfc_q1',
              type: QuestionType.multipleChoice,
              question: 'If it rained, we ___ (read) at home.',
              options: ['would be reading', 'would read', 'will read', 'reading'],
              correctAnswer: 'would be reading',
              explanation: 'would be + verb-ing',
            ),
          ],
        ),
      ],
    ),

    // 15. PAST FUTURE PERFECT TENSE (Would Have)
    GrammarTopic(
      id: 'past_future_perfect',
      title: 'Past Future Perfect',
      description: 'Aksi akan sudah selesai (dari masa lalu)',
      lessons: [
        Lesson(
          id: 'pfp_1',
          title: 'Rumus & Pengertian',
          content: '''**Past Future Perfect Tense** digunakan untuk menunjukkan sebuah kegiatan yang seharusnya sudah selesai di masa lalu. Namun, aktivitas tersebut tidak terselesaikan karena satu dan lain hal yang terjadi di masa lalu. Tense ini juga digunakan pada conditional sentence tipe 3.

**Rumus:**
- ✓ Positif: Subject + would + have + Past Participle (V3)
- ✗ Negatif: Subject + would + not + have + Past Participle (V3)
- ? Interogatif: Would + Subject + have + Past Participle (V3)?

**Kegunaan:**
1. Menyatakan kegiatan yang seharusnya sudah selesai di masa lalu
2. Menyatakan penyesalan (regret)
3. Menyatakan asumsi tentang masa lalu (conditional sentence tipe 3)

**would have = akan sudah (tidak terjadi)**''',
          examples: [
            GrammarExample(english: 'She said she would have read the book by then.', indonesian: 'Dia bilang dia akan sudah membaca buku saat itu.', sentenceType: SentenceType.positive),
            GrammarExample(english: 'She would not have read the book if you hadnt reminded her.', indonesian: 'Dia tidak akan membaca buku jika kamu tidak mengingatkannya.', sentenceType: SentenceType.negative),
            GrammarExample(english: 'Would she have read the book by yesterday?', indonesian: 'Apakah dia akan sudah membaca buku sebelum kemarin?', sentenceType: SentenceType.interrogative),
          ],
          tips: [
            'Third Conditional: If + Past Perfect, would have + V3',
            'Menyesali aksi yang tidak terjadi',
          ],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'pfp_quiz',
          topicId: 'past_future_perfect',
          title: 'Past Future Perfect Test',
          xpReward: 20,
          questions: [
            QuizQuestion(
              id: 'pfp_q1',
              type: QuestionType.multipleChoice,
              question: 'If I had studied, I ___ (read) the book.',
              options: ['would have read', 'would read', 'had read', 'would have reading'],
              correctAnswer: 'would have read',
              explanation: 'would have + V3 (Third Conditional)',
            ),
          ],
        ),
      ],
    ),

    // 16. PAST FUTURE PERFECT CONTINUOUS TENSE (Would Have Been)
    GrammarTopic(
      id: 'past_future_perfect_continuous',
      title: 'Past Future Perfect Continuous',
      description: 'Durasi aksi akan sudah tercapai (dari masa lalu)',
      lessons: [
        Lesson(
          id: 'pfpc_1',
          title: 'Rumus & Pengertian',
          content: '''**Past Future Perfect Continuous Tense** atau Future Perfect Continuous in the Past digunakan untuk menjelaskan tentang hal atau kegiatan yang akan, sedang, dan telah dilakukan di masa lalu. Biasanya, terdapat lebih dari satu keterangan waktu dalam tense yang satu ini. Namun, tense ini umumnya berbentuk asumsi atau pengandaian belaka.

**Rumus:**
- ✓ Positif: Subject + would + have + been + Verb-ing
- ✗ Negatif: Subject + would + not + have + been + Verb-ing
- ? Interogatif: Would + Subject + have + been + Verb-ing?

**Kegunaan:**
1. Menyatakan durasi kegiatan yang akan, sedang, dan telah dilakukan di masa lalu
2. Menyatakan asumsi kompleks tentang masa lalu
3. Menyatakan rangkaian aksi berantai

**would have been = akan sudah berlangsung (tidak terjadi)**''',
          examples: [
            GrammarExample(english: 'She would have been reading for three hours by then.', indonesian: 'Dia akan sudah membaca selama tiga jam saat itu.', sentenceType: SentenceType.positive),
            GrammarExample(english: 'She would not have been reading long if you hadnt called.', indonesian: 'Dia tidak akan lama membaca jika kamu tidak menelepon.', sentenceType: SentenceType.negative),
            GrammarExample(english: 'Would she have been reading all night?', indonesian: 'Apakah dia akan sudah membaca sepanjang malam?', sentenceType: SentenceType.interrogative),
          ],
          tips: [
            'Tense paling kompleks dalam bahasa Inggris',
            'Jarang digunakan dalam percakapan sehari-hari',
          ],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'pfpc_quiz',
          topicId: 'past_future_perfect_continuous',
          title: 'Past Future Perfect Continuous Test',
          xpReward: 20,
          questions: [
            QuizQuestion(
              id: 'pfpc_q1',
              type: QuestionType.multipleChoice,
              question: 'By last night, she ___ (read) for 5 hours.',
              options: ['would have been reading', 'would have read', 'would be reading', 'had been reading'],
              correctAnswer: 'would have been reading',
              explanation: 'would have been + verb-ing',
            ),
          ],
        ),
      ],
    ),
  ];
}

/// Extra Grammar Topics (NOT part of 16 tenses standard)
class ExtraGrammarData {
  static final List<GrammarTopic> extraTopics = [
    // BE GOING TO - sebagai variasi Simple Future
    GrammarTopic(
      id: 'be_going_to',
      title: 'Be Going To',
      description: 'Rencana dan prediksi dengan bukti',
      lessons: [
        Lesson(
          id: 'bgt_1',
          title: 'Rumus & Pengertian',
          content: '''**Be Going To** adalah konstruksi yang digunakan untuk menyatakan rencana yang sudah dipikirkan atau prediksi dengan bukti.

**Rumus:**
- ✓ Positif: Subject + am/is/are + going to + Verb (base)
- ✗ Negatif: Subject + am/is/are + not + going to + Verb (base)
- ? Interogatif: Am/Is/Are + Subject + going to + Verb (base)?

**Kegunaan:**
1. Planned intentions - Rencana yang sudah dipikirkan
2. Predictions with evidence - Prediksi dengan bukti
3. Previous decisions - Keputusan sebelumnya

**Sudah ada bukti/rencana = going to''',
          examples: [
            GrammarExample(english: 'She is going to read the book tonight.', indonesian: 'Dia akan membaca buku malam ini.', sentenceType: SentenceType.positive),
            GrammarExample(english: 'She is not going to read the novel.', indonesian: 'Dia tidak akan membaca novel tersebut.', sentenceType: SentenceType.negative),
            GrammarExample(english: 'Is she going to read the book tomorrow?', indonesian: 'Apakah dia akan membaca buku besok?', sentenceType: SentenceType.interrogative),
          ],
          tips: [
            'Going to = rencana dengan bukti',
            'Will = keputusan spontan',
          ],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'bgt_quiz',
          topicId: 'be_going_to',
          title: 'Be Going To Test',
          xpReward: 20,
          questions: [
            QuizQuestion(
              id: 'bgt_q1',
              type: QuestionType.multipleChoice,
              question: 'I ___ (read) a new book tonight.',
              options: ['am going to read', 'will read', 'read', 'reading'],
              correctAnswer: 'am going to read',
              explanation: 'am going to + verb',
            ),
          ],
        ),
      ],
    ),

    // USED TO - bukan bagian dari 16 tenses
    GrammarTopic(
      id: 'used_to',
      title: 'Used To',
      description: 'Kebiasaan masa lalu yang sudah berhenti',
      lessons: [
        Lesson(
          id: 'ut_1',
          title: 'Rumus & Pengertian',
          content: '''**Used To** adalah konstruksi yang digunakan untuk menyatakan kebiasaan atau keadaan masa lalu yang sudah tidak berlanjut sampai sekarang.

**Rumus:**
- ✓ Positif: Subject + used to + Verb (base)
- ✗ Negatif: Subject + did not + use to + Verb (base)
- ? Interogatif: Did + Subject + use to + Verb (base)?

**Kegunaan:**
1. Past habits - Kebiasaan masa lalu yang sudah berhenti
2. Past states - Keadaan masa lalu yang sudah berubah
3. Things that were true but not now

**Used to = Dulu (sekarang sudah tidak)**''',
          examples: [
            GrammarExample(english: 'She used to read books every night.', indonesian: 'Dulu dia membaca buku setiap malam.', sentenceType: SentenceType.positive),
            GrammarExample(english: 'She did not use to read magazines.', indonesian: 'Dulu dia tidak membaca majalah.', sentenceType: SentenceType.negative),
            GrammarExample(english: 'Did she use to read novels?', indonesian: 'Apakah dulu dia membaca novel?', sentenceType: SentenceType.interrogative),
          ],
          tips: [
            'Used to = kebiasaan/keadaan masa lalu',
            'Sekarang sudah berhenti = Used To',
          ],
          xpReward: 10,
        ),
        Lesson(
          id: 'ut_2',
          title: 'Used To vs Would',
          content: '''**USED TO:**
- Past habits AND states
- Sekarang sudah tidak dilakukan
- I used to read books every evening. (dulu membaca buku setiap sore)
- I used to be a voracious reader. (dulu saya pembaca rakus)

**WOULD:**
- Past habits only (tidak untuk states)
- Would lebih formal
- Every weekend, I would read at the library.

**Perbandingan:**
| Used To | Would |
|---------|-------|
| Habits + States | Habits only |
| Past + Present contrast | Past habitual |''',
          examples: [
            GrammarExample(english: 'I used to read the newspaper every morning.', indonesian: 'Dulu saya membaca koran setiap pagi.', sentenceType: SentenceType.positive),
            GrammarExample(english: 'I did not use to read comics.', indonesian: 'Dulu saya tidak membaca komik.', sentenceType: SentenceType.negative),
            GrammarExample(english: 'Did you use to read English books?', indonesian: 'Apakah dulu kamu membaca buku bahasa Inggris?', sentenceType: SentenceType.interrogative),
          ],
          tips: [
            'States = used to (be, live, have)',
            'Would tidak bisa untuk states',
          ],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'ut_quiz',
          topicId: 'used_to',
          title: 'Used To Test',
          xpReward: 20,
          questions: [
            QuizQuestion(
              id: 'ut_q1',
              type: QuestionType.multipleChoice,
              question: 'I ___ (read) English novels before.',
              options: ['used to read', 'use to read', 'read', 'reading'],
              correctAnswer: 'used to read',
              explanation: 'used to + verb',
            ),
          ],
        ),
      ],
    ),
  ];
}

/// Tabel Referensi 16 Tenses Bahasa Inggris (Ruangguru Standard)
/// No. | Jenis Tenses | Kegunaannya
class TensesReference {
  static final List<TensesReferenceItem> referenceTable = [
    // ============================================================
    // GROUP 1: PRESENT TENSES
    // ============================================================
    TensesReferenceItem(
      no: 1,
      id: 'simple_present',
      name: 'Simple Present Tense',
      formula: 'S + V1 (s/es)',
      kegunaan: 'Menyatakan kebiasaan, fakta umum, atau kegiatan yang terjadi secara rutin.',
    ),
    TensesReferenceItem(
      no: 2,
      id: 'present_continuous',
      name: 'Present Continuous Tense',
      formula: 'S + am/is/are + V-ing',
      kegunaan: 'Menyatakan kegiatan yang sedang berlangsung saat ini.',
    ),
    TensesReferenceItem(
      no: 3,
      id: 'present_perfect',
      name: 'Present Perfect Tense',
      formula: 'S + have/has + V3',
      kegunaan: 'Menyatakan kejadian yang sudah terjadi, tetapi hasilnya masih berpengaruh sampai sekarang.',
    ),
    TensesReferenceItem(
      no: 4,
      id: 'present_perfect_continuous',
      name: 'Present Perfect Continuous Tense',
      formula: 'S + have/has + been + V-ing',
      kegunaan: 'Menyatakan kegiatan yang sudah dimulai di masa lalu dan masih berlangsung sampai sekarang.',
    ),

    // ============================================================
    // GROUP 2: PAST TENSES
    // ============================================================
    TensesReferenceItem(
      no: 5,
      id: 'simple_past',
      name: 'Simple Past Tense',
      formula: 'S + V2',
      kegunaan: 'Menyatakan kejadian yang terjadi di masa lampau dan sudah selesai.',
    ),
    TensesReferenceItem(
      no: 6,
      id: 'past_continuous',
      name: 'Past Continuous Tense',
      formula: 'S + was/were + V-ing',
      kegunaan: 'Menyatakan kegiatan yang sedang berlangsung pada waktu tertentu di masa lalu.',
    ),
    TensesReferenceItem(
      no: 7,
      id: 'past_perfect',
      name: 'Past Perfect Tense',
      formula: 'S + had + V3',
      kegunaan: 'Menyatakan kejadian yang terjadi lebih dulu sebelum kejadian lain di masa lalu.',
    ),
    TensesReferenceItem(
      no: 8,
      id: 'past_perfect_continuous',
      name: 'Past Perfect Continuous Tense',
      formula: 'S + had + been + V-ing',
      kegunaan: 'Menyatakan kegiatan yang berlangsung dalam durasi tertentu sebelum kejadian lain di masa lalu.',
    ),

    // ============================================================
    // GROUP 3: FUTURE TENSES
    // ============================================================
    TensesReferenceItem(
      no: 9,
      id: 'simple_future',
      name: 'Simple Future Tense',
      formula: 'S + will + V1',
      kegunaan: 'Menyatakan rencana atau kejadian yang akan terjadi di masa depan.',
    ),
    TensesReferenceItem(
      no: 10,
      id: 'future_continuous',
      name: 'Future Continuous Tense',
      formula: 'S + will + be + V-ing',
      kegunaan: 'Menyatakan kegiatan yang akan sedang berlangsung pada waktu tertentu di masa depan.',
    ),
    TensesReferenceItem(
      no: 11,
      id: 'future_perfect',
      name: 'Future Perfect Tense',
      formula: 'S + will + have + V3',
      kegunaan: 'Menyatakan kegiatan yang akan sudah selesai pada waktu tertentu di masa depan.',
    ),
    TensesReferenceItem(
      no: 12,
      id: 'future_perfect_continuous',
      name: 'Future Perfect Continuous Tense',
      formula: 'S + will + have + been + V-ing',
      kegunaan: 'Menyatakan kegiatan yang akan sudah berlangsung selama durasi tertentu di masa depan.',
    ),

    // ============================================================
    // GROUP 4: PAST FUTURE TENSES
    // ============================================================
    TensesReferenceItem(
      no: 13,
      id: 'simple_past_future',
      name: 'Simple Past Future Tense',
      formula: 'S + would + V1',
      kegunaan: 'Menyatakan rencana atau kejadian masa depan yang dilihat dari sudut pandang masa lalu.',
    ),
    TensesReferenceItem(
      no: 14,
      id: 'past_future_continuous',
      name: 'Past Future Continuous Tense',
      formula: 'S + would + be + V-ing',
      kegunaan: 'Menyatakan kegiatan yang akan sedang berlangsung di masa depan dari sudut pandang masa lalu.',
    ),
    TensesReferenceItem(
      no: 15,
      id: 'past_future_perfect',
      name: 'Past Future Perfect Tense',
      formula: 'S + would + have + V3',
      kegunaan: 'Menyatakan kegiatan yang akan sudah selesai di masa depan dari sudut pandang masa lalu.',
    ),
    TensesReferenceItem(
      no: 16,
      id: 'past_future_perfect_continuous',
      name: 'Past Future Perfect Continuous Tense',
      formula: 'S + would + have + been + V-ing',
      kegunaan: 'Menyatakan kegiatan yang akan sudah berlangsung selama durasi tertentu di masa depan dari sudut pandang masa lalu.',
    ),
  ];
}

/// Model untuk Tabel Referensi 16 Tenses
class TensesReferenceItem {
  final int no;
  final String id;
  final String name;
  final String formula;
  final String kegunaan;

  const TensesReferenceItem({
    required this.no,
    required this.id,
    required this.name,
    required this.formula,
    required this.kegunaan,
  });
}
