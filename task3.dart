 Future<String> getData() async{
  await Future.delayed(Duration(seconds: 2));
  return "data loaded successfully ";
  void main() async {
    print("loading data..");
    String result =await getData();
    print(result);

  }
  Catch (error){
    print("an error occurred :$Future.error(error)");
   }
 }