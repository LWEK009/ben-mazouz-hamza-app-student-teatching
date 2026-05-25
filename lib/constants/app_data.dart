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

  // Lesson topics per year (sample data)
  static const Map<int, Map<int, Map<int, String>>> lessonTopics = {
    // Year 1
    0: {
      0: {
        0: 'مبارك الميلي رائد الإصلاح',
        1: 'العلم طريق نهضة الأمم',
        2: 'الوفاء للأرض وجذور الانتماء',
      },
      1: {
        0: 'غرس الورد - علاقة الإنسان بالأرض',
        1: 'قيم التعاون والتضامن',
        2: 'حب الوطن والانتماء',
      },
      2: {
        0: 'الطبيعة في الأدب العربي',
        1: 'الأخلاق الحميدة',
        2: 'مراجعة عامة',
      },
    },
    // Year 2
    1: {
      0: {
        0: 'الاكتشافات العلمية وأثرها في الحياة',
        1: 'التكنولوجيا وتطور العالم',
        2: 'دور العلماء في تقدم البشرية',
      },
      1: {
        0: 'البيئة وحماية الطبيعة',
        1: 'التراث الثقافي الجزائري',
        2: 'الرياضة وأهميتها في الحياة',
      },
      2: {
        0: 'الإعلام ودوره في المجتمع',
        1: 'الصحة والوقاية',
        2: 'مراجعة عامة',
      },
    },
    // Year 3
    2: {
      0: {
        0: 'التقدم العلمي في حياة الإنسان',
        1: 'الاكتشافات الحديثة',
        2: 'التكنولوجيا في خدمة الإنسان',
      },
      1: {
        0: 'العلم بين الماضي والحاضر',
        1: 'الثورة الرقمية وآثارها',
        2: 'التعليم عن بعد',
      },
      2: {
        0: 'الأدب العربي المعاصر',
        1: 'فنون التعبير الكتابي',
        2: 'مراجعة عامة',
      },
    },
    // Year 4
    3: {
      0: {
        0: 'التضامن أساس قوة المجتمع',
        1: 'الذكاء الاصطناعي وثورة المستقبل',
        2: 'طغيان الآلة وغياب الإنسان',
      },
      1: {
        0: 'التكنولوجيا بين الإيجابيات والسلبيات',
        1: 'القيم الإنسانية في الأدب',
        2: 'التحضير للامتحانات',
      },
      2: {
        0: 'نصوص الامتحانات السابقة',
        1: 'حلول نموذجية',
        2: 'مراجعة شاملة',
      },
    },
  };

  // Teacher's work categories (a3mal al oustad)
  static const List<String> teacherWorkCategories = [
    'ملخصات السنة الأولى',
    'ملخصات السنة الثانية',
    'ملخصات السنة الثالثة',
    'ملخصات السنة الرابعة',
  ];
}
