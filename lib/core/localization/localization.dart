
class Localization {

  static Map<String, String> generalCourses(bool isArabic) {
    return {
      "CSC 001": isArabic ? "مهارات حاسب" : "Computer Skills",
      "HUM 108": isArabic ? "مهارات الاتصال والعرض" : "Communication & Presentation Skills",
      "HUM 109": isArabic ? "مهارات البحث والتحليل" : "Analysis & Research Skills",
      "HUM 204": isArabic ? "مبادئ التفاوض" : "Principles of Negotiation",
      "HUM 205": isArabic ? "حقوق الانسان" : "Human Rights",
      "LNG 001": isArabic ? "اللغة الانجليزية (1)" : "English Language (1)",
      "LNG 002": isArabic ? "اللغة الانجليزية (2)" : "English Language (2)",
      "LNG 003": isArabic ? "اللغة العربية" : "Arabic Language",
      "PHE 001": isArabic ? "تربية رياضية وأنشطة (1)" : "Physical Education & Activities (1)",
      "PHE 101": isArabic ? "تربية رياضية وأنشطة (2)" : "Physical Education & Activities (2)",
      "PHE 201": isArabic ? "تربية رياضية وأنشطة (3)" : "Physical Education & Activities (3)",
      "FTR 031": isArabic ? "مدخل التدريب الصناعي" : "Introduction to Field Training",
    };
  }
  
  static Map<String, String> requirementCourses(bool isArabic) {
    return {
      "FTR 131": isArabic ? "التدريب الميداني (1)" : "Field Training (1)",
      "FTR 161": isArabic ? "التدريب الميداني (2)" : "Field Training (2)",
      "MTH 001": isArabic ? "الرياضيات (1)" : "Mathematics (1)",
      "MTH 002": isArabic ? "الرياضيات (2)" : "Mathematics (2)",
      "MTH 105": isArabic ? "الإحصاء ونظرية الاحتمالات" : "Statistics & Probability Theory",
      "PHY 001": isArabic ? "الفيزياء (1)" : "Physics (1)",
      "PHY 002": isArabic ? "الفيزياء (2)" : "Physics (2)",
      "ENG 001": isArabic ? "الميكانيكا الهندسية (1)" : "Engineering Mechanics (1)",
      "ENG 002": isArabic ? "الميكانيكا الهندسية (2)" : "Engineering Mechanics (2)",
      "CHM 001": isArabic ? "الكيمياء الهندسية" : "Engineering Chemistry",
      "MNG 202": isArabic ? "التأثير البيئي للمشروعات" : "Environmental Impact of Projects",
      "ENG 003": isArabic ? "الرسم الهندسي (1)" : "Engineering Drawing & Projection (1)",
      "ENG 004": isArabic ? "الرسم الهندسي (2)" : "Engineering Drawing & Projection (2)",
      "ENG 006": isArabic ? "تاريخ الهندسة والتكنولوجيا" : "History of Engineering & Technology",
      "ENG 005": isArabic ? "هندسة الإنتاج والورش" : "Principles of Production Technology & Workshop",
      "MNG 201": isArabic ? "إدارة المشروعات" : "Project Management",
      "MNG 101": isArabic ? "نظم المراقبة وضبط الجودة" : "Monitoring & Quality Control Systems",
      "MNG 102": isArabic ? "الاقتصاد الهندسي" : "Engineering Economics",
      "MNG 103": isArabic ? "إعداد التقارير الفنية" : "Technical Report Writing",
      "MNG 203": isArabic ? "أخلاقيات المهنة" : "Professional Ethics",
      "MTH 101": isArabic ? "الرياضيات (3)" : "Mathematics (3)",
      "MTH 102": isArabic ? "الرياضيات (4)" : "Mathematics (4)",
    };
  }
  
  static Map<String, String> majorRequirementCourses(bool isArabic) {
    return {
      "EEC 112": isArabic ? "تصميم منطقي (1)" : "Logic Design (1)",
      "EEC 113": isArabic ? "هندسة الحاسبات (1)" : "Computer Engineering (1)",
      "EEC 115": isArabic ? "إشارات ونظم" : "Signal Analysis and Systems",
      "EEC 121": isArabic ? "الدوائر الكهربية (2)" : "Electric Circuits (2)",
      "EEC 123": isArabic ? "القياسات الكهربية" : "Electrical Measurements",
      "EEC 124": isArabic ? "هندسة الحاسبات (2)" : "Computer Engineering (2)",
      "EEC 125": isArabic ? "أنظمة التحكم (1)" : "Control Systems (1)",
      "EEC 141": isArabic ? "إلكترونيات (2)" : "Electronics (2)",
      "EEC 142": isArabic ? "تصميم منطقي (2)" : "Logic Design (2)",
      "EEC 151": isArabic ? "إلكترونيات (3)" : "Electronics (3)",
      "EEC 152": isArabic ? "مجالات كهرومغناطيسية (1)" : "Electromagnetic Fields (1)",
      "EEC 154": isArabic ? "الآلات الكهربية" : "Electrical Machines",
      "EEC 211": isArabic ? "مجالات كهرومغناطيسية (2)" : "Electromagnetic Fields (2)",
      "EEC 212": isArabic ? "أنظمة التحكم (2)" : "Control Systems (2)",
      "EEC 213": isArabic ? "اتصالات (1)" : "Communications (1)",
      "EEC 214": isArabic ? "حاسب العمليات الدقيقة" : "Microprocessors",
      "EEC 216": isArabic ? "تركيبات وتنظيم الكومبيوتر" : "Computer Architecture and Organization",
      "EEC 222": isArabic ? "هندسة الميكرويف" : "Microwave Engineering",
      "EEC 223": isArabic ? "اتصالات (2)" : "Communications (2)",
      "EEC 224": isArabic ? "اتصالات البيانات وشبكات الحاسب" : "Data Communication and Computer Networks",
      "EEC 225": isArabic ? "معالجة الإشارات الرقمية (1)" : "Digital Signal Processing (1)",
      "EEC 241": isArabic ? "الهوائيات" : "Antennas",
      "EEC 242": isArabic ? "اتصالات (3)" : "Communications (3)",
      "EEC 251": isArabic ? "اتصالات (4)" : "Communications (4)",
      "EEC 255": isArabic ? "تحكم عمليات صناعية" : "Industrial Process Control",
      "EEC 290": isArabic ? "مشروع التخرج" : "Bachelor Project",
      "FTR 231": isArabic ? "التدريب الميداني (3)" : "Field Training (3)",
      "FTR 261": isArabic ? "التدريب الميداني (4)" : "Field Training (4)",
    };
  }
  
  static Map<String, String> economicOptCourses(bool isArabic) {
    return {
      "HUM 201": isArabic ? "مقدمة في المحاسبة" : "Introduction To Accounting",
      "HUM 202": isArabic ? "الأدب الإنجليزي" : "English Literature",
      "HUM 203": isArabic ? "قانون التجارة" : "Trade Law",
      "HUM 206": isArabic ? "ريادة الأعمال" : "Entrepreneurship",
      "HUM 207": isArabic ? "التفكير العلمي" : "Scientific Thinking",
      "HUM 208": isArabic ? "إدارة الأعمال" : "Business Administration",
    };
  }
  
  static Map<String, String> cultureOptCourses(bool isArabic) {
    return {
      "HUM 101": isArabic ? "مقدمة في تاريخ الحضارات" : "Introduction To The History of Civilizations",
      "HUM 102": isArabic ? "تاريخ مصر الحديث" : "Recent Egypt's History",
      "HUM 103": isArabic ? "الحضارة العربية والإسلامية" : "Arab & Islamic Civilization",
      "HUM 104": isArabic ? "التذوق الأدبي" : "Literary Appreciation",
      "HUM 105": isArabic ? "التذوق الموسيقي" : "Music Appreciation",
      "HUM 106": isArabic ? "تراث الأدب المصري" : "Heritage Of Egyptian Literature",
      "HUM 107": isArabic ? "اتجاهات الفنون المعاصرة" : "Trends in Contemporary Arts",
      "LNG 101": isArabic ? "اللغة الفرنسية" : "French Language",
      "LNG 102": isArabic ? "اللغة الألمانية" : "German Language",
    };
  }
  
  static Map<String, String> introCourses(bool isArabic) {
    return {
      "CIV 101": isArabic ? "مبادئ هندسة التشييد والبناء" : "Principles of Construction & Building Engineering",
      "ARE 101": isArabic ? "الفنون والعمارة" : "Arts & Architecture",
      "EEC 101": isArabic ? "مبادئ الهندسة الكهربية" : "Principles of Electrical Engineering",
      "EEC 102": isArabic ? "مبادئ الهندسة الإلكترونية" : "Principles of Electronic Engineering",
      "EEC 103": isArabic ? "مبادئ الآلات الكهربية" : "Principles of Electric Machines",
      "ENG 103": isArabic ? "مبادئ هندسة التصميم والإنتاج" : "Principles of Design & Manufacturing Engineering",
      "ENG 104": isArabic ? "مبادئ هندسة القوى الميكانيكية" : "Principles of Mechanical Power Engineering",
      "MTE 101": isArabic ? "مبادئ هندسة الميكاترونكس" : "Principles of Mechatronics Engineering",
      "MDE 101": isArabic ? "مبادئ الهندسة الطبية" : "Principles of Biomedical Engineering",
    };
  }
  
  static Map<String, String> mathOptCourses(bool isArabic) {
    return {
      "MTH 103": isArabic ? "الطرق العددية" : "Numerical Methods",
      "MTH 104": isArabic ? "التحليل الرياضي" : "Mathematical Analysis",
      "MTH 206": isArabic ? "حساب التفاضل والتكامل المتقدم" : "Advanced Calculus",
      "MTH 210": isArabic ? "موضوعات مختارة في الرياضيات" : "Selected Topics in Mathematics",
      "PHY 111": isArabic ? "فيزياء الكم" : "Quantum Physics",
    };
  }
  
  static Map<String, String> departmentOptCourses(bool isArabic) {
    return {
      "EEC 271": isArabic ? "الذكاء الاصطناعي" : "Artificial Intelligence",
      "EEC 272": isArabic ? "مقدمة في الإلكترونيات الطبية" : "Introduction to Medical Electronics",
      "EEC 273": isArabic ? "اتصالات الألياف الضوئية المتقدمة" : "Advanced Optical Fiber Communications",
      "EEC 274": isArabic ? "الاتصالات المتنقلة المتقدمة" : "Advanced Mobile Communication",
      "EEC 276": isArabic ? "هندسة التحكم المتقدمة" : "Advanced Control Engineering",
      "EEC 277": isArabic ? "الشبكات اللاسلكية والتطبيقات" : "Wireless Network & Applications",
      "EEC 278": isArabic ? "إلكترونيات القوى" : "Power Electronics",
      "EEC 279": isArabic ? "مقدمة في الميكاترونكس" : "Introduction to Mechatronics",
      "EEC 280": isArabic ? "أنظمة أمن الاتصالات" : "Communication Security Systems",
      "EEC 281": isArabic ? "الإلكترونيات المتقدمة" : "Advanced Electronics",
      "EEC 282": isArabic ? "إلكترونيات (4)" : "Electronics (4)",
      "EEC 283": isArabic ? "أجهزة القياس الإلكترونية" : "Electronics Instrumentation",
      "EEC 284": isArabic ? "اتصالات الأقمار الصناعية المتقدمة" : "Advanced Satellite Communication",
      "EEC 285": isArabic ? "هندسة الحاسبات (3)" : "Computer Engineering (3)",
      "EEC 286": isArabic ? "التحكم العصبي الضبابي" : "Neuro Fuzzy Control",
      "EEC 287": isArabic ? "موضوعات مختارة في الإلكترونيات الطبية" : "Selected Topics in Medical Electronics",
      "EEC 288": isArabic ? "معالجة الإشارات الرقمية (2)" : "Digital Signal Processing (2)",
      "EEC 289": isArabic ? "أنظمة الرادار والحرب الإلكترونية" : "Radar and Electronic warfare Systems",
    };
  }

  
  // Get course name by ID
  static String getCourseName(bool isArabic, String courseId) {
    final general = generalCourses(isArabic);
    final requirement = requirementCourses(isArabic);
    final majorRequirement = majorRequirementCourses(isArabic);
    final economicOpt = economicOptCourses(isArabic);
    final cultureOpt = cultureOptCourses(isArabic);
    final intro = introCourses(isArabic);
    final mathOpt = mathOptCourses(isArabic);
    final departmentOpt = departmentOptCourses(isArabic);

    if (general.containsKey(courseId)) return general[courseId]!;
    if (requirement.containsKey(courseId)) return requirement[courseId]!;
    if (majorRequirement.containsKey(courseId)) return majorRequirement[courseId]!;
    if (economicOpt.containsKey(courseId)) return economicOpt[courseId]!;
    if (cultureOpt.containsKey(courseId)) return cultureOpt[courseId]!;
    if (intro.containsKey(courseId)) return intro[courseId]!;
    if (mathOpt.containsKey(courseId)) return mathOpt[courseId]!;
    if (departmentOpt.containsKey(courseId)) return departmentOpt[courseId]!;
    
    return (isArabic ? "اسم المادة غير موجود" : "Course name not found");
  }
}