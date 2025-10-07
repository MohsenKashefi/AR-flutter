import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/model_info.dart';

class ModelService {
  // Your GitHub repository details
  static const String _githubUsername = 'MohsenKashefi';
  static const String _repositoryName = 'model';
  static const String _modelsPath = ''; // Models are in the root directory
  
  // GitHub raw URL base
  static String get _baseUrl => 'https://raw.githubusercontent.com/$_githubUsername/$_repositoryName/main';

  /// Get all available models from the GitHub repository
  Future<List<ModelInfo>> getAvailableModels() async {
    try {
      // For demo purposes, we'll return some sample models
      // In a real implementation, you would fetch this from your GitHub repository
      return _getSampleModels();
    } catch (e) {
      throw Exception('Failed to load models: $e');
    }
  }

  /// Get the direct URL for a model file
  Future<String> getModelUrl(ModelInfo model) async {
    // Construct the GitHub raw URL for the .glb file
    return '$_baseUrl/${model.fileName}';
  }

  /// Get your actual models from GitHub repository
  List<ModelInfo> _getSampleModels() {
    return [
      ModelInfo(
        name: 'Person Model',
        description: 'A detailed 3D person model created with Blender',
        fileName: 'Person.glb',
        githubUrl: '$_baseUrl/Person.glb',
        thumbnailUrl: 'https://via.placeholder.com/300x200/6366F1/FFFFFF?text=Person',
        category: 'Characters',
        scale: 0.5,
      ),
      ModelInfo(
        name: 'Nike Shoe',
        description: 'A realistic Nike shoe model with detailed textures',
        fileName: 'nike.glb',
        githubUrl: '$_baseUrl/nike.glb',
        thumbnailUrl: 'https://via.placeholder.com/300x200/8B5CF6/FFFFFF?text=Nike',
        category: 'Fashion',
        scale: 0.3,
      ),
      ModelInfo(
        name: 'TV Model',
        description: 'A modern television model with sleek design',
        fileName: 'tv.glb',
        githubUrl: '$_baseUrl/tv.glb',
        thumbnailUrl: 'https://via.placeholder.com/300x200/EC4899/FFFFFF?text=TV',
        category: 'Electronics',
        scale: 0.4,
      ),
      ModelInfo(
        name: 'Video Wall',
        description: 'A large video wall display for presentations',
        fileName: 'videowall1.glb',
        githubUrl: '$_baseUrl/videowall1.glb',
        thumbnailUrl: 'https://via.placeholder.com/300x200/10B981/FFFFFF?text=Video+Wall',
        category: 'Electronics',
        scale: 0.6,
      ),
    ];
  }

  /// Fetch models from GitHub repository (for future implementation)
  Future<List<ModelInfo>> _fetchModelsFromGitHub() async {
    try {
      // This would fetch a JSON file from your GitHub repository
      // that contains the list of available models
      final response = await http.get(
        Uri.parse('$_baseUrl/models.json'),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => ModelInfo.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch models: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching models from GitHub: $e');
    }
  }
}
