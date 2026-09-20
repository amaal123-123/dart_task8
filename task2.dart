class Student {

  String name;
  String? phone;

  String? email;
Student(this.name,{this.phone,this.email});
}
void main(){
  Student s1=Student("sara",email: "sara@email.com");
  Student s2=Student("aml",email: "aml@email.com");

  List<Student>students= [s1,s2];
  for (var student in students){
    print("students name :${student.name}");
     String phoneStatus =student.phone??"phone not available";
     print("phone :$phoneStatus");

     int? emailLengh =student.email?.length;
     print("email lengtgh:${emailLengh??'no email'}");
  }
}

