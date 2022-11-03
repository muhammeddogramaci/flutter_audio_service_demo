abstract class PlaylistRepository {
  Future<List<Map<String, String>>> fetchInitialPlaylist();
  Future<Map<String, String>> fetchAnotherSong();
}

class DemoPlaylist extends PlaylistRepository {
  @override
  Future<List<Map<String, String>>> fetchInitialPlaylist(
      {int length = 1}) async {
    return List.generate(length, (index) => _nextSong());
  }

  @override
  Future<Map<String, String>> fetchAnotherSong() async {
    return _nextSong();
  }

  var _songIndex = 0;
  static const _maxSongNumber = 16;

  Map<String, String> _nextSong() {
    _songIndex = (_songIndex % _maxSongNumber) + 1;
    return {
      'id': '1',
      'title': 'Canlı Yayın',
      'album': 'SoundHelix',
      'url': 'https://ssl120.radyotelekom.com.tr/8106/stream',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/e/e3/Billie_Holiday%2C_Downbeat%2C_New_York%2C_N.Y.%2C_ca._Feb._1947_%28William_P._Gottlieb_04251%29.jpg',
    };
  }
}
