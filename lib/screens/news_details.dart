import 'package:cached_network_image/cached_network_image.dart';
import 'package:esraa_news_app/models/NewsResponse.dart';
import 'package:esraa_news_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget{
  static const String routeName="newsDetails";
  @override
  Widget build(BuildContext context) {
    var articles=ModalRoute.of(context)?.settings.arguments as Articles;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:
      AppBar(
        centerTitle: true,
        backgroundColor: green,
        titleTextStyle:
        GoogleFonts.exo(color: Colors.white, fontSize: 22),
        shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        title: Text("News App"),
      ),
  body:Stack(
    children: [
      Image.asset("assets/images/pattern.png",fit: BoxFit.cover,width: double.infinity,height: double.infinity,),
      Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(6)
                  ) ,
                  child: CachedNetworkImage(
                    imageUrl: articles.urlToImage ?? "",
                    fit: BoxFit.fill,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
             Expanded(
               child: Padding(
                 padding: const EdgeInsets.all(16),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                            articles.title ?? "",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF42505C),
                            ),
                          ),
                     Card(
                       margin: EdgeInsets.symmetric(vertical: 20),
                       shape: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(12),
                           borderSide: BorderSide(
                               color: Colors.transparent
                           )
                       ),
                       color: Colors.white,
                       child: Padding(
                         padding: const EdgeInsets.all(24),
                         child: Column(
                           children: [
                             Text(articles.description??"",style: GoogleFonts.poppins(
                               fontSize: 13,
                               fontWeight: FontWeight.w400,
                               color: Color(0xFF42505C),
                             ),),
                             Text(articles.content??"",style: GoogleFonts.poppins(
                               fontSize: 13,
                               fontWeight: FontWeight.w400,
                               color: Color(0xFF42505C),
                             ),),
                             SizedBox(height: 30,),
                              Row(
                                 children: [
                                   Spacer(),
                                   Text("View Full Article",style: GoogleFonts.poppins(
                                     fontSize: 14,
                                     fontWeight: FontWeight.w500,
                                     color: Color(0xFF42505C),
                                   ),),
                                   IconButton(onPressed:() {
                                    Uri url=Uri.parse(articles.url??"");
                                    launchUrl(url);
                                   }, icon: Icon(Icons.arrow_right_outlined,color: Color(0xFF303030),size: 30,))
                                 ],
                               ),
                           ],
                         ),
                       ),
                     ),
                   ],
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
