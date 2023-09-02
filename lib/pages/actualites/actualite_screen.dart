import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:macarrierepro/custome/custome_appbar.dart';
import 'package:http/http.dart' as http;
import 'package:macarrierepro/pages/actualites/actualite_detail.dart';
import 'package:macarrierepro/pages/actualites/actualite_model.dart';
import 'package:macarrierepro/utils/constance.dart';

class ActualiteScreen extends StatefulWidget {
  const ActualiteScreen({super.key});

  @override
  State<ActualiteScreen> createState() => _ActualiteScreenState();
}

class _ActualiteScreenState extends State<ActualiteScreen> {
  String formatDate(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(dateTime);
  }

  Future<List<Actualites>> fetchData() async {
    String? url = Constance.actualite;

    var isRedirect = true;

    while (isRedirect) {
      final client = http.Client();
      final request = http.Request('GET', Uri.parse(url!))
        ..followRedirects = false
        ..headers['cookie'] = 'security=true';
      final response = await client.send(request);

      if (response.statusCode == HttpStatus.movedTemporarily) {
        isRedirect = response.isRedirect;
        url = response.headers['location'];
      } else if (response.statusCode == HttpStatus.ok) {
        final String responseBody = await response.stream.bytesToString();
        final List<dynamic> jsonResponse = json.decode(responseBody);
        return jsonResponse.map((data) => Actualites.fromJson(data)).toList();
      } else {
        throw Exception("An error occurred");
      }
    }

    throw Exception("No valid response received");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustome(
        title: "Actualités",
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FutureBuilder<List<Actualites>>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailActualiteScreen(
                                  actualite: snapshot.data![index],
                                ),
                              ),
                            );
                          },
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: snapshot.data![index].yoastHeadJson!
                                                .ogImage!.single.url !=
                                            null
                                        ? Image.network(
                                            snapshot.data![index].yoastHeadJson!
                                                .ogImage!.single.url!,
                                            fit: BoxFit.contain,
                                          )
                                        : Image.asset(
                                            "assets/images/logo.png",
                                            fit: BoxFit.contain,
                                          ),
                                  ),
                                ),
                                SizedBox(
                                  child: HtmlWidget(
                                    snapshot.data![index].title!.rendered!,
                                    textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                const Gap(15),
                                SizedBox(
                                  child: HtmlWidget(
                                    snapshot.data![index].excerpt!.rendered!,
                                    textStyle: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                debugPrint(snapshot.error.toString());
                return Text(snapshot.error.toString());
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
