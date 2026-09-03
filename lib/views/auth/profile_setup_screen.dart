import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  String _selectedDistrict = 'Colombo';
  String _selectedRole = 'both';

  final List<String> _districts = [
    'Colombo',
    'Gampaha',
    'Kalutara',
    'Kandy',
    'Matale',
    'Nuwara Eliya',
    'Galle',
    'Matara',
    'Hambantota',
    'Jaffna',
    'Kilinochchi',
    'Mannar',
    'Vavuniya',
    'Mullaitivu',
    'Batticaloa',
    'Ampara',
    'Trincomalee',
    'Kurunegala',
    'Puttalam',
    'Anuradhapura',
    'Polonnaruwa',
    'Badulla',
    'Monaragala',
    'Ratnapura',
    'Kegalle',
  ];

  bool get _isFormValid {
    return _nameController.text.trim().isNotEmpty &&
        _selectedDistrict.isNotEmpty;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _handleComplete() {
    if (_formKey.currentState!.validate() && _isFormValid) {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF17352A),
          ),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),

                      const Text(
                        'Set Up Your Profile',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF17352A),
                          letterSpacing: -0.5,
                        ),
                      ),

                      const SizedBox(height: 6),

                      const Text(
                        'Tell us a bit about yourself',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF61766E),
                        ),
                      ),

                      const SizedBox(height: 24),

                      const Text(
                        'Full Name',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF17352A),
                        ),
                      ),

                      const SizedBox(height: 6),

                      TextFormField(
                        controller: _nameController,
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your full name',
                          hintStyle: const TextStyle(
                            color: Color(0xFF9EAAA6),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFE8F4D9),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xFF075B3A),
                              width: 1.5,
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF17352A),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty) {
                            return 'Please enter your full name';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        'District / City',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF17352A),
                        ),
                      ),

                      const SizedBox(height: 6),

                      DropdownButtonFormField<String>(
                        value: _selectedDistrict,
                        dropdownColor: Colors.white,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFE8F4D9),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xFF075B3A),
                              width: 1.5,
                            ),
                          ),
                        ),
                        icon: const Icon(
                          Icons.expand_more,
                          color: Color(0xFF61766E),
                        ),
                        items: _districts.map(
                          (String district) {
                            return DropdownMenuItem<String>(
                              value: district,
                              child: Text(
                                district,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF17352A),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                        onChanged: (String? newValue) {
                          if (newValue == null) return;

                          setState(() {
                            _selectedDistrict = newValue;
                          });
                        },
                      ),

                      const SizedBox(height: 24),

                      const Text(
                        'I want to...',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF17352A),
                        ),
                      ),

                      const SizedBox(height: 12),

                      _buildRoleCard(
                        id: 'donor',
                        title: 'Donor',
                        subtitle: 'I want to give away items',
                        icon: Icons.volunteer_activism,
                      ),

                      const SizedBox(height: 10),

                      _buildRoleCard(
                        id: 'requester',
                        title: 'Requester',
                        subtitle: "I'm looking for items",
                        icon: Icons.inventory_2,
                      ),

                      const SizedBox(height: 10),

                      _buildRoleCard(
                        id: 'both',
                        title: 'Both',
                        subtitle: 'I want to give and receive',
                        icon: Icons.sync_alt,
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(
                24,
                12,
                24,
                20,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                border: Border(
                  top: BorderSide(
                    color: const Color(0xFFDDE5DE)
                        .withOpacity(0.7),
                  ),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed:
                      _isFormValid ? _handleComplete : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF075B3A),
                    disabledBackgroundColor:
                        const Color(0xFF075B3A)
                            .withOpacity(0.5),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Complete & Enter App',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleCard({
    required String id,
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    final bool isSelected = _selectedRole == id;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRole = id;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFF7FBF2)
              : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF075B3A)
                : const Color(0xFFDDE5DE),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.white
                    : const Color(0xFFF7FBF2),
                shape: BoxShape.circle,
                boxShadow: isSelected
                    ? const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 2,
                          offset: Offset(0, 1),
                        ),
                      ]
                    : [],
              ),
              alignment: Alignment.center,
              child: Icon(
                icon,
                color: const Color(0xFF075B3A),
                size: 20,
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.w600,
                      color: const Color(0xFF17352A),
                    ),
                  ),

                  const SizedBox(height: 2),

                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF61766E),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF075B3A)
                      : const Color(0xFFDDE5DE),
                  width: isSelected ? 2 : 1,
                ),
              ),
              alignment: Alignment.center,
              child: isSelected
                  ? Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF075B3A),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}