import 'package:flutter/material.dart';
import 'package:movie_app/data/const/app_const.dart';
import 'package:movie_app/data/providers/movie_provider.dart';
import 'package:movie_app/theme/app_color.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final vm = context.watch<MovieProvider>();
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                style: TextStyle(color: Colors.blueAccent),
                controller: controller,
                decoration: const InputDecoration(
                  filled: true,
                  // fillColor: AppColors.TextFieldColor,
                  hintText: 'search',
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.horizontal(),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<MovieProvider>().getMovie(controller.text);
                  },
                  child: const Icon(Icons.search)),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: vm.data?.search?.length ?? 0,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                '${vm.data?.search?[index].title}',
                                style: const TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text('${vm.data?.search?[index].year}',
                                  style: const TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 25,
                              ),
                              Image.network(
                                vm.data?.search?[index].poster ??
                                    AppConsts.errorImage,
                                height: 400,
                                width: double.infinity,
                              ),
                            ],
                          ),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
