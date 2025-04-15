import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_medigreif_digital_health/models/user/login_body_request.dart';
import 'package:task_medigreif_digital_health/providers/user/user_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userProvider);
    final isLoading = userState.isLoading;
    final errorMessage = userState.errorMessage;

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Username
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value == null || value.isEmpty ? 'Enter your username' : null,
              ),
              const SizedBox(height: 16),
              // Password
              TextFormField(
                controller: _passwordController,
                obscureText: _isPasswordHidden,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordHidden ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordHidden = !_isPasswordHidden;
                      });
                    },
                  ),
                ),
                validator: (value) =>
                value == null || value.isEmpty ? 'Enter your password' : null,
              ),
              const SizedBox(height: 8),
              if (errorMessage != null)
                Text(
                  errorMessage,
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isLoading ? null : _handleLogin,
                  child: isLoading
                      ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                      : const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Handle login
  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    final loginBody = LoginBodyRequest(
      username: _usernameController.text,
      password: _passwordController.text,
    );

    await ref.read(userProvider.notifier).login(loginBody);
  }
}