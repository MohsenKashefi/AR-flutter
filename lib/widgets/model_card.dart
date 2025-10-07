import 'package:flutter/material.dart';
import '../models/model_info.dart';

class ModelCard extends StatelessWidget {
  final ModelInfo model;
  final VoidCallback onTap;

  const ModelCard({
    super.key,
    required this.model,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Colors.grey.shade50,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thumbnail
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        _getCategoryColor(model.category),
                        _getCategoryColor(model.category).withOpacity(0.7),
                      ],
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Placeholder for model thumbnail
                      Center(
                        child: Icon(
                          _getCategoryIcon(model.category),
                          size: 48,
                          color: Colors.white,
                        ),
                      ),
                      // AR Badge
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.view_in_ar,
                                size: 12,
                                color: Colors.white,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'AR',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Content
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2937),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        model.description,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: _getCategoryColor(model.category).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              model.category,
                              style: TextStyle(
                                fontSize: 10,
                                color: _getCategoryColor(model.category),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: Colors.grey.shade400,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'characters':
        return const Color(0xFF6366F1);
      case 'fashion':
        return const Color(0xFF8B5CF6);
      case 'electronics':
        return const Color(0xFFEC4899);
      case 'vehicles':
        return const Color(0xFF10B981);
      case 'architecture':
        return const Color(0xFFF59E0B);
      case 'nature':
        return const Color(0xFF10B981);
      default:
        return const Color(0xFF6B7280);
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'characters':
        return Icons.person;
      case 'fashion':
        return Icons.checkroom;
      case 'electronics':
        return Icons.devices;
      case 'vehicles':
        return Icons.directions_car;
      case 'architecture':
        return Icons.business;
      case 'nature':
        return Icons.park;
      default:
        return Icons.model_training;
    }
  }
}
