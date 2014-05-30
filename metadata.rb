name             'word_games_chef'
maintainer       'YOUR_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures word_games_chef'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "apt", "~> 2.1.0"
depends "rbenv", "1.5.0"
depends "nginx", "~> 1.8.0"