import 'dart:convert';

import 'package:bpjs/model/data_waktu.dart';
import 'package:bpjs/model/dokter.dart';
import 'package:bpjs/model/layanan.dart';
import 'package:bpjs/model/login.dart';
import 'package:bpjs/model/riwayat.dart';
import 'package:bpjs/model/rumah-sakit.dart';
import 'package:bpjs/shared/shared_preferences.dart';
import 'package:bpjs/ui/login.dart';
import 'package:http/http.dart' as http;

// class Pesanan {
//   static final String _baseUrl = 'http://10.0.2.2:8000/api/layanan';

//   Future getPesanan() async {
//     try {
//       final response = await http.post(Uri.parse(_baseUrl));
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }

class Layananservice {
  static final String _baseUrl = 'https://bpjs-api.herokuapp.com/api/layanan';

  Future getLayanan() async {
    Uri urlApi = Uri.parse(_baseUrl);

    final response = await http.get(urlApi);
    if (response.statusCode == 200) {
      return layananFromJson(response.body.toString());
    } else {
      throw Exception("Failed to load data layanan");
    }
  }
}

class Rumahsakitservice {
  Future getrumahsakit(idrumahsakit) async {
    Uri urlApi = Uri.parse(
        'https://bpjs-api.herokuapp.com/api/rumah-sakit/$idrumahsakit');

    final response = await http.get(
      urlApi,
    );
    if (response.statusCode == 200) {
      return rumahsakitFromJson(response.body.toString());
    } else {
      throw Exception("Failed to load data layanan");
    }
  }
}

class Dokterservice {
  static final String _baseUrl = 'https://bpjs-api.herokuapp.com/api/dokter/';

  Future getdokter(iddokterr) async {
    Uri urlApi = Uri.parse(_baseUrl + '$iddokterr');

    final response = await http.get(urlApi);
    if (response.statusCode == 200) {
      print(response.body.toString());
      return dokterFromJson(response.body.toString());
    } else {
      throw Exception("Failed to load data layanan");
    }
  }
}

class Waktuservice {
  static final String _baseUrl =
      'https://bpjs-api.herokuapp.com/api/dokter/waktu/';

  Future getwaktu(idwaktud) async {
    Uri urlApi = Uri.parse(_baseUrl + '$idwaktud');

    final response = await http.get(urlApi);
    if (response.statusCode == 200) {
      print(response.body.toString());
      return waktuFromJson(response.body.toString());
    } else {
      throw Exception("Failed to load data layanan");
    }
  }
}

class Riwayatservice {
  static final String _baseUrl = 'https://bpjs-api.herokuapp.com/api/antri/';

  Future getriwayat(idriwayat) async {
    Uri urlApi = Uri.parse(_baseUrl + '$idriwayat');

    final response = await http.get(urlApi);
    if (response.statusCode == 200) {
      print(response.body.toString());
      return riwayatFromJson(response.body.toString());
    } else {
      throw Exception("Failed to load data layanan");
    }
  }
}

class AntrianService {
  static final String url = 'https://bpjs-api.herokuapp.com/api/antri';

  Future postAntrian(String patient_id, String doctor_id, String service_id,
      String timetable_id) async {
    try {
      final response = await http.post(Uri.parse(url), body: {
        'patient_id': patient_id,
        'doctor_id': doctor_id,
        'service_id': service_id,
        'timetable_id': timetable_id,
      });
      if (response.statusCode == 200) {
        print(response.body.toString());
        return true;
      } else {
        return false;
      }
    } catch (e) {}
  }
}

class LoginService {
  static final String url = 'https://bpjs-api.herokuapp.com/api/login';

  Future<LoginModel> postLogin(
    String nik,
    String pass,
  ) async {
    var header = {
      'Accept': 'application/json',
    };
    var body = {
      'nik': nik,
      'password': pass,
    };

    var response = await http.post(
      Uri.parse(url),
      headers: header,
      body: body,
    );

    var data = jsonDecode(response.body);
    print("Status Login User=${data['success']}");

    try {
      if (data['success'] == true) {
        LoginModel loginModel = LoginModel.fromJson(data);

        SharedPreference.loginUser
            ?.setString("id", loginModel.data.id.toString());
        SharedPreference.loginUser
            ?.setString("name", loginModel.data.name.toString());
        SharedPreference.loginUser
            ?.setString("nik", loginModel.data.nik.toString());
        SharedPreference.loginUser
            ?.setString("bpjs_number", loginModel.data.bpjsNumber.toString());
        SharedPreference.loginUser
            ?.setString("birthday", loginModel.data.birthday.toString());

        return loginModel;
      } else {
        throw data['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}

class UlasService {
  static final String url = 'https://bpjs-api.herokuapp.com/api/ulas/';

  Future postUlas(int rate, String comment, int id) async {
    try {
      final response = await http.post(Uri.parse(url + '$id'), body: {
        'rate': rate.toString(),
        'comment': comment,
      });
      var data = jsonDecode(response.body);
      if (data['success'] == true) {
        print(data.toString());
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
// class Antrianservice {
//   static final String _baseUrl = 'https://bpjs-api.herokuapp.com/api/antri';

//   Future postatrian(
//       String patient_id, String doctor_id, String service_id, String timetable_id) async {
//     Uri urlApi = Uri.parse(_baseUrl);

//     final response = await http.post(urlApi,
//         body: jsonEncode({
//           'patient_id': 1,
//           'doctor_id': 1,
//           'service_id': 1,
//           'timetable_id': 1,
//         }));
//     if (response.statusCode == 200) {
//       print(response.body.toString());
//       return true;
//     } else {
//       throw false;
//     }
//   }
// }
