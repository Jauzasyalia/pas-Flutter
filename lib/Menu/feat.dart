import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas/controller/team_controller.dart';

/// Menu 2: daftar klub English Premier League dari REST API.
class FeatPage extends StatelessWidget {
  const FeatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TeamController());

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.errorMessage.isNotEmpty) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.wifi_off, size: 48, color: Colors.grey),
              const SizedBox(height: 8),
              Text(controller.errorMessage.value, textAlign: TextAlign.center),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: controller.fetchTeams,
                child: const Text("Coba lagi"),
              ),
            ],
          ),
        );
      }

      return RefreshIndicator(
        onRefresh: controller.fetchTeams,
        child: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: controller.listTeam.length,
          itemBuilder: (context, index) {
            final team = controller.listTeam[index];
            return Card(
              elevation: 3,
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                leading: Image.network(
                  team.strBadge,
                  width: 50,
                  height: 50,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.shield, size: 40, color: Colors.grey),
                ),
                title: Text(team.strTeam,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Row(
                  children: [
                    const Icon(Icons.stadium, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Expanded(child: Text(team.strStadium)),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
