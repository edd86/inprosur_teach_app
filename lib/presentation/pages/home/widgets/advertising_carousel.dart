import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inprosur_teach_app/presentation/providers/advertising_provider.dart';

import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class AdvertisingCarousel extends ConsumerStatefulWidget {
  const AdvertisingCarousel({super.key});

  @override
  ConsumerState<AdvertisingCarousel> createState() =>
      _AdvertisingCarouselState();
}

class _AdvertisingCarouselState extends ConsumerState<AdvertisingCarousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final advertisingAsync = ref.watch(advertisingProvider);
    return advertisingAsync.when(
      data: (advertisings) => Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: CarouselSlider(
              items: advertisings
                  .map(
                    (advertising) => InkWell(
                      child: Image.network(
                        advertising.imgUrl,
                        fit: BoxFit.cover,
                        width: 100.w,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/imgs/error_image.png',
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                      onTap: () async {
                        if (advertising.externalUrl != null) {
                          final url = Uri.parse(advertising.externalUrl!);
                          if (!await launchUrl(
                            url,
                            mode: LaunchMode.inAppBrowserView,
                          )) {
                            throw Exception('Could not launch: $url');
                          }
                        }
                      },
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 4),
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(advertisings.length, (index) {
                return Container(
                  width: 10.sp,
                  height: 10.sp,
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey[400],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
      error: (error, _) {
        return Center(child: SizedBox(child: Text('No hay anuncios')));
      },
      loading: () => SizedBox.shrink(),
    );
  }
}
