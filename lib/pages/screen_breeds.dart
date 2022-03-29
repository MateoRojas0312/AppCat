
import 'package:catapp/globals.dart';
import 'package:catapp/models/breeds.dart';
import 'package:catapp/pages/screen_details.dart';
import 'package:catapp/utilities/styles.dart';
import 'package:catapp/widgets/ratingBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BreedsPage extends StatefulWidget {
  BreedsPage({Key? key}) : super(key: key);

  @override
  State<BreedsPage> createState() => _BreedsPageState();
}

class _BreedsPageState extends State<BreedsPage> {
  List<Breeds> _searchResult = [];
  List<Breeds> _listBreeds = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customSearchBar,
        backgroundColor: Color(0xFF603e85),
        actions: [
          IconButton(
            onPressed: () {
              if (customIcon.icon == Icons.search) {
                customIcon = const Icon(Icons.cancel);
                customSearchBar = ListTile(
                  leading: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 28,
                  ),
                  title: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Enter breed of cats...',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      onChanged: (value) {
                        setSearch(value);
                      }),
                );
              } else {
                customIcon = const Icon(Icons.search);
                customSearchBar = Text('CatApp',
                    style: GoogleFonts.getFont('Roboto',
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold));
              }
            },
            icon: customIcon,
          )
        ],
        centerTitle: true,
      ),
      body: FutureBuilder<List<Breeds>>(
        future: breedsClass.getAllBreeds(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError || snapshot.data == null) {
            return const Center(
              child: Text('Error Loading Data.'),
            );
          } else {
            var breeds = snapshot.data;
            _listBreeds = breeds!;

            return ListView.separated(
              itemBuilder: (context, index) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Card(
                    elevation: 6.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Text(
                                breeds[index].name!,
                                style: title,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          DetailsPage(breeds[index]),
                                    ),
                                  );
                                },
                                child: Image.network(
                                  breeds[index].image.url!,
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stacktrace) {
                                    return Container(
                                      child: Image.asset(
                                        'assets/cat.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                              child: Text(
                                'Origin:',
                                style: subtitle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                              child: Text(
                                breeds[index].origin!,
                                overflow: TextOverflow.ellipsis,
                                style: text,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 8, 20, 8),
                                child: Text(
                                  'Intelligence: ',
                                  overflow: TextOverflow.ellipsis,
                                  style: subtitle,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 8, 20, 8),
                                child: RatingBar(
                                  breeds: breeds[index].intelligence!,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: breeds.length,
            );
          }
        },
      ),
    );
  }

  void setSearch(String value) {
    if (value.isEmpty) {
      setState(() {
        return;
      });
      ;
    }

    setState(
      () {
        _searchResult = _listBreeds
            .where((element) =>
                element.name!.toLowerCase().contains(value.toLowerCase()))
            .toList();
      },
    );
  }
}
