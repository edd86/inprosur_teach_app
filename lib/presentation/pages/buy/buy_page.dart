import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inprosur_teach_app/presentation/providers/course_provider.dart';
import 'package:sizer/sizer.dart';

class BuyPage extends ConsumerStatefulWidget {
  final int courseId;
  const BuyPage({required this.courseId, super.key});

  @override
  ConsumerState<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends ConsumerState<BuyPage> {
  @override
  Widget build(BuildContext context) {
    final courseAsync = ref.watch(courseDetailsProvider(widget.courseId));
    return courseAsync.when(
      data: (courseDetails) => Scaffold(
        appBar: AppBar(
          title: Text(
            courseDetails.title,
            style: TextStyle(
              fontSize: courseDetails.title.length >= 25 ? 16.sp : 17.5.sp,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/imgs/image.png', width: 70.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '${courseDetails.price} bs.',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Valido: 15/03/2025',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              Text('Descargue y scanee el código QR para pagar por el curso'),
              SizedBox(height: 5.h),
              LinearProgressIndicator(),
              SizedBox(height: 5.h),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.download),
                label: Text('Descargar'),
              ),
            ],
          ),
        ),
      ),
      error: (e, _) => Center(child: Text('Error: $e')),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }
}
