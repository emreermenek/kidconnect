
const List<String> oppositionNamesList =
[
  'büyük', 'ön taraf', 'dışında', 'uzun', 'kavanoz boş', 'karanlık', 'sağ el', 'zayıf', 'genç', 'kadın',
  'hızlı', 'mutlu', 'ağır', 'gece', 'aşağıya iniyor', 'zengin', 'küçük', 'arka taraf', 'içinde', 'kısa',
  'kavanoz dolu', 'aydınlık', 'sol el', 'şişman', 'yaşlı', 'erkek', 'yavaş', 'üzgün', 'hafif', 'gündüz',
  'yukarıya çıkıyor', 'fakir'
];


//1 sol, 0 sağ => 1 yukarıda, 0 aşağı
const List<int> oppositionCorrectAnswer =
[
  1,0,1,0,1,1,0,1,0,0,1,1,0,0,0,1,
  0,1,0,1,0,0,1,0,1,1,0,0,1,1,1,0
];
//vertical 1, horizontal 0
const List<int> verticalOrHorizontal =
[
  1,1,1,0,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,0,1,1,1,1,1
];

const List<List<String>> oppositionImagesList =
[
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/büyük.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/küçük.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/arka.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/ön.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/dış.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/iç.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/kısa.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/uzun.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/boş.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/dolu.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/karanlık.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/aydınlık.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/sol el.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/sağ el.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/zayıf.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/şişman.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/yaşlı.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/genç.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/erkek.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/kadın.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/hızlı.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/yavaş.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/mutlu.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/üzgün.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/hafif.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/ağır.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/gündüz.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/gece.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/yukarı.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/aşağı.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/zengin.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/fakir.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/büyük.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/küçük.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/arka.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/ön.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/dış.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/iç.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/kısa.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/uzun.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/boş.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/dolu.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/karanlık.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/aydınlık.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/sol el.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/sağ el.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/zayıf.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/şişman.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/yaşlı.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/genç.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/erkek.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/kadın.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/hızlı.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/yavaş.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/mutlu.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/üzgün.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/hafif.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/ağır.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/gündüz.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/gece.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/yukarı.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/aşağı.png'],
  ['assets/images/choose_correct_games/opposite_choose_correct_game_images/zengin.png', 'assets/images/choose_correct_games/opposite_choose_correct_game_images/fakir.png']
];