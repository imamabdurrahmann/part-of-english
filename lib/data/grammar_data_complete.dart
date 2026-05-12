import '../models/grammar_models.dart';

// Colors for categories
const int tensesColor = 0xFF6C63FF;
const int partsOfSpeechColor = 0xFF00C853;
const int sentenceColor = 0xFFFF9800;
const int specialColor = 0xFFF44336;
const int vocabularyColor = 0xFF2196F3;
const int verbsColor = 0xFF9C27B0;

class GrammarDataComplete {
  // ==================== 16 TENSES ====================
  static final List<GrammarTopic> tensesTopics = [
    // 1. PRESENT SIMPLE
    GrammarTopic(
      id: 'present_simple',
      title: 'Present Simple',
      description: 'Habitual actions, facts, general truths',
      lessons: [
        Lesson(
          id: 'ps_1',
          title: 'What is Present Simple?',
          content: '''Present Simple (Simple Present) adalah tense yang digunakan untuk menyatakan:

**Fungsi:**
1. Habitual actions - Tindakan rutin
2. General truths - Fakta umum
3. Scheduled events - Jadwal
4. Permanent situations - Situasi permanen

**Rumus:**
- ✓ Positif: Subject + Verb (s/es) + Object
- ✗ Negatif: Subject + do/does + not + Verb (base)
- ? Tanya: Do/Does + Subject + Verb (base)?''',
          examples: [
            GrammarExample(english: 'I eat breakfast every day.', indonesian: 'Saya sarapan setiap hari.', explanation: 'Habitual action'),
            GrammarExample(english: 'The sun rises in the east.', indonesian: 'Matahari terbit dari timur.', explanation: 'General truth'),
            GrammarExample(english: 'She works at a bank.', indonesian: 'Dia bekerja di bank.', explanation: 'Permanent situation'),
          ],
          tips: [
            'Gunakan Verb (s/es) untuk he/she/it',
            'Do not = dont / Does not = doesnt',
          ],
          xpReward: 10,
        ),
        Lesson(
          id: 'ps_2',
          title: 'Positive Form (+)',
          content: '''**Present Simple Positive**

Subject + Verb (s/es)

**Aturan -s/-es:**
1. Umum: +s → works, plays, reads
2. -s, -ss, -sh, -ch, -x, -z: +es → watches, fixes, goes
3. -y + konsonan: -y → -ies → studies, tries
4. -y + vokal: +s → plays, says

**Special Verbs:**
- have → has
- go → goes''',
          examples: [
            GrammarExample(english: 'I work every day.', indonesian: 'Saya bekerja setiap hari.'),
            GrammarExample(english: 'She plays football.', indonesian: 'Dia bermain sepak bola.'),
            GrammarExample(english: 'He studies English.', indonesian: 'Dia belajar bahasa Inggris.'),
            GrammarExample(english: 'The cat sleeps on the sofa.', indonesian: 'Kucing itu tidur di sofa.'),
          ],
          tips: ['Ingat: He/She/It + s/es'],
          xpReward: 10,
        ),
        Lesson(
          id: 'ps_3',
          title: 'Negative Form (-)',
          content: '''**Present Simple Negative**

Subject + do/does + not + Verb (base)

**Pengecilan:**
- do not = don't
- does not = doesn't

**Ingat: Setelah dont/didnt, gunakan verb dasar (tanpa -s)''',
          examples: [
            GrammarExample(english: 'I do not like coffee.', indonesian: 'Saya tidak suka kopi.'),
            GrammarExample(english: 'She does not work on Sundays.', indonesian: 'Dia tidak bekerja hari Minggu.'),
            GrammarExample(english: 'They do not live in Jakarta.', indonesian: 'Mereka tidak tinggal di Jakarta.'),
            GrammarExample(english: 'He does not eat meat.', indonesian: 'Dia tidak makan daging.'),
          ],
          tips: ['Dont untuk I/you/we/they', 'Doesnt untuk he/she/it'],
          xpReward: 10,
        ),
        Lesson(
          id: 'ps_4',
          title: 'Question Form (?)',
          content: '''**Present Simple Questions**

Do/Does + Subject + Verb (base)?

**Wh- Questions:**
- What do you do? = Apa pekerjaanmu?
- Where does she live? = Di mana dia tinggal?
- When do they come? = Kapan mereka datang?
- Why do you study? = Mengapa kamu belajar?''',
          examples: [
            GrammarExample(english: 'Do you speak English?', indonesian: 'Apakah kamu berbicara bahasa Inggris?'),
            GrammarExample(english: 'Does she like music?', indonesian: 'Apakah dia suka musik?'),
            GrammarExample(english: 'What do you do?', indonesian: 'Apa yang kamu lakukan?'),
            GrammarExample(english: 'Where does he work?', indonesian: 'Di mana dia bekerja?'),
          ],
          tips: ['Gunakan does untuk he/she/it', 'Wh + does + he/she/it'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'ps_quiz',
          topicId: 'present_simple',
          title: 'Present Simple Test',
          xpReward: 20,
          questions: [
            QuizQuestion(id: 'ps_q1', type: QuestionType.multipleChoice, question: 'She ___ English every day.', options: ['learns', 'learn', 'learning', 'learned'], correctAnswer: 'learns', explanation: 'She/He/It + Verb + s'),
            QuizQuestion(id: 'ps_q2', type: QuestionType.fillInBlank, question: 'I ___ (not/watch) TV.', options: ['do not watch', 'does not watch', 'not watch', 'does not watches'], correctAnswer: 'do not watch', explanation: 'I + dont + verb'),
            QuizQuestion(id: 'ps_q3', type: QuestionType.trueFalse, question: '"He goes to school" benar untuk Present Simple.', options: ['True', 'False'], correctAnswer: 'True', explanation: 'He goes = Present Simple'),
            QuizQuestion(id: 'ps_q4', type: QuestionType.multipleChoice, question: '___ you like pizza?', options: ['Do', 'Does', 'Is', 'Are'], correctAnswer: 'Do', explanation: 'You + Do'),
            QuizQuestion(id: 'ps_q5', type: QuestionType.fillInBlank, question: 'They ___ (work) at the hospital.', options: ['work', 'works', 'working', 'worked'], correctAnswer: 'work', explanation: 'They + Verb dasar'),
          ],
        ),
      ],
    ),
    // 2. PRESENT CONTINUOUS
    GrammarTopic(
      id: 'present_continuous',
      title: 'Present Continuous',
      description: 'Actions happening now, temporary actions',
      lessons: [
        Lesson(
          id: 'pc_1',
          title: 'Understanding Present Continuous',
          content: '''Present Continuous (Present Progressive)

**Fungsi:**
1. Actions happening now - Sedang berlangsung sekarang
2. Temporary situations - Situasi sementara
3. Future arrangements - Rencana masa depan
4. Always + continuous - Perilaku menjengkelkan

**Rumus:**
- ✓: Subject + am/is/are + Verb-ing
- ✗: Subject + am/is/are + not + Verb-ing
- ?: Am/Is/Are + Subject + Verb-ing?''',
          examples: [
            GrammarExample(english: 'I am reading a book now.', indonesian: 'Saya sedang membaca buku sekarang.'),
            GrammarExample(english: 'She is staying with her friend.', indonesian: 'Dia tinggal bersama temannya.'),
            GrammarExample(english: 'We are meeting tomorrow.', indonesian: 'Kami bertemu besok.'),
          ],
          tips: ['am untuk I', 'are untuk you/we/they', 'is untuk he/she/it'],
          xpReward: 10,
        ),
        Lesson(
          id: 'pc_2',
          title: 'Positive, Negative, Question',
          content: '''**Positive (+):**
Subject + am/is/are + Verb-ing
- I am studying.
- She is eating.
- They are playing.

**Negative (-):**
Subject + am/is/are + not + Verb-ing
- I am not studying.
- She is not eating.
- They are not playing.

**Question (?):**
Am/Is/Are + Subject + Verb-ing?
- Are you studying?
- Is she eating?
- Are they playing?''',
          examples: [
            GrammarExample(english: 'I am working now.', indonesian: 'Saya sedang bekerja sekarang.'),
            GrammarExample(english: 'She is not sleeping.', indonesian: 'Dia tidak sedang tidur.'),
            GrammarExample(english: 'Are you listening?', indonesian: 'Apakah kamu sedang mendengarkan?'),
            GrammarExample(english: 'What are you doing?', indonesian: 'Apa yang kamu sedang lakukan?'),
          ],
          tips: ['Verb + ing = Verb-ing'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'pc_quiz',
          topicId: 'present_continuous',
          title: 'Present Continuous Test',
          xpReward: 20,
          questions: [
            QuizQuestion(id: 'pc_q1', type: QuestionType.multipleChoice, question: 'I ___ (eat) dinner now.', options: ['am eating', 'is eating', 'are eating', 'eating'], correctAnswer: 'am eating', explanation: 'I + am + eating'),
            QuizQuestion(id: 'pc_q2', type: QuestionType.trueFalse, question: '"They are studying" = mereka sedang belajar.', options: ['True', 'False'], correctAnswer: 'True', explanation: 'Present Continuous = sedang'),
            QuizQuestion(id: 'pc_q3', type: QuestionType.fillInBlank, question: 'She ___ (make) a cake.', options: ['is making', 'are making', 'am making', 'making'], correctAnswer: 'is making', explanation: 'She + is + making'),
          ],
        ),
      ],
    ),
    // 3. PAST SIMPLE
    GrammarTopic(
      id: 'past_simple',
      title: 'Past Simple',
      description: 'Completed actions in the past',
      lessons: [
        Lesson(
          id: 'pst_1',
          title: 'Introduction to Past Simple',
          content: '''Past Simple (Simple Past)

**Fungsi:**
1. Completed actions - Tindakan selesai di masa lalu
2. Specific time - Waktu spesifik
3. Sequential actions - Tindakan berurutan
4. Past habits - Kebiasaan masa lalu

**Rumus:**
- ✓: Subject + Verb (ed/2) + Object
- ✗: Subject + did + not + Verb (base)
- ?: Did + Subject + Verb (base)?''',
          examples: [
            GrammarExample(english: 'I visited Jakarta last week.', indonesian: 'Saya ke Jakarta minggu lalu.'),
            GrammarExample(english: 'She was a teacher before.', indonesian: 'Dulu dia guru.'),
            GrammarExample(english: 'He played football yesterday.', indonesian: 'Dia main sepak bola kemarin.'),
          ],
          tips: ['Yesterday, last week, ago = Past Simple'],
          xpReward: 10,
        ),
        Lesson(
          id: 'pst_2',
          title: 'Regular & Irregular Verbs',
          content: '''**Regular Verbs:** +ed
- work → worked
- play → played
- want → wanted

**Irregular Verbs:**
- go → went
- eat → ate
- see → saw
- come → came
- take → took
- write → wrote
- read → read
- become → became''',
          examples: [
            GrammarExample(english: 'I worked yesterday.', indonesian: 'Saya bekerja kemarin.'),
            GrammarExample(english: 'She went to Bali.', indonesian: 'Dia ke Bali.'),
            GrammarExample(english: 'They ate sushi.', indonesian: 'Mereka makan sushi.'),
            GrammarExample(english: 'He wrote a letter.', indonesian: 'Dia menulis surat.'),
          ],
          tips: ['Hafalkan verb irregular yang sering'],
          xpReward: 10,
        ),
        Lesson(
          id: 'pst_3',
          title: 'Negative & Question',
          content: '''**Negative (-):**
Subject + did + not + Verb (base)
- I did not (didnt) go.
- She did not (didnt) come.

**Question (?):**
Did + Subject + Verb (base)?
- Did you see the movie?
- Where did she go?
- What did he say?''',
          examples: [
            GrammarExample(english: 'I did not finish my homework.', indonesian: 'Saya tidak menyelesaikan PR.'),
            GrammarExample(english: 'Did you meet her?', indonesian: 'Apakah kamu bertemu dia?'),
            GrammarExample(english: 'Why did he leave?', indonesian: 'Mengapa dia pergi?'),
            GrammarExample(english: 'What did they buy?', indonesian: 'Apa yang mereka beli?'),
          ],
          tips: ['Didnt + verb dasar (tanpa -ed)'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'pst_quiz',
          topicId: 'past_simple',
          title: 'Past Simple Test',
          xpReward: 20,
          questions: [
            QuizQuestion(id: 'pst_q1', type: QuestionType.multipleChoice, question: 'She ___ to the store yesterday.', options: ['go', 'goes', 'went', 'going'], correctAnswer: 'went', explanation: 'go → went'),
            QuizQuestion(id: 'pst_q2', type: QuestionType.fillInBlank, question: 'I ___ (not/see) the movie.', options: ['did not see', 'did not saw', 'not see', 'didnt saw'], correctAnswer: 'did not see', explanation: 'Did + not + verb'),
            QuizQuestion(id: 'pst_q3', type: QuestionType.multipleChoice, question: '___ you ___ (meet) John?', options: ['Did/met', 'Did/meet', 'Do/met', 'Does/meet'], correctAnswer: 'Did/meet', explanation: 'Did + subject + verb'),
          ],
        ),
      ],
    ),
    // 4. PAST CONTINUOUS
    GrammarTopic(
      id: 'past_continuous',
      title: 'Past Continuous',
      description: 'Actions in progress in the past',
      lessons: [
        Lesson(
          id: 'pcont_1',
          title: 'Understanding Past Continuous',
          content: '''Past Continuous

**Fungsi:**
1. Action in progress - Sedang berlangsung di masa lalu
2. Background actions - Tindakan latar belakang
3. Two simultaneous actions - Dua tindakan bersamaan
4. Interrupted actions - Tindakan yang terganggu

**Rumus:**
- ✓: Subject + was/were + Verb-ing
- ✗: Subject + was/were + not + Verb-ing
- ?: Was/Were + Subject + Verb-ing?''',
          examples: [
            GrammarExample(english: 'I was studying at 8 PM.', indonesian: 'Saya sedang belajar jam 8 malam.'),
            GrammarExample(english: 'While I was cooking, the phone rang.', indonesian: 'Saat saya memasak, telepon berdering.'),
            GrammarExample(english: 'She was reading while he was sleeping.', indonesian: 'Dia sedang membaca sementara dia tidur.'),
          ],
          tips: ['was untuk I/he/she/it', 'were untuk you/we/they'],
          xpReward: 10,
        ),
        Lesson(
          id: 'pcont_2',
          title: 'Past Continuous vs Past Simple',
          content: '''**Past Continuous + when + Past Simple:**
- I was sleeping when she called.
- They were eating when it rained.

**While + Past Continuous:**
- While I was studying, my brother was playing games.

**Perbedaan:**
| Continuous | Simple |
|------------|--------|
| Sedang berlangsung | Selesai/terputus |''',
          examples: [
            GrammarExample(english: 'The phone rang while I was sleeping.', indonesian: 'Telepon berdering saat saya tidur.'),
            GrammarExample(english: 'When I arrived, they were eating.', indonesian: 'Saat saya tiba, mereka sedang makan.'),
            GrammarExample(english: 'She was walking when it started to rain.', indonesian: 'Dia berjalan saat hujan turun.'),
          ],
          tips: ['when = Past Simple (interrupt)', 'while = Past Continuous (background)'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'pcont_quiz',
          topicId: 'past_continuous',
          title: 'Past Continuous Test',
          xpReward: 20,
          questions: [
            QuizQuestion(id: 'pcont_q1', type: QuestionType.multipleChoice, question: 'I ___ (sleep) when the alarm rang.', options: ['was sleeping', 'were sleeping', 'am sleeping', 'sleeping'], correctAnswer: 'was sleeping', explanation: 'I + was + sleeping'),
            QuizQuestion(id: 'pcont_q2', type: QuestionType.fillInBlank, question: 'They ___ (watch) TV when I came.', options: ['were watching', 'was watching', 'are watching', 'watching'], correctAnswer: 'were watching', explanation: 'They + were + watching'),
          ],
        ),
      ],
    ),
    // 5. PRESENT PERFECT
    GrammarTopic(
      id: 'present_perfect',
      title: 'Present Perfect',
      description: 'Past actions with present relevance',
      lessons: [
        Lesson(
          id: 'pp_1',
          title: 'Introduction to Present Perfect',
          content: '''Present Perfect

**Fungsi:**
1. Experience - Pengalaman hidup
2. Completed action - Tindakan selesai dengan hasil sekarang
3. Action continuing - Tindakan berlanjut sampai sekarang
4. Recently completed - Baru saja selesai

**Rumus:**
- ✓: Subject + have/has + Past Participle (V3)
- ✗: Subject + have/has + not + V3
- ?: Have/Has + Subject + V3?''',
          examples: [
            GrammarExample(english: 'I have been to Japan.', indonesian: 'Saya pernah ke Jepang.'),
            GrammarExample(english: 'She has finished her homework.', indonesian: 'Dia sudah menyelesaikan PR.'),
            GrammarExample(english: 'I have lived here for 5 years.', indonesian: 'Saya sudah tinggal di sini 5 tahun.'),
          ],
          tips: ['has untuk he/she/it', 'have untuk I/you/we/they'],
          xpReward: 10,
        ),
        Lesson(
          id: 'pp_2',
          title: 'Time Markers & Usage',
          content: '''**Kata Kunci Present Perfect:**

**Experience:** ever, never, before, once/twice
- Have you ever eaten sushi?
- I have never been to America.

**Recently:** just, already, yet, recently
- I have just finished.
- She has not finished yet.

**Duration:** for, since, how long
- I have lived here for 10 years.
- How long have you known her?

**TIDAK gunakan:** yesterday, last week, in 2020''',
          examples: [
            GrammarExample(english: 'Have you ever been to Paris?', indonesian: 'Apakah kamu pernah ke Paris?'),
            GrammarExample(english: 'I have already eaten.', indonesian: 'Saya sudah makan.'),
            GrammarExample(english: 'She has not finished yet.', indonesian: 'Dia belum selesai.'),
            GrammarExample(english: 'How long have you lived here?', indonesian: 'Berapa lama kamu tinggal di sini?'),
          ],
          tips: ['yet biasanya di akhir kalimat', 'already sebelum verb'],
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
            QuizQuestion(id: 'pp_q1', type: QuestionType.multipleChoice, question: 'She ___ (be) to Tokyo twice.', options: ['has been', 'have been', 'was', 'were'], correctAnswer: 'has been', explanation: 'She + has + been'),
            QuizQuestion(id: 'pp_q2', type: QuestionType.fillInBlank, question: 'Have you ever ___ (eat) sushi?', options: ['eaten', 'ate', 'eat', 'eating'], correctAnswer: 'eaten', explanation: 'have + ever + eaten'),
          ],
        ),
      ],
    ),
    // 6. PAST PERFECT
    GrammarTopic(
      id: 'past_perfect',
      title: 'Past Perfect',
      description: 'Actions before another past action',
      lessons: [
        Lesson(
          id: 'pd_1',
          title: 'Understanding Past Perfect',
          content: '''Past Perfect

**Fungsi:**
1. Earlier past - Tindakan lebih dulu di masa lalu
2. Before another action - Sebelum tindakan lain
3. Unfulfilled wishes - Keinginan tidak terpenuhi

**Rumus:**
- ✓: Subject + had + Past Participle (V3)
- ✗: Subject + had + not + V3
- ?: Had + Subject + V3?

**had = sudah (lebih dulu)''',
          examples: [
            GrammarExample(english: 'I had finished before she came.', indonesian: 'Saya sudah selesai sebelum dia datang.'),
            GrammarExample(english: 'By the time I arrived, the movie had started.', indonesian: 'Saat saya tiba, film sudah mulai.'),
            GrammarExample(english: 'She had left when I got there.', indonesian: 'Dia sudah pergi saat saya tiba.'),
          ],
          tips: ['Gunakan had untuk semua subject'],
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

**Past Perfect = aksi pertama (lebih dulu)**
**Past Simple = aksi kedua (setelahnya)**''',
          examples: [
            GrammarExample(english: 'When I got home, mother had cooked dinner.', indonesian: 'Saat saya pulang, ibu sudah memasak.'),
            GrammarExample(english: 'She had already left when I called.', indonesian: 'Dia sudah pergi saat saya menelepon.'),
            GrammarExample(english: 'They had finished before deadline.', indonesian: 'Mereka sudah selesai sebelum deadline.'),
          ],
          tips: ['Past Perfect diikuti Past Simple'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'pd_quiz',
          topicId: 'past_perfect',
          title: 'Past Perfect Test',
          xpReward: 15,
          questions: [
            QuizQuestion(id: 'pd_q1', type: QuestionType.multipleChoice, question: 'She ___ (finish) before I called.', options: ['had finished', 'has finished', 'finished', 'was finishing'], correctAnswer: 'had finished', explanation: 'had + finished'),
          ],
        ),
      ],
    ),
    // 7. FUTURE SIMPLE
    GrammarTopic(
      id: 'future_simple',
      title: 'Future Simple (Will)',
      description: 'Predictions, promises, spontaneous decisions',
      lessons: [
        Lesson(
          id: 'fs_1',
          title: 'Understanding Future Simple (Will)',
          content: '''Future Simple (Will)

**Fungsi:**
1. Predictions - Prediksi/dugaan
2. Promises - Janji
3. Spontaneous decisions - Keputusan spontan
4. Threats/Offers - Tawaran

**Rumus:**
- ✓: Subject + will + Verb (base)
- ✗: Subject + will + not + Verb (base)
- ?: Will + Subject + Verb (base)?''',
          examples: [
            GrammarExample(english: 'I will help you tomorrow.', indonesian: 'Saya akan membantumu besok.'),
            GrammarExample(english: 'It will rain later.', indonesian: 'Nanti akan hujan.'),
            GrammarExample(english: 'I will never forget you.', indonesian: 'Saya tidak akan pernah melupakanmu.'),
          ],
          tips: ['will = akan', 'wont = will not'],
          xpReward: 10,
        ),
        Lesson(
          id: 'fs_2',
          title: 'Will vs Going To',
          content: '''**WILL:**
- Spontaneous decision: I'll help you! ( baru decide)
- Prediction: I think it will rain.
- Promise: I will always love you.
- Offer: I'll do it for you.

**GOING TO:**
- Planned intention: I'm going to study next year.
- Evidence: Look! It's going to rain!
- Previous plan: I'm going to visit grandmother.

**Beda:**
| Will | Going To |
|------|----------|
| Spontaneous | Planned |
| No evidence | With evidence |''',
          examples: [
            GrammarExample(english: 'I will call you later. (spontaneous)', indonesian: 'Saya akan meneleponmu nanti.'),
            GrammarExample(english: 'I am going to study medicine. (plan)', indonesian: 'Saya akan belajar kedokteran.'),
            GrammarExample(english: 'The phone is ringing. I will answer it.', indonesian: 'Telepon berdering. Saya yang akan menjawab.'),
          ],
          tips: ['Spontaneous = will', 'Plan = going to'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'fs_quiz',
          topicId: 'future_simple',
          title: 'Future Simple Test',
          xpReward: 20,
          questions: [
            QuizQuestion(id: 'fs_q1', type: QuestionType.multipleChoice, question: 'I ___ (visit) my grandmother tomorrow.', options: ['will visit', 'am going to visit', 'visit', 'visiting'], correctAnswer: 'will visit', explanation: 'will + verb'),
          ],
        ),
      ],
    ),
    // 8. FUTURE CONTINUOUS
    GrammarTopic(
      id: 'future_continuous',
      title: 'Future Continuous',
      description: 'Actions in progress at a future time',
      lessons: [
        Lesson(
          id: 'fc_1',
          title: 'Understanding Future Continuous',
          content: '''Future Continuous

**Fungsi:**
1. Action in progress - Sedang berlangsung di waktu future
2. Scheduled events - Acara terjadwal
3. Polite inquiries - Pertanyaan sopan tentang rencana

**Rumus:**
- ✓: Subject + will be + Verb-ing
- ✗: Subject + will not be + Verb-ing
- ?: Will + Subject + be + Verb-ing?

**will be + verb-ing = akan sedang''',
          examples: [
            GrammarExample(english: 'I will be sleeping at 10 PM.', indonesian: 'Saya akan sedang tidur jam 10.'),
            GrammarExample(english: 'At this time tomorrow, we will be flying.', indonesian: 'Jam ini besok, kami akan sedang terbang.'),
            GrammarExample(english: 'Will you be using the car tonight?', indonesian: 'Apakah kamu akan sedang menggunakan mobil?'),
          ],
          tips: ['Untuk waktu spesifik di masa depan'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'fc_quiz',
          topicId: 'future_continuous',
          title: 'Future Continuous Test',
          xpReward: 15,
          questions: [
            QuizQuestion(id: 'fc_q1', type: QuestionType.multipleChoice, question: 'At 8 PM, I ___ (have) dinner.', options: ['will be having', 'will have', 'am having', 'have'], correctAnswer: 'will be having', explanation: 'will be + verb-ing'),
          ],
        ),
      ],
    ),
    // 9. PRESENT PERFECT CONTINUOUS
    GrammarTopic(
      id: 'present_perfect_continuous',
      title: 'Present Perfect Continuous',
      description: 'Actions started in past and continue',
      lessons: [
        Lesson(
          id: 'ppc_1',
          title: 'Understanding Present Perfect Continuous',
          content: '''Present Perfect Continuous

**Fungsi:**
1. Duration - Tindakan berlangsung untuk waktu tertentu
2. Recently finished - Baru saja selesai dengan efek visible
3. Temporary situations - Situasi sementara

**Rumus:**
- ✓: Subject + have/has been + Verb-ing
- ✗: Subject + have/has + not + been + Verb-ing
- ?: Have/Has + Subject + been + Verb-ing?

**have been = sudah berlangsung + -ing''',
          examples: [
            GrammarExample(english: 'I have been studying for 3 years.', indonesian: 'Saya sudah belajar selama 3 tahun.'),
            GrammarExample(english: 'She is tired because she has been working.', indonesian: 'Dia lelah karena sudah bekerja.'),
            GrammarExample(english: 'How long have you been waiting?', indonesian: 'Berapa lama kamu sudah menunggu?'),
          ],
          tips: ['For + periode', 'Since + titik waktu'],
          xpReward: 10,
        ),
        Lesson(
          id: 'ppc_2',
          title: 'Present Perfect vs Continuous',
          content: '''**Perbedaan:**

| Present Perfect | Present Perfect Continuous |
|-----------------|--------------------------|
| Fokus pada hasil | Fokus pada proses |
| I have written 3 letters. | I have been writing. |
| (3 surat selesai) | (sedang menulis, lelah) |

**Present Perfect Continuous:**
- She is sweating. She has been running. (bukti: berkeringat)
- The wall is wet. I have been painting. (efek visible)

**Present Perfect:**
- I have painted the wall. (hasil: dinding dicat)''',
          examples: [
            GrammarExample(english: 'I have been reading for 2 hours.', indonesian: 'Saya sudah membaca 2 jam.'),
            GrammarExample(english: 'I have read 50 pages.', indonesian: 'Saya sudah membaca 50 halaman.'),
            GrammarExample(english: 'She has been crying. (mata merah)', indonesian: 'Dia sudah menangis.'),
          ],
          tips: ['Lihat efek = Continuous', 'Lihat hasil = Perfect'],
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
            QuizQuestion(id: 'ppc_q1', type: QuestionType.multipleChoice, question: 'I ___ (study) for 4 hours.', options: ['have been studying', 'has been studying', 'have studied', 'studying'], correctAnswer: 'have been studying', explanation: 'have been + studying'),
          ],
        ),
      ],
    ),
    // 10. PAST PERFECT CONTINUOUS
    GrammarTopic(
      id: 'past_perfect_continuous',
      title: 'Past Perfect Continuous',
      description: 'Actions in progress before another past action',
      lessons: [
        Lesson(
          id: 'ppd_1',
          title: 'Understanding Past Perfect Continuous',
          content: '''Past Perfect Continuous

**Fungsi:**
1. Duration before - Tindakan berlangsung sebelum tindakan lain
2. Cause in the past - Alasan di masa lalu

**Rumus:**
- ✓: Subject + had been + Verb-ing
- ✗: Subject + had + not + been + Verb-ing
- ?: Had + Subject + been + Verb-ing?

**had been = sudah berlangsung + -ing''',
          examples: [
            GrammarExample(english: 'I had been waiting for 30 minutes when she arrived.', indonesian: 'Saya sudah menunggu 30 menit saat dia tiba.'),
            GrammarExample(english: 'He was exhausted because he had been running.', indonesian: 'Dia lelah karena sudah berlari.'),
            GrammarExample(english: 'How long had you been studying?', indonesian: 'Berapa lama kamu sudah belajar?'),
          ],
          tips: ['Biasanya digunakan dengan when/because'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'ppd_quiz',
          topicId: 'past_perfect_continuous',
          title: 'Past Perfect Continuous Test',
          xpReward: 15,
          questions: [
            QuizQuestion(id: 'ppd_q1', type: QuestionType.multipleChoice, question: 'They ___ (play) for an hour when rain started.', options: ['had been playing', 'have been playing', 'were playing', 'had played'], correctAnswer: 'had been playing', explanation: 'had been + playing'),
          ],
        ),
      ],
    ),
    // 11. FUTURE PERFECT
    GrammarTopic(
      id: 'future_perfect',
      title: 'Future Perfect',
      description: 'Actions completed before a future time',
      lessons: [
        Lesson(
          id: 'fp_1',
          title: 'Understanding Future Perfect',
          content: '''Future Perfect

**Fungsi:**
1. Completed action - Tindakan selesai sebelum waktu tertentu
2. By the time - Sebelum/sesudah waktu tertentu

**Rumus:**
- ✓: Subject + will have + Past Participle (V3)
- ✗: Subject + will + not + have + V3
- ?: Will + Subject + have + V3?

**will have = akan sudah''',
          examples: [
            GrammarExample(english: 'I will have finished by 5 PM.', indonesian: 'Saya akan sudah selesai jam 5.'),
            GrammarExample(english: 'By next year, she will have graduated.', indonesian: 'Sebelum tahun depan, dia akan sudah lulus.'),
            GrammarExample(english: 'Will you have completed by Monday?', indonesian: 'Apakah kamu akan sudah selesai Senin?'),
          ],
          tips: ['By + waktu = sebelum waktu itu'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'fp_quiz',
          topicId: 'future_perfect',
          title: 'Future Perfect Test',
          xpReward: 15,
          questions: [
            QuizQuestion(id: 'fp_q1', type: QuestionType.multipleChoice, question: 'I ___ (finish) by tomorrow.', options: ['will have finished', 'have finished', 'will finish', 'finished'], correctAnswer: 'will have finished', explanation: 'will have + V3'),
          ],
        ),
      ],
    ),
    // 12. FUTURE PERFECT CONTINUOUS
    GrammarTopic(
      id: 'future_perfect_continuous',
      title: 'Future Perfect Continuous',
      description: 'Duration up to a future time',
      lessons: [
        Lesson(
          id: 'fpc_1',
          title: 'Understanding Future Perfect Continuous',
          content: '''Future Perfect Continuous

**Fungsi:**
1. Long duration - Tindakan berlangsung lama sebelum waktu tertentu
2. Emphasis on duration - Penekanan pada durasi

**Rumus:**
- ✓: Subject + will have been + Verb-ing
- ✗: Subject + will + not + have been + Verb-ing
- ?: Will + Subject + have been + Verb-ing?

**will have been = akan sudah berlangsung + -ing''',
          examples: [
            GrammarExample(english: 'By next month, I will have been working here for 2 years.', indonesian: 'Bulan depan, saya akan sudah bekerja di sini 2 tahun.'),
            GrammarExample(english: 'When she graduates, she will have been studying for 5 years.', indonesian: 'Saat dia lulus, dia akan sudah belajar 5 tahun.'),
          ],
          tips: ['Jarang digunakan dalam percakapan sehari-hari'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'fpc_quiz',
          topicId: 'future_perfect_continuous',
          title: 'Future Perfect Continuous Test',
          xpReward: 15,
          questions: [
            QuizQuestion(id: 'fpc_q1', type: QuestionType.multipleChoice, question: 'By next year, they ___ (live) here for 10 years.', options: ['will have been living', 'will have lived', 'will living', 'will be living'], correctAnswer: 'will have been living', explanation: 'will have been + verb-ing'),
          ],
        ),
      ],
    ),
    // 13. BE GOING TO - FUTURE PLANS
    GrammarTopic(
      id: 'be_going_to',
      title: 'Be Going To (Future Plans)',
      description: 'Future plans and predictions with evidence',
      lessons: [
        Lesson(
          id: 'bgt_1',
          title: 'Be Going To - Plans',
          content: '''Be Going To (Future Plans)

**Fungsi:**
1. Planned intentions - Rencana yang sudah dipikirkan
2. Predictions with evidence - Prediksi dengan bukti
3. Previous decisions - Keputusan sebelumnya

**Rumus:**
- ✓: Subject + am/is/are + going to + Verb (base)
- ✗: Subject + am/is/are + not + going to + Verb
- ?: Am/Is/Are + Subject + going to + Verb?''',
          examples: [
            GrammarExample(english: 'I am going to study English.', indonesian: 'Saya akan belajar bahasa Inggris.'),
            GrammarExample(english: 'She is going to buy a new car.', indonesian: 'Dia akan membeli mobil baru.'),
            GrammarExample(english: 'They are going to get married.', indonesian: 'Mereka akan menikah.'),
            GrammarExample(english: 'Look at those clouds! It is going to rain.', indonesian: 'Lihat awan itu! Akan hujan.'),
          ],
          tips: ['Sudah ada bukti/rencana = going to'],
          xpReward: 10,
        ),
        Lesson(
          id: 'bgt_2',
          title: 'Positive, Negative, Question',
          content: '''**Positive (+):**
- I am going to study.
- She is going to come.
- They are going to help.

**Negative (-):**
- I am not going to study.
- She is not going to come.
- They are not going to help.

**Question (?):**
- Are you going to study?
- Is she going to come?
- What are you going to do?''',
          examples: [
            GrammarExample(english: 'I am going to learn Spanish.', indonesian: 'Saya akan belajar Spanyol.'),
            GrammarExample(english: 'She is not going to accept the job.', indonesian: 'Dia tidak akan menerima pekerjaan.'),
            GrammarExample(english: 'Are you going to come to my party?', indonesian: 'Apakah kamu akan datang ke pestaku?'),
            GrammarExample(english: 'What are you going to be when you grow up?', indonesian: 'Apa yang akan kamujadi saat dewasa?'),
          ],
          tips: ['am/is/are + going to + verb'],
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
            QuizQuestion(id: 'bgt_q1', type: QuestionType.multipleChoice, question: 'I ___ (buy) a new phone.', options: ['am going to buy', 'will buy', 'buy', 'buying'], correctAnswer: 'am going to buy', explanation: 'am going to + verb'),
          ],
        ),
      ],
    ),
    // 14. USED TO - PAST HABITS
    GrammarTopic(
      id: 'used_to',
      title: 'Used To (Past Habits)',
      description: 'Past habits and states that no longer exist',
      lessons: [
        Lesson(
          id: 'ut_1',
          title: 'Understanding Used To',
          content: '''Used To (Past Habits)

**Fungsi:**
1. Past habits - Kebiasaan masa lalu yang sudah berhenti
2. Past states - Keadaan masa lalu yang sudah berubah
3. Things that were true but not now

**Rumus:**
- ✓: Subject + used to + Verb (base)
- ✗: Subject + did not + use to + Verb
- ?: Did + Subject + use to + Verb?''',
          examples: [
            GrammarExample(english: 'I used to smoke.', indonesian: 'Dulu saya merokok.'),
            GrammarExample(english: 'She used to live in Jakarta.', indonesian: 'Dulu dia tinggal di Jakarta.'),
            GrammarExample(english: 'They used to be friends.', indonesian: 'Dulu mereka teman.'),
            GrammarExample(english: 'I used to eat rice every day. Now I dont.', indonesian: 'Dulu saya makan nasi setiap hari. Sekarang tidak.'),
          ],
          tips: ['Used to = kebiasaan/keadaan masa lalu'],
          xpReward: 10,
        ),
        Lesson(
          id: 'ut_2',
          title: 'Used To vs Would',
          content: '''**USED TO:**
- Past habits AND states
- Sekarang sudah tidak dilakukan
- I used to play football. (dulu main, sekarang tidak)
- I used to be shy. (dulu malu, sekarang tidak)

**WOULD:**
- Past habits only (tidak untuk states)
- Would lebih formal
- Every Sunday, I would visit my grandmother.

**Perbandingan:**
| Used To | Would |
|---------|-------|
| Habits + States | Habits only |
| Past + Present contrast | Past habitual |''',
          examples: [
            GrammarExample(english: 'I used to go to school by bus.', indonesian: 'Dulu saya ke sekolah naik bus.'),
            GrammarExample(english: 'She used to be a teacher.', indonesian: 'Dulu dia guru.'),
            GrammarExample(english: 'When I was young, I would play outside.', indonesian: 'Dulu waktu kecil, saya bermain di luar.'),
          ],
          tips: ['States = used to (be, live, have)'],
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
            QuizQuestion(id: 'ut_q1', type: QuestionType.multipleChoice, question: 'I ___ (live) in Bandung before.', options: ['used to live', 'use to live', 'lived', 'living'], correctAnswer: 'used to live', explanation: 'used to + verb'),
          ],
        ),
      ],
    ),
    // 15. WOULD - CONDITIONAL/POLITE
    GrammarTopic(
      id: 'would',
      title: 'Would (Polite/Conditional)',
      description: 'Polite requests, past habits, conditional',
      lessons: [
        Lesson(
          id: 'w_1',
          title: 'Would - Polite Requests',
          content: '''Would - Polite Requests

**Fungsi:**
1. Polite requests - Permintaan sopan
2. Past habits (formal) - Kebiasaan masa lalu formal
3. Conditional - Kondisi

**Rumus:**
- ✓: Subject + would + Verb (base)
- ✗: Subject + would + not + Verb
- ?: Would + Subject + Verb?''',
          examples: [
            GrammarExample(english: 'Would you like some tea?', indonesian: 'Apakah kamu mau teh?'),
            GrammarExample(english: 'Would you help me please?', indonesian: 'Boleh kamu membantuku?'),
            GrammarExample(english: 'I would love to come.', indonesian: 'Saya dengan senang hati akan datang.'),
            GrammarExample(english: 'Would you mind opening the door?', indonesian: 'Apakah kamu keberatan membuka pintu?'),
          ],
          tips: ['Would lebih sopan dari will'],
          xpReward: 10,
        ),
        Lesson(
          id: 'w_2',
          title: 'Would - Conditional',
          content: '''**Would untuk Conditional:**

**Second Conditional:**
- If I had money, I would buy a car. (Tidak nyata sekarang)

**Third Conditional:**
- If I had studied, I would have passed. (Menyesali masa lalu)

**Polite Past:**
- Would you like...?
- Would you mind...?
- Would you prefer...?''',
          examples: [
            GrammarExample(english: 'If I were you, I would accept the job.', indonesian: 'Jika aku kamu, aku akan terima pekerjaan.'),
            GrammarExample(english: 'She would have been happy if she came.', indonesian: 'Dia akan bahagia jika dia datang.'),
            GrammarExample(english: 'Would you like to join us?', indonesian: 'Apakah kamu mau bergabung dengan kami?'),
          ],
          tips: ['Would untuk imajinasi/tidak nyata'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'w_quiz',
          topicId: 'would',
          title: 'Would Test',
          xpReward: 20,
          questions: [
            QuizQuestion(id: 'w_q1', type: QuestionType.multipleChoice, question: '___ you like some coffee?', options: ['Would', 'Will', 'Can', 'Do'], correctAnswer: 'Would', explanation: 'Would untuk permintaan sopan'),
          ],
        ),
      ],
    ),
    // 16. WOULD BE (CONDITIONAL CONTINUOUS)
    GrammarTopic(
      id: 'would_be',
      title: 'Would Be (Continuous)',
      description: 'Continuous actions in conditional',
      lessons: [
        Lesson(
          id: 'wbc_1',
          title: 'Would Be - Continuous',
          content: '''Would Be Continuous

**Fungsi:**
1. Future continuous in conditional - Kondisi masa depan
2. Imagining ongoing actions - Membayangkan aksi yang sedang berlangsung
3. Polite refusals - Penolakan sopan

**Rumus:**
- ✓: Subject + would be + Verb-ing
- ✗: Subject + would + not + be + Verb-ing''',
          examples: [
            GrammarExample(english: 'If it rains tomorrow, I would be sleeping at home.', indonesian: 'Jika hujan besok, saya akan sedang tidur di rumah.'),
            GrammarExample(english: 'She would be studying if she had time.', indonesian: 'Dia akan sedang belajar jika punya waktu.'),
            GrammarExample(english: 'I would be working right now if I hadnt gotten sick.', indonesian: 'Saya akan sedang bekerja sekarang jika tidak sakit.'),
          ],
          tips: ['Would be + verb-ing = akan sedang'],
          xpReward: 10,
        ),
      ],
      quizzes: [
        Quiz(
          id: 'wbc_quiz',
          topicId: 'would_be',
          title: 'Would Be Continuous Test',
          xpReward: 15,
          questions: [
            QuizQuestion(id: 'wbc_q1', type: QuestionType.multipleChoice, question: 'If it rained, we ___ (stay) home.', options: ['would be staying', 'would stay', 'will stay', 'staying'], correctAnswer: 'would be staying', explanation: 'would be + verb-ing'),
          ],
        ),
      ],
    ),
  ];
}
