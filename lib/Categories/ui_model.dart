import 'package:categorylogin/Categories/presentation/categories_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/client.dart';
import '../main.dart';
import '../utils.dart';
import 'data/repository/categories_repository.dart';


// void main() {
//   runApp(Categories());
// }

class Categories extends StatelessWidget {
  Categories({super.key});

  final darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.bacround,
      foregroundColor: Colors.black,
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.redpinkmain,
      onPrimary: Colors.white,
      secondary: AppColors.pink,
      onSecondary: AppColors.redpink,
      error: Colors.red,
      onError: Colors.white,
      surface: AppColors.bacround,
      onSurface: AppColors.redpinkmain,
      onBackground: Colors.white,

    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: CategoriesPage(
        vm: CategoriesViewModel(
          repo: CategoriesRepository(
            client: ApiClient(),
          ),
        ),
      ),
    );
  }
}

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key, required this.vm});

  final CategoriesViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: vm,
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 41,
          leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginView()),
              );
            },
            child: Center(
              child: SvgPicture.asset(
                'asset/back.svg',
                width: 20,
                height: 20,
              ),
            ),
          ),
          title: Center(
            child: Text(
              'Categories',
              style: TextStyle(
                color: AppColors.redpinkmain,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'asset/notifiler.svg',
                        // color: AppColors.pink,
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      // color: AppColors.redpink,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'asset/search.svg',
                        // color: AppColors.pink,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    vm.myCategory![9].title,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 3),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      vm.myCategory![9].image,
                      width: double.infinity,
                      height: 148,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            vm.myCategory![1].title,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              vm.myCategory![1].image,
                              width: 158,
                              height: 144,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 36),
                      Column(
                        children: [
                          Text(
                            vm.myCategory![2].title,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              vm.myCategory![2].image,
                              width: 158,
                              height: 144,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            vm.myCategory![8].title,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              vm.myCategory![8].image,
                              width: 158,
                              height: 144,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 36),
                      Column(
                        children: [
                          Text(
                            vm.myCategory![7].title,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              vm.myCategory![7].image,
                              width: 158,
                              height: 144,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            vm.myCategory![6].title,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              vm.myCategory![6].image,
                              width: 158,
                              height: 144,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 36),
                      Column(
                        children: [
                          Text(
                            vm.myCategory![5].title,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              vm.myCategory![5].image,
                              width: 158,
                              height: 144,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            vm.myCategory![4].title,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              vm.myCategory![4].image,
                              width: 158,
                              height: 144,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 36),
                      Column(
                        children: [
                          Text(
                            vm.myCategory![3].title,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              vm.myCategory![3].image,
                              width: 158,
                              height: 144,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: Container(
          width: 430,
          height: 100,
          decoration: BoxDecoration(),
          child: Center(
            child: Container(
              width: 250,
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.redpinkmain,
                borderRadius: BorderRadius.circular(150),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      SvgPicture.asset('asset/bottom1.svg'),
                      SizedBox(
                        width: 30,
                      ),
                      SvgPicture.asset('asset/bottom2.svg'),
                      SizedBox(
                        width: 30,
                      ),
                      SvgPicture.asset('asset/bottom3.svg'),
                      SizedBox(
                        width: 30,
                      ),
                      SvgPicture.asset('asset/bottom4.svg'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
