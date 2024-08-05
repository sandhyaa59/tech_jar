import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tech_jar/controllers/photo_controller.dart';
import 'package:tech_jar/widget/appbar.dart';
import 'package:tech_jar/widget/error_message.dart';
import 'package:tech_jar/widget/navigation_bar.dart';

class PhotosScreen extends StatelessWidget {
  final photoController = Get.find<PhotoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Photos'
      ),
      bottomNavigationBar: BottomNavBar(),
      body: Obx(() {
        if (photoController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (photoController.photoList.isEmpty) {
          return const ErrorMessageWidget(message: 'No photos found.');
        } else {
          return Container(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of columns
                crossAxisSpacing: 1.0, // Horizontal space between photos
                
              ),
              itemCount: photoController.photoList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Handle photo tap if needed
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      photoController.photoList[index].thumbnailUrl ?? "",
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            color: Colors.white,
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error);
                      },
                    ),
                  ),
                );
              },
            ),
          );
        }
      }),
    );
  }
}
