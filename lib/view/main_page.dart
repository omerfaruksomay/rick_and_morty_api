import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_api/model/character.dart';
import 'package:rick_and_morty_api/view_model/main_view_model.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Rick & Morty Characters',
            style: TextStyle(
              color: Colors.white,
            )),
      ),
      body: Consumer<MainViewModel>(
        builder: (context, viewModel, child) {
          return _buildListView(viewModel);
        },
      ),
    );
  }

  Widget _buildListView(MainViewModel viewModel) {
    return ListView.builder(
      itemCount: viewModel.characters.length,
      itemBuilder: (context, index) {
        Character char = viewModel.characters[index];
        return _buildCard(char,viewModel);
      },
    );
  }

  Widget _buildCard(Character char,MainViewModel viewModel) {

    if(char.status == 'Alive'){
      viewModel.statusColor = Colors.green;
    }else if(char.status == 'unknown'){
      viewModel.statusColor = Colors.grey;
    }else if(char.status == 'Dead'){
      viewModel.statusColor = Colors.red;
    }

    return Card(
      color: Colors.grey.shade700,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            child: Image.network(
              char.image,
              width: 150,
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    char.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: viewModel.statusColor),
                        height: 12,
                        width: 12,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "${char.status} - ${char.species} - ${char.gender}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Last Known Location:',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    char.location,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'First Seen Location:',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    char.origin,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
