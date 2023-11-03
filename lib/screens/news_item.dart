import 'package:esraa_news_app/models/NewsResponse.dart';
import 'package:esraa_news_app/screens/news_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsItem extends StatelessWidget {
  Articles articles;

  NewsItem(this.articles);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsDetails.routeName,arguments:
        articles);
      },
      child: Card(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.transparent)),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14), topRight: Radius.circular(14)),
              child: CachedNetworkImage(
                imageUrl: articles.urlToImage ?? "",
                fit: BoxFit.fill,
                height: 230,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                articles.title ?? "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF42505C),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
