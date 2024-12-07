import 'package:flutter/material.dart';

void main() {
  runApp(const Forms());
}

class Forms extends StatelessWidget {
  const Forms({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/formulir',
      routes: {
        '/formulir': (context) => FormulirPendaftaran(),
      },
    );
  }
}

class FormulirPendaftaran extends StatefulWidget {
  @override
  _FormulirPendaftaranState createState() => _FormulirPendaftaranState();
}

class _FormulirPendaftaranState extends State<FormulirPendaftaran> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nomorTeleponController = TextEditingController();

  String _jenisKelamin = 'Laki-laki';
  bool _setujuSyarat = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('form pendaftaran'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Format email tidak valid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nomorTeleponController,
                decoration: const InputDecoration(
                  labelText: 'Nomor Telepon',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nomor telepon tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Jenis Kelamin',
                  border: OutlineInputBorder(),
                ),
                value: _jenisKelamin,
                onChanged: (String? newValue) {
                  setState(() {
                    _jenisKelamin = newValue!;
                  });
                },
                items: <String>['Laki-laki', 'Perempuan']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              CheckboxListTile(
                title: const Text('Saya menyetujui syarat dan ketentuan'),
                value: _setujuSyarat,
                onChanged: (bool? value) {
                  setState(() {
                    _setujuSyarat = value!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (!_setujuSyarat) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Harap setujui syarat dan ketentuan'),
                        ),
                      );
                      return;
                    }
                    _prosesFormulir();
                  }
                },
                child: const Text('Kirim'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _prosesFormulir() {
    print('Nama: ${_namaController.text}');
    print('Email: ${_emailController.text}');
    print('Nomor Telepon: ${_nomorTeleponController.text}');
    print('Jenis Kelamin: $_jenisKelamin');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Formulir berhasil dikirim!')),
    );
  }

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    _nomorTeleponController.dispose();
    super.dispose();
  }
}
