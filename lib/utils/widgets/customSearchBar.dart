import 'package:ecommerce_project/imports.dart';

class customSearchBar extends StatelessWidget {
  final Function(String) onChanged;
  const customSearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(10),
      child: TextField(
        onChanged: onChanged,

        style: appTextStyles.withColor(
          appTextStyles.buttonMid, 
          Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black
        ),

        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: appTextStyles.withColor(
            appTextStyles.buttonMid, 
            Colors.grey[600]!
          ),

          prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
          suffixIcon: Icon(Icons.tune, color: Colors.grey[600]),

          filled: true,
          fillColor: Colors.grey[100],

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.grey[600]!, width: 1)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1)
          ),
        ),
      )
    );
  }
}