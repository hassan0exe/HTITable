
import 'package:table/core/localization/localization.dart';
import 'package:table/data/departments/department.dart';
import 'package:table/data/entity/course_model.dart';

class Electrical implements Department {
  @override
  final String name = 'Telecom Engineering';
  
  @override
  final String code = 'ELEC';
  
  final bool isArabic;

   const Electrical({ this.isArabic = false});
  
  factory Electrical.fromJson(Map<String, dynamic> json) {
    return Electrical();
  }
  
  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
    };
  }
  
  @override
  String toString() => name;

     List<CourseModel> get generalCoursesList {
    final courseNames = Localization.generalCourses(isArabic);
    
    return [
      CourseModel(name: courseNames["CSC 001"]!, id: "CSC 001", units: 0, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["HUM 108"]!, id: "HUM 108", units: 2, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["HUM 109"]!, id: "HUM 109", units: 2, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["HUM 204"]!, id: "HUM 204", units: 2, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["HUM 205"]!, id: "HUM 205", units: 1, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["LNG 001"]!, id: "LNG 001", units: 2, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["LNG 002"]!, id: "LNG 002", units: 2, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["LNG 003"]!, id: "LNG 003", units: 2, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["PHE 001"]!, id: "PHE 001", units: 0, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["PHE 101"]!, id: "PHE 101", units: 0, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["PHE 201"]!, id: "PHE 201", units: 1, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["FTR 031"]!, id: "FTR 031", units: 3, departmentCode: 'ELEC'),
    ];
  }
  
  List<CourseModel> get requirementCoursesList {
    final courseNames = Localization.requirementCourses(isArabic);
    
    return [
      CourseModel(name: courseNames["FTR 131"]!, id: "FTR 131", units: 3, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["FTR 161"]!, id: "FTR 161", units: 3, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["MTH 001"]!, id: "MTH 001", units: 3, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["MTH 002"]!, id: "MTH 002", units: 3, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["MTH 105"]!, id: "MTH 105", units: 3, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["PHY 001"]!, id: "PHY 001", units: 3, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["PHY 002"]!, id: "PHY 002", units: 3, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["ENG 001"]!, id: "ENG 001", units: 2, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["ENG 002"]!, id: "ENG 002", units: 2, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["CHM 001"]!, id: "CHM 001", units: 3, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["MNG 202"]!, id: "MNG 202", units: 1, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["ENG 003"]!, id: "ENG 003", units: 2, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["ENG 004"]!, id: "ENG 004", units: 2, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["ENG 006"]!, id: "ENG 006", units: 1, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["ENG 005"]!, id: "ENG 005", units: 3, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["MNG 201"]!, id: "MNG 201", units: 2, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["MNG 101"]!, id: "MNG 101", units: 1, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["MNG 102"]!, id: "MNG 102", units: 2, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["MNG 103"]!, id: "MNG 103", units: 2, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["MNG 203"]!, id: "MNG 203", units: 1, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["MTH 101"]!, id: "MTH 101", units: 3, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["MTH 102"]!, id: "MTH 102", units: 3, departmentCode: 'ELEC'),
    ];
  }

  List<CourseModel> get majorRequirementCoursesList {
    final courseNames = Localization.majorRequirementCourses(isArabic);
    
    return [
      CourseModel(name: courseNames["EEC 112"]!, id: "EEC 112", units: 3, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["EEC 113"]!, id: "EEC 113", units: 2, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["EEC 115"]!, id: "EEC 115", units: 3, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["EEC 121"]!, id: "EEC 121", units: 3, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["EEC 123"]!, id: "EEC 123", units: 3, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["EEC 124"]!, id: "EEC 124", units: 2, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["EEC 125"]!, id: "EEC 125", units: 3, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["EEC 141"]!, id: "EEC 141", units: 2, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["EEC 142"]!, id: "EEC 142", units: 2, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["EEC 151"]!, id: "EEC 151", units: 2, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["EEC 152"]!, id: "EEC 152", units: 3, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["EEC 154"]!, id: "EEC 154", units: 2, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["EEC 211"]!, id: "EEC 211", units: 3, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["EEC 212"]!, id: "EEC 212", units: 3, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["EEC 213"]!, id: "EEC 213", units: 3, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["EEC 214"]!, id: "EEC 214", units: 4, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["EEC 216"]!, id: "EEC 216", units: 4, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["EEC 222"]!, id: "EEC 222", units: 3, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["EEC 223"]!, id: "EEC 223", units: 3, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["EEC 224"]!, id: "EEC 224", units: 3, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["EEC 225"]!, id: "EEC 225", units: 3, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["EEC 241"]!, id: "EEC 241", units: 3, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["EEC 242"]!, id: "EEC 242", units: 3, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["EEC 251"]!, id: "EEC 251", units: 3, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["EEC 255"]!, id: "EEC 255", units: 2, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["EEC 290"]!, id: "EEC 290", units: 3, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["FTR 231"]!, id: "FTR 231", units: 3, departmentCode: 'ELEC'),
      CourseModel(name: courseNames["FTR 261"]!, id: "FTR 261", units: 3, departmentCode: 'ELEC'),
    ];
  }

  List<CourseModel> get economicOptCourses {
    final courseNames = Localization.economicOptCourses(isArabic);
    
    return [
      CourseModel(name: courseNames["HUM 201"]!, id: "HUM 201", units: 2, departmentCode: 'ELEC', electiveName: 'List D'),
      CourseModel(name: courseNames["HUM 202"]!, id: "HUM 202", units: 2, departmentCode: 'ELEC', electiveName: 'List D'),
      CourseModel(name: courseNames["HUM 203"]!, id: "HUM 203", units: 2, departmentCode: 'ELEC', electiveName: 'List D'),
      CourseModel(name: courseNames["HUM 206"]!, id: "HUM 206", units: 2, departmentCode: 'ELEC', electiveName: 'List D'),
      CourseModel(name: courseNames["HUM 207"]!, id: "HUM 207", units: 2, departmentCode: 'ELEC', electiveName: 'List D'),
      CourseModel(name: courseNames["HUM 208"]!, id: "HUM 208", units: 2, departmentCode: 'ELEC', electiveName: 'List D'),
    ];
  }

  List<CourseModel> get cultureOptCourses {
    final courseNames = Localization.cultureOptCourses(isArabic);
    
    return [
      CourseModel(name: courseNames["HUM 101"]!, id: "HUM 101", units: 2, departmentCode: 'ELEC', electiveName: 'List E'),
      CourseModel(name: courseNames["HUM 102"]!, id: "HUM 102", units: 2, departmentCode: 'ELEC', electiveName: 'List E'),
      CourseModel(name: courseNames["HUM 103"]!, id: "HUM 103", units: 2, departmentCode: 'ELEC', electiveName: 'List E'),
      CourseModel(name: courseNames["HUM 104"]!, id: "HUM 104", units: 2, departmentCode: 'ELEC', electiveName: 'List E'),
      CourseModel(name: courseNames["HUM 105"]!, id: "HUM 105", units: 2, departmentCode: 'ELEC', electiveName: 'List E'),
      CourseModel(name: courseNames["HUM 106"]!, id: "HUM 106", units: 2, departmentCode: 'ELEC', electiveName: 'List E'),
      CourseModel(name: courseNames["HUM 107"]!, id: "HUM 107", units: 2, departmentCode: 'ELEC', electiveName: 'List E'),
      CourseModel(name: courseNames["LNG 101"]!, id: "LNG 101", units: 2, departmentCode: 'ELEC', electiveName: 'List E'),
      CourseModel(name: courseNames["LNG 102"]!, id: "LNG 102", units: 2, departmentCode: 'ELEC', electiveName: 'List E'),
    ];
  }

  List<CourseModel> get introCourses {
    final courseNames = Localization.introCourses(isArabic);
    
    return [
      CourseModel(name: courseNames["CIV 101"]!, id: "CIV 101", units: 2, departmentCode: 'ELEC', electiveName: 'List F'),
      CourseModel(name: courseNames["ARE 101"]!, id: "ARE 101", units: 2, departmentCode: 'ELEC', electiveName: 'List F'),
      CourseModel(name: courseNames["EEC 101"]!, id: "EEC 101", units: 2, departmentCode: 'ELEC', electiveName: 'List F'),
      CourseModel(name: courseNames["EEC 102"]!, id: "EEC 102", units: 2, departmentCode: 'ELEC', electiveName: 'List F'),
      CourseModel(name: courseNames["EEC 103"]!, id: "EEC 103", units: 2, departmentCode: 'ELEC', electiveName: 'List F'),
      CourseModel(name: courseNames["ENG 103"]!, id: "ENG 103", units: 2, departmentCode: 'ELEC', electiveName: 'List F'),
      CourseModel(name: courseNames["ENG 104"]!, id: "ENG 104", units: 2, departmentCode: 'ELEC', electiveName: 'List F'),
      CourseModel(name: courseNames["MTE 101"]!, id: "MTE 101", units: 2, departmentCode: 'ELEC', electiveName: 'List F'),
      CourseModel(name: courseNames["MDE 101"]!, id: "MDE 101", units: 2, departmentCode: 'ELEC', electiveName: 'List F'),
    ];
  }

  List<CourseModel> get mathOptCourses {
    final courseNames = Localization.mathOptCourses(isArabic);
    
    return [
      CourseModel(name: courseNames["MTH 103"]!, id: "MTH 103", units: 3, departmentCode: 'ELEC', electiveName: 'List G'),
      CourseModel(name: courseNames["MTH 104"]!, id: "MTH 104", units: 3, departmentCode: 'ELEC', electiveName: 'List G'),
      CourseModel(name: courseNames["MTH 206"]!, id: "MTH 206", units: 3, departmentCode: 'ELEC', electiveName: 'List G'),
      CourseModel(name: courseNames["MTH 210"]!, id: "MTH 210", units: 3, departmentCode: 'ELEC', electiveName: 'List G'),
      CourseModel(name: courseNames["PHY 111"]!, id: "PHY 111", units: 3, departmentCode: 'ELEC', electiveName: 'List G'),
    ];
  }

  List<CourseModel> get departmentOptCourses {
    final courseNames = Localization.departmentOptCourses(isArabic);
    
    return [
      CourseModel(name: courseNames["EEC 271"]!, id: "EEC 271", units: 3, departmentCode: 'ELEC', electiveName: 'List H'),
      CourseModel(name: courseNames["EEC 272"]!, id: "EEC 272", units: 3, departmentCode: 'ELEC', electiveName: 'List H'),
      CourseModel(name: courseNames["EEC 273"]!, id: "EEC 273", units: 3, departmentCode: 'ELEC', electiveName: 'List H'),
      CourseModel(name: courseNames["EEC 274"]!, id: "EEC 274", units: 3, departmentCode: 'ELEC', electiveName: 'List H'),
      CourseModel(name: courseNames["EEC 276"]!, id: "EEC 276", units: 3, departmentCode: 'ELEC', electiveName: 'List H'),
      CourseModel(name: courseNames["EEC 277"]!, id: "EEC 277", units: 3, departmentCode: 'ELEC', electiveName: 'List H'),
      CourseModel(name: courseNames["EEC 278"]!, id: "EEC 278", units: 3, departmentCode: 'ELEC', electiveName: 'List H'),
      CourseModel(name: courseNames["EEC 279"]!, id: "EEC 279", units: 3, departmentCode: 'ELEC', electiveName: 'List H'),
      CourseModel(name: courseNames["EEC 280"]!, id: "EEC 280", units: 3, departmentCode: 'ELEC', electiveName: 'List H'),
      CourseModel(name: courseNames["EEC 281"]!, id: "EEC 281", units: 3, departmentCode: 'ELEC', electiveName: 'List H'),
      CourseModel(name: courseNames["EEC 282"]!, id: "EEC 282", units: 3, departmentCode: 'ELEC', electiveName: 'List H'),
      CourseModel(name: courseNames["EEC 283"]!, id: "EEC 283", units: 3, departmentCode: 'ELEC', electiveName: 'List H'),
      CourseModel(name: courseNames["EEC 284"]!, id: "EEC 284", units: 3, departmentCode: 'ELEC', electiveName: 'List H'),
      CourseModel(name: courseNames["EEC 285"]!, id: "EEC 285", units: 3, departmentCode: 'ELEC', electiveName: 'List H'),
      CourseModel(name: courseNames["EEC 286"]!, id: "EEC 286", units: 3, departmentCode: 'ELEC', electiveName: 'List H'),
      CourseModel(name: courseNames["EEC 287"]!, id: "EEC 287", units: 3, departmentCode: 'ELEC', electiveName: 'List H'),
      CourseModel(name: courseNames["EEC 288"]!, id: "EEC 288", units: 3, departmentCode: 'ELEC', electiveName: 'List H'),
      CourseModel(name: courseNames["EEC 289"]!, id: "EEC 289", units: 3, departmentCode: 'ELEC', electiveName: 'List H'),
    ];
  }

  @override
  /// List ID : {ListOfCourses : The amount needed to finish} if -1 then all of them ar requirment
  Map<String, Map<List<CourseModel> , int>>  get allCoursesMap  {
        return {"Lista A":{generalCoursesList:-1},
        "List B":{requirementCoursesList:-1},
        "List C":{majorRequirementCoursesList:-1},
        "List D":{economicOptCourses:1},
        "List E":{cultureOptCourses:2},
        "List F":{introCourses:3},
        "List G":{mathOptCourses:3},
        "List H":{departmentOptCourses:4}};
  }
  
  @override
  List<CourseModel> get  allCoursesList{
        return [
          ...generalCoursesList,
        ...requirementCoursesList,
        ...majorRequirementCoursesList,
        ...economicOptCourses,
        ...cultureOptCourses,
        ...introCourses,
        ...mathOptCourses,
        ...departmentOptCourses];
  }
  

  /*
  اختيارى س  -> cultureOptCourses
  اختيارى ب  -> introCourses
  اختيارى أ  -> mathOptCourses
  اختيارى د  -> economicOptCourses
  اختيارى ى  ->  departmentOptCourses

  */

@override
Map<String, List<CourseModel>>  get departmentTree => {
  "prep":[
    getCourse("CHM 001" , isArabic),
    getCourse("CSC 001" , isArabic),
    getCourse("ENG 003" , isArabic),
    getCourse("ENG 004" , isArabic),
    getCourse("ENG 005" , isArabic),
    getCourse("ENG 006" , isArabic),
    getCourse("ENG 001" , isArabic),
    getCourse("ENG 002" , isArabic),
    getCourse("FTR 031" , isArabic),
    getCourse("LNG 001" , isArabic),
    getCourse("MTH 001" , isArabic),
    getCourse("PHE 001" , isArabic),
    getCourse("PHY 001" , isArabic),
    getCourse("PHY 002" , isArabic),
    getCourse("MTH 002" , isArabic),
    getCourse("LNG 003" , isArabic),
    getCourse("LNG 002" , isArabic),
  ],
  
  "year1 term 1":[
    getCourse("EEC 112" , isArabic),
    getCourse("EEC 113" , isArabic),
    getCourse("MTH 101" , isArabic),
    CourseModel(name: "Math Elective (Choose 1)", id: "MTH (1)", units: 3,departmentCode:'ELEC' , electiveName: 'List G'),
    CourseModel(name: "Intro Elective (Choose 1)", id: "EEC (1)", units: 2,departmentCode:'ELEC', electiveName:  'List F'),
    CourseModel(name: "Intro Elective (Choose 1)", id: "EEC (2)", units: 2,departmentCode:'ELEC', electiveName:  'List F'),
    CourseModel(name: "Intro Elective (Choose 1)", id: "EEC (3)", units: 2,departmentCode:'ELEC', electiveName:  'List F'),
    getCourse("PHE 101" , isArabic),
  ],
  "year1 term 2":[
    getCourse("EEC 121" , isArabic),
    getCourse("EEC 123" , isArabic),
    getCourse("EEC 124" , isArabic),
    getCourse("MTH 102" , isArabic),
    CourseModel(name: "Culture Elective (Choose 1)", id: "HUM (1)", units: 2,departmentCode:'ELEC' , electiveName: 'List E'),
    getCourse("MNG 101" , isArabic),
    getCourse("MNG 102" , isArabic),
  ],
  "year1 term 3":[
    getCourse("FTR 131" , isArabic),
  ],
  
  "year2 term 1":[
    getCourse("EEC 141" , isArabic),
    getCourse("EEC 142" , isArabic),
    getCourse("EEC 115" , isArabic),
    CourseModel(name: "Math Elective (Choose 1)", id: "MTH (2)", units: 3,departmentCode:'ELEC', electiveName: 'List G'),
    getCourse("MNG 103" , isArabic),
    getCourse("HUM 108" , isArabic),
    getCourse("HUM 109" , isArabic),
  ],
  "year2 term 2":[
    getCourse("EEC 151" , isArabic),
    getCourse("EEC 152" , isArabic),
    getCourse("EEC 154" , isArabic),
    getCourse("EEC 125" , isArabic),
    getCourse("MTH 105" , isArabic),
    CourseModel(name: "Culture Elective (Choose 1)", id: "HUM (2)", units: 2,departmentCode:'ELEC', electiveName: 'List E'),
    CourseModel(name: "Math Elective (Choose 1)", id: "MTH (3)", units: 3,departmentCode:'ELEC', electiveName: 'List G'),
  ],
  "year2 term 3":[
    getCourse("FTR 161" , isArabic),
  ],
  
  "year3 term 1":[
    getCourse("EEC 211" , isArabic),
    getCourse("EEC 255" , isArabic),
    getCourse("EEC 212" , isArabic),
    getCourse("EEC 213" , isArabic),
    getCourse("MNG 201" , isArabic),
    CourseModel(name: "Department Elective (Choose 1)", id: "EEC (1)", units: 3,departmentCode:'ELEC', electiveName: 'List H'),
  ],
  "year3 term 2":[
    getCourse("EEC 225" , isArabic),
    getCourse("EEC 223" , isArabic),
    getCourse("EEC 224" , isArabic),
    getCourse("EEC 222" , isArabic),
    getCourse("EEC 216" , isArabic),
    CourseModel(name: "Department Elective (Choose 1)", id: "EEC (2)", units: 3,departmentCode:'ELEC', electiveName: 'List H'),
  ],
  "year3 term 3":[
    getCourse("FTR 231" , isArabic),
  ],
  
  "year4 term 1":[
    getCourse("EEC 242" , isArabic),
    getCourse("EEC 241" , isArabic),
    getCourse("EEC 214" , isArabic),
    getCourse("MNG 202" , isArabic),
    getCourse("MNG 203" , isArabic),
    getCourse("PHE 201" , isArabic),
    getCourse("HUM 205" , isArabic),
  ],
  "year4 term 2":[
    getCourse("EEC 290" , isArabic),
    getCourse("EEC 251" , isArabic),
    CourseModel(name: "Department Elective (Choose 1)", id: "EEC (3)", units: 3,departmentCode:'ELEC', electiveName: 'List H'),
    CourseModel(name: "Department Elective (Choose 1)", id: "EEC (4)", units: 3,departmentCode:'ELEC', electiveName: 'List H'),
    CourseModel(name: "Economic Elective (Choose 1)", id: "HUM (3)", units: 2,departmentCode:'ELEC', electiveName: 'List D'),
    getCourse("HUM 204" , isArabic),
  ],
  "year4 term 3":[
    getCourse("FTR 261" , isArabic),
  ],
};


CourseModel getCourse(String id , bool isArabic){
  try{
  return allCoursesList.firstWhere((element) => element.id == id,);
  }catch(e){
    return CourseModel(name: "No Such Course", id: id, units: -1, departmentCode: "N/A");
  }
}
}

