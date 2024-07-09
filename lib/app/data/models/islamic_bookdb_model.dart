class Section {
  int id;
  int bookId;
  String bookName;
  int chapterId;
  int sectionId;
  String title;
  String? preface;
  int number;

  Section({
    required this.id,
    required this.bookId,
    required this.bookName,
    required this.chapterId,
    required this.sectionId,
    required this.title,
    this.preface,
    required this.number,
  });

  factory Section.fromMap(Map<String, dynamic> map) {
    return Section(
      id: map['id'],
      bookId: map['book_id'],
      bookName: map['book_name'],
      chapterId: map['chapter_id'],
      sectionId: map['section_id'],
      title: map['title'],
      preface: map['preface'],
      number: map['number'],
    );
  }
}

class Hadith {
  int? hadithId;
  int? bookId;
  String? bookName;
  int? chapterId;
  int? sectionId;
  String? narrator;
  String? bn;
  String? ar;
  String? arDiacless;
  String? note;
  int? gradeId;
  String? grade;
  String? gradeColor;

  Hadith({
    this.hadithId,
    this.bookId,
    this.bookName,
    this.chapterId,
    this.sectionId,
    this.narrator,
    this.bn,
    this.ar,
    this.arDiacless,
    this.note,
    this.gradeId,
    this.grade,
    this.gradeColor,
  });

  factory Hadith.fromMap(Map<String, dynamic> map) {
    return Hadith(
      hadithId: map['hadith_id'],
      bookId: map['book_id'],
      bookName: map['book_name'],
      chapterId: map['chapter_id'],
      sectionId: map['section_id'],
      narrator: map['narrator'],
      bn: map['bn'],
      ar: map['ar'],
      arDiacless: map['ar_diacless'],
      note: map['note'],
      gradeId: map['grade_id'],
      grade: map['grade'],
      gradeColor: map['grade_color'],
    );
  }
}
