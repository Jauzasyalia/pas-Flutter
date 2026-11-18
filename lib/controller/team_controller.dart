import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas/model/team_model.dart';

class TeamController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var listTeam = <Team>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTeams();
  }

  Future<void> fetchTeams() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final url = Uri.parse(
          "https://www.thesportsdb.com/api/v1/json/123/search_all_teams.php?l=English%20Premier%20League");
      final response = await http.get(url).timeout(const Duration(seconds: 20));

      if (response.statusCode == 200) {
        listTeam.value = premierLeagueModelFromJson(response.body).teams;
      } else {
        errorMessage.value = "Gagal memuat data (${response.statusCode})";
      }
    } catch (e) {
      debugPrint("error team: $e");
      errorMessage.value = "Gagal memuat data. Cek koneksi internet anda.";
    } finally {
      isLoading.value = false;
    }
  }
}
