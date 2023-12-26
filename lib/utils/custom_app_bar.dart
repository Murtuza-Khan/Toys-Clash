import '../resources/exports/index.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      leadingWidth: 50.0,
      leading: GestureDetector(
        onTap: Get.back,
        child: const Icon(Icons.arrow_back_ios, color: Colors.black),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
