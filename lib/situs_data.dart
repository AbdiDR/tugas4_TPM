class SitusData {
  String name;
  String image;
  String type;
  String descipton;
  String url;

  SitusData({
    required this.name,
    required this.image,
    required this.type,
    required this.descipton,
    required this.url,
  });
}

var listSitus = [
  SitusData(
    name: "Wikipedia",
    image:
    "https://upload.wikimedia.org/wikipedia/commons/f/f3/Wikipedia-logo-v2-id.png",
    type: 'Education',
    descipton: "Proyek ensiklopedia daring multibahasa yang bebas dan terbuka, yang dijalankan oleh Yayasan Wikimedia, organisasi nirlaba yang berbasis di Florida, Amerika Serikat. Nama Wikipedia berasal dari gabungan kata wiki dan ensiklopedia.",
    url: "https://www.wikipedia.org/",
  ),
  SitusData(
    name: "W3Schools",
    image:
    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/W3Schools_logo.svg/120px-W3Schools_logo.svg.png",
    type: "Education",
    descipton: "Situs web developer informasi, dengan tutorial dan referensi yang berkaitan dengan topik pengembangan web seperti HTML, CSS, JavaScript, PHP, SQL, dan JQuery.",
    url: "https://www.w3schools.com/",
  ),
  SitusData(
    name: "Netflix",
    image:
    "https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Netflix_2015_logo.svg/375px-Netflix_2015_logo.svg.png",
    type: "Entertainment",
    descipton: "Salah satu penyedia layanan pengaliran (streaming) media digital, berkantor pusat di Los Gatos, California. yang didirikan pada tahun 1997 oleh Reed Hasting dan Marc Randolph di Scotts Valley, California.",
    url: "https://www.netflix.com/",
  ),
  SitusData(
    name: "Google Scholar",
    image:
    "https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Google_Scholar_logo.png/330px-Google_Scholar_logo.png",
    descipton:"Sebuah layanan yang memungkinkan kalian sebagai pengguna untuk mencari materi berupa teks dalam beberapa format publikasi. Google Scholar merupakan website yang digunakan untuk mencari naskah akademis.",
    type: "Education",
    url: "https://scholar.google.com/",
  ),
];
var situsFavList = [];
