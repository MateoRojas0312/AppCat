import 'package:catapp/models/breeds.dart';
import 'package:catapp/utilities/styles.dart';
import 'package:catapp/widgets/ratingBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DetailsPage extends StatelessWidget {
  Breeds breeds;
  DetailsPage(this.breeds, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(breeds.name!),
        backgroundColor: Color(0xFF603e85),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.5,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
              child: Image.network(
                breeds.image.url!,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 500,
                child: ListView(
                  children: [
                    Text(
                      breeds.description!,
                      textAlign: TextAlign.justify,
                      style: text,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Origin: ',
                          style: subtitle,
                        ),
                        Text(
                          breeds.origin!,
                          style: text,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Adaptability: ',
                          style: subtitle,
                        ),
                        RatingBar(breeds: breeds.adaptability!),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Dog Friendly:',
                          style: subtitle,
                        ),
                        RatingBar(breeds: breeds.dogFriendly!)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Child Friendly:',
                          style: subtitle,
                        ),
                        RatingBar(breeds: breeds.childFriendly!)
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
