import 'package:alldb/helper/constants/app_strings.dart';

extension FieldValidation on String{
  emailValidation(){
    if(isEmpty){
      return AppStrings.kEmptyEmail;
    }else if(!contains("@")){
      return AppStrings.kInvalidEmail;
    }else {
      return null;
    }
  }

  nameValidation(){
    if(isEmpty){
      return AppStrings.kEmptyName;
    }else {
      return null;
    }
  }
}