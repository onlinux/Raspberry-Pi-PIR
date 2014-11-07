<h2><a href="http://blog.onlinux.fr/?p=131" target="_blank">Voir l'article complet sur le blog</a></h2>

<h2>Détecteur de mouvement (PIR) branché sur Raspberry Pi intégré à la ZiBASE - Part 1/2</h2>

Dans cet article, je vais vous présenter comment intégrer, comme périphérique virtuel sur la ZiBASE, un détecteur de mouvement connecté à un Raspberry Pi. Nous allons voir l'ensemble des étapes , depuis la connexion du détecteur (PIR) au RaspBerry Pi , la création du script python , la gestion du service pir et le scénario sur la ZiBASE qui va nous permettre d'alimenter un détecteur virtuel, qui pourra ensuite être intégré à une alarme Zibase ou être utilisé dans d'autres scénarios.<a href="http://blog.onlinux.fr/wp-content/uploads/2014/09/zibase.jpg"><img class="alignright wp-image-167 size-thumbnail" src="http://blog.onlinux.fr/wp-content/uploads/2014/09/zibase-150x150.jpg" alt="zibase" width="150" height="150" /></a><img class="alignleft wp-image-135 size-medium" src="http://blog.onlinux.fr/wp-content/uploads/2014/09/pi-motion-plate-forme-300x270.jpeg" alt="pi-motion-plate-forme" width="300" height="270" />

Pour l'installation du module, j'ai suivi l'excellent article en anglais de Matt Hawkins intitulé  <a href="http://www.raspberrypi-spy.co.uk/2013/01/cheap-pir-sensors-and-the-raspberry-pi-part-1/" target="_blank">Cheap PIR Sensors and the Raspberry Pi – Part 1</a> dont je reprends les grandes lignes pour montrer comment brancher et faire fonctionner ce merveilleux petit module.
<h1>Le matériel nécessaire<img class="alignright wp-image-133" src="http://blog.onlinux.fr/wp-content/uploads/2014/09/pir-300x300.jpg" alt="pir" width="130" height="130" /></h1>
Nous allons utiliser comme détecteur un module PIR 5V (Passive Infra Red) que l'on trouvera facilement dans une boutique en ligne pour quelques euros. Je l'ai personnellement trouvé pour $2.40 chez <a href="http://www.dx.com/p/pyroelectric-infrared-pir-motion-sensor-detector-module-157004#.VBWTdXV_uCw" target="_blank">www.dx.com</a>. Nous allons le  connecter à un Raspberry Pi  (dans mon cas, j'utilise un Raspberry Pi B+ qui tourne sous Linux Raspbian version Wheezy du 20/06/2014)
<h2>Branchement du module PIR<img class="alignright wp-image-145 size-medium" src="http://blog.onlinux.fr/wp-content/uploads/2014/09/20140916_173043-300x180.jpg" alt="20140916_173043" width="300" height="180" /></h2>
Voici un schéma représentant les trois sorties du module et leurs branchements sur les pins du Raspberry Pi. Le module a deux potentiomètres qui permettent d'ajuster ses performances. Un pour la sensibilité (Sx) et le second (Tx) pour le réglage du temps ou la sortie (pin OUT) du module reste à 3V lors de la détection d'un mouvement.

[caption id="attachment_999" align="aligncenter" width="550"]<a href="http://blog.onlinux.fr/wp-content/uploads/2014/09/pir_module_circuit_1.png"><img class="wp-image-999 size-full" src="http://www.raspberrypi-spy.co.uk/wp-content/uploads/2013/01/pir_module_circuit_1.png" alt="PIR Module" width="550" height="250" /></a> Module PIR[/caption]

<img class="aligncenter wp-image-144 size-full" src="http://blog.onlinux.fr/wp-content/uploads/2014/09/20140916_173058.jpg" alt="20140916_173058" width="550" height="476" />
