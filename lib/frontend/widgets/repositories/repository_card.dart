// This file contains the widget for each
// individual Repository Card Widget

import 'package:assignment/data/models/github_repository.dart';
import 'package:flutter/material.dart';

class RepositoryCard extends StatelessWidget {
  final Repository repository;
  const RepositoryCard({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.12,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                        ),
                        Text(
                          repository.numberOfStars.toString(),
                          overflow: TextOverflow.fade,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    //for overflow
                    child: Text(
                      repository.name,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    repository.description,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
