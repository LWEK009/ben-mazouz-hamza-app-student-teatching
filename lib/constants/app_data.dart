/// App-wide data constants for Manaret Al Lougha Al Arabiya
class AppData {
  static const String appName = 'منارة اللغة العربية';
  static const String appSlogan = 'نحو مستقبل مبدع';
  static const String teacherName = 'بن مزوز حمزة';

  // WhatsApp contact number
  static const String whatsappNumber = '213659300250'; // Algeria +213

  // Google Drive folder links for each year, term, and section/makta3
  static const Map<int, Map<int, Map<int, String>>> driveLinks = {
    0: { // السنة الأولى متوسط
      0: {
        0: 'https://drive.google.com/drive/folders/1-placeholder-y1-f1-m1',
        1: 'https://drive.google.com/drive/folders/1-placeholder-y1-f1-m2',
        2: 'https://drive.google.com/drive/folders/1-placeholder-y1-f1-m3',
      },
      1: {
        0: 'https://drive.google.com/drive/folders/1-placeholder-y1-f2-m1',
        1: 'https://drive.google.com/drive/folders/1-placeholder-y1-f2-m2',
        2: 'https://drive.google.com/drive/folders/1-placeholder-y1-f2-m3',
      },
      2: {
        0: 'https://drive.google.com/drive/folders/1-placeholder-y1-f3-m1',
        1: 'https://drive.google.com/drive/folders/1-placeholder-y1-f3-m2',
        2: 'https://drive.google.com/drive/folders/1-placeholder-y1-f3-m3',
      },
    },
    1: { // السنة الثانية متوسط
      0: {
        0: 'https://drive.google.com/drive/folders/1-placeholder-y2-f1-m1',
        1: 'https://drive.google.com/drive/folders/1-placeholder-y2-f1-m2',
        2: 'https://drive.google.com/drive/folders/1-placeholder-y2-f1-m3',
      },
      1: {
        0: 'https://drive.google.com/drive/folders/1-placeholder-y2-f2-m1',
        1: 'https://drive.google.com/drive/folders/1-placeholder-y2-f2-m2',
        2: 'https://drive.google.com/drive/folders/1-placeholder-y2-f2-m3',
      },
      2: {
        0: 'https://drive.google.com/drive/folders/1-placeholder-y2-f3-m1',
        1: 'https://drive.google.com/drive/folders/1-placeholder-y2-f3-m2',
        2: 'https://drive.google.com/drive/folders/1-placeholder-y2-f3-m3',
      },
    },
    2: { // السنة الثالثة متوسط
      0: {
        0: 'https://drive.google.com/drive/folders/1-placeholder-y3-f1-m1',
        1: 'https://drive.google.com/drive/folders/1-placeholder-y3-f1-m2',
        2: 'https://drive.google.com/drive/folders/1-placeholder-y3-f1-m3',
      },
      1: {
        0: 'https://drive.google.com/drive/folders/1-placeholder-y3-f2-m1',
        1: 'https://drive.google.com/drive/folders/1-placeholder-y3-f2-m2',
        2: 'https://drive.google.com/drive/folders/1-placeholder-y3-f2-m3',
      },
      2: {
        0: 'https://drive.google.com/drive/folders/1-placeholder-y3-f3-m1',
        1: 'https://drive.google.com/drive/folders/1-placeholder-y3-f3-m2',
        2: 'https://drive.google.com/drive/folders/1-placeholder-y3-f3-m3',
      },
    },
    3: { // السنة الرابعة متوسط
      0: {
        0: 'https://drive.google.com/drive/folders/1-placeholder-y4-f1-m1',
        1: 'https://drive.google.com/drive/folders/1-placeholder-y4-f1-m2',
        2: 'https://drive.google.com/drive/folders/1-placeholder-y4-f1-m3',
      },
      1: {
        0: 'https://drive.google.com/drive/folders/1-placeholder-y4-f2-m1',
        1: 'https://drive.google.com/drive/folders/1-placeholder-y4-f2-m2',
        2: 'https://drive.google.com/drive/folders/1-placeholder-y4-f2-m3',
      },
      2: {
        0: 'https://drive.google.com/drive/folders/1-placeholder-y4-f3-m1',
        1: 'https://drive.google.com/drive/folders/1-placeholder-y4-f3-m2',
        2: 'https://drive.google.com/drive/folders/1-placeholder-y4-f3-m3',
      },
    },
  };

  // Year names
  static const List<String> yearNames = [
    'السنة الأولى متوسط',
    'السنة الثانية متوسط',
    'السنة الثالثة متوسط',
    'السنة الرابعة متوسط',
  ];

  // Short year names for cards
  static const List<String> yearShortNames = [
    'الأولى',
    'الثانية',
    'الثالثة',
    'الرابعة',
  ];

  // Fusul (terms/semesters) names
  static const List<String> fusulNames = [
    'الفصل الأول',
    'الفصل الثاني',
    'الفصل الثالث',
  ];

  // Sections/sessions names
  static const List<String> sectionNames = [
    'المقطع الأول',
    'المقطع الثاني',
    'المقطع الثالث',
  ];

  // Year icons
  static const List<String> yearEmojis = ['📗', '📘', '📙', '📕'];

  // Section icons
  static const List<String> sectionEmojis = ['📝', '📖', '✍️'];

  // Lesson topics per year (from photos)
  static const Map<int, Map<int, Map<int, String>>> lessonTopics = {
    // Year 1
    0: {
      0: {
        0: 'الحياة العائلية',
        1: 'حب الوطن',
        2: 'عظماء الإنسانية',
      },
      1: {
        0: 'الأخلاق والمجتمع',
        1: 'العلم والاكتشافات العلمية',
        2: 'الأعياد',
      },
      2: {
        0: 'الطبيعة',
        1: 'الصحة والرياضة',
      },
    },
    // Year 2
    1: {
      0: {
        0: 'الحياة العائلية',
        1: 'حب الوطن',
        2: 'عظماء الإنسانية',
      },
      1: {
        0: 'الأخلاق والمجتمع',
        1: 'العلم والاكتشافات العلمية',
        2: 'الأعياد',
      },
      2: {
        0: 'الطبيعة',
        1: 'الصحة والرياضة',
      },
    },
    // Year 3
    2: {
      0: {
        0: 'قضايا اجتماعية',
        1: 'الاعلام والمجتمع',
        2: 'التضامن الانساني',
      },
      1: {
        0: 'شعوب العالم',
        1: 'العلم والتقدم التكنولوجي',
        2: 'التلوث البيئي',
      },
      2: {
        0: 'الصناعات التقليدية',
        1: 'الهجرة',
      },
    },
    // Year 4
    3: {
      0: {
        0: 'قضايا اجتماعية',
        1: 'الاعلام والمجتمع',
        2: 'التضامن الانساني',
      },
      1: {
        0: 'شعوب العالم',
        1: 'العلم والتقدم التكنولوجي',
        2: 'التلوث البيئي',
      },
      2: {
        0: 'الصناعات التقليدية',
        1: 'الهجرة',
      },
    },
  };

  // Teacher's work categories (a3mal al oustad)
  static const List<String> teacherWorkCategories = [
    'الملخصات',
    'في رحاب الضاد',
    'المقاصد في بلوغ القواعد',
    'إكليل الفصاحة',
    'تطبيقات نحوية',
    'وحي القلم',
  ];
}
