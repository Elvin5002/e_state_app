import 'widgets/container_view.dart';
import '../../../cubits/property/property_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectImage extends StatelessWidget {
  const SelectImage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PropertyCubit>();
    return StreamBuilder(
        stream: cubit.selectedImages.stream,
        builder: (context, snapshot) {
          final images = snapshot.data ?? [];
          return GestureDetector(
            onTap: () {
              cubit.pickImages();
            },
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: images.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.image, size: 40, color: Colors.grey),
                          Text(AppLocalizations.of(context)!.choosePicture, style: Theme.of(context).textTheme.labelLarge,),
                        ],
                      )
                    : GridView.builder(
                        itemCount: images.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (context, i) {
                          return ContainerView(
                            image: images[i], 
                            onTap: () {
                              cubit.selectedImages.value.removeAt(i);
                              cubit.selectedImages.sink.add(cubit.selectedImages.value);
                            },
                          );
                        },
                      ),
              ),
            ),
          );
        });
  }
}
