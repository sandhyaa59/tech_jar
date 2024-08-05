import 'package:flutter/material.dart';

TextFormField customFormField(
    {String? labelText, String? hintText, IconButton? iconButton,
    validator,controller,onSubmitted}) {
  return TextFormField(
      textInputAction: TextInputAction.next,
      autofocus: true,
     
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon: iconButton,
        contentPadding: const EdgeInsets.all(12.0),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
         color:  Color(0xff939185),
        )),
        errorBorder:
            const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.red,
        )),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
         color:  Color(0xff939185)
        )),
      ));
}
// InputDecoration customInputDecoration({
//      String ?labelText,
//      String ?hintText,
//     IconButton? iconButton

//   }) {
//     return InputDecoration(
//       labelText: labelText,
//       hintText: hintText,
//     suffixIcon: iconButton,
//   contentPadding: const EdgeInsets.all(12.0),
//         focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide(
//           color: Color(0xff596cff),
//         )),
//         errorBorder:
//             const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
//         focusedErrorBorder: const OutlineInputBorder(
//             borderSide: BorderSide(
//           color: Colors.red,
//         )),
//         enabledBorder: const OutlineInputBorder(
//             borderSide: BorderSide(
//           color: Color(0xff596cff),
//         )),
//     );
//   }

