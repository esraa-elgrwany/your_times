import 'package:cached_network_image/cached_network_image.dart';
import 'package:esraa_news_app/layouts/home_cubit/cubit.dart';
import 'package:esraa_news_app/models/NewsResponse.dart';
import 'package:esraa_news_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsDetails extends StatelessWidget{
  static const String routeName="newsDetails";
  @override
  Widget build(BuildContext context) {
    var articles=ModalRoute.of(context)?.
    settings.arguments as Articles;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:
      AppBar(
        centerTitle: true,
        backgroundColor: green,
        titleTextStyle:
        GoogleFonts.exo(color: Colors.white, fontSize: 22.sp),
        shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.r),
                bottomRight: Radius.circular(30.r))),
        title: Text(AppLocalizations.of(context)!.appTitle),
      ),
  body:Stack(
    children: [
      Image.asset("assets/images/pattern.png",fit: BoxFit.cover,
        width: double.infinity,height: double.infinity,),
      Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6.r)
                    ) ,
                    child: CachedNetworkImage(
                      imageUrl: articles.urlToImage ?? "",
                      fit: BoxFit.fill,
                      width: 412.w,
                      height: 232.5.h,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                          Center(child:
                          CircularProgressIndicator(
                              value: downloadProgress.progress)),
                      errorWidget: (context, url, error)
                      => Icon(Icons.error),
                    ),
                  ),
             Expanded(
               child: Padding(
                 padding: const EdgeInsets.all(16).w,
                 child: Expanded(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                                articles.title ?? "",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color:Theme.of(context).colorScheme.surface,
                                ),
                              ),

                       Expanded(
                         child: Card(
                           margin: EdgeInsets.symmetric(vertical: 20),
                           shape: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(12.r),
                               borderSide: BorderSide(
                                   color: Colors.transparent
                               )
                           ),
                           child: Padding(
                             padding: const EdgeInsets.all(24).w,
                             child: Expanded(
                               child: Column(
                                 children: [
                                   Text(articles.description??"",style: GoogleFonts.poppins(
                                     fontSize: 14.sp,
                                     fontWeight: FontWeight.w400,
                                     color:Theme.of(context).colorScheme.surface,
                                   ),),
                                   Text(articles.content??"",style: GoogleFonts.poppins(
                                     fontSize: 14.sp,
                                     fontWeight: FontWeight.w400,
                                     color:Theme.of(context).colorScheme.surface,
                                   ),),
                                   Spacer(),
                                    Row(
                                       children: [
                                         Spacer(),
                                         Text("View Full Article",style: GoogleFonts.poppins(
                                           fontSize: 14.sp,
                                           fontWeight: FontWeight.w500,
                                           color: Theme.of(context).colorScheme.surface,
                                         ),),
                                         IconButton(onPressed:() {
                                          Uri url=Uri.parse(articles.url??"");
                                          launchUrl(url);
                                         }, icon: Icon(Icons.arrow_right_outlined,
                                           color: green,size: 35,))
                                       ],
                                     ),
                                 ],
                               ),
                             ),
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
             ),
            ],
          ),
    ],
  ),
    );
  }
}
