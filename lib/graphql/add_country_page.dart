// lib/ui/add_country_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/graphql/add_country_cubit.dart';
import 'package:learning_flutter/graphql/country.dart';

class AddCountryPage extends StatelessWidget {
  const AddCountryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // controllers to read user input
    final codeController = TextEditingController();
    final nameController = TextEditingController();
    final emojiController = TextEditingController();
    final capitalController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Add Country (Mutation demo)')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<AddCountryCubit, AddCountryState>(
          listener: (context, state) {
            if (state is AddCountrySuccess) {
              // Show success and clear inputs
              final Country c = state.country;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Added ${c.name} (${c.code}) ✅')),
              );
              codeController.clear();
              nameController.clear();
              emojiController.clear();
              capitalController.clear();
            } else if (state is AddCountryError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.message}')),
              );
            }
          },
          builder: (context, state) {
            if (state is AddCountryLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
                TextField(
                  controller: codeController,
                  decoration: const InputDecoration(labelText: 'Code (e.g. US)'),
                ),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: emojiController,
                  decoration: const InputDecoration(labelText: 'Emoji (e.g. 🇺🇸)'),
                ),
                TextField(
                  controller: capitalController,
                  decoration: const InputDecoration(labelText: 'Capital (optional)'),
                ),
                const SizedBox(height: 20),
                FilledButton(
                  onPressed: () {
                    // Read values and call the cubit
                    context.read<AddCountryCubit>().addCountry(
                      code: codeController.text.trim(),
                      name: nameController.text.trim(),
                      emoji: emojiController.text.trim(),
                      capital: capitalController.text.trim().isEmpty ? null : capitalController.text.trim(),
                    );
                  },
                  child: const Text('Submit'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
