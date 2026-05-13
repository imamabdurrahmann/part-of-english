class SentenceTransformItem {
  final String id;
  final String instruction;
  final String original;
  final String answer;
  final String hint;
  final String explanation;

  const SentenceTransformItem({
    required this.id,
    required this.instruction,
    required this.original,
    required this.answer,
    required this.hint,
    required this.explanation,
  });
}

class SentenceTransformData {
  static const List<SentenceTransformItem> items = [
    // Passive Voice
    SentenceTransformItem(
      id: 'st_001',
      instruction: 'Change to passive voice',
      original: 'The teacher explains the lesson.',
      answer: 'The lesson is explained by the teacher.',
      hint: 'Object becomes subject, verb to be + past participle',
      explanation: 'Dalam passive voice, objek menjadi subjek dan kata kerja berubah menjadi to be + past participle.',
    ),
    SentenceTransformItem(
      id: 'st_002',
      instruction: 'Change to passive voice',
      original: 'Someone has stolen my bicycle.',
      answer: 'My bicycle has been stolen.',
      hint: 'Has been + past participle, object becomes subject',
      explanation: 'Present perfect passive: has/have + been + past participle.',
    ),
    SentenceTransformItem(
      id: 'st_003',
      instruction: 'Change to passive voice',
      original: 'They will announce the results tomorrow.',
      answer: 'The results will be announced tomorrow.',
      hint: 'Will be + past participle',
      explanation: 'Future passive: will + be + past participle. "The results" menjadi subjek baru.',
    ),
    SentenceTransformItem(
      id: 'st_004',
      instruction: 'Change to active voice',
      original: 'The cake was baked by my grandmother.',
      answer: 'My grandmother baked the cake.',
      hint: 'Subject comes from "by", verb changes to active form',
      explanation: 'Active voice: subjek (dari "by phrase") + kata kerja aktif + objek.',
    ),
    SentenceTransformItem(
      id: 'st_005',
      instruction: 'Change to passive voice',
      original: 'The manager is reviewing the report.',
      answer: 'The report is being reviewed by the manager.',
      hint: 'Is being + past participle (continuous passive)',
      explanation: 'Present continuous passive: is/are + being + past participle.',
    ),

    // Reported Speech
    SentenceTransformItem(
      id: 'st_006',
      instruction: 'Change to reported speech',
      original: '"I will come tomorrow," he said.',
      answer: 'He said that he would come the next day.',
      hint: 'Will -> would, tomorrow -> the next day',
      explanation: 'Direct ke indirect: will berubah menjadi would, time expression berubah (tomorrow -> the next day).',
    ),
    SentenceTransformItem(
      id: 'st_007',
      instruction: 'Change to reported speech',
      original: '"I am learning English," she said.',
      answer: 'She said that she was learning English.',
      hint: 'Present continuous -> past continuous (was learning)',
      explanation: 'Reported speech: am/is/are -> was/were. Tense mundur satu tingkat.',
    ),
    SentenceTransformItem(
      id: 'st_008',
      instruction: 'Change to reported speech',
      original: '"I have finished my homework," Tom said.',
      answer: 'Tom said that he had finished his homework.',
      hint: 'Have -> Had (past perfect)',
      explanation: 'Present perfect berubah menjadi past perfect (had + past participle).',
    ),
    SentenceTransformItem(
      id: 'st_009',
      instruction: 'Change to reported speech',
      original: '"I visited Paris last year," John said.',
      answer: 'John said that he had visited Paris the year before.',
      hint: 'Past simple -> past perfect, last year -> the year before',
      explanation: 'Past simple bisa berubah menjadi past perfect. Time expression berubah: last year -> the year before.',
    ),
    SentenceTransformItem(
      id: 'st_010',
      instruction: 'Change to reported speech',
      original: '"Do not touch the fire," she warned.',
      answer: 'She warned us not to touch the fire.',
      hint: 'Imperative becomes infinitive construction',
      explanation: 'Perintah dalam reported speech berubah menjadi to-infinitive: told/warned + object + not to + verb.',
    ),

    // Conditional
    SentenceTransformItem(
      id: 'st_011',
      instruction: 'Complete with the correct conditional',
      original: 'If I ___ (be) rich, I would buy a yacht.',
      answer: 'If I were rich, I would buy a yacht.',
      hint: 'Use "were" for all subjects in type 2',
      explanation: 'Conditional type 2 (unreal present): If + past simple, would + base verb. Gunakan "were" untuk semua subjek.',
    ),
    SentenceTransformItem(
      id: 'st_012',
      instruction: 'Complete with the correct conditional',
      original: 'If it ___ (rain) tomorrow, we will cancel the trip.',
      answer: 'If it rains tomorrow, we will cancel the trip.',
      hint: 'Type 1: If + present simple, will + verb',
      explanation: 'Conditional type 1 (possible): If + present simple, will + base verb.',
    ),
    SentenceTransformItem(
      id: 'st_013',
      instruction: 'Complete with the correct conditional',
      original: 'If she ___ (study) harder, she would have passed.',
      answer: 'If she had studied harder, she would have passed.',
      hint: 'Type 3: If + past perfect, would have + past participle',
      explanation: 'Conditional type 3 (unreal past): If + past perfect, would have + past participle.',
    ),
    SentenceTransformItem(
      id: 'st_014',
      instruction: 'Rewrite using unless',
      original: 'If you do not practice, you will not improve.',
      answer: 'Unless you practice, you will not improve.',
      hint: 'Unless = if not',
      explanation: '"Unless" adalah negation dari "if". "If not" bisa diganti dengan "unless".',
    ),
    SentenceTransformItem(
      id: 'st_015',
      instruction: 'Rewrite as a zero conditional',
      original: 'Water freezes when it is cold enough.',
      answer: 'If water gets cold enough, it freezes.',
      hint: 'Both clauses use present simple',
      explanation: 'Zero conditional: If + present simple, present simple. Kedua bagian sama-sama present tense.',
    ),

    // Degree (so...that / such...that)
    SentenceTransformItem(
      id: 'st_016',
      instruction: 'Rewrite using "so...that"',
      original: 'It was a very hot day. We could not sleep.',
      answer: 'It was so hot that we could not sleep.',
      hint: 'So + adjective/adverb + that',
      explanation: '"So...that" digunakan untuk menunjukkan akibat/konsekuensi dari tingkat tertentu.',
    ),
    SentenceTransformItem(
      id: 'st_017',
      instruction: 'Rewrite using "such...that"',
      original: 'She is a very talented singer. Everyone admires her.',
      answer: 'She is such a talented singer that everyone admires her.',
      hint: 'Such + (a/an) + adjective + noun + that',
      explanation: '"Such...that" digunakan dengan noun. "Such a talented singer" diikuti that clause.',
    ),
    SentenceTransformItem(
      id: 'st_018',
      instruction: 'Rewrite using "too...to"',
      original: 'He is very old. He cannot work.',
      answer: 'He is too old to work.',
      hint: 'Too + adjective + to + verb',
      explanation: '"Too...to" menunjukkan bahwa sesuatu melebihi batas yang diperlukan.',
    ),
    SentenceTransformItem(
      id: 'st_019',
      instruction: 'Rewrite using "enough to"',
      original: 'The box was very heavy. We could not lift it.',
      answer: 'The box was not heavy enough for us to lift.',
      hint: 'Not + adjective + enough + to + verb',
      explanation: '"Enough to" digunakan setelah adjective untuk menunjukkan kapabilitas.',
    ),
    SentenceTransformItem(
      id: 'st_020',
      instruction: 'Rewrite using "enough...to"',
      original: 'She is very tall. She can reach the top shelf.',
      answer: 'She is tall enough to reach the top shelf.',
      hint: 'Adjective + enough + to + verb',
      explanation: '"Enough...to" menunjukkan bahwa sesuatu memenuhi syarat yang diperlukan.',
    ),

    // Relative Clause
    SentenceTransformItem(
      id: 'st_021',
      instruction: 'Combine using relative pronoun',
      original: 'The man is standing there. He teaches mathematics.',
      answer: 'The man who is standing there teaches mathematics.',
      hint: 'Use "who" for people as subject',
      explanation: '"Who" digunakan sebagai subject dalam relative clause.',
    ),
    SentenceTransformItem(
      id: 'st_022',
      instruction: 'Combine using relative pronoun',
      original: 'The book is on the table. You lent it to me.',
      answer: 'The book which you lent to me is on the table.',
      hint: 'Use "which" for things as object',
      explanation: '"Which" digunakan untuk benda, bisa sebagai object dalam relative clause.',
    ),
    SentenceTransformItem(
      id: 'st_023',
      instruction: 'Combine using relative pronoun',
      original: 'The city is very beautiful. I was born there.',
      answer: 'The city where I was born is very beautiful.',
      hint: 'Use "where" for places',
      explanation: '"Where" digunakan untuk tempat, menggantikan "in which" atau "at which".',
    ),
    SentenceTransformItem(
      id: 'st_024',
      instruction: 'Combine using relative pronoun',
      original: 'The reason is unclear. She was absent.',
      answer: 'The reason why she was absent is unclear.',
      hint: 'Use "why" for reasons',
      explanation: '"Why" digunakan untuk alasan, menggantikan "for which".',
    ),
    SentenceTransformItem(
      id: 'st_025',
      instruction: 'Rewrite without relative clause',
      original: 'The student who won the prize is my cousin.',
      answer: 'My cousin is the student who won the prize.',
      hint: 'Rephrase to keep the information',
      explanation: 'Relative clause yang identifying (mendefinisikan) tidak bisa dihapus. Kita perlu merekonstruksi kalimat.',
    ),

    // Wish
    SentenceTransformItem(
      id: 'st_026',
      instruction: 'Rewrite using "wish"',
      original: 'I am not tall enough to reach the shelf.',
      answer: 'I wish I were tall enough to reach the shelf.',
      hint: 'Use past simple (were) after wish for present',
      explanation: 'Wish + past simple untuk keinginan yang tidak realistis di masa sekarang.',
    ),
    SentenceTransformItem(
      id: 'st_027',
      instruction: 'Rewrite using "wish"',
      original: 'I did not study, so I failed the exam.',
      answer: 'I wish I had studied for the exam.',
      hint: 'Wish + past perfect for past regrets',
      explanation: 'Wish + past perfect (had + past participle) untuk penyesalan di masa lampau.',
    ),
    SentenceTransformItem(
      id: 'st_028',
      instruction: 'Rewrite using "wish"',
      original: 'He does not listen to my advice.',
      answer: 'I wish he would listen to my advice.',
      hint: 'Wish + would for unwilling changes',
      explanation: 'Wish + would + verb untuk menunjukkan keinginan perubahan yang tidak kunjung terjadi.',
    ),
    SentenceTransformItem(
      id: 'st_029',
      instruction: 'Rewrite using "if only"',
      original: 'I regret not learning to drive.',
      answer: 'If only I had learned to drive.',
      hint: 'If only + past perfect for past regrets',
      explanation: '"If only" memiliki fungsi yang sama dengan "wish" untuk past regrets.',
    ),
    SentenceTransformItem(
      id: 'st_030',
      instruction: 'Rewrite using "would rather"',
      original: 'I prefer going to the beach instead of the mountains.',
      answer: 'I would rather go to the beach than the mountains.',
      hint: 'Would rather + base verb + than + base verb',
      explanation: '"Would rather" digunakan untuk preferensi. Gunakan than untuk perbandingan.',
    ),

    // Causative (have/get something done)
    SentenceTransformItem(
      id: 'st_031',
      instruction: 'Rewrite using causative',
      original: 'A mechanic repaired my car yesterday.',
      answer: 'I had my car repaired yesterday.',
      hint: 'Have/get + object + past participle',
      explanation: 'Causative "have something done" menunjukkan bahwa seseorang meminta orang lain untuk melakukan sesuatu.',
    ),
    SentenceTransformItem(
      id: 'st_032',
      instruction: 'Rewrite using causative',
      original: 'She is going to ask someone to cut her hair.',
      answer: 'She is going to have her hair cut.',
      hint: 'Have + object + past participle',
      explanation: 'Causative passive: have + object + past participle.',
    ),
    SentenceTransformItem(
      id: 'st_033',
      instruction: 'Rewrite to active voice',
      original: 'We had our house painted last week.',
      answer: 'We hired someone to paint our house last week.',
      hint: 'Explain who did the action',
      explanation: 'Causative dalam active form: subjek + have/get + other person + to-infinitive.',
    ),

    // Inversion
    SentenceTransformItem(
      id: 'st_034',
      instruction: 'Rewrite with inversion',
      original: 'I have never seen such a beautiful sunset.',
      answer: 'Never have I seen such a beautiful sunset.',
      hint: 'Never at the beginning, auxiliary before subject',
      explanation: 'Negative adverbials di awal kalimat memerlukan inversion (auxiliary + subject).',
    ),
    SentenceTransformItem(
      id: 'st_035',
      instruction: 'Rewrite with inversion',
      original: 'She barely knew him when he asked her to marry.',
      answer: 'Barely did she know him when he asked her to marry.',
      hint: 'Barely at the beginning, auxiliary before subject',
      explanation: '"Barely" adalah negative adverbial yang memerlukan inversion di awal kalimat.',
    ),
    SentenceTransformItem(
      id: 'st_036',
      instruction: 'Rewrite with inversion',
      original: 'Only after the war did they meet again.',
      answer: 'Only after the war did they meet again.',
      hint: 'Correct - already inverted',
      explanation: '"Only after" memerlukan inversion. Bentuk invert: did + subject + base verb.',
    ),
  ];
}
