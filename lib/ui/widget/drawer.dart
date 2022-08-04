part of 'widgets.dart';

class MyDrawer extends GetView<HomeController> {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: primaryColor,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                height: 150,
                width: double.infinity / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/cs.png',
                      scale: 1.5,
                    ),
                    const Spacer(),
                    Text(
                      'Usep Hermanto',
                      style: title.copyWith(color: Colors.white),
                    ),
                    Text(
                      'BUSDEV',
                      style: subtTitle.copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              DrawerListTile(
                ontap: () => Get.offAll(() => const HomeScreen()),
                title: 'Home',
                icon: MdiIcons.home,
              ),
              DrawerListTile(
                ontap: () async => await controller.getresults().then((value) =>
                    (value.value ?? false)
                        ? Get.to(() => const QuizHistoryScreen())
                        : snackbar(context, value.value ?? false,
                            value.message ?? 'error')),
                title: 'History Quiz',
                icon: MdiIcons.history,
              ),
              const Spacer(),
              const Divider(
                thickness: 1,
                color: Colors.white,
              ),
              DrawerListTile(
                ontap: () {},
                title: 'Log Out',
                icon: MdiIcons.logout,
              ),
            ],
          ),
        ),
      );
}
